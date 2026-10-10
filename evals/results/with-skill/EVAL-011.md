# EVAL-011 with_skill

## Status verifikasi (dibaca dulu, sebelum sintesis)

Sesuai Aturan Global #3 skill `scientific-research`: bukti, bukan asersi.

| Item | Paper A | Paper B |
|------|---------|---------|
| Sumber | ringkasan sintetis (bukan full text) | ringkasan sintetis (bukan full text) |
| Venue | jurnal nasional terakreditasi — **belum terverifikasi** | internasional — **belum terverifikasi** |
| DOI / tautan | tidak ada di fixture | tidak ada di fixture |
| Audit sumber (Fase 3) | tidak bisa dijalankan | tidak bisa dijalankan |

Dua keterbatasan yang harus dibaca bersama seluruh jawaban di bawah:

1. **Web tidak tersedia di harness ini** (SKILL.md → KAPABILITAS & FALLBACK: *"Jangan mengarang hasil pencarian"*). Maka tidak ada verifikasi Crossref/SINTA/Scopus/DOAJ, tidak ada full text, tidak ada cek apakah d dihitung sebagai antar-kelompok atau perubahan pre-post. Semua langkah verifikasi di bawah ditandai sebagai **rekomendasi**, bukan hasil.
2. **Keduanya ringkasan sintetis untuk menguji sintesis** — bukan klaim ilmiah nyata. Status setiap dimensi tetap `belum terverifikasi`; tidak ada yang boleh dinaikkan jadi "valid" atau "invalid".

---

## 1. Sintesis: apakah kedua paper benar-benar bertentangan?

**Tidak bertentangan secara logis. Keduanya menjawab pertanyaan yang berbeda.**

| | Paper A | Paper B |
|---|---|---|
| Kontras (estimand) | flashcard digital **vs kelompok kontrol** (kondisi bawaan/tanpa intervensi) | flashcard digital **vs flashcard kertas** (dua aktif) |
| Pertanyaan | *"Apakah flashcard digital bekerja?"* | *"Apakah medium digital lebih baik dari kertas?"* |
| Desain | pre-post dengan kontrol, non-randomisasi penuh | RCT |
| n | 200 (SMA Bandung) | 85 (universitas) |
| Interval tes tertunda | 8 minggu | 4 minggu |
| Hasil | d = 0.62 | d = 0.05 |

Kedua temuan bisa benar-benar serentak benar:

- A benar → flashcard digital **efektif** dibanding tidak melakukan apa pun.
- B benar → keuntungan **khusus medium digital** di atas kertas hampir nol.

Mekanisme yang memberi keduanya efek aktif bersama: *testing effect* / retrieval practice — mekanisme itu ada di flashcard apa pun, kertas maupun digital. Jadi B bukan sangkalan terhadap A; B memotong efek menjadi: (efek flashcard) + (tambahan efek medium digital). A mengukur jumlah keduanya terhadap kontrol; B mengukur suku kata keduanya saja. Suku katanya kecil, jumlahnya besar → d=0.62 dan d=0.05 **kompatibel**.

Satu kalimat sintesis: **flashcard digital kemungkinan bekerja, tetapi bukti tidak mendukung klaim bahwa digital lebih baik daripada kertas.**

---

## 2. Dari mana perbedaannya? Lima kandidat, diurutkan dari paling berpengaruh

### 2.1 Desain — kandidat terkuat (dan paling meragukan bagi A)

- **A: non-randomisasi penuh.** Alokasi kelompok tidak acak → seleksi ke kelompok bisa berkorelasi dengan motivasi, akses internet, kebiasaan belajar, dukungan orang tua. Control group mengurangi *maturation* dan *testing effect*, tetapi **tidak menghilangkan selection bias**. Arah bias cenderung *menggelembungkan* efek.
- **A juga desain pre-post.** Kalau yang dilaporkan adalah *perubahan* (post − pre) bukan kontras antar-kelompok yang diancovari, maka regresi ke mean dan efek tes ikut terhitung sebagai "efek intervensi". Ini penyebab paling umum d yang terlalu besar pada desain begini.
- **B: RCT.** Randomisasi menyeimbangkan variabel tersembunyi → estimasi kontras medium jauh lebih kuat secara *internal validity*. Dengan RCT, d=0.05 lebih bisa dipercaya daripada d=0.62 dari non-RCT.

**Kesimpulan sementara:** perbedaan paling mungkin dari desain: A kemungkinan *overestimate*, B *unbiased tapi kecil*. Keduanya bisa jadi benar pada nilai "kebenaran" sekitar nol untuk kontras digital-vs-kontrol yang murni, dan nol untuk digital-vs-kertas.

### 2.2 Sampel

- **Populasi berbeda:** siswa SMA (15–18 th) vs mahasiswa. Remaja SMA mungkin punya *headroom* lebih besar (kebiasaan belajar belum terbentuk, familiaritas rendah → efek kejutan/novelty medium digital lebih besar); mahasiswa sudah punya strategi belajar sendiri → ruang untuk berubah lebih sempit.
- **Ukuran sampel berbeda → ketidakpastian berbeda.** Aproksimasi kasar (Hedges g, dua kelompok seimbang, SE(d) ≈ √(4/n)):

  | | d | SE kasar | 95% CI kasar |
  |---|---|---|---|
  | A (n=200) | 0.62 | ≈0.14 | ≈ [0.34, 0.90] |
  | B (n=85) | 0.05 | ≈0.22 | ≈ [−0.37, 0.47] |

  CI A **tidak** sepenuhnya di atas CI B: ada wilayah tumpang tindih [0.34, 0.47]. Uji heterogenitas kasar: (0.62−0.05)/√(0.14²+0.22²) ≈ 0.57/0.26 ≈ **z ≈ 2.2 (p ≈ 0.03)** — bedanya hanya *borderline*, padahal asumsi kedua estimand setara sudah meragukan (lihat 2.1). Artinya: perbedaan A vs B **belum cukup kuat untuk dinyatakan sebagai kontradiksi nyata**.
  - ⚠️ Aproksimasi ini kasar: desain pre-post dengan kontrol punya SE lebih kecil bila korelasi pre-post tinggi, dan alokasi mungkin tidak 1:1. Angka hanya untuk urutan besar-kecilnya.
- **Daya statistik (power):** B dengan n=85 hanya punya power ≈ 0.28 untuk d=0.30 (ambang signifikan kasar ≈ 0.42). Jadi **B tidak membuktikan "tidak ada beda"** — B *gagal menemukan* beda. Klaim "tidak berbeda" butuh *equivalence test* (TOST) dengan margin yang dinyatakan lebih dulu; tidak ada indikasi itu dilakukan. Ini koreksi penting: d=0.05 ≠ bukti kesetaraan.
- A dengan n=200 pun power ≈ 0.56 untuk d=0.30 — juga tidak sempurna, tapi efek yang dilaporkan (0.62) jauh di atas ambang.

### 2.3 Data (pengukuran, prosedur, interval)

- **Interval tes tertunda berbeda: 8 minggu (A) vs 4 minggu (B).** Ini bukan perbedaan sepele — kurva *forgetting* eksponensial. Keanehan: A melaporkan efek *lebih besar* pada interval yang *lebih panjang*. Kalau memang itu yang terjadi, konsisten dengan hipotesis "kelompok kontrol melupakan lebih cepat" — tapi juga bisa menandakan perbedaan jumlah sesi latihan, dosis, atau pengawasan antar-studi.
- **Instrumen tes kemungkinan berbeda** (jenis butir, jumlah butir, skoring, recall vs recognition, tes tertulis vs aplikasi). Tanpa teks penuh: tidak bisa dibandingkan.
- **Data kelolaan/eksposur berbeda:** A mungkin melibatkan pendampingan guru & tugas wajib (tekanan eksternal menghasilkan latihan lebih banyak di kedua kelompok), B mungkin mandiri. Kalau begitu, yang diukir bukan "medium" tapi "dosis latihan".
- **Cek yang harus dilakukan (belum bisa dijalankan):** N butir, bentuk recall/recognition, siapa yang menyusun butir, apakah butir identik antar-kelompok, jumlah sesi, compliance/attrition, apakah analisis intention-to-treat.

### 2.4 Metrik

- **d adalah skala ternormalisasi → lintas-studi tidak otomatis sebanding.** d = selisih rata-rata / SD gabungan. Sampel SMA Bandung yang beragam (mis. ada siswa yang sejak awal sudah rajin) punya SD besar → d mengecil; sampel homogen → d membesar. Angka d yang sama bisa mewakili selisih mentah yang sangat berbeda.
- **Estimand berbeda (lihat §1):** d A = kontras terhadap kontrol (mungkin dalam-bentuk perubahan); d B = kontras antar dua aktif. Ini sumber perbedaan terbesar dan **bukan** soal ukuran sampel.
- Kemungkinan lain: A melaporkan *within-group* atau *pre-post pooled* (umum pada laporan non-RCT), B melaporkan *between-group* post-test. Tanpa teks penuh → `belum terverifikasi`.
- **Cek:** apakah d koreksi Hedges g atau Cohen's d; apakah CI dilaporkan; apakah koreksi untuk baseline (ANCOVA) dipakai.

### 2.5 Konteks

- **Konteks implementasi berbeda:** sekolah SMA Bandung (kurikulum, tekanan ujian, mungkin kelas yang sama di bawah satu guru) vs universitas (belajar mandiri). Efek intervensi yang di-*deliver* guru umumnya lebih besar daripada yang mandiri.
- **Familiaritas & novelty effect:** mahasiswa hampir pasti sudah lebih terbiasa dengan aplikasi → efek "kebaruan alat" hilang di B.
- **Venue & incentive penulisan berbeda** (nasional terakreditasi vs internasional): relevan untuk *publication bias* dan standar pelaporan, tetapi **venue belum terverifikasi** — jadi ini hipotesis kerja, bukan temuan.
- **Konteks waktu/teknologi:** kalau tahun terbit berbeda jauh, kualitas aplikasi flashcard juga beda. Tahun terbit tidak ada di fixture.

---

## 3. Urutan penjelasan paling masuk akal

1. **Estimand/kontras berbeda** (digital-vs-kertas ≠ digital-vs-kontrol) — perbedaan struktural, bukan kontradiksi.
2. **Desain:** non-randomisasi A cenderung menggelembungkan efek; RCT B lebih bersih.
3. **Metrik:** d ternormalisasi dengan basis berbeda; kemungkinan jenis d yang berbeda.
4. **Sampel:** populasi + n → CI B terlalu lebar untuk menyimpulkan "tidak ada beda".
5. **Data & konteks:** interval tes, dosis, instrumen, pendampingan guru, familiaritas, venue.

Tidak ada satu pun yang bisa dikunci tanpa teks penuh.

---

## 4. Cara memutuskan (rekomendasi verifikasi — belum bisa dijalankan, web tidak tersedia)

Checklist untuk pengguna, diurutkan nilai per usaha:

- [ ] Ambil full text kedua paper → cocokkan **definisi kontras** pada tiap d (ini langkah dengan nilai tertinggi; kemungkinan besar menyelesaikan 70% "kontradiksi").
- [ ] Cek metode A: alokasi benar-benar tidak acak? Analisis pakai ANCOVA post-test atau selisih pre-post? Attrition berapa persen?
- [ ] Cek B: apakah ada **equivalence test (TOST)**? Kalau tidak, ganti frasa "tidak berbeda" jadi "tidak ditemukan perbedaan (underpowered, power ≈ 0.28 untuk d=0.30)".
- [ ] Cocokkan instrumen tes: bentuk butir, jumlah, recall/recognition, penyusun.
- [ ] Cocokkan dosis: jumlah sesi, lama per sesi, siapa yang memandu.
- [ ] Audit venue per dimensi terpisah (Fase 3): Crossref/DOI, kebijakan peer review, SINTA (untuk A), Scopus (untuk B), DOAJ — status `ya/tidak/belum terverifikasi` + tautan + tanggal cek. **Jangan** menggabung jadi satu label valid/invalid.
- [ ] Cari paper ketiga yang membandingkan digital vs kertas dengan RCT + n memadai (idealnya jauh di atas 85) untuk menjadi jangkar.

---

## 5. Apa yang TIDAK boleh disimpulkan sekarang

- ❌ "Paper A salah / paper B salah" — tidak ada yang bisa dinyatakan invalid tanpa bukti tautan (Aturan Global #3).
- ❌ "Flashcard digital tidak efektif" — A menunjukkan sebaliknya dan B tidak menguji itu.
- ❌ "Flashcard digital = kertas" — B tidak cukup power untuk klaim kesetaraan.
- ❌ "d=0.62 lebih besar karena sampelnya lebih besar" — pengaruh n pada *besar efek* nol; n hanya mengubah ketepatan estimasi.
- ❌ Klaim venue/nama jurnal/kualitas metodologi sebagai fakta — semua `belum terverifikasi`.

## 6. QC checklist internal (semua lolos)

- [x] Status sumber dipisah per dimensi, tidak ada label tunggal valid/invalid
- [x] Keterbatasan web dilaporkan, tidak ada hasil pencarian yang dikarang
- [x] Angka numerik (CI, power, z) ditandai sebagai aproksimasi kasar dengan asumsinya
- [x] Tidak ada keputusan riset final; seluruh langkah lanjut berupa rekomendasi untuk validasi manusia
- [x] Klaim utama "tidak bertentangan" ditopang penjelasan estimand, bukan asersi

**Status:** sintesis bersifat sementara (`belum terverifikasi`) sampai full text dan audit venue tersedia. Konfirmasi akhir = validasi pengguna (gate tidak berlaku untuk mode mandiri ini).
