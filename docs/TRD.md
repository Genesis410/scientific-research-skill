# TRD — scientific-research-skill

## Technical Goals
Skill markdown yang bisa dieksekusi agent (Hermes maupun Claude/agent Agent Skills-compatible) tanpa runtime tambahan.

## Stack
- Format: Agent Skills (SKILL.md + YAML frontmatter) — kompatibel umum + Hermes (D016)
- Bahasa konten: Markdown
- CI: GitHub Actions + validator Python stdlib ~50-80 baris (D020)
- Lisensi: MIT (D015)

## Runtime
Agent LLM dengan akses web (web_search, web_extract). Tanpa database, tanpa server, tanpa API key wajib.

## Architecture
Monolith — satu skill induk, fase di-split via references/ (D023). Lihat docs/ARCHITECTURE.md.

## Dependencies
Wajib: akses web tool.
Opsional (tidak mensyaratkan): pandas/scipy/matplotlib saat pengguna menganalisis data nyata — di luar scope skill.

## Performance
Tidak ada ukuran performa; skill harus tetap ringan: SKILL.md < 500 baris agar tidak membanjiri konteks agent.

## Security
- Skill tidak memegang secret, tidak meminta API key wajib
- Agent dilarang mengklaim status valid/invalid sumber tanpa bukti tautan verifikasi
- Data riset pengguna tetap di folder milik pengguna (D024), tidak diunggah eksternal tanpa persetujuan

## Scalability
Tidak applicable — artefak per proyek = file markdown lokal.

## Deployment
GitHub push. Instalasi: salin folder ke skills dir (Hermes) atau manual untuk agent lain. Tag rilis + CHANGELOG.md (D019).
