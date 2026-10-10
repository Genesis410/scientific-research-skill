# TASKS — scientific-research-skill

| ID | Title | Deps | Status |
|----|-------|------|--------|
| T01 | Repo GitHub public (Genesis410/scientific-research-skill) | — | Done |
| T02 | Spesifikasi docs/ (12 dokumen + ADR) | T01 | Done |
| T03 | SKILL.md induk (ROLE, 9 fase, gate, bilingual rule) | T02 | Done |
| T04 | references/01-discovery.md | T03 | Done |
| T05 | references/02-novelty.md | T03 | Done |
| T06 | references/03-source-audit.md | T03 | Done |
| T07 | references/04-methodology.md | T03 | Done |
| T08 | references/05-analysis.md | T03 | Done |
| T09 | references/06-writing.md | T03 | Done |
| T10 | references/07-review.md | T03 | Done |
| T11 | references/08-continuity.md | T03 | Done |
| T12 | assets/template/ (progress, decisions, sources) | T03 | Done |
| T13 | Validator CI Python stdlib | T01 | Done |
| T14 | GitHub Actions workflow | T13 | Done |
| T15 | README + LICENSE + CHANGELOG + CONTRIBUTING | T01 | Done |
| T16 | Tag v0.1.0 + CHANGELOG entry | T15 | Done |
| T17 | Pilot: jalankan skill pada 1 riset nyata | T16 | Todo (gate MVP belum terpenuhi) |
| T18 | Golden test end-to-end dummy di CI | T17 | Todo (pasca-MVP) |
| T20 | Batch 1: evaluation harness (evals.json 12 kasus, RUBRIC, BASELINE) | T16 | Done |
| T21 | Batch 2: anti-fabrikasi rule eksplisit + mode audit cepat | T20 | Todo |
| T22 | Rerun EVAL-002 (2 mode) + EVAL-002 without_skill scoring | T21 | Todo |
| T19 | Repo template riset sebagai rilis lanjutan | T17 | Todo (pasca-MVP) |

## Acceptance Criteria MVP
- CI hijau; deskripsi skill ≤60 char; semua file references ada (D027)
- Pilot riset nyata lulus semua gate G1–G7
- Review manusia + agent sebelum tag rilis (D028)
