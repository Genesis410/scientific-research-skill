# EVAL-004 without_skill

## Bagaimana dokumen ini dibaca
Fase ini **pemetaan masalah**, bukan penyusunan solusi. Tiap kandidat memuat: klaim masalah → bukti kejadian nyata → kebutuhan yang jelas → cara uji berbiaya rendah → pertanyaan akar masalah yang wajib dijawab dulu. Gerbang keluar dari fase ini ada di bagian akhir.

## Kriteria seleksi (dipakai untuk menyaring kandidat)
1. **Berulang**: ≥ 2 kejadian terpisah pada 2024–2026, atau satu kejadian dengan pola sama dari tahun sebelumnya.
2. **Relevan Indonesia**: kejadian/data di Indonesia, bukan generalisasi dari luar negeri.
3. **Bukti nyata**: dapat ditelusuri ke sumber primer (lembaga resmi, laporan audit, pemberitaan berdata).
4. **Uji murah**: tanpa infrastruktur berat, tanpa akses internal, data publik atau koleksi sendiri; sasaran ≤ 2 minggu kerja, biaya operasional nyaris nol (hanya token API/perangkat yang sudah ada).
5. **Akar masalah belum dipahami**: ada pertanyaan terbuka yang bisa dijawab penelitian — bukan sekadar "kita butuh sistem X".

---

## Kandidat 1 — Kebocoran data lembaga publik berulang: akarnya konfigurasi & tata kelola, bukan eksploitasi canggih

**Klaim masalah.** Kasus kebocoran data di instansi Indonesia 2024–2026 berulang dengan pola yang mirip: data tersimpan/tersalin tanpa perlindungan yang memadai, lalu dijual di kanal anonim. Pola berulang menunjukkan penyebab sistemik (kelola, konfigurasi, SDM), bukan kebetulan per-insiden.

**Bukti kejadian nyata.**
- Pemilu 2024: akun anonim "Jimbo" mengeklaim meretas situs KPU dan memasarkan 204 juta data pemilih (BBC Indonesia); sebelumnya, dugaan kebocoran data pemilih juga muncul November 2023 (siaran pers ELSAM) — pola sama, bertahun-tahun berulang.
- Juni 2024: gangguan server Pusat Data Nasional (PDNS) hingga penyelidikan Polri dan BSSN (Tempo, 23 Juni 2024).
- 2025: kebocoran data Badan Kepegawaian Negara lebih dari 4,7 juta data; kajian akademik 2025 menyebut KPU, PLN, BPJS Kesehatan, dan Dukcapil dalam daftar insiden berskala besar.
- Laporan tahunan BSSN 2024–2025 mencatat peningkatan insiden kebocoran dengan penyebab dominan kelalaian manusia dan sistem belum memenuhi standar keamanan nasional; surat edaran bersama Mendagri–Kepala BSSN 2025 mendorong pembentukan CSIRT daerah — artinya kebutuhan kelembagaan memang diakui resmi.

**Kebutuhan yang jelas.** UU PDP, rencana Perpres AI (diumumkan jadi prioritas tanda tangan 2026), dan pedoman BSSN menuntut akuntabilitas teknis yang terukur; daerah kecil umumnya tak punya SDM keamanan. Deteksi dini murah dan terukur langsung menjawab kebutuhan itu.

**Cara uji berbiaya rendah.** Pemeriksaan **pasif** (tanpa eksploitasi, tanpa brute force, tanpa akses sistem) terhadap 200–500 domain layanan web instansi pusat/daerah: header keamanan HTTP, konfigurasi TLS, indeks direktori terbuka, peninggalan berkas `.env`/`.git`/`.sql`, penyimpanan awan yang dapat diakses publik, tanda backup terbuka. Hasil: skor konfigurasi + uji silang dengan daftar insiden yang pernah dilaporkan. Biaya ~Rp 0, waktu 1–2 minggu, alat: satu skrip Python standar. Penemuan sensitif diselesaikan lewat **disclosure terkoordinasi**, bukan publikasi.

**Pertanyaan akar masalah (wajib dijawab sebelum menyentuh solusi).**
1. Sebaran kerentanan konfigurasi di lapangan seperti apa, dan apakah berkorelasi dengan insiden yang benar-benar terjadi?
2. Pola kelola yang sama (mis. tidak ada CSIRT, tidak ada peninjauan akses, backup publik) muncul di banyak lembaga berbeda — ataukah masing-masing kasus punya sebab khas?
3. Faktor mana yang dominan: SDM TI < n orang, ketiadaan prosedur, pengadaan/vendor, atau pelatihan?
4. Apakah insiden di daerah benar-benar dilaporkan ke BSSN? Jika tidak, itu sendiri merupakan masalah (pelaporan insiden) yang perlu diukur.

**Gerbang akar masalah.** Wawancara singkat 3–5 narahubung CSIRT/insiden + pencocokan dengan laporan BSSN. Jika penyebab dominan ternyata pengadaan/kontrak (bukan konfigurasi), rumuskan ulang kandidat ini menjadi masalah proses pengadaan perangkat lunak.

---

## Kandidat 2 — Penipuan berbasis AI (deepfake/kloning suara) dalam bahasa Indonesia non-baku, dan keterlambatan pelaporan korban

**Klaim masalah.** Modus penipuan memakai AI melonjak dan berganti bentuk cepat, sementara mekanisme deteksi dan pelaporan bergerak terlalu lambat: korban rata-rata baru melapor setelah 12 jam, sehingga dana hampir tidak pernah tertolong. Detektor yang ada umumnya dilatih pada bahasa baku/Inggris dan video stok, bukan bahasa gaul, typo, code-mixing, dan suara kloning berbahasa Indonesia.

**Bukti kejadian nyata.**
- OJK: sejak Indonesia Anti-Scam Center (IASC) beroperasi 22 November 2024 hingga akhir Juni 2026 ada **1.379 laporan penipuan terindikasi memakai AI** (13 laporan di 2024, 1.366 pada 2025–Semester I 2026); deepfake tokoh publik menawarkan investasi palsu jadi modus terbanyak.
- IASC: **373.129 laporan penipuan** sejak November 2024 hingga 30 November 2025, rata-rata 874 laporan/hari.
- VIDA: kerugian sekitar Rp 8,2 triliun/tahun, hanya **4,76% dana korban berhasil diselamatkan**, rata-rata pelaporan korban tertunda 12 jam (negara lain 15–20 menit); klaim penipuan berbasis deepfake melonjak 1.550%.
- Polda Metro Jaya (Januari–Agustus 2025): 2.597 laporan polisi siber, kerugian Rp 24,3 miliar; WhatsApp kanal paling sering dipakai pelaku (486 kasus); pola tren lonjakan Mei–Juli 2025 (>800 laporan dalam dua bulan).

**Kebutuhan yang jelas.** OJK/BSSN/kepolisian sudah membangun kanal pelaporan, tetapi kecepatan pelaporan dan kualitas deteksi konten masih jadi titik lemah yang terbuka. Butuh deteksi murah untuk teks/suara berbahasa Indonesia tak baku, dan butuh bukti mengapa korban telat melapor.

**Cara uji berbiaya rendah.** Kumpulkan 300–500 materi kampanye penipuan dari arsip publik (wawancara pers kepolisian/OJK, tangkapan layar yang dikutip media, grup yang sudah ditutup dan diarsipkan), lalu uji dua hal terpisah: (a) aturan sederhana + model kecil lokal untuk teks promosi penipuan (precision/recall, CPU saja); (b) deteksi vokal/suara kloning pada klip pendek hasil rekaman ulang. Biaya token < Rp 200 ribu, waktu 2–3 minggu.

**Pertanyaan akar masalah (diselesaikan sebelum membangun detektor apa pun).**
1. Mengapa korban telat melapor: tidak tahu kanal, malu, tidak yakin ini penipuan, atau proses pelaporannya sendiri berbelit? (Hipotesis bersaing: faktor sosial vs faktor perangkat lunak.)
2. Apakah platform/perbankan menyediakan tombol pelaporan yang berfungsi dan merespons < 15 menit? Uji kepatuhan alur pelaporan pada 10 aplikasi populer.
3. Apakah kerugian datang dari kegagalan deteksi konten, kegagalan verifikasi identitas (OTP/biometrik), atau kegagalan blokir rekening? Data OJK soal 4,76% penyelamatan mengarah ke kegagalan blokir/kecepatan — harus diverifikasi.
4. Bahasa apa yang benar-benar dipakai pelaku (gaul, code-mixing, typo)? Perlu korpus kecil sebelum memilih model.

**Gerbang akar masalah.** Wawancara 8–10 korban/relawan + audit alur pelaporan 10 aplikasi. Jika akar utamanya sosial/perancangan antarmuka, arahkan penelitian ke desain pelaporan cepat — bukan ke detektor.

---

## Kandidat 3 — Benchmark halusinasi LLM bahasa Indonesia untuk layanan publik dan hukum (selisih akurasi luar vs dalam negeri)

**Klaim masalah.** Klaim kepatuhan dan "keamanan" penggunaan AI di Indonesia diuji dengan benchmark multibahasa generik atau tugas NLU lama, padahal kualitas jawaban pada topik lokal (peraturan daerah, alur layanan publik, statistik nasional) bisa jauh lebih buruk. Tanpa benchmark lokal, evaluasi wajib yang diminta regulator tidak bisa dilakukan dengan benar.

**Bukti.**
- Benchmark Indonesia yang ada: IndoNLU (2020), IndoMMLU (2023), IndoCareer (NAACL 2025) — sebagian besar tugas NLU/ujian profesional, bukan pengukuran halusinasi pada topik lokal.
- Regulasi yang menuntut evaluasi: Buku Putih Peta Jalan AI Nasional + draf Pedoman Etika AI (konsultasi publik Agustus 2025), Perpres AI disampaikan ke DPR sebagai prioritas tanda tangan 2026 (Komdigi, 26 Januari 2026); OJK 2025 mewajibkan komite internal AI, validasi model, stress test, dan human-in-the-loop untuk perbankan.
- Celah: pedoman menyebut "pemantauan dan evaluasi", tetapi belum ada instrumen terbuka berbahasa Indonesia untuk melaksanakannya.

**Kebutuhan yang jelas.** Penerbit Perpres/menteri, otoritas sektor (OJK, kesehatan), dan pengembang perlu instrumen ukur yang bisa direproduksi sebelum aturan turunan terbit pada 2026.

**Cara uji berbiaya rendah.** Susun 200–300 butir pertanyaan tertutup-jejak (*closed-book*) dengan fakta terverifikasi (peraturan, alur layanan publik, data BPS/BI), jalankan ke 3–5 model (API berbayar murah atau model kecil lokal), skoring otomatis berbasis string/JSON + satu anotator manusia, laporkan skor per domain (lokal vs global) dan per bahasa (ID vs EN). Biaya token < Rp 1 juta, waktu 2–3 minggu, tanpa GPU.

**Pertanyaan akar masalah.**
1. Selisih akurasi lokal vs global sebesar apa, dan signifikan secara statistik?
2. Penyebabnya data pelatihan (topik Indonesia kurang terwakili), bahasa instruksi, atau ukuran model? Uji silang bahasa × domain memisahkan ketiganya.
3. Apakah kesalahan terkonsentrasi pada topik yang cepat berubah (peraturan 2024–2026) — jika ya, masalahnya *freshness*, bukan bahasa.
4. Apakah jawaban "terdengar benar tapi salah" (halusinasi eksplisit) lebih berbahaya pada topik hukum daripada pada topik umum? Butuh anotasi tingkat keseriusan, bukan sekadar akurasi.

**Gerbang akar masalah.** Dataset, skrip, dan skoring harus bisa direproduksi dan berlisensi jelas; jika tidak, hasil tidak bisa dipakai pihak lain dan nilai risetnya turun.

---

## Kandidat 4 (cadangan, prioritas lebih rendah) — Sistem informasi pemerintah yang diluncurkan lalu tidak terpakai (*abandonment*)

**Klaim masalah.** Banyak sistem TI instansi berhenti dipakai setelah seremoni peluncuran; akar masalahnya pada perumusan kebutuhan ("punya sistem seperti instansi X", bukan masalah nyata) dan keterlibatan pengguna yang hanya sebatas tanda tangan.

**Bukti.** Pola gagal yang berulang diungkap praktisi TI pemerintah (proyek dimulai dari keinginan punya aplikasi, requirement sebagai "fiksi yang disepakati", user tidak dilibatkan); rekomendasi BPK tahunan soal tindak lanjut sistem/layanan. **Catatan**: bukti utamanya kualitatif dan berasal dari industri — kekuatannya lebih lemah dari tiga kandidat di atas.

**Cara uji berbiaya rendah.** Indikator sinyal publik pada 30–50 aplikasi resmi instansi: domain mati, tidak ada pembaruan sejak 2 tahun, ulasan toko aplikasi, dokumentasi tidak ada, form pendaftaran error + verifikasi wawancara 5–10 pengguna/ASN. Tanpa akses internal.

**Kenapa prioritas rendah.** Data "penggunaan sesungguhnya" (log) tidak publik; kalau tidak ada pintu wawancara instansi, hipotesis akar tidak bisa diuji — jangan pilih kandidat ini sebelum akses terkonfirmasi.

---

## Pemeringkatan

| Prioritas | Kandidat | Kekuatan bukti nyata | Kebutuhan jelas | Biaya uji | Risiko akses/etika |
|---|---|---|---|---|---|
| 1 | K1: kebocoran data lembaga publik | Sangat kuat (KPU 2023–2024, PDNS 2024, BKN 2025, Dukcapil/PLN/BPJS) | Sangat jelas (UU PDP, BSSN, Perpres AI 2026) | ~Rp 0 | Sedang: wajib pemeriksaan pasif + disclosure terkoordinasi |
| 2 | K2: penipuan AI & keterlambatan pelaporan | Sangat kuat (OJK 1.379 laporan; IASC 373.129 laporan; Polda 2.597 laporan; kerugian Rp 8,2 T) | Sangat jelas (OJK/BSSN/kepolisian) | < Rp 500 rb | Sedang: korpus penipuan, hati-hati lisensi & privasi |
| 3 | K3: benchmark halusinasi bahasa Indonesia | Kuat sebagai celah (tak ada instrumen lokal) | Jelas (Perpres AI 2026, OJK 2025) | < Rp 1 juta | Rendah |
| 4 | K4: sistem tidak terpakai | Sedang (kualitatif) | Jelas | Rendah | Tinggi: akses data internal |

**Rekomendasi**: mulai dari **K1** (bukti paling kuat, uji termurah, langsung terukur), dengan **K2** sebagai kandidat paralel bila ada akses ke arsip konten penipuan, dan **K3** sebagai pilihan bila penelitian harus sepenuhnya berbasis data terbuka tanpa isu etika pemeriksaan infrastruktur.

---

## Langkah verifikasi sebelum menyusun solusi (untuk kandidat terpilih)
1. Kumpulkan sumber primer: laporan tahunan BSSN 2024/2025, rilis OJK/IASC, laporan BPK terkait sistem informasi, draf Perpres/Pedoman Etika AI Komdigi, putusan/penanganan kasus KPU dan PDNS.
2. Wawancara 3–5 narahubung praktisi (CSIRT daerah, QA/vendor, narahubung pelaporan penipuan) untuk menguji hipotesis akar masalah.
3. Catat tanggal, periode, dan definisi tiap angka — angka BSSN, OJK, IASC, dan Polda berbeda definisi sehingga tidak boleh dijumlahkan.
4. Rekam versi data dan skrip agar analisis dapat diulang.

## Gerbang wajib: kapan solusi baru boleh ditulis
1. Masalah dinyatakan sebagai pertanyaan terukur, bukan sebagai nama solusi.
2. Ada minimal **2 hipotesis akar masalah yang bersaing**, lengkap dengan bukti yang berpotensi menyangkal masing-masing; bukti penyangkal harus dikumpulkan, bukan dilewati.
3. Ada bukti empiris lokal (observasi, pengukuran, wawancara) — bukan hanya kutipan pustaka.
4. Bila semua hipotesis bergantung pada akses internal yang tidak tersedia, turunkan cakupan ke yang bisa diuji dari luar, atau pindah kandidat.
5. Baru setelah minimal satu hipotesis akar bertahan dari bukti penyangkal, rumuskan solusi — dan solusi itu harus menjawab akar masalah yang sudah terbukti, bukan akar masalah yang diasumsikan.

## Keterbatasan dokumen ini
- Sebagian bukti berasal dari pemberitaan dan kajian yang belum diverifikasi silang ke sumber primer; wajib dicek ulang sebelum dipakai dalam proposal.
- Periode pelaporan antar-lembaga berbeda (OJK: 22 Nov 2024–Juni 2026; IASC: Nov 2024–Nov 2025; Polda: Jan–Agu 2025) sehingga tren hanya bisa dibandingkan secara kasar.
- Pencarian ini belum menjangkau literatur nasional terindeks (Google Scholar/Garuda/SINTA); tambahkan pencarian itu sebelum menyusun tinjauan pustaka.
- Kandidat 4 sengaja ditahan karena kekuatan buktinya paling lemah; jangan dinaikkan tanpa konfirmasi akses wawancara.
