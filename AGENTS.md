# AGENTS.md — baca sebelum mengubah apapun di repo ini

READ AGENTS.md BEFORE MODIFYING CODE.

## Project
Skill Agent riset ilmiah end-to-end (markdown only). Bahasa konten: Indonesia basis, istilah internasional dipertahankan.

## Stack
Markdown + YAML frontmatter (Agent Skills). CI: Python stdlib. Tidak ada framework, tidak ada dependensi runtime.

## Rules
1. Skill murni markdown — JANGAN menambahkan scripts Python ke dalam SKILL.md/references/assets. scripts/ hanya untuk tooling repo (CI).
2. Deskripsi skill ≤60 karakter; name = scientific-research (dicek CI).
3. Gate antar fase tidak boleh dihapus — persetujuan manusia wajib.
4. Jangan pernah mengubah aturan audit sumber (references/03-source-audit.md) agar status "belum terverifikasi" berubah jadi default valid/invalid.
5. Semua file yang dirujuk SKILL.md harus ada — jalankan `python scripts/validate_skill.py` sebelum commit.
6. Jangan commit artefak riset pribadi pengguna ke repo ini.
7. Format: heading Markdown standar; tabel untuk matriks; tanpa emoji dekoratif.
8. Git: branch main, commit message imperative, tag semver + CHANGELOG entry untuk tiap rilis.

## Forbidden
- Menambah dependensi eksternal CI (super-linter, dll) tanpa persetujuan
- Menghapus DECISIONS.md / ADR saat mengubah fitur
- Menjadikan API key syarat penggunaan skill
