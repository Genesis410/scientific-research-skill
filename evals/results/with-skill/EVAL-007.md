# EVAL-007 with_skill

**Mode:** Dataset Analysis (Fase 5, disertai aturan evaluasi Fase 4 untuk riset komputational) — mode mandiri, sesuai tujuan eksplisit pengguna; menu tidak ditampilkan, pipeline penuh tidak dijalankan.

**Status bukti:** audit ini berbasis *deskripsi* pengguna. Saya belum melihat skema data, kode pembuatan label/split, atau isinya. Karena itu setiap temuan di bawah berstatus **potensi risiko — belum terverifikasi**, bukan "leakage ditemukan". Klaim metodologi umum tertaut sumber pada bagian Bukti.

---

## 0. Yang saya butuhkan untuk memverifikasi (permintaan artefak)

Agar audit berhenti di hipotesis dan jadi temuan, mohon dikirim:

1. Skema data: nama kolom, tipe, zona waktu, dan 3–5 baris contoh (data boleh disamarkan).
2. Kode pembuatan label (`kejadian kebakaran besok`) — urutan `shift` vs pembuatan fitur agregat/rolling.
3. Kode split (`70/15/15 acak`) dan tahap preprocessing (scaler/imputer/feature selection/SMOTE) — urutannya relatif terhadap split.
4. Definisi operasional prediksi: **jam berapa prediksi dihasilkan** dan untuk tanggal siapa (inisiasi jam berapa, waktu layanan/operasi).
5. Sumber data: apakah produk cuaca/NDVI adalah nilai "final" yang direvisi belakangan atau nilai yang benar-benar tersedia waktu itu (point-in-time).
6. Rentang tanggal total, jumlah baris, jumlah kejadian positif, dan apakah ada entitas ganda (multi-stasiun/wilayah).

Tanpa poin 1–4, kesimpulan kepastian ("bebas leakage" atau "bocor pasti") tidak bisa diberikan — saya tidak akan mengklaim salah satunya.

---

## 1. Temuan, diurutkan keparahan

### T1 — Split acak 70/15/15 pada deret harian = pelanggaran struktur temporal (risiko paling besar)
Data harian bersifat autokorelasi: hari `t` dan `t+1` dalam episode cuaca/kebakaran yang sama hampir identik. Split acak menaruh hari `t` di train dan `t+1` di test, sehingga model dievaluasi atas kemampuan *interpolasi antar observasi yang praktis sudah dilihat*, bukan forecasting. Metrik jadi optimis, dan besarnya keoptimisan tumbuh seiring autokorelasi.

Bukti eksternal:
- Studi empiris pada LSTM forecasting: pembagian acak tanpa batas waktu + pembuatan sekuens *sebelum* split menaikkan performa hingga **RMSE Gain ~20,5%** (khususnya 10-fold acak) — https://arxiv.org/html/2512.06932
- scikit-learn, dokumentasi cross-validation: menyetel parameter berulang dengan melihat test membuat "knowledge about the test set can 'leak' into the model and evaluation metrics no longer report on generalization performance" — https://scikit-learn.org/stable/modules/cross_validation.html

Konsekuensi praktis: selisih metrik train-vs-test pada setup acak saat ini **bukan** bukti generalisasi.

### T2 — Target leakage / salah jajarkan label (off-by-one), 4 titik perik
Definisi yang harus berlaku: baris fitur tanggal `t` → label = kejadian pada `t+1`. Titik kegagalan yang paling umum:

- **(a) Urutan operasi.** Jika `shift(1)` dijalankan *sebelum* fitur agregat/rolling dihitung, agregat hari `t+1` ikut terbentuk ke dalam baris `t`. Urutan yang aman: agregat dulu (pakai ≤ hari `t`), baru `label = y.shift(-1)`.
- **(b) Kembaran bersamaan.** Jika baris di-anchor pada hari kejadian (`t+1`) dan memakai fitur harian `t+1`, fitur tersebut bersamaan dengan kejadian — bukan prediksi. Terutama curah hujan 09:00: bila prediksi dibuat sebelum 09:00 hari `t+1`, total hujan hari itu belum ada; bila dipakai, itu informasi yang dihasilkan di hari kejadian.
- **(c) Jendela label vs fitur.** Label "besok" membuat interval informasi `[t, t+1]`. Baris train terakhir yang labelnya menembus blok validasi/test = kasus klasik yang harus di-*purge* (lihat T6).
- **(d) Ketersediaan label di sumber.** Pastikan kolom kebakaran untuk hari `X` memang berasal dari laporan hari `X` (itu wajar — label memang masa depan), bukan kolom turunan yang mengandung fitur (mis. "kebakaran aktif kumulatif" yang sudah mencakup status hari berikutnya).

### T3 — Ketidaksesuaian tanggal fitur per kolom
- **Curah hujan "harian, jam 09:00":** pastikan jendela waktu tertulis eksplisit. Dua kegagalan umun: (i) jendela 09:00(`t-1`)→09:00(`t`) diklaim sebagai "hujan hari `t`" padahal bocor ke separuh hari `t` berikutnya; (ii) agregat kalender 00:00–24:00 hari `t` dinamai "jam 09:00". Selain itu: apakah total hari `t` sudah lengkap saat prediksi dibuat? Jika inisiasi ≤09:00 hari `t`, belum.
- **Suhu & kelembapan:** jam pengamatan/agregasinya apa (titik 09:00, harian penuh, reanalisis harian)? Agregat harian penuh hari `t` hanya sah bila prediksi dijalankan **setelah hari `t` berakhir** (mis. 00:00 menuju `t+1`). Ini perlu dikonfirmasi: satu-satunya pertanyaan yang paling sering menjatuhkan desain sejenis.
- **NDVI mingguan:** risiko paling subtif.
  1. Minggu keberapa? Komposit harus yang **selesai sebelum waktu prediksi**; komposit minggu berjalan yang mencakup hari setelah inisiasi = data masa depan.
  2. Produk NDVI kerap sebenarnya komposit 8-hari/lintas tanggal rilis, bukan minggu kalender — verifikasi frekuensi dan tanggal alokasinya (tanggal observasi vs tanggal rilis; latensi produksi adalah leakage ketersediaan bila diabaikan).
  3. Interpolasi/smoothing lintas gap (linear interpolation antar komposit, Savitzky–Golay, koreksi atmosfer temporal) memakai titik masa depan → bocor. Forward-fill dari nilai lampau aman.
  4. 7 baris dalam satu minggu membawa NDVI identik → pada split acak, nilai identik muncul di train **dan** test (duplikasi tidak langsung, kadang disebut group leakage).

### T4 — Preprocessing fit sebelum split (kalau ada)
Scaler, imputer mean/global, encoder/target encoding, seleksi fitur berbasis korelasi dengan target, dan SMOTE/oversampling yang dijalankan **sebelum** split memasukkan statistik masa depan ke train. Semua transformasi harus `fit` di dalam blok train (dalam pipeline CV). **Status: belum terverifikasi** — tergantung poin permintaan #3.

### T5 — Duplikasi entitas & episode
- Multi-stasiun/wilayah: baris tanggal sama dengan cuaca sama tersebar acak → split harus *group by* tanggal (atau tanggal×stasiun), bukan per baris.
- Episode kebakaran beruntun: hari positif dari satu episode terbelah train/test → model "hafal" episode. Split per **tanggal/episode**, bukan per baris.
- Sampling negatif acak dari seluruh rentang: kalau negatif diambil dari masa depan untuk train, distribusi train membocorkan karakteristik periode test (ringan, tapi catat).

### T6 — Desain split & purging yang saya usulkan (menunggu persetujuan Anda; bukan keputusan final)
1. **Split kronologis 70/15/15 berdasarkan tanggal** (bukan baris acak): `train < val < test`, assertions `max(date_train) < min(date_val) < ...`.
2. **Purge/embargo di tiap batas** = horizont label (1 hari) + lebar jendela fitur terpanjang (NDVI ≤ 7–8 hari) → usulan gap **8–14 hari** antar blok. Ini mencegah baris train yang interval informasinya menembus blok berikutnya (konsep purging & embargo, López de Prado; implementasi rujukan: https://github.com/eslazarev/purged-cross-validation).
3. **Tuning hanya di val**; untuk kecilnya data, ganti val tunggal dengan `TimeSeriesSplit(gap=…)` / walk-forward expanding window.
4. **Test dibuka sekali** di akhir, dengan protokol tertulis (Fase 4: "test set hanya sekali").
5. **Verifikasi split:** jumlah kejadian positif per blok, tidak ada tanggal overlap, dan baseline naive (prediksi "selalu 0" dan persistensi hari `t`) — kalau baseline hampir menyamai model, metrik tinggi = artefak imbalance, bukan sinyal.

Catatan: pilihan gap persis, metrik utama, dan rasio split adalah keputusan metodologis — saya usulkan, Anda konfirmasi (aturan skill: tanpa konfirmasi pengguna, keputusan desain tidak saya tetapkan sendiri).

### T7 — Risiko penggunaan test berulang
Mekanisme: setiap iterasi fitur/hyperparameter/ambang yang dievaluasi ulang di test memindahkan sedikit informasi test ke model; setelah beberapa kali, test = dev set dan angka akhirnya bukan estimasi generalisasi (kutipan scikit-learn di T1).
- **Pencegahan:** log jumlah akses test; semua keputusan dari val; test final satu kali, hasilnya dilaporkan apa adanya meski mengecewakan.
- **Bila sudah terlanjur:** jujur menyebut test lama sebagai validation, dan buat holdout baru dari akhir rentang (atau kumpulkan periode data baru). Kalau rentang terlalu pendek untuk holdout baru, laporkan estimasi dari walk-forward sebagai estimasi utama dan tandai bahwa test final tidak tersedia — **jangan** menyembunyikan riwayat pemakaian.
- Tambahan: tuning berulang di val pun bisa meng-overfit val; karena itu test final tetap perlu, dan metrik yang dipilih harus diputuskan sebelum melihat hasil (hindari p-hacking; lihat QC checklist).

### T8 — Kelangkaan kelas (implikasi evaluasi, bukan leakage)
Kebakaran harian biasanya jarang. Split temporal bisa menghasilkan blok val/test dengan sangat sedikit positif → metrik tidak stabil. Periksa base rate per blok dan laporkan jumlah event; untuk pelaporan, akurasi saja menyesatkan pada imbalance. Pilihan metrik (PR-AUC, recall/precision di ambang operasi, Brier, dll) menyangkut keputusan metodologis — **butuh konfirmasi Anda**, saya tidak menetapkannya sepihak.

---

## 2. Pemetaan ke permintaan pengguna

| Permintaan | Temuan |
|---|---|
| Kemungkinan leakage | T1 (split acak), T4 (preprocessing), T5 (duplikasi entitas/episode) |
| Target leakage | T2 (a–d), T6.2 (purge label overlap) |
| Ketidaksesuaian tanggal fitur | T3 (hujan 09:00, suhu/kelembapan, NDVI mingguan + latensi rilis) |
| Risiko test set berulang | T7 |

---

## 3. QC Checklist (Fase 5 / references/05-analysis.md + aturan evaluasi Fase 4)

- [x] Analisis sesuai deskripsi yang diberikan; deviasi: tidak ada data/kode yang diperiksa → semua temuan ditandai "belum terverifikasi"
- [ ] Asumsi temporal dicek terhadap data (butuh artefak bagian §0)
- [ ] Tidak ada p-hacking: metrik & ambang diputuskan sebelum lihat hasil test — **belum bisa diverifikasi**
- [ ] Hasil dapat direproduksi dari dokumentasi langkah — **menunggu kode split & pembuatan label**
- [ ] Limitasi ditulis: ini bagian §4 di bawah
- [x] Tidak ada keputusan desain final tanpa konfirmasi pengguna

## 4. Keterbatasan audit ini

- Tidak ada akses ke data/kode; tidak ada klaim "dataset ini bocor" maupun "dataset ini bersih" — keduanya sama-sama belum terbukti dari deskripsi saja.
- Kondisi ketersediaan point-in-time (produk cuaca/NDVI final vs real-time) tidak bisa dinilai tanpa info sumber (permintaan #5).
- pencarian web default (Tavily) sedang melewati batas kuota; tautan alternatif diambil lewat jalur pencarian cadangan — dua sumber utama (scikit-learn, arxiv 2512.06932) tetap diekstrak dan diverifikasi isinya.

## 5. Bukti

- scikit-learn, *Cross-validation: evaluating estimator performance* — https://scikit-learn.org/stable/modules/cross_validation.html (diverifikasi: kalimat kebocoran via tuning di test & peran validation set)
- *Hidden Leaks in Time Series Forecasting* — https://arxiv.org/html/2512.06932 (diverifikasi: RMSE Gain s.d. 20,5% pada split acak tanpa batas waktu)
- purged-cross-validation (purging, embargo, walk-forward, diagnosa split) — https://github.com/eslazarev/purged-cross-validation (ringkasan hasil pencarian; belum diekstrak penuh)

## 6. Gate

Mode mandiri: gate antarfase tidak berlaku otomatis. Saya mengajukan **validasi QC di §3** dan menunggu:
(a) artefak §0, dan
(b) persetujuan Anda atas desain split usulan T6 (termasuk lebar gap, metrik utama, dan rasio split).

Setelah keduanya masuk, saya lanjutkan memverifikasi temuan terhadap kode/data dan menaikkan status "belum terverifikasi" menjadi terverifikasi atau gugur.
