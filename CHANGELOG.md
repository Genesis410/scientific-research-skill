# Changelog

Semua perubahan terdokumentasi di sini. Format: [Keep a Changelog](https://keepachangelog.com/), versi: semver.

> Status: **v0.1.0 = rilis awal/eksperimental**. Gate MVP (D027) terpenuhi hanya setelah pilot riset nyata selesai (T17). CI hijau = struktur valid, bukan bukti kualitas ilmiah.

## [0.1.3] - 2026-10-10
### Fixed
- Deteksi skills dir aktif: Windows → %LOCALAPPDATA%\hermes\skills (bukan ~/.hermes/skills yang tidak dipakai Hermes)

## [0.1.2] - 2026-10-10
### Added
- install.sh (curl | bash) + install.ps1 (irm | iex) — auto clone/pull ke skills dir, opsi --dir / -SkillsDir / env HERMES_SKILLS_DIR
- Quick install di README

## [0.1.1] - 2026-10-10
### Added
- Mode entry menu interaktif (11 pilihan: pipeline lengkap, discovery, literature review, novelty audit, SINTA/Scopus audit, methodology, dataset analysis, writing, critical review, jelaskan 1 paper, continue research)
- Audit sumber multidimensi: status terpisah (bibliografi, peer review, SINTA, Scopus, OA, metodologi) + mode filter SINTA-only/Scopus-only/Q1-only/OA-only/peer-reviewed-only/full
- Registry discovery per disiplin (GARUDA, Neliti, OneSearch, Google Scholar, dst.)
- Bagian KAPABILITAS & FALLBACK di SKILL.md
- Pengujian skenario fungsional di TESTING.md (SINTA-only, Q1-only, 1 paper, continue project)
- Instruksi instalasi PowerShell di README
### Changed
- sources.md: pemisahan URL artikel, bukti indeksasi, kedalaman baca, keterbatasan
- Kuota discovery proporsional (bukan ≥10 kaku)
- Catatan batasan validator: regex struktur, bukan validasi YAML penuh
- TASKS.md: v0.1.0 dinyatakan eksperimental sampai pilot (T17) selesai
### Removed
- docs/DATABASE.md, docs/API.md, docs/UI_SPEC.md, docs/DESIGN_SYSTEM.md (tidak applicable)

## [0.1.0] - 2026-10-10
### Added
- Rilis awal: SKILL.md induk (9 fase, gate G1–G7, aturan bahasa Indonesia basis)
- references/01–08 (discovery, novelty, source-audit tiered, methodology, analysis, writing, review, continuity)
- assets/template/ (progress.md, decisions.md, sources.md)
- CI: scripts/validate_skill.py (stdlib) + GitHub Actions workflow
- Dokumentasi: docs/ (PRD, TRD, FEATURE_SPEC, TASKS, TESTING, DECISIONS, ADR) + AGENTS.md
- README bilingual, CONTRIBUTING, LICENSE (MIT)
