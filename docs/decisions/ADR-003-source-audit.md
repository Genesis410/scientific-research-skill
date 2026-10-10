# ADR: Audit bertingkat gratis tanpa API key

## Context
Audit validitas sumber (SINTA/Scopus) diperlukan; API Elsevier berbayar/institusional.

## Decision
Tiered audit berbasis sumber resmi gratis: SINTA portal → DOAJ → Crossref (metadata/DOI) → Scopus Sources (manual) → halaman penerbit. Simpan tautan verifikasi + tanggal cek. Status ragu = "belum terverifikasi". Elsevier API opsional belakangan.

## Alternatives
- Scopus API sejak awal: mensyaratkan key institusi — tidak open-source friendly.
- Tanpa audit: melanggar kebutuhan pengguna.

## Trade-offs
Manual, tidak otomatis penuh — dapat ditambah API bila tersedia.

## Consequences
Tidak ada klaim valid/invalid tanpa bukti; reproducibility audit tercatat.
## Status
Accepted (D025)
