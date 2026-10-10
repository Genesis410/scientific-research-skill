# EVAL-010 without_skill

## Analisis Mendalam (Berdasarkan Abstrak Saja)

**Status evidensi:** Full text tidak tersedia dan sumber sekunder dilarang sebagai pengganti. Seluruh analisis di bawah bersumber pada abstrak di `abstract.md` (7 baris). Setiap klaim ditandai: **[D]** = dinyatakan abstrak, **[S]** = inferensi/interpretasi metodologis, **[X]** = tidak dapat ditentukan dari abstrak.

---

### 1. Ringkasan studi

- **[D]** Objek: evaluasi komparatif **6 alat deteksi plagiarisme**.
- **[D]** Sampel: **300 esai siswa SMA** (abstrak versi fixture menyebut SMA; versi prompt menyebut "esai siswa").
- **[D]** Gold standard: **anotasi manual oleh 2 penilai (rater)**.
- **[D]** Metrik utama dilaporkan: **inter-rater kappa** dan **F1**.
- **[D]** Hasil: kappa **0.81** (dilaporkan "pada 2 alat"), F1 terbaik **0.88**.
- **[D]** Keterbatasan yang diakui penulis: **satu sekolah**, **threshold default alat**.

---

### 2. Metodologi — detail yang tersedia dan yang hilang

**2.1 Desain** — **[S]** Studi diagnostik/komparatif (accuracy study) klasik: prediktor = skor 6 alat, referensi = anotasi manual. Cocok untuk kerangka evaluasi deteksi plagiarisme (mis. banding alat berbasis n-gram, fingerprinting, vs. LLM-based).

**2.2 Gold standard** — **[D]** Dua rater, kappa dilaporkan. **[S]** Kappa 0.81 termasuk kategori "almost perfect" Landis & Koch (0.81–1.00), batas bawah tepat di ambang — artinya reliabilitas referensi layak tapi tidak nyaman tinggi.

Inkonsistensi internal yang harus ditandai: **[D]** abstrak menyatakan "inter-rater kappa 0.81 **pada 2 alat**". **[S]** Kappa adalah ukuran kesepakatan antarmanusia, seharusnya satu nilai untuk satu set anotasi, bukan per alat. Dua pembacaan mungkin:
1. Hanya 2 dari 6 alat yang anotasinya diinterkodifikasi → kappa 0.81 hanya untuk pasangan itu (sinyal: anotasi 4 alat lain tidak diverifikasi → risiko gold standard lemah di situ);
2. Setiap anotasi per alat diperiksa 2 rater → ada 6 kappa, hanya 2 dilaporkan (risiko: selective reporting).
Full text dibutuhkan untuk memutus; ini temuan kualitas pelaporan, bukan sekadar ambigu.

**[X]** Tidak disebutkan: definisi unit anotasi (paragraf? frasa? dokumen?), skala penilaian rater (binary plagiarism / skor kemiripan), proses resolusi ketidaksetujuan (adjudication ketiga rater? konsensus?), blinding rater terhadap output alat, dan prevalensi kasus plagiar dalam 300 esai.

**2.3 Threshold** — **[D]** Keterbatasan: "threshold default alat". **[S]** Ini penting: F1 sangat sensitif terhadap threshold. Memakai default berarti hasilnya tidak optimal untuk konteks bahasa/jenjang siswa Indonesia; perbandingan 6 alat bisa adil (sama-sama default) tapi tidak menunjukkan *best achievable performance* tiap alat. Trade-off presisi–recall tidak bisa dievaluasi tanpa kurva/operating point.

**2.4 Hal lain yang hilang** — **[X]**: merek/versi 6 alat, apakah bahasa Indonesia didukung penuh oleh tiap alat, desain split data (tidak ada training, jadi split tidak wajib — **[S]** threshold default membuat data leakage lewat tuning praktis tidak ada, itu kekuatan kecil), power analysis, sampling technique (konvenien?), apakah esai mengandung plagiarisme sengaja atau natural.

---

### 3. Hasil

- **[D]** F1 terbaik = **0.88** pada salah satu alat (alat mana tidak disebut di abstrak). **[S]** Artinya pada threshold default, alat terbaik punya harmonic mean presisi–recall 0.88 — tanpa presisi/recall terpisah, tidak bisa dipastikan mana yang mendominasi. **[X]** Distribusi F1 keenam alat, nilai kappa per alat, confusion matrix, interval kepercayaan, dan uji signifikansi perbedaan antar alat: tidak ada di abstrak.
- **[S]** Dengan n=300, proporsi kasus plagiar ≈ 50% menghasilkan sekitar 150 sampel positif; seleksi threshold default menurunkan recall pada plagiarisme parafrase. **[X]** Prevalensi sebenarnya tidak diketahui, jadi estimasi ini spekulatif.
- **[S]** Kappa 0.81 pada referensi manusia dengan F1 0.88 pada alat menimbatkan paradoks interpretasi: skor alat **mendekati atau melampaui reliabilitas manusianya sendiri**. Karena kappa dan F1 bukan metrik sebanding langsung, klaim "alat lebih baik dari manusia" tidak bisa dibuat — tetapi plafon performa alat memang dibatasi oleh kualitas gold standard (ceiling effect).

---

### 4. Keterbatasan

**Diakui penulis** — **[D]**: (a) sampel satu sekolah → generalisabilitas rendah, bias institusional/kultur penulisan siswa satu sekolah; (b) threshold default alat → performa tidak optimal, perbandingan terikat konfigurasi bawaan.

**Tidak diakui / tampak dari abstrak** — **[S]/[X]**:
1. **Validitas gold standard terbatas** — kappa 0.81 berarti ~19% discordansi tersirat (karena kappa sudah mengoreksi peluang); 300 esai × dua rater adalah beban besar, kelelahan rater mungkin.
2. **Tidak ada external validation** — satu sekolah, satu konteks budaya/pendidikan.
3. **Ketergantungan observasi** — **[X]** 300 esai bisa datang dari sedikit penulis; jika ya, unit independen sebenarnya < 300 dan CI akan menyempit salah.
4. **Reporting tidak lengkap** — tidak ada presisi, recall, spesifisitas, ROC-AUC, interval kepercayaan, atau bed test antar 6 alat. Tanpa ini, klaim "F1 terbaik 0.88" tidak bisa diuji signifikansi statistiknya (selisih 0.88 vs 0.85 bisa saja noise).
5. **Potensi bias verifikasi** — **[X]** tidak jelas apakah rater blind terhadap identitas alat penghasil skor.
6. **Masalah konstruksional** — **[S]** "plagiarisme" pada esai siswa melibatkan paraphrase & patchwriting; alat berbasis copy-paste akan sistematis underperform; abstrak tidak menyebut jenis plagiarisme yang dianotasi.

---

### 5. Kekuatan analisis statistik

- **[D]** Menggunakan **inter-rater reliability (kappa)**, bukan persentase agreement mentah → benar secara metodologis karena kappa mengoreksi peluang.
- **[D]** **F1** dipilih daripada akurasi → tepat untuk kelas tidak seimbang (plagiarisme umumnya minoritas).
- **[D]** **Gold standard manual dua rater** → lebih kuat daripada memakai satu alat sebagai referensi (menghindari circularity).
- **[D]** **n = 300** → cukup besar untuk estimasi F1 dengan presisi wajar. **[S]** Dengan p≈0.5, SE(F1) kasar ≈ ±0.04 (95% CI ≈ 0.80–0.96 order of magnitude), jadi perbedaan antar alat < ~0.05 kemungkinan tidak signifikan — ini membuat ketiadaan uji beda sangat disayangkan.
- **[D]** Keterbatasan dilaporkan terus terang (satu sekolah, threshold default) → transparansi penulis baik.
- **[S]** 6 alat dibandingkan pada sampel yang sama → desain within-sample mengontrol varians esai, desain pembanding yang tepat.

---

### 6. Verdict

Stilistik metodologisnya benar (kappa + F1 + dual human rater + n=300), tetapi pelaporan di abstrak terlalu tipis untuk menguatkan kesimpulan. Dua hal paling merisaukan: (1) ambigu "kappa 0.81 pada 2 alat" yang menandakan anotasi 4 alat lain mungkin tidak terverifikasi dua rater; (2) tidak ada presisi/recall terpisah, interval kepercayaan, maupun uji perbedaan antar alat, sehingga "F1 terbaik 0.88" adalah angka titik tanpa ketidakpastian. **Tanpa full text, kualitas keseluruhan studi tidak dapat dipastikan** — analisis ini batasnya di sini, dan mengambil kesimpulan lebih jauh dari abstrak akan melanggar batas evidensi yang ditetapkan.

**[X] bagian tidak dapat dianalisis sama sekali tanpa full text:** algoritma/skema deteksi tiap alat, analisis kesalahan (false positive/negative apa yang dominan), subkelompok analisis (jenis plagiarisme, panjang esai, bidang studi), biaya/komputasi, dan implikasi kebijakan penegakan akademik.
