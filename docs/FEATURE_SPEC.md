# FEATURE_SPEC — scientific-research-skill

Skill induk: `scientific-research` (≤60 char description, Agent Skills frontmatter).
Setiap fitur = satu fase. Gate = checkpoint persetujuan manusia sebelum fase berikutnya.

## F0 — Mode Entry (menu interaktif)
- Saat skill dipanggil tanpa tujuan eksplisit: tampilkan menu 11 mode (pipeline lengkap; discovery; literature review; novelty audit; SINTA/Scopus audit; methodology; dataset analysis; writing; critical review; jelaskan 1 paper; continue research).
- Mode mandiri tanpa pipeline: tidak memaksa folder proyek; gate antarfase tidak berlaku kecuali pengguna minta lanjut berantai.

## F1 — Inisialisasi Proyek (tanpa gate)
- User story: Peneliti menyebut topik/ide → agent membuat kerangka proyek riset lokal.
- Input: topik, tujuan penelitian awal (bisa kasar).
- Output: folder proyek berisi progress.md, decisions.md, sources.md (dari assets/template).
- Rules: lokasi folder ditentukan pengguna (D024); semua artefak markdown.

## F2 — Research Discovery & Literature Review (gate G1)
- User story: Peneliti ingin tahu lanskap paper relevan dengan tujuan penelitiannya.
- Output: sources.md berisi matriks paper (judul, penulis, tahun, venue, metode, temuan, relevansi vs tujuan, tautan).
- Rules: pemetaan paper diarahkan tujuan penelitian (bukan sekadar kata kunci); agent memuat references/01-discovery.md.

## F3 — Novelty & Innovation Lab (gate G2)
- Output: analisis gap + posisi novelty proposal; analisis efek samping/limitasi solusi yang ada.
- Rules: novelty dinyatakan sebagai klaim berbasis bukti paper yang ditemukan, bukan asersi.

## F4 — Audit Validitas Sumber (gate G3)
- Output: kolom status per sumber di sources.md: terverifikasi / belum terverifikasi, dengan bukti tautan + tanggal cek.
- Rules: tiered audit (D025): SINTA → DOAJ → Crossref → Scopus Sources → halaman penerbit; status ragu = "belum terverifikasi".

## F5 — Desain Riset & Metodologi (gate G4)
- Output: research design (pendekatan, variabel/konstruk, sampel, instrumen, validitas-reliabilitas), tercatat di decisions.md.

## F6 — Data Pipeline & Analisis Statistik (gate G5)
- Output: rencana/eksekusi analisis sesuai desain; asumsi statistik dicek; hasil dicatat di progress.md.
- Rules: skill pandu + agent eksekusi; alat berat (pandas/scipy) opsional di sisi pengguna, bukan dependensi skill.

## F7 — Penulisan Paper & Sitasi BibTeX (gate G6)
- Output: draf IMRaD + library.bib; sitasi diverifikasi cocok dengan sources.md yang lolos audit.

## F8 — Critical Review & Reproducibility (gate G7)
- Output: critical review draft (klaim vs bukti, ancaman validitas internal/eksternal), checklist reproducibility (data, kode, parameter, langkah).

## F9 — Kontinuitas Proyek (berjalan tiap sesi)
- Output: progress.md selalu dibaca di awal sesi; resume fase terakhir; daftar gate status.
