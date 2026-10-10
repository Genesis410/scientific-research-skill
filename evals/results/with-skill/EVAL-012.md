# EVAL-012 with_skill

## 1. Pemosisian kerja (mode & keterbatasan)

Permintaan pengguna eksplisit: **susun draf Related Work + library.bib dari paper yang sudah disetujui**. Sesuai aturan routing skill, menu entry dilewati dan mode yang dipilih adalah **Scientific Writing (Fase 6)**. Saya **tidak** menawarkan pipeline lengkap 9 fase — tahapan tambahan tidak diminta.

Panduan yang dipakai: `SKILL.md` + `references/06-writing.md` (penulisan & BibTeX), `references/03-source-audit.md` (dimensi status sumber), `references/01-discovery.md` (baca ringkas untuk konteks literature review). Rekaman pengguna dibaca dari `records.md` (fixture eval-fixture-eval012).

**Keterbatasan material (jujur, sesuai fallback skill):** tool web (`web_search`/`web_extract`) **tidak tersedia** dalam sesi ini. Konsekuensinya:

- Tidak ada verifikasi silang Crossref, portal SINTA, Scopus Sources, atau DOAJ. Status indeks/akreditasi **tetap seperti rekaman pengguna** dan dimensi audit saya tandai `belum terverifikasi` — bukan `ya`, bukan `tidak`.
- Tidak ada akses full text. Karena itu draf Related Work di bagian 4 memakai **penanda `[ISI TEMUAN: …]`** untuk setiap kalimat yang menuntut isi paper. Saya tidak mengarang temuan/hasil.
- Status sumber tidak pernah saya ubah menjadi `valid`/`invalid` tanpa bukti tautan (Aturan Global #3).

## 2. Status sumber per dimensi (terpisah, tidak digabung)

Dimensi dicatat terpisah sesuai `references/03-source-audit.md`. Nilai: `ya` / `tidak` / `belum terverifikasi` (+ bukti). Karena tool web mati, kolom bukti berisi tautan yang **siap ditelusuri**, dengan catatan verifikasi belum dijalankan.

### Sumber 1 — Kusuma & Rahayu (2023), *Digital literacy among Indonesian secondary students*

| Dimensi | Nilai | Bukti / catatan |
|---|---|---|
| Validitas bibliografi (DOI/Crossref) | **belum terverifikasi** | DOI tercatat `10.xxxx/jer.2023.14` dengan catatan pengguna "verifikasi manual". Bentuk `10.xxxx/...` adalah **placeholder**, bukan DOI resolvable — `https://doi.org/10.xxxx/jer.2023.14` hampir pasti tidak terselesaikan. **Perlu konfirmasi DOI asli dari pengguna.** |
| Venue | tercatat | *Journal of Education Research* (sesuai rekaman). Cek kebijakan peer review jurnal ini: `belum terverifikasi` |
| Peer review | belum terverifikasi | butuh halaman kebijakan jurnal (situs resmi) |
| Akreditasi SINTA | belum terverifikasi | rekaman pengguna: **SINTA 2**. Klaim ini dari pengguna, bukan hasil cek portal SINTA oleh saya. |
| Indeksasi Scopus | tidak diminta / tidak dicatat | — |
| Open access (DOAJ) | belum terverifikasi | — |
| Full text | tidak diketahui | tidak pernah saya buka |

### Sumber 2 — Nguyen et al. (2024), *Measuring digital literacy at scale*, Computers & Education

| Dimensi | Nilai | Bukti / catatan |
|---|---|---|
| Validitas bibliografi (DOI/Crossref) | belum terverifikasi | DOI tercatat `10.1016/j.compedu.2024.105001`. Bentuknya lengkap dan konsisten dengan pola DOI Elsevier; tautan ketelusuran: `https://doi.org/10.1016/j.compedu.2024.105001`. **Verifikasi Crossref belum dijalankan** (tool web mati). |
| Venue | tercatat | *Computers & Education* (Elsevier) |
| Peer review | belum terverifikasi | kebijakan jurnal belum dicek |
| Indeksasi Scopus | belum terverifikasi | rekaman pengguna: **Scopus Q1**. Q1 = klaim kuartil; perlu cek Scopus Sources (kuartil + cakupan tahun vs 2024). |
| Kuartil | belum terverifikasi | dimensi terpisah dari "indeksasi" — Q1 butuh angka CiteScore/SJR dari sumber resmi |
| Open access (DOAJ) | belum terverifikasi | — |
| Full text | tidak diketahui | — |

### Sumber 3 — Aditya (2022), *Literasi digital*

| Dimensi | Nilai | Bukti / catatan |
|---|---|---|
| Validitas bibliografi | **belum terverifikasi** | Tanpa DOI; **venue tidak pasti** (rekaman sengaja tidak lengkap). Menurut `03-source-audit.md`, tanpa DOI ≠ otomatis invalid — banyak jurnal sah tanpa DOI — jadi statusnya `belum terverifikasi`, **tidak** saya labeli invalid. |
| Venue | tidak pasti | tidak ada nama jurnal/penerbit yang bisa dicatat |
| Peer review / SINTA / Scopus / DOAJ | belum terverifikasi | tanpa venue, dimensi ini belum bisa diarahkan |
| Full text | tidak diketahui | — |

**Konsekuensi penggunaan (Fase 6, QC: "yang belum terverifikasi tidak jadi rujukan utama"):** Sumber 1 & 2 (metadata lengkap) menjadi **anchor** Related Work. Sumber 3 hanya boleh dikutip **sekunder/terbatas** dengan penandaan jujur, atau diganti/dilengkapi metadatanya oleh pengguna.

## 3. sources.md (arsip bukti, format tabel Fase 1/3)

Belum ada `sources.md` proyek yang diserahkan; berikut baris yang siap ditempel ke `sources.md` pengguna:

| # | Penulis, tahun | Judul | Venue | DOI / tautan | Status per dimensi | Relevansi vs tujuan |
|---|---|---|---|---|---|---|
| 1 | Kusuma & Rahayu, 2023 | Digital literacy among Indonesian secondary students | Journal of Education Research | `10.xxxx/jer.2023.14` (placeholder; verifikasi manual) | SINTA 2 (klaim pengguna); seluruh dimensi audit: belum terverifikasi | Studi literasi digital siswa menengah Indonesia — konteks lokal |
| 2 | Nguyen et al., 2024 | Measuring digital literacy at scale | Computers & Education | `https://doi.org/10.1016/j.compedu.2024.105001` | Scopus Q1 (klaim pengguna); dimensi lain: belum terverifikasi | Kerangka pengukuran berskala besar — metodologi & instrumen |
| 3 | Aditya, 2022 | Literasi digital | tidak pasti | tidak ada | belum terverifikasi (metadata tidak lengkap) | Konsep/terminologi literasi digital (rujukan sekunder) |

## 4. Draf Related Work

> **Asumsi topik:** ketiga rekaman bertema **literasi digital**, jadi draf ini membingkai tinjauan pustaka di sekitar literasi digital (siswa Indonesia, pengukuran berskala besar, konsep lokal). Kalimat yang menuntut isi asli paper diberi penanda `[ISI TEMUAN: …]` — isi setelah full text tersedia. Penanda ini **wajib dihapus, bukan ditebak**.

### 2. Related Work

Literasi digital telah menjadi fokus riset pendidikan, terutama sejak kebutuhan kompetensi digital siswa mengiringi pembelajaran daring. Bagian ini meninjau tiga lini yang relevan: (a) potret literasi digital siswa di Indonesia, (b) instrumen pengukuran literasi digital berskala besar, dan (c) rumusan konsep literasi digital dalam konteks Indonesia.

**Potret literasi digital siswa Indonesia.** Kusuma dan Rahayu ([kusuma2023digital]) meneliti literasi digital di kalangan siswa menengah Indonesia. `[ISI TEMUAN: metode, sampai, dan hasil utama — diambil dari full text, bukan tebakan]`. Studi ini penting karena memberi baseline kontekstual untuk pendidikan menengah di Indonesia, sehingga instrumen dan temuannya dapat dijadikan pembanding ketika penelitian lain mengukur populasi sejenis.

**Pengukuran literasi digital berskala besar.** Nguyen dan rekan ([nguyen2024measuring]) mengembangkan pendekatan pengukuran literasi digital pada skala besar di *Computers & Education*. `[ISI TEMUAN: desain instrumen, cakupan responden, dan validitas/reliabilitas laporan]`. Lini ini relevan karena persoalan utama penelitian literasi digital adalah standardisasi instrumen: temuan lintas negara sulit dibandingkan bila definisi dan skala ukur berbeda.

**Konsep literasi digital dalam konteks Indonesia.** Aditya ([aditya2022literasi]) membahas konsep literasi digital dalam konteks Indonesia. `[ISI TEMUAN: definisi/kerangka yang dipakai]`. ⚠️ *Catatan sitasi: rekaman sumber ini belum lengkap (tanpa DOI, venue tidak pasti), sehingga rujukan ini bersifat sekunder dan harus diganti atau dilengkapi metadatanya sebelum naskah final.*

**Sintesis dan celah awal.** Dari tiga lini di atas terlihat pembagian peran yang berbeda: konteks lokal siswa menengah ([kusuma2023digital]), metodologi pengukuran berskala ([nguyen2024measuring]), dan kerangka konseptual ([aditya2022literasi]). `[CEK SETELAH FULL TEXT: apakah benar belum ada studi yang memadukan instrumen berskala besar dengan populasi siswa menengah Indonesia — klaim gap ini BELUM terkonfirmasi dan tidak boleh dinyatakan tegas sebelum kedua paper dibaca]`. Saat ini jumlah rujukan baru tiga paper; petaan literatur masih dangkal dan perlu diperluas (lihat Keterbatasan, bagian 7).

Sitasi dalam teks memakai format naratif nama–tahun; kunci BibTeX ditulis eksplisit di atas agar pemeriksaan silang mudah.

## 5. library.bib

```bibtex
% library.bib — draf EVAL-012 (Fase 6)
% Konsistensi: setiap kunci di bawah muncul di draf Related Work, dan sebaliknya.

@article{kusuma2023digital,
  author    = {Kusuma, A. and Rahayu, S.},
  title     = {Digital literacy among Indonesian secondary students},
  journal   = {Journal of Education Research},
  year      = {2023},
  doi       = {10.xxxx/jer.2023.14},
  note      = {Status: SINTA 2 (klaim pengguna, belum diverifikasi via portal SINTA).
               DOI tercatat sebagai hasil verifikasi manual pengguna dan berbentuk
               placeholder — kemungkinan tidak resolvable. Verifikasi Crossref
               belum dijalankan (tool web nonaktif). Ganti dengan DOI asli bila ada.}
}

@article{nguyen2024measuring,
  author    = {Nguyen, T. and others},
  title     = {Measuring digital literacy at scale},
  journal   = {Computers \& Education},
  year      = {2024},
  doi       = {10.1016/j.compedu.2024.105001},
  note      = {Status: Scopus Q1 (klaim pengguna; kuartil & cakupan tahun belum
               diverifikasi via Scopus Sources). DOI lengkap, tautan ketelusuran:
               https://doi.org/10.1016/j.compedu.2024.105001. Nama penulis kedua
               dst. perlu dilengkapi dari full text ("others" = placeholder).}
}

% Venue tidak pasti → dipakai @misc, bukan @article, agar metadata yang belum
% diketahui tidak diisi karangan.
@misc{aditya2022literasi,
  author    = {Aditya, R.},
  title     = {Literasi digital},
  year      = {2022},
  note      = {Metadata tidak lengkap: tanpa DOI, venue tidak pasti. Status audit:
               belum terverifikasi. Rujukan sekunder — jadikan rujukan utama hanya
               setelah metadata dilengkapi. Tidak ada tautan yang bisa dicatat saat ini.}
}
```

## 6. Pemeriksaan silang sitasi ↔ bibliografi

| Sitasi di teks | Kunci di bib | Bib ↔ teks | Tautan ketelusuran | Bisa ditelusuri sekarang? |
|---|---|---|---|---|
| Kusuma dan Rahayu (2023) / `[kusuma2023digital]` | `@article{kusuma2023digital}` | ✅ cocok | `https://doi.org/10.xxxx/jer.2023.14` | ❌ bentuk placeholder; **menunggu DOI asli dari pengguna** |
| Nguyen dan rekan (2024) / `[nguyen2024measuring]` | `@article{nguyen2024measuring}` | ✅ cocok | `https://doi.org/10.1016/j.compedu.2024.105001` | ⚠️ bentuk lengkap & resolvable pada prinsipnya; **verifikasi belum dijalankan** |
| Aditya (2022) / `[aditya2022literasi]` | `@misc{aditya2022literasi}` | ✅ cocok | tidak ada | ❌ tanpa DOI/venue — ketelusuran mustahil sampai metadata lengkap |

- Bib → teks: ketiga entri punya setidaknya satu sitasi di draf. ✅
- Teks → bib: ketiga sitasi punya entri. ✅
- Entri tanpa jejak yang disamarkan: **tidak ada** — `aditya2022literasi` ditandai eksplisit di `note` dan di teks (⚠️).

## 7. QC Checklist Fase 6 (sebelum gate G6)

- [x] Struktur sesuai konvensi — di sini hanya bagian Related Work yang diminta; bagian IMRaD lain di luar lingkup permintaan.
- [ ] Setiap klaim hasil didukung artefak Fase 5 — **belum berlaku/belum ada**: belum ada Fase 5, dan temuan paper belum terbaca (penanda `[ISI TEMUAN: …]`).
- [x] Paper yang dikutip: 2 anchor (metadata lengkap, status audit tetap `belum terverifikasi`), 1 rujukan sekunder berpenandaan.
- [x] Bib ↔ teks konsisten (tabel bagian 6). Entri punya DOI/tautan **sepanjang tersedia**; satu entri (`aditya2022literasi`) jujur tanpa tautan.
- [x] Bagian Limitations ada dan substantif (bagian 7b di bawah).

### 7b. Keterbatasan (wajib tampil di naskah juga)

1. Tool web nonaktif → tidak ada verifikasi Crossref/SINTA/Scopus/DOAJ dan tidak ada akses full text. Seluruh status indeks yang disebut adalah **klaim rekaman pengguna**, bukan hasil audit saya.
2. Draf Related Work hanya bertumpu pada 3 paper; kedangkalan pustaka ini material untuk klaim gap — jangan klaim novelty kuat sebelum discovery (Fase 1) dijalankan dengan tool web aktif.
3. Gap yang disebut di paragraf sintesis **belum terkonfirmasi** (belum baca kedua paper).
4. Nama penulis Nguyen selain penulis pertama masih placeholder (`and others`).

## 8. Permintaan persetujuan (gate G6)

Karena permintaan pengguna adalah tugas tunggal (mode mandiri), gate antarfase tidak dipaksakan berantai; namun menurut Fase 6 saya mengajukan hasil ini untuk **persetujuan pengguna** sebelum melangkah:

**Mohon putuskan:**
1. **Approve draf** Related Work + `library.bib` di atas sebagai draf kerja, atau tentukan revisi.
2. **Sumber 1:** isi DOI asli Kusuma & Rahayu (2023) — DOI `10.xxxx/...` saat ini tidak dapat ditelusuri.
3. **Sumber 3:** Aditya (2022) — lengkapi metadata (venue, penerbit, tautan), atau setujui penggantian sumber sekunder, atau setujui pencabutan sitasinya dari naskah.
4. Konfirmasi **asumsi topik** "literasi digital" dan research question Anda, supaya paragraf sintesis/gap bisa ditulis final.
5. Setelah tool web aktif: jalankan verifikasi dimensi (Crossref, portal SINTA, Scopus Sources) lalu G3/G6 ulang untuk mengubah `belum terverifikasi` menjadi `ya`/`tidak` dengan bukti tautan.

**Status akhir:** draf dikirim dengan ketidakpastian ditandai; tidak ada metadata, temuan, atau status indeks yang dikarang.
