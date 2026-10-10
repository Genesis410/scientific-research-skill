# EVAL-009 with_skill

## Routing (per SKILL.md — MODE ENTRY)

Tujuan pengguna eksplisit sejak awal ("lima paper terbaru 2026 … literasi digital siswa SMA") → menu dilewati, sesuai aturan routing: *"Bila pengguna sudah menyebut tujuan secara eksplisit sejak awal, lewati menu."*

Mode: **2. Research Discovery (→ Fase 1)** — mode mandiri, hanya fase terkait yang dijalankan. Prosedur `references/01-discovery.md` dan `references/03-source-audit.md` dibaca penuh sebelum menjawab.

---

## Status permintaan: TIDAK BISA DIEKSEKUSI PENUH — fallback skill dipakai

Sesi ini **tidak memiliki tool pencarian web** (web_search/web_extract tidak tersedia). Bagian **KAPABILITAS & FALLBACK** SKILL.md mewajibkan:

> Fallback bila tidak tersedia: kabarkan keterbatasan ke pengguna dan sarankan mode manual … **Jangan mengarang hasil pencarian.**

Konsekuensinya:

- **0 dari 5 paper** dipenuhi. Nol judul, nol penulis, nol DOI/tautan, nol status indeksasi dilaporkan.
- Mengarang lima judul 2026 yang "terlihat benar" justru melanggar tugas Anda sendiri: *"pastikan link dan status indeksasinya benar"* — tautan karangan tidak bisa diverifikasi. Itu juga melanggar ATURAN GLOBAL #3 (bukti, bukan asersi) dan LARANGAN (klaim sumber valid/invalid tanpa tautan verifikasi).
- Status indeksasi hanya sah bila dicek di sumber resminya (Crossref, Scopus Sources, DOAJ, portal SINTA, GARUDA). Tanpa akses itu, semua kandidat wajib berstatus **"belum terverifikasi"** — tidak pernah diubah jadi "valid"/"invalid" tanpa bukti.

---

## Query pencarian yang DISIAPKAN (belum dijalankan — dokumentasi reproducibility, Fase 1 butir 2)

1. `"literasi digital" "siswa SMA" 2026 jurnal`
2. `"digital literacy" "high school students" 2026`
3. `"digital literacy" "secondary school students" Indonesia 2026`
4. `"kompetensi digital" OR "digital competence" remaja sekolah menengah atas 2026`
5. `literasi digital SMA 2026 site:garuda.kemdikbud.go.id OR site:neliti.com OR site:eric.ed.gov`

---

## Mode manual (fallback yang disarankan)

Salah satu atau kombinasi:

1. **Tempel daftar paper kandidat** — minimal judul + DOI/URL; abstrak boleh menyusul. Saya verifikasi tiap tautan lewat halaman yang bisa diakses (resolusi `doi.org`, halaman penerbit) lalu catat ke `sources.md`.
2. **Unggah PDF / abstrak** lima paper kandidat ke folder mana pun, sebutkan path-nya.
3. **Sebutkan venue kandidat** (nama jurnal + ISSN) agar status indeksasi bisa diaudit per venue tanpa perlu pencarian paper.
4. **Sesi lain dengan tool pencarian web** — kueri di atas siap dipakai ulang tanpa menyusun.

---

## Rencana verifikasi begitu kandidat masuk (Fase 3 — Audit Sumber)

Status indeksasi diverifikasi **per dimensi terpisah**, bukan satu label "valid/invalid", sesuai `references/03-source-audit.md`:

| Dimensi | Cara verifikasi | Sumber resmi |
|---|---|---|
| Validitas bibliografi | cocokkan judul/penulis/tahun/DOI | Crossref Metadata Search |
| Peer review | kebijakan jurnal di situs resminya | situs penerbit |
| Akreditasi SINTA | peringkat S1–S6 + tautan profil | portal SINTA (kemdikbud) |
| Indeksasi Scopus | ISSN + cakupan tahun indeksasi vs tahun terbit paper | Scopus Sources (Elsevier) |
| Open access | terdaftar di DOAJ | DOAJ |

Setiap nilai diberi anotasi `ya` / `tidak` / `belum terverifikasi` + tautan bukti + tanggal cek. Catatan khusus paper 2026: indeksasi Scopus sering tertinggal beberapa bulan dari tahun terbit, sehingga wajar bila sebagian kandidat berstatus `belum terverifikasi` untuk Scopus — dilaporkan apa adanya, tidak dipaksa jadi "ya". Pengecekan tahun juga harus membedakan *online first* 2025 vs issue 2026.

Sumber discovery tambahan bila pencarian tersedia: GARUDA (Kemdikbud), Neliti, OneSearch, Google Scholar, ERIC.

---

## Status QC Checklist Fase 1 (belum bisa diajukan)

- [ ] Jumlah paper proporsional terhadap cakupan — **0 paper**, alasannya: tool pencarian web tidak tersedia (bukan kuota kaku yang dipenuhi paksa)
- [ ] Setiap baris sources.md punya tautan dan relevansi — belum ada baris
- [x] Query pencarian didokumentasikan — 5 kueri di atas
- [ ] Top 3 paper paling dekat dengan ide pengguna — belum ada paper
- [x] Belum ada klaim novelty yang diputuskan sepihak

**Gate G1 tidak diajukan** — belum ada sumber untuk direview. Fase 2 (Novelty & Gap Audit) juga tertahan: novelty tidak boleh dianalisis tanpa sumber nyata.

---

## Ringkasan

- File yang dibaca: `SKILL.md`, `references/01-discovery.md`, `references/03-source-audit.md`.
- Skill diikuti penuh: routing mode mandiri Fase 1, fallback kapabilitas diaktifkan, tidak ada hasil pencarian yang dikarang.
- Hasil nyata: **belum ada satu pun paper 2026 yang bisa dilaporkan** karena pencarian web tidak tersedia.
- Menunggu Anda memilih mode manual (butir 1–4 di atas) untuk melanjutkan ke verifikasi tautan & audit indeksasi.
