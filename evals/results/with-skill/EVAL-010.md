# EVAL-010 with_skill

**Mode:** Mode 10 skill `scientific-research` — "Jelaskan/evaluasi 1 paper" (mode mandiri, tanpa pipeline, tanpa folder proyek, tanpa gate antarfase).
**Bahan yang tersedia:** hanya abstrak di `C:/Users/LENOVO THINKPAD/AppData/Local/hermes/cache/scratch/eval-fixture-eval010/abstract.md`.
**Keterbatasan eksekusi:** full text tidak tersedia dan tidak boleh diakses; sumber sekunder tidak boleh dipakai sebagai pengganti; tool web (search/extract) dianggap tidak ada. Sesuai bagian "KAPABILITAS & FALLBACK" SKILL.md, keterbatasan ini diumumkan terbuka, tidak ditutupi, dan tidak ada hasil pencarian yang dikarang.

**Aturan bukti yang dipakai (SKILL.md, Aturan Global #3):** setiap pernyataan diberi label:
- `[A]` = fakta dari abstrak (bukti langsung, satu-satunya bahan primer yang tersedia).
- `[I]` = inferensi/penalaran metodologis umum atas fakta `[A]` — bukan klaim tentang isi paper.
- `[U]` = **belum terverifikasi**: ada di full text, tidak bisa dicek di lingkungan ini. Status ini tidak pernah dinaikkan jadi "valid"/"invalid".

---

## 1. Ringkasan paper (hanya dari abstrak) `[A]`

| Aspek | Isi abstrak |
|---|---|
| Topik | Evaluasi komparatif 6 alat deteksi plagiarisme |
| Sampel | 300 esai siswa (SMA, per catatan abstrak) |
| Gold standard | Anotasi manual oleh 2 penilai (rater) |
| Metrik utama | inter-rater kappa; F1 |
| Hasil 1 | inter-rater kappa 0.81 pada 2 alat |
| Hasil 2 | F1 terbaik 0.88 |
| Keterbatasan yang dilaporkan penulis | sampel satu sekolah; threshold default alat |

Tidak ada lagi yang boleh diklaim tentang paper ini. Judul, penulis, tahun, venue, protokol, tabel, dan angka lain: `[U]`.

---

## 2. Analisis metodologi

### 2.1 Yang bisa disebut dari abstrak `[A]`
- Desain: studi komparatif/benchmark terhadap gold standard manual (bukan eksperimen dengan manipulasi variabel).
- Instrumen evaluasi: anotasi manual 2 rater sebagai acuan; skor alat dibandingkan ke anotasi itu.
- Ukuran sampel: n = 300 esai.

### 2.2 Detail metodologis yang tidak diketahui `[U]` (harus diminta ke full text)
Checklist diadaptasi dari `references/04-methodology.md` (prosedur 2–5 dan QC checklist G4):
1. Desain & justifikasi: mengapa 6 alat itu dipilih; apakah pemilihan alat ada risiko seleksi.
2. Sampling: teknik pengambilan 300 esai (random/stratified/konvenien), kriteria inklusi-eksklusius, rentang kelas/mata pelajaran, periode pengumpulan.
3. Unit analisis: per esai? per paragraf? per potongan n-gram? Skor alat biasanya berbeda pada tiap unit — ini menentukan makna F1.
4. Protokol anotasi: pedoman rater, pelatihan, apakah rater buta (blind) terhadap skor alat, penanganan sengketa (dengan 2 rater, hasil tie butu adjudikasi — mekanismenya tidak diketahui).
5. Ground truth final: apakah label emas = hasil kedua rater digabung (konsensus/mayoritas) atau salah satu rater? Ini menentukan validitas seluruh metrik.
6. Konfigurasi alat: versi, bahasa, pengaturan threshold (abstrak menyebut "threshold default" sebagai keterbatasan `[A]`), apakah semua alat disetel seragam.
7. Prosedur evaluasi: apakah test set dipakai sekali, apakah ada tuning di data yang sama (kebocoran evaluasi).
8. Etika: izin sekolah/ortu, anonimitas esai siswa. `[U]`

### 2.3 Anomali konseptual pada kalimat hasil `[I]`
Abstrak menyebut "*inter-rater kappa 0.81 pada 2 alat*". Kappa inter-rater adalah statistik **antar-penilai manusia**, bukan properti alat — kappa tidak seharusnya "melekat" pada sebuah alat. Kemungkinan makna (semua `[U]`, butuh full text):
- (a) kappa 0.81 dilaporkan untuk anotasi 2 rater, dan kebetulan disebut bersama 2 alat;
- (b) yang dimaksud kappa antara skor alat vs rater (itu sebenarnya *agreement* alat-rater, bukan inter-rater);
- (c) hanya 2 dari 6 alat yang melaporkan/kelulusan ambang tertentu.
Perbedaan ini mengubah seluruh interpretasi hasil — **jangan ditafsirkan lebih jauh sebelum full text ada.**

---

## 3. Analisis hasil

### 3.1 Kappa 0.81 `[A]`, interpretasi `[I]`
- Dalam konvensi umum Landis & Koch (1977) — **konvensi eksternal, bukan kutipan paper** — 0.61–0.80 = *substantial*, 0.81–1.00 = *almost perfect*; 0.81 tepat di batas atas. Paper tidak menyebut acuan mana yang dipakai `[U]`, jadi label kualitasnya tidak bisa dipastikan.
- Kappa dikoreksi peluang (chance correction) → lebih baik daripada persentase kesepakatan mentah. Nilai 0.81 menandakan anotasi manusia cukup konsisten, sehingga gold standard-nya **layak dipakai** — asumsi ini menjadi fondasi seluruh F1 di bawah `[I]`.
- Kekhawatiran klasik: kappa peka terhadap prevalensi (masalah *prevalence paradox*). Jika plagiarisme jarang, kappa bisa tinggi meski kesepakatan klinis lemah, atau sebaliknya. Prevalensi plagiarisme di 300 esai **tidak dilaporkan di abstrak** `[U]` → kekuatan kappa tidak bisa dinilai penuh.

### 3.2 F1 terbaik 0.88 `[A]`, interpretasi `[I]`
Kekuatan:
- F1 (harmonic mean precision–recall) metrik yang tepat untuk deteksi dengan kelas tidak seimbang — lebih informatif daripada akurasi. Pemilihan metrik ini cenderung tepat sasaran `[I]`.
- 0.88 termasuk kuat: dalam skala 0–1, itu berarti precision dan recall sekitar kisaran 0.85–0.91 saling menyeimbangkan (F1 0.88 konsisten dengan P≈R≈0.88; banyak kombinasi lain juga mungkin → `[U]` tanpa P dan R terpisah).

Yang tidak bisa dinilai (semua `[U]`):
1. Tidak ada precision dan recall terpisah → tidak tahu apakah alat "aman" (precision tinggi) atau "galak" (recall tinggi). Untuk menuduh siswa plagiarism, precision lebih kritikal daripada recall `[I]`.
2. Tidak ada interval kepercayaan. n = 300 → bootstrap 95% CI untuk F1 sangat disarankan; selisih F1 antar-alat bisa saja di dalam noise `[I]`.
3. Averaging tidak disebut: micro vs macro vs weighted F1 bisa berbeda jauh pada data tidak seimbang `[U]`.
4. Threshold dipakai default (keterbatasan yang diakui penulis `[A]`) → titik kerja tiap alat berbeda; perbandingan pada threshold berbeda itu tidak adil dan menahan performa terbaik tiap alat `[I]`. Kurva PR per alat akan lebih jujur daripada satu titik F1.
5. Hanya "F1 terbaik" yang disebut → hasil 5 alat lain tidak terlihat di abstrak `[U]`. Ini risiko *selective reporting* / *winner's curse*: dari 6 alat, nilai maksimum cenderung terlalu optimis `[I]`.
6. Tidak ada uji statistik antar-alat. Desainnya *paired* (6 alat pada esai yang sama) → seharusnya memakai uji berpasangan (mis. McNemar untuk prediksi biner per esai, atau bootstrap pembandingan delta-F1), dengan koreksi multiple comparison (6 alat = banyak pasang) `[I]`. Tidak ada jejaknya di abstrak `[U]`.

---

## 4. Kekuatan yang bisa diakui (berdasar bukti `[A]` + penalaran `[I]`)
1. Ada **gold standard manual**, bukan hanya skor alat yang dilaporkan sendiri → desain evaluasi lebih kuat daripada studi yang memakai keluaran alat lain sebagai acuan.
2. **Dua rater + kappa dilaporkan** → reliabilitas anotasi diukur, bukan diasumsikan. Banyak benchmark deteksi plagiarism melewati langkah ini.
3. **Kappa 0.81** menunjukkan anotasi cukup konsisten untuk jadi acuan `[I]`.
4. **F1 dipakai, bukan akurasi** → metrik sesuai untuk deteksi kelas tidak seimbang.
5. **Keterbatasan diakui penulis sendiri** (satu sekolah, threshold default) → tingkat keterbacaan/kejujuran pelaporan yang baik.
6. n = 300 esai untuk benchmark 6 alat = 1.800 pengamatan alat × esai, desain berpasangan yang hemat sampel `[I]`.

---

## 5. Keterbatasan & ancaman validitas (kerangka `references/07-review.md`, prosedur 2)

**Eksternal (generalisasi)**
- Satu sekolah `[A]` → kultur menulis, tingkat plagiarisme, dan tata bahasa sekolah itu bisa sangat berbeda dari populasi lain. Generalisasi ke sekolah/daerah/skala nasional tidak beralasan `[I]`.
- Bahasa esai tidak disebut `[U]` → performa alat sangat bergantung pada bahasa dan corpus training alat.

**Internal (bias instrumen & confounding)**
- Threshold default berbeda antar alat `[A]` → konfigurasi, bukan kualitas alat, bisa jadi sumber selisih skor `[I]`.
- Kemungkinan rater tidak blind terhadap skor alat → bias konfirmasi pada gold standard `[U]`.
- Dengan 2 rater saja, tanpa adjudikator, label final untuk kasus sengketa tidak diketahui `[U]`.

**Konklusional (inferensi melebihi data)**
- "F1 terbaik 0.88" tanpa CI dan tanpa uji antar-alat → klaim "alat X terbaik" mungkin tidak signifikan `[I]`.
- Kappa yang kabur antara "antar rater" dan "antar alat" (bagian 2.3) bisa membuat kesimpulan tentang *reliabilitas alat* dibangun di atas statistik yang sebenarnya mengukur hal lain `[I]`.

**Konstruk (operasionalisasi)**
- Apa yang dihitung "plagiarisme" oleh rater vs apa yang dihitung alat (kemiripan verbatim vs parafrase vs sitasi salah) sering tidak selaras → F1 bisa tinggi padahal deteksi parafrase buruk `[I]`, `[U]` untuk definisi yang dipakai paper ini.
- Unit skor alat (esai vs potongan) tidak disebut `[U]`.

---

## 6. Reproducibility checklist (`references/07-review.md`)

- [ ] Data: sumber, format, prosedur pembersihan — **tidak bisa diverifikasi** (full text `[U]`); yang diketahui: 300 esai, 1 sekolah `[A]`.
- [ ] Kode/dependensi versi alat — `[U]`.
- [ ] Parameter/model: threshold & konfigurasi 6 alat — `[U]`; yang diketahui hanya "threshold default" dipakai `[A]`.
- [ ] Langkah analisis cukup untuk diulang — **tidak bisa diverifikasi** `[U]`.
- [ ] Sitasi library.bib — `[U]`.

Status reproducibility: **belum terverifikasi** — bukan "tidak reproducible". Status ini baru boleh dinaikkan setelah full text dibaca.

---

## 7. Daftar pertanyaan prioritas untuk penulis (untuk diperoleh dari full text)

**Tinggi**
1. Apa definisi unit analisis dan label emas final (konsensus 2 rater / adjudikator)?
2. Apa arti sebenarnya "kappa 0.81 pada 2 alat" (lihat 2.3)? Inter-rater manusia atau alat-vs-rater?
3. Precision dan recall per alat, plus 95% CI untuk F1 (bootstrap, n=300).
4. Prevalensi plagiarisme dalam 300 esai (untuk menilai kappa & F1).
5. Apakah ada uji perbandingan berpasangan antar 6 alat dengan koreksi multiple comparison?

**Sedang**
6. Rata-raging metrik (micro/macro/weighted) dan kurva PR per alat.
7. Prosedur anotasi: pelatihan rater, blinding, penanganan sengketa.
8. Versi/pengaturan tiap alat; apakah threshold disetel ulang atau dibiarkan default.

**Rendah**
9. Kriteria seleksi 6 alat dan 300 esai.
10. Pertimbangan etika (izin, anonimitas esai siswa).

---

## 8. Kesimpulan

Analisis ini **hanya** menilai abstrak; tidak ada klaim yang melampaui bahan yang tersedia. Yang bisa disimpulkan sekarang: desain intinya masuk akal (gold standard manual 2 rater, kappa dilaporkan, F1 dipakai, n = 300), dan hasilnya menjanjikan (kappa 0.81; F1 terbaik 0.88), dengan keterbatasan eksternal yang diakui penulis (satu sekolah, threshold default) `[A]`. Kekuatan statistiknya **tidak bisa dipastikan** karena abstrak tidak menyertakan precision/recall, interval kepercayaan, uji antar-alat, prevalensi kelas, maupun definisi label `[U]`. Kecurigaan metodologis utama: ambiguitas makna kappa (bagian 2.3), perbandingan pada threshold default yang tidak seragam, dan kemungkinan pelaporan hanya "F1 terbaik" tanpa hasil 5 alat lain.

Langkah berikutnya yang sah: minta full text (atau penempelan bagian metodologi + tabel hasil oleh pengguna), lalu audit ulang butir-butir bagian 7. Tanpa itu, semua status tetap **belum terverifikasi** — sesuai Aturan Global #3 skill, status itu tidak boleh diubah jadi valid/invalid tanpa bukti.
