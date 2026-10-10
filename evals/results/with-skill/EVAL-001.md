# EVAL-001 with_skill

**Mode yang dijalankan:** Mode 10 — "Jelaskan/evaluasi 1 paper" (mandiri, tanpa pipeline, tanpa folder proyek, tanpa gate antarfase). Tujuan pengguna sudah eksplisit sejak awal, jadi menu entry dilewati sesuai aturan routing skill.

**Status sumber:** Terverifikasi. DOI yang diberikan ternyata *resolve* ke paper nyata (bukan fiktif), dan full text prarevisi bisa diakses bebas.
Judul: *Automatic Generation of Dominance Breaking Nogoods for a Class of Constraint Optimization Problems*
Penulis: Jimmy H. M. Lee, Allen Z. Zhong (The Chinese University of Hong Kong)
Venue: *Artificial Intelligence*, Vol. 323, Article 103974, 28 halaman, terbit Oktober 2023.
Tautan verifikasi:
- DOI: https://doi.org/10.1016/j.artint.2023.103974
- Full text (prarevisi PDF, CUHK): http://www.cse.cuhk.edu.hk/~jlee/publ/23/aij23AutoDomBreak.pdf
- Rekam metadata (Monash): https://research.monash.edu/en/publications/automatic-generation-of-dominance-breaking-nogoods-for-a-class-of/
- Kode + benchmark: https://github.com/AllenZzw/auto_dom/tree/dominance
- Versi konferensi pendahulu (IJCAI 2020): https://www.ijcai.org/proceedings/2020/0166.pdf
- Lanjutan (JAIR 2023): https://doi.org/10.1613/jair.1.14714

---

## 1. Tujuan

Constraint Optimization Problem (COP) — cari penugasan variabel yang memenuhi batasan sambil memaksimalkan/meminimalkan objective — umumnya diselesaikan dengan Branch and Bound (B&B). Dalam B&B, *dominance breaking* memangkas penugasan yang "subordinat" (nilai objektifnya tidak lebih baik dan/atau keterpenuhannya terimplikasi oleh penugasan lain). Masalahnya: mengenali relasi dominasi dan menyusun konstraksinya selama ini **problem-specific dan menuntut wawasan manusia yang mendalam**.

Tujuan paper: menyodorkan **kerangka teoretis dan praktis pertama untuk generasi otomatis dominance breaking constraints** pada kelas COP yang objective dan constraint-nya *efficiently checkable*, sehingga teknik ini bisa dipakai non-ahli. Fokusnya khusus pada bentuk *nogood* (larangan kombinasi nilai) dan generasi nogoods diformulasikan sebagai penyelesaian CSP bantu.

## 2. Metode

1. **Teori dominasi pada partial assignment** (Bagian 4): mendefinisikan kapan satu assignment constraint didominasi lain melalui tiga kondisi cukup — *irreflexivity*, *betterment*, *implied satisfaction* — untuk objective dan constraint bentuk efisien-dicek (linear, separable, submodular, alldifferent, atmost, dll).
2. **Generasi nogoods sebagai CSP** (Bagian 5): syarat-syarat cukup tersebut sendiri adalah constraint atas pasangan partial assignment, sehingga menghasilkan nogoods ≠ generate-and-test. Tiap solusi CSP bantu = satu dominance breaking nogood.
3. **Kontrol kekuatan**: panjang nogood L dan jumlahnya diatur → keluarga metode **L-dom** (2-dom, 3-dom, 4-dom). Semakin panjang, pruning makin kuat, biaya generasi makin besar.
4. **Eksperimen** (Bagian 6): model dalam MiniZinc, solver Chuffed (backend generasi + pemecahan), pembanding: `no-dom` (tanpa), `manual` (dominance breaking buatan manusia dari literatur), dan MIP/CBC 2.10 sebagai referensi. Timeout total 2 jam (1 jam khusus generasi nogood), mesin Xeon Platinum 8268 2.90 GHz, MiniZinc 2.6.0. Dua opsi pencarian: fixed heuristic dan free search. Tiga kelompok benchmark: (a) 6 problem standar acak × 20 instans (Knapsack, DisjKnapsack, ConcertSchd, MaxCut, CombAuc, SetCover), (b) benchmark nyata penjadwalan sopir bus (12 instans industri), (c) varian non-linier B2B meeting scheduling.
5. **Analisis teoretis kekuatan** (Bagian 7): membandingkan kekuatan logis kumpulan nogoods otomatis vs constraint manual per benchmark.

## 3. Temuan utama

- **Kecepatan (standar benchmark, 3-dom, total waktu = generasi + pemecahan):** dengan fixed search, hingga **305,60× lebih cepat dari no-dom** dan **129,54× dari manual**; dengan free search hingga **1212,76× vs no-dom** dan **210,54× vs manual**. (Angka "up to" = kasus terbaik, bukan rerata.)
- **3-dom titik optimum** pada banyak kasus; 4-dom kadang kalah dari 3-dom (Knapsack, DisjKnapsack) karena overhead menangani nogood tambahan tidak terbayar.
- **Instance sulit diuntungkan, instance mudah bisa dirugikan**: 2-dom/3-dom/4-dom butuh waktu lebih dulu sebelum menyelesaikan instans pertama; pada instance kecil `no-dom`/`manual` kadang lebih cepat.
- **Benchmark nyata (bus scheduling):** 3-dom menurunkan total waktu **33,92%** pada r1 dan **≥39,20%** pada r1a, tetapi `no-dom` justru terbaik pada r2, r3, t1 — overhead generasi nogood tak terbayar; pada r3 generasi 3-dom/4-dom malah timeout 1 jam tanpa menghasilkan nogood tambahan.
- **Benchmark non-linier (varian B2B meeting scheduling):** nogoods otomatis menurunkan waktu pemecahan **43,56%–81,52%** vs no-dom, sementara **MIP/CBC timeout di semua instans** — di sinilah keunggulan CP + dominance breaking paling terlihat. Sebaliknya, pada benchmark standar dan bus scheduling yang linier, **MIP justru mendominasi**.
- **Analisis teoretis (Bagian 7):** nogoods otomatis terbukti *logically stronger* dari, dan kadang tidak terimplikasi oleh, dominance breaking constraints manual di literatur — paper klaim method menemukan nogoods yang sebelumnya tidak ditemukan manusia.
- Klaim inti: metode pertama yang **fully automated** untuk kelas COP ini, plus kemampuan mengatur jumlah/kekuatan kolektif nogoods.

## 4. Keterbatasan

**Yang diakui paper sendiri (Concluding Remarks, hal. 41):**
1. **Overhead per-instance** — generasi nogoods instans demi instans bisa tidak terbayar; pada problem berstruktur linier performa total *tidak kompetitif* dengan integer programming karena waktu generasi besar.
2. **Pemeriksaan pola nogood masih butuh intervensi manusia** (merujuk kerja lanjutan mereka).
3. **Cakupan kelas sempit** — berlaku hanya untuk kelas yang lahir dari analisis syarat cukup betterment/implied satisfaction; struktur rumit (mis. instans MiniZinc Challenge) belum tertangani.
4. **Redundansi nogoods** — peran/efektivitas tiap nogood individual belum dipahami; penyederhanaan SAT (clause vivification) masih usulan masa depan.

**Kritik reviewer (ancaman validitas, gaya Fase 7):**
- **Internal — bias benchmark:** mayoritas instans dibangkitkan acak; paper sendiri mengakui kemungkinan bias (hal. 30). Random generator + seed tidak saya temukan didokumentasikan pada bagian yang saya baca → status *belum terverifikasi*, cek manual sebelum mengutip angka.
- **Internal — umumnya satu solver:** Chuffed sebagai backend tunggal untuk CP; klaim bisa jadi solver-spesifik. Pembanding MIP hanya CBC 2.10 tanpa tuning, sehingga perbandingan "CP vs MIP" lemah di kedua arah.
- **Internal — desain timeout:** alokasi 1 jam generasi dalam timeout 2 jam membuat kasus seperti r3 tidak informatif (kedua varian dapat nogood identik).
- **Konklusional — klaim "up to":** 305×/1212× adalah ekstrem; tidak ada ringkasan rerata/geometrik yang saya temukan, jangan dibaca sebagai speed-up tipikal.
- **Konstruk — "ease of use":** tidak ada studi pengguna; kemudahan disimpulkan dari argumentasi bahwa metode manual butuh ahli, bukan dari pengukuran.
- **Ekstern generalisasi:** benchmark non-linier hanya satu varian buatan dengan satu konfigurasi (|P| = 10, |T| = 20, L = 10) → generalisasi ke "problems with non-linier structures" terlalu luas untuk bukti setipis itu.
- **Reproduksi:** positif — kode dan benchmark terpublikasi di GitHub; seed/hyperparameter perlu dicek di repo sebelum klaim reproducibility penuh.

## 5. Relevansi terhadap ide penelitian Anda

**Belum bisa saya pastikan: Anda belum menyebutkan ide/tujuan penelitian Anda dalam permintaan ini.** Skill melarang saya menilai relevansi atau novelty sepihak tanpa tujuan riset dari Anda. Kirim 1–3 kalimat tujuan penelitian (bidang, masalah, apa yang mau dicapai), nanti saya petakan dengan checklist:

1. Apakah objek riset Anda termasuk COP yang objective/constraint-nya efficiently checkable? Kalau ya → paper ini kandidat **baseline / pembanding wajib**.
2. Apakah Anda memakai B&B/CP solver? Kalau ya → dominance breaking L-dom relevan sebagai teknik percepatan; kalau pakai MIP, paper ini justru menunjukkan batas Anda (bagian linier, MIP menang).
3. Apakah ide Anda soal *automasi heuristik/pruning* (belajar atau men-generate constraint otomatis)? → ini paper terdekat; perhatikan celah yang mereka sendiri sebut: overhead generasi, redundansi nogood, otomasi analisis syarat cukup, pemanfaatan functional dependency — itu bahan gap analysis.
4. Apakah ide Anda di domain berbeda (mis. NLP, visi, learning)? → relevansi hanya metodologis/sekunder; paper ini tidak boleh jadi tulang punggung tinjauan Anda.

Catatan: paper ini punya dua "saudara" yang harus ikut dipantau agar novelty Anda tidak salah sasaran — versi IJCAI 2020 (pendahulu, klaim speed-up hingga tiga orde magnitudo) dan JAIR 2023 *Exploiting functional constraints in automatic dominance breaking* (https://doi.org/10.1613/jair.1.14714).

---

**Status & langkah berikutnya (semi-otomatis, keputusan di tangan Anda):**
- Pemahaman 1 paper selesai — mode 10 tidak punya gate.
- Jika ingin lanjut ke **Literature Review / Discovery (Fase 1, gate G1)** atau **Novelty & Gap Audit (Fase 2, gate G2)**, konfirmasi dan kirim tujuan penelitian Anda; saya akan menyusun query pencarian dan tabel sumber lebih dulu sebelum melangkah.
