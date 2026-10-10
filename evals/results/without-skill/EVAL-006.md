# EVAL-006 without_skill

# Pemilihan Analisis untuk Dua Variabel Likert Dependen (n=120)

## 1. Spesifikasi desain dan variabel

- **Desain:** cross-sectional, non-independen — dua skor dari responden yang sama (paired / within-subject).
- **X (kebiasaan belajar):** Likert 5 poin, skala ordinal (kemungkinan agregat butir — cek dulu apakah skor total dari beberapa item).
- **Y (prestasi):** Likert 5 poin, ordinal.
- **n = 120:** cukup besar untuk uji non-parametrik dan untuk asumsi normalitas lewat pendekatan robust.

Langkah wajib sebelum memilih uji: pastikan skor tiap variabel apakah **skor tunggal** (1 item, 5 kategori) atau **skor total** (banyak item, dijumlahkan). Ini mengubah pilihan analisis secara mendasar.

## 2. Pilihan analisis berdasarkan skenario

### Skenario A — skor tunggal (1 item per variabel, 5 kategori)

Uji asosiasi dua variabel ordinal kategorikal:

- **Uji Korelasi Kendall's tau-b** (utama): dirancang untuk data ordinal dengan banyak ikatan (ties), yang pasti melimpah pada Likert 5 poin. tau-b mengoreksi ties, unlike tau-c.
- **Alternatif: Spearman's rho** — masih lazim dilaporkan, tetapi dengan 5 kategori dan ties berat, tau-b lebih unggul secara statistik.
- **Chi-square independensi** (tabel 5×5) hanya jika pertanyaannya berpindah ke "asosiasi kategorikal", bukan kekuatan hubungan. Chi-square tidak memanfaatkan sifat ordinals dan dengan 5×5 banyak sel berharapan <5 → gabungkan kategori atau pakai Fisher-Freeman-Halton.
- **Gamma / Somers' d** bila ingin ukuran yang bebas dari ties sepenuhnya; Somers' d (Y|X asymmetric) bagus jika ada arah teoretis X→Y.

### Skenario B — skor total beberapa item (rata-rata/jumlah butir)

Skor total bersifat **kontinu-interval de facto**, meskipun asalnya ordinal:

- **Korelasi Spearman's rho** (pilihan aman, tidak membutuhkan normalitas).
- **Pearson** sah jika distribusi skor mendekati normal dan linear — cek histogram + Q-Q plot, bukan hanya Shapiro-Wilk (dengan n=120 Shapiro-Wilk sensitif berlebihan).
- Perlu kehati-hatian: kedua variabel berasal dari responden yang sama bisa menciptakan **common-method variance**; interpretasi tetap asosiasi, bukan sebab-akibat.

### Mengapa BUKAN uji beda rata-rata

Ini titik krusial: **independen di sini artinya dua skor dari orang yang sama, bukan dua kelompok**. Desainnya bukan matched-pairs t-test / Wilcoxon signed-rank untuk membandingkan *tinggi-rendah* X vs Y — karena X dan Y mengukur **konstruk berbeda** (kebiasaan vs prestasi). Skala X 1–5 dan Y 1–5 tidak komparabel substantif. Beda rata-rata X−Y tidak bermakna substantif. Jadi:

- **Bukan** independent-samples t-test (itu untuk dua kelompok berbeda).
- **Bukan** paired t-test / Wilcoxon signed-rank (itu untuk dua pengukuran *sama* pada hal berbeda, mis. pre-post).
- **Yang dicari: hubungan/kekuatan asosiasi** → korelasi.

## 3. Uji yang sesuai (rekomendasi utama)

**Korelasi Spearman's rho** (skor total) atau **Kendall's tau-b** (skor tunggal 5 kategori), dua sisi (two-tailed) kecuali ada hipotesis arah.

Alasan, bukan karena berpotensi signifikan:
1. Variabel ordinal → asumsi normalitas Pearson tidak terpenuhi secara teoritis.
2. Pasangan skor dari responden yang sama → data berpasangan, korelasi memang alat untuk itu.
3. n=120 → estimasi korelasi cukup stabil; power bukan pertimbangan pemilihan uji.
4. tau-b unggul saat ties banyak (5 kategori = ties sangat banyak).

## 4. Asumsi yang perlu diperiksa

Untuk **Spearman/Kendall** (ringan):
- Observasi independen antar-responden (satu baris per responden, tanpa sampel bertingkat/clusters).
- Variabel minimal ordinal; hubungan bersifat monoton, tidak harus linear.
- Tidak ada asumsi normalitas.

Untuk **Pearson** (jika dipilih):
- Linearitas (scatterplot).
- Normalitas bivariat / normalitas residu.
- Homoskedastisitas.
- Tidak ada outlier berpengaruh (cook's distance / leverage).

Umum:
- Skala ordinal 5 poin: pertimbangkan analisis **polychoric correlation** bila asumsi threshold normal bivariat masuk akal — lebih tepat untuk ordinal tapi jarang dilaporkan di riset sosial dasar.
- Cek **reliabilitas** (Cronbach's alpha / omega) jika X atau Y skor gabungan butir; reliabilitas rendah meremukkan korelasi (attenuation).

## 5. Pelaporan & langkah lanjutan

Laporkan: rho/tau, n, p (dua sisi), **koefisien determinasi** (rho²) untuk proporsi varians bersama, dan **CI 95%** (bootstrap BCa cocok untuk ordinal, n=120 cukup untuk 5000 resamples).

Jika hubungan signifikan dan ada variabel kontrol (umur, gender, jam belajar):
- **Partial Kendall / partial Spearman**, atau
- **Ordinal logistic regression** (Y ordinal 5 kategori, X sebagai prediktor) — model lebih kaya, bisa dapat odds ratio.

Jika ingin uji perbedaan antar kelompok pada Y (mis. kategori "rendah/sedang/tinggi" X): Kruskal-Wallis / Mann-Whitni, bukan t-test.

## 6. Ringkasan keputusan

| Kondisi | Pilihan |
|---|---|
| Skor tunggal 5 poin, banyak ties | **Kendall's tau-b** |
| Skor total (multi-butir) | **Spearman's rho** (atau Pearson bila normal & linear) |
| Ada variabel kontrol / butuh prediksi | **Ordinal logistic regression** |
| Ingin asosiasi kategorikal murni | Chi-square 5×5 (hati-hati sel kecil) |
| Salah | independent t-test, paired t-test, Wilcoxon signed-rank (tujuan salah) |

**Rekomendasi inti: Kendall's tau-b (skor tunggal) atau Spearman's rho (skor total), dua sait, dengan CI bootstrap. Bukan uji beda rata-rata — desain mencari asosiasi, bukan perbedaan.**
