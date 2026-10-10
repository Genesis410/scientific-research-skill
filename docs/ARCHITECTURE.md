# ARCHITECTURE — scientific-research-skill

## Overview
Satu skill induk (SKILL.md) dengan referensi per fase. Agent membaca SKILL.md saat skill dipanggil, lalu memuat references/<fase>.md sesuai kebutuhan (lazy-load — hemat konteks).

## Component Diagram

```text
SKILL.md (induk: ROLE, fase index, aturan gate, bahasa)
├── references/01-discovery.md        Fase 1–2: discovery & literature review
├── references/02-novelty.md          Fase 3: novelty & innovation lab (+ efek samping solusi)
├── references/03-source-audit.md     Fase 4: audit tiered SINTA/DOAJ/Crossref/Scopus
├── references/04-methodology.md      Fase 5: desain riset & metodologi
├── references/05-analysis.md         Fase 6: data pipeline & analisis statistik
├── references/06-writing.md          Fase 7: penulisan & sitasi BibTeX
├── references/07-review.md           Fase 8: critical review & reproducibility
├── references/08-continuity.md       Fase 9: kontinuitas & progress tracking
└── assets/template/                  Template artefak proyek (progress, decisions, sources)
```

## Data Flow (per proyek riset pengguna)

```text
Ide/topik
  → agent inisialisasi folder proyek (assets/template → progress.md, decisions.md, sources.md)
  → loop fase: agent kerjakan → tulis artefak → gate → manusia approve → lanjut
  → semua artefak lokal di folder proyek pengguna (D024)
```

## Module Responsibilities
- SKILL.md: routing fase, aturan gate, aturan bahasa, larangan (tidak mengklaim validasi tanpa bukti)
- references/<fase>.md: prosedur + QC checklist per fase
- assets/template/: template markdown yang disalin agent ke folder proyek
- scripts/validate_skill.py (di repo, bukan bagian skill): validator struktur untuk CI

## Dependency Rules
- references/*.md hanya dirujuk dari SKILL.md, tidak saling menumpuk berlebihan (cross-ref maksimal 1 tingkat)
- assets/template hanya berisi markdown

## Trust Boundaries
- Manusia = authority gate; agent tidak boleh approve gate sendiri
- Sumber eksternal = tidak tepercaya sampai lolos audit tiered
