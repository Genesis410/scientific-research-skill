# TESTING — scientific-research-skill

3 lapisan (D026):

## 1. CI otomatis (scripts/validate_skill.py, stdlib)
- SKILL.md ada + frontmatter valid (name, description)
- name = scientific-research, description ≤60 char
- Setiap file yang dirujuk di SKILL.md ada di disk
- references/ berisi minimal 8 file fase

## 2. QC checklist per fase
Setiap references/<fase>.md mengakhiri prosedur dengan checklist QC yang dijalankan agent sebelum mengajukan gate. Isi minimal: kelengkapan artefak, validitas tautan, konsistensi bukti.

## 3. Pilot riset nyata
Uji dari pemilihan tujuan sampai tahap akhir relevan; dokumentasikan kegagalan di CHANGELOG/issues.

Golden test end-to-end di CI: ditunda (perilaku agent & web bergantung lingkungan).

## Definition of Done (MVP)
CI hijau + pilot lulus G1–G7 + tag v0.1.0 terbit.
