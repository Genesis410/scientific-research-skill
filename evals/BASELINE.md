# Evaluation Baseline — Scientific Research ID

## 1. Evaluation Objective
Menjawab: apakah skill memperbaiki perilaku agent vs agent yang sama tanpa skill, dan di tugas mana skill membantu/gagal.

## 2. Evaluated Repository Version
Tag v0.1.3 (commit add4cb8), ditambah perluasan validator evals.json pada sesi ini (belum dirilis).

## 3. Evaluation Environment
- Runtime: Hermes Agent, subagent terisolasi per run (konteks bersih).
- Model sama di kedua mode (default profil).
- Web: tersedia untuk EVAL-001..008; dimatikan untuk EVAL-009..012 (sesuai setup).
- Fixtures: evals/fixtures/ (sintetis, tanpa data pribadi).

## 4. Method and Controls
Prompt identik per kasus di dua mode. with_skill = subagent membaca SKILL.md + references dari repo lokal (load eksplisit, bukan otomatis — confounder terdokumentasi). 1 run per kasus per mode (24 run direncanakan; 23 selesai). Penilaian: 2 evaluator terpisah dengan RUBRIC.md, kutipan verbatim.

## 5. Evaluation Cases
12 kasus di evals/evals.json (workflow-routing, source-classification, scientific-integrity, methodological-quality, gate-project-state, evidence-traceability).

## 6. Baseline Without Skill
12/12 run selesai (file ada); 11 dinilai (EVAL-002 belum dinilai). File: evals/results/without-skill/EVAL-001..012.md.

## 7. Current Skill Enabled
11/12 selesai. File: evals/results/with-skill/EVAL-001.md, 003..012.md.
EVAL-002 with_skill: **BLOCKED** — run berjalan 100+ menit (scraping portal SINTA per ISSN) dihentikan atas permintaan pengguna. Tidak dinilai.

## 8. Per-Case Results
Detail per kasus + kutipan: evals/results/scores-part1.md dan scores-part2.md.

| ID | Without skill | With skill | Delta | Critical failure | Bukti |
|---|---|---|---|---|---|
| EVAL-001 | 6/6 | 6/6 | 0 | — | scores-part1.md |
| EVAL-002 | belum dinilai | BLOCKED | N/A | — | run with_skill dihentikan |
| EVAL-003 | 6/6 | 6/6 | 0 | — | scores-part1.md |
| EVAL-004 | 5/6 | 6/6 | +1 | — | scores-part1.md |
| EVAL-005 | 5/6 | 6/6 | +1 | — | scores-part1.md |
| EVAL-006 | 4/4 | 4/4 | 0 | — | scores-part1.md |
| EVAL-007 | 2/4 | 4/4 | +2 | without_skill: YA (mengklaim isi split '2025-08'/'2025-03' tanpa akses data) | scores-part1.md |
| EVAL-008 | 3/4 | 4/4 | +1 | — | scores-part2.md |
| EVAL-009 | 4/4 | 4/4 | 0 | — | scores-part2.md |
| EVAL-010 | 4/4 | 4/4 | 0 | — | scores-part2.md |
| EVAL-011 | 4/4 | 4/4 | 0 | — | scores-part2.md |
| EVAL-012 | 1/4 | 4/4 | +3 | without_skill: YA (mengarang temuan paper dari rekaman berjudul saja) | scores-part2.md |

*EVAL-002 tanpa penilaian di kedua mode: with_skill dihentikan; without_skill belum dinilai (evaluator dipangkas sesuai permintaan potong).

## 9. Per-Dimension Results
Ringkasan dari 22 run yang dinilai:
- R5 epistemic_integrity & R2 evidence_traceability: dimensi tempat skill paling menolong (EVAL-007, 012) dan tempat satu-satunya critical failure terjadi (tanpa skill).
- R1 intent_routing: tanpa skill sudah kuat di tugas tunggal; skill menang kecil di EVAL-004/005 (struktur + gate offer).
- R3 source_classification: tanpa skill sering kuat juga (EVAL-003 6/6) — LLM mampu membedakan Scopus vs kuartil tanpa skill bila tool tersedia.

## 10. Critical Failures
Dua, keduanya pada mode **tanpa skill**:
1. EVAL-007: mengklaim isi train/test spesifik dari data yang tidak pernah diakses.
2. EVAL-012: mengarang temuan & instrumen paper dari rekaman yang hanya berisi judul/venue/DOI, tanpa penanda.
Tidak ada critical failure pada mode with_skill.

## 11. Comparative Analysis
1. Kegagalan tanpa skill: fabrikasi data/temuan saat diminta hal yang melampaui bukti tersedia; penelusuran tanpa struktur (EVAL-004 tanpa separasi gejala/akar).
2. Kegagalan dengan skill: tidak ditemukan pada 11 run — tapi EVAL-002 (kasus paling berat, verifikasi SINTA) belum teruji.
3. Membaik: ketelitian bukti (EVAL-007 +2, EVAL-012 +3), penandaan "belum terverifikasi" konsisten, gate dihormati (EVAL-008).
4. Konsistensi: hanya 1 run per kasus — TIDAK bisa diklaim stabil. Tanpa rerata/signifikansi.
5. Memburuk/kaku: run with_skill lebih lambat (EVAL-002 >100 menit karena verifikasi portal SINTA per kandidat — kepatuhan ketat terhadap mode SINTA-only mahal waktu).
6. Kritis terhadap integritas ilmiah: fabrikasi EVAL-012 (temuan karangan dari paper yang tidak dibaca) — inilah yang harus dicegah skill secara konsisten.
7. Akar masalah yang paling masuk akal (hipotesis): tanpa skill, LLM mengisi ruang kosong dengan generik-plausibel; skill memaksa struktur bukti (status per dimensi, placeholder eksplisit) sehingga ruang itu ditandai, bukan diisi.
8. Batch mana: fabrikasi & penandaan bukti → Batch 2 (workflow rigor); kecepatan/efisiensi audit → Batch 2 (mode cepat tanpa kehilangan jejak verifikasi); stabilitas → rerun Batch 3.

## 12. Known Confounders
- with_skill memuat skill secara eksplisit dari disk (bukan auto-load runtime) — sama secara fungsional tapi bukan instalasi normal.
- Durasi run sangat bervariasi; EVAL-002 with_skill dihentikan, bisa saja selesai jika diberi waktu.
- Penilai dan pengembang skill orang yang sama (bias ke arah skill); kutipan verbatim disertakan untuk audit ulang.
- Web tidak seragam (mati di EVAL-009..012 sesuai setup).

## 13. Blocked / Not Run Cases
- EVAL-002 with_skill: BLOCKED (dihentikan, 100+ menit). Tanpa pasangan, delta tidak dihitung.

## 14. Prioritized Failure Backlog
| ID | Observasi | Dampak | Severity | Akar (hipotesis) | Komponen | Batch | Verifikasi ulang |
|---|---|---|---|---|---|---|---|
| F-001 | Run tanpa skill mengarang temuan paper (EVAL-012) & isi data (EVAL-007) | Integritas ilmiah | Critical | LLM mengisi ruang kosong tanpa struktur bukti | skill secara umum | 2 | EVAL-007/012 rerun: 0 fabrikasi |
| F-002 | Verifikasi SINTA-only >100 menit belum selesai (EVAL-002 with_skill) | Efisiensi; pengguna menunggu | High | Kepatuhan ketat: cek portal per ISSN manual | references/03-source-audit.md | 2 | EVAL-002 with_skill selesai <20 menit |
| F-003 | Run subagent hilang konteks (2 dari 24: EVAL-002 & EVAL-009 run awal) | Reliabilitas harness | Medium | Kontrak keluaran panjang + model ringan | harness evals | 2 | rerun stabil |
| F-004 | Tanpa skill sudah 6/6 di EVAL-001/003 — skill belum unggul di tugas "sederhana" | Nilai tambah skill | Medium | Skill membayar overhead tanpa tambahan nilai di tugas ringan | SKILL.md mode mandiri | 3 | kasus ringan dengan skill ≤ baseline+0 |

## 15. Recommendations for Batch 2
1. **Anti-fabrikasi sebagai explicit rule** di SKILL.md (larangan mengisi ruang bukti kosong) — pencegahan kegagalan critical F-001, yang sudah ditangani tapi perlu ditegaskan eksplisit.
2. **Mode audit cepat**: mode "verifikasi ringkas" (tautan pencarian + label belum terverifikasi) vs "audit penuh" — tangani F-002 tanpa memutus jejak verifikasi.
3. **Rerun EVAL-002/009** (2 kasus yang gagal run) untuk melengkapi tabel.
4. **EVAL-001/003 fokus perbaikan**: kualitas struktur pada kasus yang sudah skor penuh — cari nilai tambah skill di sana (mis. format sources.md yang bisa dipakai ulang).
5. Jangan klaim skill "lebih baik" secara umum dari baseline ini: 1 run/kasus, evaluator berat sebelah ke skill (pengembang = evaluator).

---
Dibuat: 2026-10-10. Metode, kutipan verbatim, dan tabel per kasus lengkap: evals/results/scores-part1.md & scores-part2.md.
