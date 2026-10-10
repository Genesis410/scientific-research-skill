# scientific-research-skill

Skill Agent riset ilmiah end-to-end — dari discovery sampai publikasi, dengan checkpoint gate antar fase. Open source, MIT.

*An end-to-end scientific-research agent skill — discovery to publication, with human checkpoints between phases. Open source, MIT.*

## Masalah / Problem
Riset berhenti di tengah: tidak ada tracking kontinuitas, klaim novelty tanpa bukti, sumber tidak teraudit (predatory/non-terakreditasi).

## Solusi / Solution
Satu skill (format [Agent Skills](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills) — SKILL.md) yang memandu manusia + AI agent melalui 9 fase riset. Semi-otomatis: agent eksekusi, manusia approve tiap gate (G1–G7).

## Fase / Phases
| # | Fase | Gate |
|---|------|------|
| 0 | Inisialisasi proyek | — |
| 1 | Research discovery & literature review | G1 |
| 2 | Novelty & innovation lab (+ analisis efek samping solusi) | G2 |
| 3 | Audit validitas sumber (SINTA/DOAJ/Crossref/Scopus) | G3 |
| 4 | Desain riset & metodologi | G4 |
| 5 | Data pipeline & analisis statistik | G5 |
| 6 | Penulisan paper & sitasi BibTeX | G6 |
| 7 | Critical review & reproducibility | G7 |
| 8 | Kontinuitas proyek (tiap sesi) | — |

## Instalasi / Install
**Hermes Agent (Windows / PowerShell):**
```powershell
git clone https://github.com/Genesis410/scientific-research-skill.git
Copy-Item -Recurse scientific-research-skill "$env:USERPROFILE\.hermes\skills\scientific-research-skill"
```
Linux/macOS:
```bash
git clone https://github.com/Genesis410/scientific-research-skill.git
cp -r scientific-research-skill ~/.hermes/skills/
```
Lokasi skills dir bisa berbeda per instalasi Hermes — sesuaikan (lihat config.yaml / `hermes skills`).
**Agent lain (Claude Code, dll.):** salin folder ke direktori skill / skills-nya.

Lalu gunakan `/scientific-research` atau sebut "riset ilmiah" dalam percakapan.

**Kapabilitas yang dibutuhkan runtime:** tool pencarian web + ekstraksi konten halaman (mis. `web_search`/`web_extract`). Skill menyediakan fallback bila tidak ada — lihat SKILL.md bagian KAPABILITAS & FALLBACK.

*For other agents: copy the folder into your agent's skills directory and reference `scientific-research`.*

## Struktur repo
```text
SKILL.md              skill induk (routing, aturan gate, bahasa)
references/01–08      prosedur per fase + QC checklist
assets/template/      template progress.md, decisions.md, sources.md
scripts/              validator CI (Python stdlib, bukan bagian skill)
docs/                 PRD, TRD, arsitektur, ADR (keputusan)
```

## Pengembangan / Contributing
Lihat CONTRIBUTING.md. Wajib: `python scripts/validate_skill.py` sebelum PR.

## Lisensi / License
MIT — lihat LICENSE.
