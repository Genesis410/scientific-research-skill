# EVAL-007 without_skill

## Ringkasan eksekutif

Dua masalah struktural pada desain saat ini:

1. **Split 70/15/15 acak pada data deret waktu = kebocoran waktu (temporal leakage).** Data masa depan bocor ke pelatihan, dan baris berurutan yang hampir identik (autokorelasi harian/musiman) tersebar ke train sekaligus test → metrik terlalu optimis, model belum tentu jalan pada data baru.
2. **Tidak ada perlindungan terhadap pemakaian test set berulang.** Selama tidak ada mekanisme one-shot, setiap iterasi fitur/hyperparameter/threshold yang Anda nilai ulang di test = test set terpakai berkali-kali → test kehilangan maknanya.

Selain itu ada 5 titik kebocoran tanggal fitur yang spesifik ke kasus Anda (NDVI mingguan, curah hujan jam 09:00, target harian). Semuanya wajib diaudit sebelum melatih model apa pun.

---

## 1. Temuan utama

| # | Temuan | Jenis | Keparahan | Mekanisme |
|---|--------|-------|-----------|-----------|
| 1 | Split acak 70/15/15 | Temporal leakage | **Kritis** | Baris train bisa berisi tanggal SETELAH baris test |
| 2 | Split acak + sampel berjendela/bergelombang | Near-duplicate leakage | **Kritis** | Jendela 7 hari yang tumpang tindih terbelah antar split |
| 3 | NDVI mingguan (window/semua jendela ≤ t?) | Fitur tanggal salah / look-ahead | **Kritis** | Composite NDVI sering di-center atau diambil "minggu terdekat" → memakai data setelah tanggal prediksi |
| 4 | Curah hujan "harian, jam 09:00" | Off-by-one / target-day leakage | **Tinggi** | Akumulasi bisa menutup di 09:00 hari target → sebagian hari kejadian ikut masuk fitur |
| 5 | Preprocessing sebelum split (scale/impute/feature selection/SMOTE) | Preprocessing leakage | **Tinggi** | Statistik dihitung dari seluruh data, termasuk test |
| 6 | Imputasi NDVI berbasis interpolasi dua arah | Future leakage | **Tinggi** | Interpolasi memakai nilai sesudah tanggal t |
| 7 | Tuning hyperparameter / threshold / fitur di test set | Test set berulang | **Tinggi** | Test dipakai sebagai validasi → overfit ke test |
| 8 | Target 0/1 dari sumber yang sama dengan fitur | Target leakage (potensial) | **Tinggi** | Fitur proxy dari outcome (hotspot/Frp/smoke di hari yang sama) |
| 9 | Musiman & tahun sama di train dan test | Generalisasi semu | Sedang | Model menghafal musim, bukan sinyal |
| 10 | Skala/encoding/PCA/fitur global | Preprocessing leakage | Sedang | Sama seperti #5 untuk transformasi non-numerik |

---

## 2. Detail: split acak pada data deret waktu

**Masalah.** Dengan split acak, `train` memuat tanggal 2025-08 sementara `test` memuat 2025-03. Model dilatih pada "masa depan" lalu diuji pada "masa lalu" — bukan skenario prediksi nyata. Lebih buruk: data cuaca harian punya autokorelasi kuat (t dan t+1 sangat mirip), jadi untuk setiap baris test hampir selalu ada baris train tanggal t±1 yang hampir identik. Model cukup menghafal tetangga → skor bagus tanpa kemampuan prediksi nyata.

**Perbaikan — split berbasis waktu, urut:**

```python
import pandas as pd

df = df.sort_values("tanggal").reset_index(drop=True)
n  = len(df)
i1, i2 = int(n * 0.70), int(n * 0.85)

embargo = pd.Timedelta(days=7)   # >= horizon prediksi (1 hari) + panjang jendela fitur (7 hari)

train = df[df["tanggal"] <  df["tanggal"].iloc[i1]]
val   = df[(df["tanggal"] >= df["tanggal"].iloc[i1] + embargo) &
           (df["tanggal"] <  df["tanggal"].iloc[i2] + embargo)]
test  = df[df["tanggal"] >= df["tanggal"].iloc[i2] + embargo]

assert train["tanggal"].max() < val["tanggal"].min() < test["tanggal"].min()
```

- **Embargo/gap** minimal = horizon (1 hari) + panjang jendela fitur terpanjang (NDVI 7 hari) → 7–8 hari. Ini mencegah baris tumpang tindih antar split.
- Untuk pemilihan model, gunakan **rolling-origin / expanding-window CV** (time series split), bukan K-Fold acak:

```python
from sklearn.model_selection import TimeSeriesSplit
tscv = TimeSeriesSplit(n_splits=5, gap=7)
```

- **Alternatif bila wajib memakai proporsi acak:** blokir per minggu/bulan/tahun (GroupSplit pada `tahun_minggu`), bukan per baris. Minimal: jangan pernah mencampur tahun yang sama ke dua sisi tanpa gap.

---

## 3. Detail: audit tanggal fitur (khusus kasus Anda)

### 3.1 NDVI mingguan
Pertanyaan yang harus dijawab dengan bukti dari kode, bukan asumsi:

1. **Jendela komposit:** apakah NDVI untuk baris tanggal `t` diambil dari jendela `[t-6, t]`, `[t-3, t+3]` (centered → **leakage**), atau "minggu terdekat" (`nearest` merge → bisa mengambil masa depan)?
2. **Ketersediaan nyata:** Sentinel-2/Landsat revisit 5–16 hari + cloud filtering. Komposit "mingguan" sering sebenarnya memakai obs tanggal t-9. Itu bukan leakage, tapi **ketidaksesuaian tanggal** → pastikan label jendela (`ndvi_window_end`) ≤ tanggal prediksi.
3. **Aturan aman:** lakukan **as-of join ke belakang** — ambil nilai NDVI terakhir yang *sudah tersedia* per tanggal t. Jangan pernah merge `nearest` tanpa batas atas.

```python
avail = ndvi.assign(tanggal_mulai=ndvi.window_end)            # hanya setelah jendela ditutup
df = pd.merge_asof(df.sort_values("tanggal"),
                   avail.sort_values("tanggal_mulai"),
                   left_on="tanggal", right_on="tanggal_mulai",
                   direction="backward", allow_exact_matches=True)
```

4. **Missing karena awan:** jangan interpolasi dua arah (memakai nilai masa depan). Isi dengan nilai terakhir yang tersedia (LOCF) atau tambah flag `ndvi_missing`.

### 3.2 Curah hujan harian, jam 09:00
Semantik label harus dipastikan:

- Kasus A: `curah_hujan(t)` = akumulasi `(t-1) 09:00 → t 09:00`. Aman untuk target hari `t+1`.
- Kasus B: `curah_hujan(t)` = akumulasi `t 09:00 → (t+1)09:00`. **Ini bocor** — bagian awal hari target sudah masuk fitur.
- Kasus C: akumulasi kalender `t 00:00–24:00`. Aman hanya jika prediksi dibuat setelah tutup hari t; kalau prediksi dibuat pagi t, Anda memakai data yang belum ada saat itu (**availability leakage**, bukan label leakage).

Tulis definisi eksplisit di docstring dataset dan uji dengan assert: `fitur_tanggal_maks <= tanggal_prediksi`.

### 3.3 Fitur lain
- **Suhu/kelembapan:** sumber jam-an di-agregasi ke harian → pastikan agregasi hanya memakai jam ≤ waktu prediksi, dan tidak ada agregat yang membawa hari `t+1`.
- **Reanalisis (ERA5 dll):** produk final direvisi belakangan; versi operasional saat itu beda. Untuk backtest realistis, pakai data yang benar-benar tersedia saat itu.
- **Kalender:** aman. **Lag features:** wajib `shift(1)` atau lebih; cek tidak ada lag yang dihitung sebelum sort.

### 3.4 Target & fitur dari sumber sama
Jika target "kejadian kebakaran besok" berasal dari deteksi hotspot (VIIRS/MODIS/Frp) dan ada fitur hotspot/Frp/smoke/aqi di hari yang sama sumbernya → **target leakage** silang. Audit: daftarkan asal setiap kolom, pastikan tidak ada fitur yang dihitung dari peristiwa setelah cutoff prediksi.

**Uji praktis (leakage canary):** latih model hanya dengan fitur tanggal — kalau AUC test ≫ 0.6, ada kebocoran waktu/target. Uji kedua: acak urutan tanggal fitur; skor harus anjlok ke ~0.5.

---

## 4. Risiko test set berulang

Sumber pemakaian berulang yang sering tak disadari:

- Memilih fitur berdasarkan skor test.
- Grid search / random search dilaporkan skor test terbaik.
- Menentukan threshold klasifikasi (0.5 vs optimal) di test.
- Early stopping / checkpoint terbaik dipilih dari kurva test.
- EDA awal (boxplot per split, korelasi dengan target) lalu iterasi fitur → test sudah "terlihat".
- Melaporkan banyak arsitektur lalu memilih yang terbaik di test = multiple comparisons.
- Cross-validation acak yang melibatkan baris test di fold train (karena split awal acak).

**Mitigasi:**

1. **Urutan wajib:** `train` (fit) → `val` (semua keputusan: fitur, hyperparameter, threshold, kalibrasi, pemilihan model) → `test` **satu kali saja** di akhir, hasilnya dilaporkan apa adanya.
2. **Log satu baris per eval test** (timestamp, versi model, skor). Kalau >1 sebelum final → anggap test sudah tercemar, buat holdout baru.
3. Untuk estimasi yang butuh banyak iterasi, gunakan **nested time-series CV** (outer = performa, inner = tuning), test tetap utuh.
4. Simpan **holdout kedua** (mis. bulan terakhir 15%) yang tidak pernah disentuh sampai paper/final.
5. Laporkan **ketidakpastian**: bootstrap CI atau block bootstrap per minggu pada test final.
6. Dokumentasikan seluruh percobaan (reproducible run log) supaya jumlah pemakaian test terlacak.

---

## 5. Masalah lain yang wajib dicek

- **Imbangan kelas:** kebakaran harian biasanya <5%. Akurasi menyesatkan. Pakai **PR-AUC, recall@precision tertentu, F2**, dan bandingkan dengan baseline persistensi/musiman.
- **Preprocessing setelah split:** `StandardScaler`, imputer, encoder, PCA, feature selection, SMOTE/oversampling, dan target encoding **di-fit hanya pada train**, lalu di-`transform` ke val/test. SMOTE sebelum split = sampel sintetis dari test masuk train.
- **Kelompok:** jika banyak stasiun/piksel per tanggal, split harus **per waktu dan per lokasi** — kalau tidak, kebocoran spasial (lokasi sama di train & test).
- **Duplikat:** cek `(tanggal, lokasi)` ganda; windowing dapat menghasilkan baris identik yang tersebar ke dua split.
- **Cutoff waktu eksplisit:** setiap baris = snapshot "informasi yang diketahui per jam X tanggal t". Simpan kolom `available_at` dan filter `available_at <= cutoff` di semua tahap.

---

## 6. Checklist verifikasi sebelum melatih

- [ ] Split urut waktu (bukan acak), dengan gap ≥ horizon + jendela fitur terpanjang
- [ ] `max(tanggal fitur) <= tanggal prediksi` di-assert per baris
- [ ] Semua agregat/pivot/lag dihitung setelah sort, dengan `shift` yang benar
- [ ] NDVI: as-of backward join, tanpa interpolasi masa depan
- [ ] Definisi curah hujan 09:00 dipastikan tidak menutup di hari target
- [ ] Scaler/imputer/encoder/resampler di-fit di train saja
- [ ] Val dipakai untuk semua keputusan; test dievaluasi ≤1 kali dan dicatat
- [ ] TimeSeriesSplit + gap untuk tuning, bukan KFold acak
- [ ] Leakage canary test lolos (fitur-tanggal saja → AUC ≈ 0.5)
- [ ] Metrik PR-AUC/F2 + baseline persistensi, bukan akurasi
- [ ] Duplikat dan kelompok (lokasi/tahun) diperiksa antar split

**Prioritas perbaikan:** (1) ganti split acak → split waktu + embargo, (2) audit tanggal NDVI & curah hujan dengan assert, (3) pindahkan semua preprocessing ke dalam pipeline yang fit di train, (4) kunci test set one-shot. Empat langkah ini menutup hampir seluruh kebocoran yang mungkin pada desain Anda.
