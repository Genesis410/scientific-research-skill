# EVAL-004 with_skill

**Skill diikuti:** `scientific-research` (mode 2 — Research Discovery, tanpa chaining; Fase 0 & Fase 1).

---

## Fase 0 — Persiapan (ringkas)

- Tujuan pengguna sudah eksplisit (temukan masalah penelitian AI/SE, konteks Indonesia 2024–2026), jadi menu Fase 0 dilewati.
- Lokasi folder artefak lokal (`progress.md`, `decisions.md`, `sources.md`) **belum ditentukan pengguna** — sesuai SKILL.md, subagen riset tidak memutuskan sendiri. Tabel sumber lengkap disertakan inline di bawah; siap dipindah ke `sources.md` begitu lokasi folder diberikan.
- Batasan kerja: identifikasi **masalah**, bukan solusi (permintaan eksplisit pengguna). Solusi tidak dirancang di sini.

---

## Fase 1 — Discovery

### 1. Tujuan penelitian (draft, 3 kalimat)

Temukan masalah penelitian AI/software engineering yang (a) **berulang** di Indonesia selama 2024–2026, (b) berbasis **bukti kejadian nyata**, (c) punya **kebutuhan jelas** bagi pemangku kepentingan, dan (d) **dapat diuji dengan biaya rendah**. Hasil discovery ini menjadi dasar penyusunan RQ pada Fase 2 (belum dikerjakan).

**Scope:** Indonesia; 2024–2026; bidang AI + SE (sistem informasi publik/layanan digital, LLM/chatbot, AI generatif & moderasi, praktik pengembangan perangkat lunak). Di luar scope: riset AI murni tanpa kaitan SE, infrastruktur jaringan seluler, keamanan siber forensik.

### 2. Prosedur pencarian (untuk replikasi)

- **Bahasa:** Indonesia + Inggris. **Rentang:** 2024–2026. **Sumber:** mesin pencari web (Tavily/Exa).
- **Query inti (7):** (1) kegagalan sistem informasi pemerintah Indonesia 2024–2025; (2) kebocoran data Indonesia 2024–2025 Komdigi; (3) chatbot layanan publik Indonesia 2025 hallucination; (4) deepfake pemilu Indonesia 2024; (5) PPDB online gagal 2024–2025; (6) SLR software engineering Indonesia legacy/technical debt; (7) AI coding assistant adoption Indonesia 2025.
- **Query penyempurnaan (≈15):** ppdb 2025 jaringan SMA negeri error server pengaduan; chatbot AI pemerintah jawaban salah informasi warga; bca mobile down downdetector; byond bsi gangguan juni 2025 wondr bni error; deepfake AI pemilu 2024 misinformasi; dicoding survey developer AI produktivitas; komdigi blokir grok 2026; sapawarga/chatbot akurasi; systematic mapping study SE Indonesia 2024–2025 gap; requirements engineering AI Indonesia PRISMA; dsb.
- **Relevansi dua tahap:** tahap 1 cek judul/snippet (lolos: mengandung kejadian/insiden Indonesia + tahun 2024–2026, atau studi akademik tentang konteks Indonesia); tahap 2 baca ringkasan isi untuk ekstraksi temuan. Query dengan hasil <1.000 karakter dianggap tipis dan diganti dengan query penyempurnaan.
- **Catatan teknis:** dua panggilan pencari sempat gagal (limit Tavily) dan dilayani backend cadangan — tidak memengaruhi kelengkapan sumber di bawah.

### 3. Tabel sumber (sources.md — siap diekstrak)

| # | Judul / sumber | Penulis/instansi | Tahun | Venue | Metode/bukti | Temuan utama | Relevansi | Status | Tautan |
|---|---|---|---|---|---|---|---|---|---|
| S1 | Sistem PPDB Online Jawa Barat Eror Lagi, Sekolah Layani Pendaftaran Manual | mediaaksara.id | 2025 | Berita | Insiden lapangan | SPMB Jabar error lagi; sekolah buka pendaftaran manual di Sukabumi (11 Jun 2025) | Buktikan kegagalan PPDB **berulang** ("eror lagi") lintas tahun | Berita, dibaca ringkas | https://mediaaksara.id/read/2025/06/11/sistem-ppdb-online-jawa-barat-eror-lagi-sekolah-layani-pendaftaran-manual- |
| S2 | Kemendikdasmen Akui Ada Kendala Server di Awal SPMB | tangselpos.id | 2025 | Berita | Pernyataan resmi | Irjen Kemendikdasmen akui kendala server awal SPMB 2025 | Pengakuan otoritatif: masalah kapasitas/jaringan | Berita | https://tangselpos.id/kemendikdasmen-akui-ada-kendala-server-di-awal-spmb/ |
| S3 | Kuota Pendaftar Membludak, Server PPDB Makassar "Over Capacity" | bacaonline.id | 2025 | Berita | Insiden + keterangan teknis | Server "over capacity", pendaftaran diperpanjang (12 Jun 2025) | Pola serupa di daerah berbeda | Berita | https://www.bacaonline.id/kuota-pendaftar-membludak-server-ppdb-makassar-over-capacity-dinas-pendidikan-perpanjang-masa-pendaftaran/ |
| S4 | 1.676 Aduan Masuk Call Center SPMB Jateng | beritajateng.tv | 2025 | Berita | Data aduan | 1.676 aduan SPMB Jateng; Dindik Jateng imbau lapor | Data aduan publik = bahan analisis gratis | Berita | https://www.beritajateng.tv/read/2025/06/11/128029/1-676-aduan-masuk-call-center-spmb-jateng-dindik-jateng-imbau-warga-lapor-ke-call-center-bila-mengalami-kendala- |
| S5 | Ratusan Orangtua Geruduk Disdik Kota Bogor | wartakota.tribunnews.com | 2025 | Berita | Insiden sosial | Dampak langsung ke warga; massa datangi Disdik (2 Jul 2025) | Kebutuhan jelas: layanan penerimaan murid | Berita | https://wartakota.tribunnews.com/2025/07/02/1953743/ratusan-orangtua-geruduk-disdik-kota-bogor-terkait-ppdb |
| S6 | Wondr by BNI Error, Nasabah Tak Bisa Transaksi | bisnis.com | 2024 | Berita | Insiden + klarifikasi manajemen | Gangguan 25 Nov 2024; Corp Sec BNI minta maaf | Gangguan aplikasi bank nasional, awal rentang 2024–2026 | Berita | https://finansial.bisnis.com/read/20241125/90/1818839/wondr-by-bni-error-nasabah-tak-bisa-transaksi-begini-penjelasan-manajemen |
| S7 | Aplikasi BYOND BSI Gangguan | Kompas.com | 2025 | Berita | Insiden + klarifikasi | BYOND gangguan sejak 1 Jun 2025; disebut "peningkatan kualitas layanan" | Pola gangguan berulang dengan narasi teknis mirip | Berita | https://money.kompas.com/read/2025/06/02/142835426/aplikasi-byond-bsi-gangguan-manajemen-minta-maaf-sebut-gangguan-dalam |
| S8 | Aplikasi Baru Bank Seperti BYOND dan Wondr Kerap Error, Ada Apa? | kontan.co.id | 2025 | Berita analitis | Rekap insiden lintas bank | BYOND error ≥2x (Des 2024, Feb 2025); Wondr error Nov 2024; Dirut BNI: "sesekali error" saat migrasi | **Rekurensi terkonfirmasi** + kausalitas manajerial (migrasi aplikasi) | Berita analitis | https://keuangan.kontan.co.id/news/aplikasi-baru-bank-seperti-byond-by-bsi-dan-wondr-by-bni-kerap-error-ada-apa |
| S9 | BCA Mobile Down 2 Jam, 103 Aduan di Downdetector | CNBC Indonesia | 2025 | Berita | Metrik pihak ketiga | Aduan Downdetector 103 (29 Sep 2025); tagar trending; BCA pulih tanpa penjelasan akar | Data aduan terstruktur siap pakai | Berita | https://www.cnbcindonesia.com/tech/20250929080708-37-670924/bca-mobile-down-2-jam-ramai-di-medsos-netizen-curhat-susah-ke-kantor |
| S10 | BCA Mobile dan MyBCA Error Senin Pagi | Kompas.com | 2025 | Berita | Wawancara pengguna | Keluhan gagal login/transfer; dana terpotong tak terverifikasi | Dampak keuangan langsung ke pengguna | Berita | https://megapolitan.kompas.com/read/2025/09/29/07491261/bca-mobile-dan-mybca-error-senin-pagi-nasabah-keluhkan-tak-bisa-masuk |
| S11 | Deepfakes and Selective Belief: How Partisanship Affects Voters' Exposure and Susceptibility | Muhtadi & Wihardja (ISEAS–Yusof Ishak Institute) | 2024 | ISEAS Perspective 2024/58 | Panel survei 2 gelombang, 34 provinsi, n=1.919 | Deepfake pemilu 2024 viral (audio Surya Paloh 23,2% terpapar; video Prabowo bahasa Arab 28,2% percaya); selective belief signifikan | Studi akademik primernya insiden deepfake pemilu | Abstrak+teks penuh dibaca | https://www.iseas.edu.sg/articles-commentaries/iseas-perspective/2024-58-deepfakes-and-selective-belief-how-partisanship-affects-voters-exposure-and-susceptibility-to-deepfake-content-by-burhanuddin-muhtadi-and-maria-monica-wihardja/ |
| S12 | Penggunaan AI dalam Pemilu Indonesia 2024 | Rumah Pemilu (CfDS UGM) | 2024 | Analisis | Diskusi pakar + kasus | Deepfake video Soeharto (Golkar); video Jokowi bahasa Mandarin; animasi AI paslon | Bukti penggunaan AI generatif dalam demokrasi | Dibaca | https://rumahpemilu.or.id/penggunaan-ai-dalam-pemilu-indonesia-2024-1/ |
| S13 | AI 'resurrects' long dead dictator… (deepfake Soeharto) | CNN | 2024 | Berita internasional | Verifikasi kasus | Video deepfake Soeharto 4,7 juta tayangan di X | Skala dampak | Dibaca | https://www.cnn.com/2024/02/12/asia/suharto-deepfake-ai-scam-indonesia-election-hnk-intl |
| S14 | Akses Aplikasi Grok Sementara Diputus — Pernyataan Resmi Menkomdigi | Meutya Hafid (Komdigi), via MMC Kalteng | 2026 | Siaran/pernyataan resmi | Kebijakan regulator | Blokir akses Grok sementara demi lindungi perempuan/anak dari pornografi palsu hasil AI; dasar Permenkominfo 5/2020 | Regulasi merespons kegagalan guardrail AI generatif | Pernyataan resmi | https://mmc.kalteng.go.id/berita/read/49724/akses-aplikasi-grok-sementara-diputus-ini-pernyataan-resmi-menkomdigi-ri |
| S15 | AI Grok Diblokir Komdigi | Kompas.com | 2026 | Berita | Insiden + kebijakan | Blokir Grok terkait deepfake asusila (10 Jan 2026); Komdigi menyiapkan payung hukum | Kejadian nyata 2026 = bukti masalah **masih berulang** | Dibaca | https://www.kompas.com/tekno/read/2026/01/10/140000073/ai-grok-diblokir-komdigi-terkait-konten-deepfake-dan-pornografi |
| S16 | Indonesia Jadi Negara Pertama yang Tegas Blokir Grok | merdeka.com | 2026 | Berita | Konteks kebijakan | Negara pertama memblokir; Menkomdigi: ruang digital bukan wilayah bebas hukum | Sinyal urgensi + keunikan konteks Indonesia | Dibaca | http://www.merdeka.com/peristiwa/read/8069340/indonesia-jadi-negara-pertama-yang-tegas-blokir-grok-demi-jaga-ruang-digital |
| S17 | Generative AI for Software Development: A SLR | Frontiers in Computer Science | 2025 | Systematic literature review | SLR (pemetaan tema) | Isu dominan: *output quality* dan *hallucination*; dampak produktivitas belum terukur konsisten | Landasan celah untuk klaster keandalan output AI | Abstrak+ringkasan hasil | https://www.frontiersin.org/journals/computer-science/articles/10.3389/fcomps.2025.1615757/full |
| S18 | Dicoding: 9 dari 10 developer RI alami lonjakan produktivitas berkat AI (IDO 2026) | ANTARA (Dicoding) | 2026 | Survei + berita | Survei n=3.163 talenta digital | 9 dari 10 developer: produktivitas naik 20–>50% (persepsi); 63% andalkan online course | Klaim produktivitas Indonesia 2026 = bahan pembanding dengan bukti mutu | Berita + rilis survei | https://megapolitan.antaranews.com/berita/526552/dicoding-9-dari-10-developer-ri-alami-lonjakan-produktivitas-berkat-ai |
| S19 | Survei Dicoding 2026: AI Bisa Dongkrak Produktivitas Developer | detikINET | 2026 | Berita | Liputan survei sama | Angka sama (n=3.163, 9/10, 20–50%) | Konfirmasi silang S18 | Dibaca | https://inet.detik.com/cyberlife/d-8465441/survei-dicoding-2026-ai-bisa-dongkrak-produktivitas-developer |
| S20 | LLM Hallucinations in Conversational AI for Customer Service | Tandfonline (IJHCI) | 2025 | Jurnal | Eksperimen + survei n=300 | 7 tipe kesalahan chatbot layanan pelanggan; informasi salah = syarat utama kepercayaan | Kerangka taksonomi kesalahan, siap adaptasi ke layanan publik ID | Abstrak+metode | https://www.tandfonline.com/doi/full/10.1080/10447318.2025.2580540 |

### 4. Ringkasan lanskap (klaster masalah, 2024–2026)

Empat klaster muncul berulang dari bukti:

**K1 — Kegagalan sistem layanan publik musiman (PPDB/SPMB).** Pola sama di banyak daerah setiap musim penerimaan: Jabar ("eror lagi", Sukabumi), Makassar ("over capacity"), Jateng (1.676 aduan), Bogor (massa ke Disdik), Banten (login failed). Otoritas pusat (Kemendikdasmen) mengakui kendala server. Berulang ≥2 musim (2025 & sinyal 2026), lintas daerah, dengan respons "perbaiki server" yang tidak menghilangkan insiden.

**K2 — Kegagalan aplikasi layanan keuangan digital.** Wondr BNI (Nov 2024), BYOND BSI (Des 2024, Feb 2025, Jun 2025), myBCA/BCA Mobile + blu (Sep 2025, 103 aduan Downdetector). Direktur Utama BNI menyebut "sesekali error" sebagai adaptasi migrasi; BSI menyebut "peningkatan kualitas layanan". Pola: aplikasi baru → gangguan berulang → klarifikasi seragam tanpa akar masalah dipublikasikan.

**K3 — Kegagalan guardrail AI generatif pada konteks lokal.** 2024: deepfake pemilu (video Soeharto 4,7 jt tayangan; audio Surya Paloh; video Prabowo bahasa Arab) — ISEAS: paparan 23,2% dan kepercayaan palsu 28,2%. 2026: Grok diblokir sementara Komdigi karena deepfake seksual nonkonsensual; Indonesia negara pertama yang melakukan itu; payung hukum masih disiapkan. Terbukti berulang dalam dua insiden besar beda jenis (politik → seksual), satu benang merah: model global lolos pada norma/konteks lokal.

**K4 — Klaim produktivitas AI vs bukti kualitas yang belum ada.** Survei Dicoding IDO 2026 (n=3.163): 9 dari 10 developer Indonesia merasakan +20–>50% produktivitas. Namun SLR Frontiers 2025 menyebut *output quality* dan *hallucination* tetap sebagai isu dominan tanpa konsensus pengukuran dampak. Di Indonesia belum terlihat studi yang memverifikasi klaim produktivitas itu dengan metrik mutu (defect rate, rework, keamanan kode).

### 5. Kandidat masalah penelitian (diurutkan; akar masalah dulu — belum ada solusi)

**Rank 1 — Kegagalan berulang sistem penerimaan murid baru (PPDB/SPMB) di banyak daerah, dengan pola "perbaikan tahunan yang tidak menurunkan insiden".**
- *Bukti:* S1–S5 (2025), termasuk pengakuan resmi Kemendikdasmen (S2) dan data aduan terbuka Jateng (S4).
- *Kebutuhan:* puluhan ribu keluarga terdampak tiap tahun; anggaran daerah tersita untuk layanan darurat manual.
- *Akar masalah yang belum terjawab (pertanyaan riset, bukan solusi):* Apakah akarnya kapasitas infrastruktur, arsitektur sistem, proses bisnis pendaftaran multi-pihak (Diskominfo–Disdik–sekolah–orangtua), atau kombinasi beban puncak musiman + tata kelola? Mengapa evaluasi tahunan tidak menurunkan jumlah insiden/aduan? Belum ada studi akar masalah empiris lintas daerah 2024–2026 yang bisa ditemukan lewat pencarian ini.
- *Uji biaya rendah:* korpus aduan publik (call center, media, medsos) + rekaman beban musiman + wawancara ringan operator; simulasi beban pada replika skala kecil. Tanpa akses sistem produksi, tanpa GPU.

**Rank 2 — Kegagalan guardrail AI generatif terhadap norma/konteks lokal Indonesia (deepfake pemilu 2024 → deepfake seksual 2026).**
- *Bukti:* S11–S16, termasuk studi panel nasional ISEAS (S11) dan pernyataan resmi regulator (S14).
- *Kebutuhan:* perlindungan perempuan/anak, integritas pemilu 2024; regulator kini menuntut penyesuaian sistem platform.
- *Akar masalah yang belum terjawab:* Mengapa guardrail model global lolos pada skenario berbahasa Indonesia/norma lokal? Apakah evaluasi safety berbasis bahasa Inggris/ontologi Barat memang tidak mencakup skenario lokal — dan seberapa besar celahnya (terukur)? Sejauh mana pengguna Indonesia menyeberikasi (cross-check) konten AI (temuan selective belief S11 masih praliminar)?
- *Uji biaya rendah:* red-teaming prompt berbahasa Indonesia pada API model publik (biaya API kecil); deteksi deepfake pada dataset publik + wajah/suara konteks lokal; analisis data panel ISEAS yang tersedia publik.

**Rank 3 — Tidak ada tolok ukur kualitas jawaban chatbot/LLM layanan publik berbahasa Indonesia.**
- *Bukti:* S17 (SLR: hallucination & output quality isu dominan), S20 (taksonomi 7 tipe kesalahan chatbot layanan, n=300). Bukti insiden spesifik chatbot pemerintah Indonesia **belum terkumpul kuat** dari pencarian ini — itu sendiri indikasi celah: kualitas layanan chatbot publik tidak diukur/dipublikasikan.
- *Kebutuhan:* ratusan chatbot layanan publik daerah & nasional beroperasi tanpa tolok ukur akurasi yang dipublikasikan.
- *Akar masalah yang belum terjawab:* Seberapa akurat chatbot publik Indonesia pada pertanyaan layanan nyata? Apakah kesalahan berasal dari model, basis pengetahuan (regulasi/FAQ), retrieval, atau desain percakapan? Belum ada benchmark terbuka QA layanan publik berbahasa Indonesia.
- *Uji biaya rendah:* set pertanyaan disusun dari FAQ/peraturan resmi yang berlisensi terbuka, uji hitam-box ke chatbot publik, skoring manual+otomatis. Tanpa fine-tuning.
- *Peringatan QC:* klaim "chatbot pemerintah menjawab salah" dari media sulit diverifikasi tanpa akses log — jangan dikutip sebagai fakta tanpa sumber primer.

**Rank 4 — Klaim peningkatan produktivitas AI pada pengembangan perangkat lunak Indonesia tidak diverifikasi dengan metrik mutu.**
- *Bukti:* S18/S19 (survei persepsi, n=3.163, 2026) vs S17 (SLR global: output quality tetap bermasalah).
- *Kebutuhan:* keputusan karier, kurikulum kampus/vokasi, dan kebijakan industri berpijak pada klaim survei persepsi.
- *Akar masalah yang belum terjawab:* Apakah peningkatan produktivitas yang dirasakan berbanding lurus dengan mutu keluaran (defect, rework, keamanan)? Data Indonesia berupa persepsi subjektif satu titik waktu; belum ada pengukuran objektif lintas tim/organisasi.
- *Uji biaya rendah:* studi observasional lintas tim dengan metrik repo publik + defect tracker; survei longitudinal; mining repo GitHub Indonesia. Tanpa GPU.

### 6. Kandidat yang dipertimbangkan tapi TIDAK diprioritaskan (dan alasannya)

- **Kebocoran data pribadi instansi (temuan pencarian awal):** insiden ada, tapi lebih dekat ke keamanan siber forensik dan butuh akses/koordinasi internal — di luar batas uji biaya rendah.
- **Legacy/technical debt sistem informasi lama:** pencarian tidak menemukan sumber Indonesia 2024–2026 yang kuat; bukti terlalu tipis untuk diklaim berulang.
- **AI-based requirements engineering di konteks Indonesia (gap akademik):** menarik sebagai gap literatur, tetapi tidak punya "bukti kejadian nyata" sesuai kriteria pengguna — kandidat cadangan bila pengguna mau mode penelitian akademik murni.

### 7. QC (checklist skill)

- ✅ Semua klaim insiden disertai tautan (S1–S20).
- ✅ Relevansi dua tahap diterapkan; query dicatat untuk replikasi.
- ⚠️ Sumber didominasi berita (S1–S10, S13–S16, S18–S19) — bagus untuk bukti kejadian, lemah untuk estimasi besaran. Studi akademik primer baru ada di K3 (S11) dan landasan global (S17, S20).
- ⚠️ Belum dicek: apakah sudah ada paper 2024–2026 yang menjawab persis kandidat Rank 1–4 (novelty penuh baru berlaku di Fase 2/3 — SKILL.md: "jangan putuskan novelty dari discovery ini saja").
- ⚠️ Data aduan Downdetector/call center bukan dataset akademik resmi — perlu validasi provenance di Fase 3.
- ✅ Tidak ada solusi yang dirancang; semua keluaran berupa masalah + pertanyaan akar masalah (sesuai permintaan pengguna).

### 8. G1 — persetujuan lanjut

Discovery menghasilkan 4 kandidat (Rank 1–4 di atas) dengan bukti kejadian nyata, kebutuhan jelas, dan jalur uji biaya rendah.

1. Lanjut ke **Fase 2 (Research Design)** untuk kandidat terpilih — sebutkan nomor rank-nya.
2. Perdalam discovery dulu (mis. verifikasi novelty Rank 1–3 dengan pencarian paper akademik spesifik).
3. Simpan/ekstrak artefak dulu — sebutkan folder tujuan `sources.md`/`progress.md`.

Rekomendasi subagen riset: opsi 2 untuk Rank 1 (karena novelty-nya paling berisiko — mungkin sudah ada studi SPMB), lalu opsi 1.
