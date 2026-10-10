# Fase 3 — Audit Validitas Sumber (Gate G3)

## Tujuan
Memverifikasi sumber dengan status TERPISAH PER DIMENSI — bukan satu label "valid/invalid". Audit berbasis sumber resmi, gratis, TANPA API key.

## Dimensi status (simpan terpisah, jangan pernah digabung)
| Dimensi | Diverifikasi lewat | Catatan |
|---------|-------------------|---------|
| Validitas bibliografi | Crossref (DOI), penerbit resmi | Tidak ada DOI ≠ otomatis invalid — banyak jurnal sah tanpa DOI |
| Peer review | kebijakan jurnal di situs resminya | |
| Akreditasi SINTA | portal SINTA (peringkat S1–S6) | Hanya berlaku jurnal nasional |
| Indeksasi Scopus | Scopus Sources (cakupan tahun, ISSN) | Cek periode indeksasi vs tahun terbit paper |
| Open access | DOAJ / situs jurnal | |
| Kualitas metodologi | pembacaan isi paper | Bukan hasil audit indeks |

Nilai tiap dimensi: `ya` / `tidak` / `belum terverifikasi` (+ bukti tautan + tanggal cek).

## Prosedur
1. Tentukan FILTER YANG RELEVAN dengan permintaan pengguna dulu (lihat Mode). Hanya filter itulah yang wajib diverifikasi; dimensi lain dicatat bila tersedia, tidak mensyaratkan.
2. Verifikasi per venue/paper:
   - **SINTA** — portal resmi SINTA, peringkat akreditasi + tautan profil.
   - **DOAJ** — pencatatan direktori OA; membantu verifikasi status open-access, TIDAK menggantikan cek indeksasi.
   - **Crossref** — cocokkan metadata (judul, penulis, tahun, DOI) via Crossref Metadata Search.
   - **Scopus Sources** — halaman resmi Elsevier: ISSN, cakupan tahun, status sumber. Pencarian manual; API tidak pernah jadi prasyarat.
   - **Sumber discovery tambahan per disiplin** — Indonesia: GARUDA (Kemdikbud), Neliti, OneSearch. Internasional: Google Scholar, Dimensions, PubMed/IEEE Xplore/ERIC/dll sesuai bidang.
   - **Halaman penerbit** — identitas penerbit, kebijakan peer review, full text legal bila tersedia.
3. Simpan di sources.md: URL artikel, tautan full text legal, tautan bukti tiap dimensi (SINTA/Scopus/DOAJ/Crossref), tanggal pemeriksaan.

## Mode filter
| Mode | Dimensi wajib |
|------|---------------|
| SINTA-only | Akreditasi SINTA (peringkat min. sesuai permintaan, default S1) |
| Scopus-only | Indeksasi Scopus (periode cakupan mencakup tahun terbit) |
| Q1-only | Scopus + kuartil (CiteScore/SJR dari sumber resmi) |
| Open-access-only | OA terdaftar DOAJ / situs jurnal |
| Peer-reviewed-only | Kebijakan peer review terverifikasi |
| Full audit | Semua dimensi diverifikasi |

## Aturan klasifikasi
- Semua dimensi FILTER YANG DIMINTA lolos → lolos filter itu
- Ada dimensi filter gagal / belum bisa dipastikan → tidak lolos filter / `belum terverifikasi` + alasan
- DILARANG mengubah status per dimensi jadi kebalikannya tanpa bukti tautan
- DILARANG menyimpulkan "paper invalid" dari satu dimensi saja

Elsevier API = opsional masa depan, tidak prasyarat.

## QC Checklist (sebelum ajukan G3)
- [ ] Mode/filter permintaan pengguna didefinisikan sebelum verifikasi
- [ ] Dimensi filter terisi untuk semua paper di sources.md
- [ ] Setiap nilai dimensi punya bukti tautan + tanggal cek
- [ ] Tidak ada label tunggal "valid/invalid" menggantikan dimensi
- [ ] Paper di luar filter tetap dicatat (status dimensi sisanya opsional)

## Ajukan G3
Tampilkan: ringkasan per dimensi + status lolos/tidak terhadap filter pengguna. Minta persetujuan lanjut.
