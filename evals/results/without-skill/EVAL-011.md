# EVAL-011 without_skill

## 1. Sintesis inti

Kedua paper tidak benar-benar mengukur hal yang sama, sehingga "temuan berbeda" belum tentu kontradiksi.

- Paper A mengukur **flashcard digital vs kelompok kontrol** (jenis kontrol tidak dirinci pada ringkasan) → estimand: *flashcard digital vs apa pun yang dilakukan kontrol*. Efek d = 0.62 pada tes tertunda 8 minggu, n = 200, siswa SMA Bandung, pre-post dengan kontrol, randomisasi tidak penuh.
- Paper B mengukur **flashcard digital vs flashcard kertas** (komparator aktif) → estimand: *modalitas digital vs kertas*. Efek d = 0.05 pada tes tertunda 4 minggu, n = 85, mahasiswa, RCT.

Keduanya bisa benar serentak: **flashcard (apa pun medianya) lebih baik daripada tidak pakai flashcard, sementara digital ≈ kertas**. Beda headline (0.62 vs 0.05) sebagian besar berasal dari beda pertanyaan riset, bukan dari beda kebenaran.

Pengecualian yang membuat kontradiksi jadi nyata: jika kontrol pada Paper A **memang flashcard kertas** (atau "belajar biasa yang melibatkan flashcard kertas"), maka kedua studi membandingkan hal yang sama dan perbedaannya harus dijelaskan oleh faktor lain di bawah ini.

## 2. Dari mana perbedaannya mungkin berasal

### a. Desain (kemungkinan paling besar)
- **Paper A: pre-post non-random penuh.** Risiko bias seleksi (siswa/kelas yang memilih intervensi bisa lebih termotivasi), regression to the mean, testing effect (pre-test ikut mengajari), dan attrition yang tak tertangani semuanya menggelembungkan d ke atas. Bila randomisasi dilakukan di level kelas tapi analisis di level siswa tanpa cluster-robust SE (ICC tak diperhitungkan), SE jadi terlalu kecil dan efek tampak lebih "kokoh" daripada kenyataan.
- **Paper B: RCT**, bias seleksi jauh lebih kecil, tapi komparator aktif membuat efek menyusut secara inheren (kedua kelompok sama-sama dapat manfaat retrieval practice) → efek kontras jauh lebih kecil dari kontras vs kontrol pasif.
- Paper A kemungkinan melaporkan efek *superiority vs kontrol pasif*; Paper B pada dasarnya menguji *setara/superioritas tipis*. Beda estimand, bukan beda hasil.

### b. Sampel
- **Populasi berbeda:** SMA Bandung (remaja, belajar terarah guru/kurikulum, mungkin tekanan ujian tinggi → efek intervensi terstruktur lebih besar) vs mahasiswa (belajar mandiri, literasi digital tinggi → kedua metode sudah "panggung setara", tidak ada lagi keuntungan novelty/kemudahan digital).
- **Ukuran sampel beda:** n = 200 vs n = 85. Presisi jauh berbeda. Dengan n = 85 dan alokasi seimbang, SE(d) ≈ √(4/85) ≈ 0.22 → CI 95% untuk d = 0.05 kira-kira **[−0.38, +0.48]**. Interval itu masih memuat efek sedang, jadi Paper B **tidak membuktikan "tidak ada beda"** — ia gagal menolak nol (bukti ketiadaan ≠ ketiadaan bukti). Klaim "tidak berbeda" butuh uji equivalensi (TOST) dengan margin mis. ±0.20, bukan p > 0.05.
- Pada A (n = 200, seimbang), SE(d) ≈ 0.14 → CI ≈ [0.34, 0.90]. Tapi CI itu untuk estimand yang berbeda, jadi **tidak boleh dibandingkan langsung** dengan CI Paper B.
- Satu titik data masing-masing → terlalu sedikit untuk meta-analisis; I² / uji Q tidak bermakna dengan 2 studi berbeda estimand.

### c. Data
- **Waktu tes tertunda beda:** 8 minggu (A) vs 4 minggu (B). Secara paradoks A (delay lebih panjang) justru menemukan efek lebih besar — hal ini konsisten dengan penjelasan "beda komparator", bukan dengan hipotesis peluruhan memori.
- **Instrumen & reliabilitas berbeda:** d = selisih rata-rata / SD. Tes yang lebih homogen (SD kecil) → d membesar tanpa ada beda mentah yang lebih besar. Reliabilitas rendah menekan d; tes berbeda antar-studi membuat skala d tak sebanding.
- **Dosis intervensi beda:** frekuensi, durasi, materi, pendampingan guru, tingkat kepatuhan (fidelity) tidak disebut di kedua ringkasan.
- **Penanganan data hilang:** A pre-post rentan per-protocol analysis yang bias; B kecil dan mungkin single-site.

### d. Metrik
- **Definisi Cohen's d berbeda antar-studi:** d_av, d_ppc (koreksi korelasi pre-post), d_rm (Morris & DeShon), Hedges' g dengan korelasi ukuran sampel. Pada desain pre-post, pilihan korelasi pre-post mengubah d belasan persen; memakai SD change tanpa koreksi atau tanpa koreksi cluster dapat membengkakkan efek.
- **Pembanding SD berbeda:** pooled SD post-test vs SD pre-test vs SD gain.
- **Analisis:** d dari ANCOVA (pre-test sebagai kovariat) vs d dari difference-in-gain → nilai berbeda untuk data yang sama.
- Angka 0.62 vs 0.05 bisa murni produk beda konvensi perhitungan, belum tentu beda substansi.

### e. Konteks
- **Setting:** SMA Bandung vs kampus; kurikulum, target ujian, tekanan akademik, akses perangkat, dukungan guru berbeda.
- **Venue:** jurnal nasional terakreditasi vs internasional — standar pelaporan, potensi publication bias / winner's curse pada efek besar, dan kualitas peer-review belum terverifikasi di harness ini.
- **Kesegaran alat (novelty)** dan kebiasaan belajar mahasiswa yang sudah mapan dapat mengikis keunggulan digital.
- Keduanya **ringkasan sintetis, belum tervalidasi**; angka d, n, venue, dan desain belum diverifikasi. Perlakukan sebagai hipotesis, bukan fakta.

## 3. Kesimpulan sintesis

Perbedaan paling parsimonious: **beda estimand (vs kontrol pasif ≠ vs kertas)**, lalu **desain non-RCT vs RCT** yang memperbesar efek A, lalu **populasi SMA vs mahasiswa** dan **definisi d yang tidak seragam**. Selisih 0.62 − 0.05 = 0.57 jangan dibaca sebagai perbedaan nyata: CI Paper B sendiri lebar (±0.4), dan kedua estimand tidak sebanding untuk diuji beda secara formal.

## 4. Desain pengujian yang bisa memisahkan pengaruh tersebut

1. **RCT multi-lengan** dengan satu populasi: digital vs kertas vs tanpa flashcard → langsung meniru kedua estimand dalam satu percobaan.
2. **Tes tertunda diukur di titik yang sama** (mis. 4 dan 8 minggu sekaligus) untuk memisahkan efek modalitas dari efek waktu.
3. **Satu konvensi metrik:** Hedges' g atau d_av, laporkan CI, korelasi pre-post, dan ICC; unit randomisasi = individu atau analisis cluster-robust.
4. **Uji TOST/equivalensi** (margin ±0.20) untuk klaim "tidak berbeda"; jangan pakai p > 0.05 sebagai bukti setara.
5. **Preregistrasi, analisis ITT**, laporan attrition; kalau kontrol A memang kertas, replikasi RCT di populasi SMA Bandung.
6. Dengan ≥ beberapa studi sebanding: meta-analisis dengan meta-regresi desain/sampel/delay sebagai moderator.

## 5. Catatan verifikasi

- Sumber hanya ringkasan sintetis (two-papers.md), penanda "belum tervalidasi".
- Belum dicek: paper asli, definisi d persis, jenis kontrol A, korelasi pre-post, ICC, angka attrition, venue.
