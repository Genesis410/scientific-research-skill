# EVAL-006 with_skill

**Pemetaan dalam skill scientific-research:** Permintaan ini masuk mode **7 — Dataset Analysis (→ Fase 5, gate G5)** dengan sentuhan Fase 4 (desain). Tujuan eksplisit sudah disebut pengguna, jadi menu dilewati (Aturan routing skill). Sesuai LARANGAN skill, metode statistik TIDAK saya finalkan sepihak: di bawah saya ajukan rekomendasi + gate untuk konfirmasi Anda sebelum analisis dieksekusi.

---

## 1. Klarifikasi desain dulu (sebelum memilih uji)

Berdasarkan contoh data yang Anda berikan:

| Elemen | Status dari data Anda |
|---|---|
| Desain | Cross-sectional survei; setiap responden memberi **satu pasang skor (X, Y)** |
| Dependensi | Pasangan dalam satu responden **non-independen**, tetapi antar-responden diasumsikan independen (asumsi sampling) |
| X — kebiasaan belajar | Likert 5 poin |
| Y — prestasi | Likert 5 poin |
| n | 120 (cukup besar untuk uji korelasi parametrik maupun nonparametrik) |
| Riset | Asosiasi/hubungan, bukan eksperimen |

**Dua keputusan yang harus Anda ambil sebelum analisis (saya tidak boleh memutuskannya tanpa konfirmasi Anda — LARANGAN skill, butir 4):**

**Keputusan A — Rumusan masalah: "hubungan" atau "perbedaan"?**
Ini jebakan paling umum pada data berpasangan. "Non-independen" ≠ otomatis uji beda.

- Jika tujuan: **apakah kebiasaan belajar berhubungan dengan prestasi** → uji **asosiasi/korelasi** (Pearson/Spearman — lihat Keputusan B). Desain berpasangan justru *memungkinkan* korelasi: korelasi butuh dua skor dari subjek yang sama.
- Jika tujuan: **apakah rata-rata skor X berbeda dari rata-rata skor Y** → paired t-test (bila asumsi terpenuhi) atau Wilcoxon signed-rank. Ini mengukur *perbedaan taraf*, bukan hubungan, dan tidak menjawab pertanyaan asosiasi Anda.

Saya asumsikan Anda memilih **hubungan** sesuai permintaan awal; mohon konfirmasi.

**Keputusan B — Apakah X dan Y skor tunggal atau skor skala?**

- **Skor tunggal** (satu item Likert 5 poin per variabel): skala murni **ordinal**, banyak nilai terikat (ties), distribusi tidak normal → uji parametrik Pearson tidak tepat.
- **Skor skala** (jumlah/rata-rata beberapa item Likert; misal 5–10 item per variabel): skala sumatif sering diperlakukan mendekati interval, terutama bila reliabilitas tinggi (Cronbach's α/ω ≥ 0,70) dan jumlah item cukup → Pearson layak dipertimbangkan **hanya jika asumsinya terpenuhi**.

---

## 2. Matriks keputusan (desain × karakteristik variabel × asumsi)

| Kondisi data | Uji sesuai desain | Asumsi yang wajib dicek |
|---|---|---|
| Likert tunggal 5 poin (ordinal), tujuan hubungan | **Spearman's rho (utama)** | Hubungan monoton; observasi antar-responden independen; ties ditangani koreksi |
| Skor skala ≈ interval, tujuan hubungan, asumsi terpenuhi | **Pearson's r** | Linearitas, bivariate normalitas, homoskedastisitas, tidak ada outlier pengungkit |
| Banyak sekali ties / distribusi sangat terkumpul di satu kategori | Kendall's tau-b | Lebih konservatif, cocok bila ties dominan |
| Ingin memodelkan Y sebagai outcome ordinal dengan prediktor lain/kovariat | Regresi logistik ordinal | Proportional odds |
| Tujuan perbedaan taraf X vs Y (bukan hubungan) | Paired t-test / Wilcoxon signed-rank | Beda: normalitas selisih (t) vs simetri distribusi selisih (Wilcoxon) |

**Rekomendasi saya (menunggu konfirmasi Keputusan B):**

- Bila **skor tunggal** → **Spearman's rho**, dua arah, α = 0,05. Ini pilihan yang dirancang untuk data ordinal ber-ties; tidak ada asumsi normalitas yang dilanggar.
- Bila **skor skala** → uji asumsi dulu (lihat §3). Asumsi terpenuhi → **Pearson**; gagal → **Spearman** sebagai alternatif yang tetap sesuai desain (bukan pengganti "yang lebih signifikan" — lihat §5).

Korelasi polychoric tersedia sebagai opsi lanjutan bila Anda ingin estimasi asosiasi antara variabel laten tersembunyi di balik Likert; ini analisis lebih canggih dan tidak wajib untuk jawaban riset dasar.

---

## 3. Urutan eksekusi analisis (yang akan saya jalankan setelah Anda setuju)

1. **Pipeline data**: dokumentasikan sumber → cek kelengkapan (n=120 utuh?) → deteksi outlier/missing → variabel akhir. Setiap langkah ditulis di progress.md (reproducibility).
2. **Deskriptif**: frekuensi + proporsi tiap kategori Likert, median & IQR (untuk ordinal), mean & SD (hanya bila skor skala), skewness/kurtosis.
3. **Reliabilitas** (hanya bila skor skala): Cronbach's α atau omega per skala sebelum skor dihitung.
4. **Uji asumsi** (khusus jalur Pearson): Shapiro-Wilk pada tiap variabel dan residual; Q-Q plot; scatterplot untuk linearitas & outlier; uji homoskedastisitas. Untuk Spearman: cek hubungan monoton via scatterplot.
5. **Uji utama** sesuai keputusan di §2.
6. **Effect size + ketidakpastian**: koefisien r/rho dengan **confidence interval 95%** (bootstrap untuk Spearman), bukan sekadar p-value. Interpretasi ukuran efek (panduan Cohen untuk r: ~0,1 kecil; ~0,3 sedang; ~0,5 besar — konteks substantif tetap diutamakan).
7. **Pelaporan lengkap**: statistik uji, df, p dua arah eksak, koefisien, CI, n efektif, dan **keterbatasan** (korelasi ≠ kausalitas; rentang Likert menyebabkan efek plafon/ceiling; data self-report).

---

## 4. Antipahacking — aturan yang saya kunci sebelum melihat hasil (sesuai eksplisit permintaan Anda)

- Uji yang dipilih **dari desain dan karakteristik variabel**, bukan dari hasil mana yang signifikan. Keputusan A & B di atas dikunci sebelum analisis.
- α = 0,05 dua arah; tidak diubah setelah melihat data.
- **Tidak ada** switching Pearson→Spearman (atau sebaliknya) karena salah satu lebih signifikan — pergantian hanya dipicu **gagalnya uji asumsi**, dengan bukti uji asumsi yang dilaporkan.
- Semua hasil dilaporkan apa adanya; koefisien tidak signifikan tetap ditulis lengkap.
- Jika nanti ada banyak variabel/analisis eksploratif, koreksi multiplikasi (mis. Bonferroni/FDR) akan diusulkan dan dideklarasikan sebagai eksploratif.

---

## 5. QC Checklist Fase 5 (dijalankan sebelum gate G5)

- [ ] Analisis sesuai rencana di decisions.md; deviasi dibuat eksplisit + alasannya
- [ ] Asumsi statistik diuji/dilaporkan (normalitas, linearitas/monoton, homoskedastisitas, outlier, independensi antar-responden)
- [ ] Tidak ada p-hacking: uji & α dikunci sebelum melihat hasil
- [ ] Hasil direproduksi dari dokumentasi langkah
- [ ] Limitasi ditulis (asosiasi ≠ kausalitas; Likert ordinal; ceiling effect; self-report)

---

## 6. GATE — persetujuan sebelum eksekusi (Fase 5 → G5)

Saya tidak akan memutuskan metode statistik tanpa konfirmasi Anda. Mohon jawab tiga hal:

1. **Tujuan**: hubungan (korelasi) — benar? Atau justru perbedaan taraf X vs Y?
2. **Bentuk skor**: X dan Y skor tunggal (1 item) atau skor skala (jumlah/beberapa item)? Bila skor skala: berapa jumlah item & sudah ada nilai α reliabilitas?
3. **Lokasi file data**: berikan path file (mis. CSV/Excel) agar saya eksekusi pipeline + uji asumsi di folder proyek Anda (data tidak diunggah ke layanan eksternal — Aturan global #5).

Setelah Anda konfirmasi, saya jalankan urutan §3, lalu ajukan G5 berisi temuan + keterbatasan untuk persetujuan lanjut.
