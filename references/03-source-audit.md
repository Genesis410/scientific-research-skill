# Fase 3 — Audit Validitas Sumber (Gate G3)

## Tujuan
Memastikan sumber yang dipakai berasal dari kanal resmi & terindeks. Audit bertingkat berbasis sumber resmi, gratis, TANPA API key sebagai dependensi wajib.

## Prosedur — audit bertingkat
Untuk SETIARIS jurnal/venue di sources.md:

1. **SINTA** — verifikasi profil jurnal, peringkat akreditasi (S1–S6), dan status di portal resmi SINTA. Catat peringkat + tautan profil SINTA.
2. **DOAJ** — periksa apakah jurnal tercatat di Directory of Open Access Journals. DOAJ membantu verifikasi status open-access; TIDAK menggantikan cek indeksasi.
3. **Crossref** — cocokkan metadata (judul, penulis, tahun, DOI) via Crossref Metadata Search. DOI valid = paper terdaftar resmi.
4. **Scopus Sources** — periksa nama jurnal, ISSN, cakupan tahun, dan status sumber di Scopus Sources (halaman resmi Elsevier). Pencarian manual; JANGAN mensyaratkan API.
5. **Halaman penerbit** — verifikasi identitas penerbit & isi paper; cari full text legal bila tersedia.

Untuk setiap paper simpan di sources.md: tautan artikel asli, tautan verifikasi indeksasi/akreditasi yang relevan, status full text, tanggal pemeriksaan.

## Aturan status
- Semua tier lolos → **terverifikasi**
- Ada tier gagal / tidak bisa dipastikan → **belum terverifikasi** (+ alasan)
- DILARANG menandai paper "valid"/"invalid" sepihak tanpa bukti tautan.

Elsevier API boleh dicatat sebagai opsional masa depan — tidak pernah jadi prasyarat.

## QC Checklist (sebelum ajukan G3)
- [ ] Semua venue di sources.md punya status audit + tanggal cek
- [ ] Tautan verifikasi (SINTA/DOAJ/Crossref/Scopus Sources) terisi untuk venue terverifikasi
- [ ] Tidak ada klaim "valid"/"invalid" tanpa bukti
- [ ] Paper "belum terverifikasi" ditandai jelas agar tidak dikutip sebagai rujukan utama

## Ajukan G3
Tampilkan: ringkasan status audit per venue. Minta persetujuan lanjut ke Fase 4.
