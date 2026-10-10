# ADR: Markdown + Python stdlib CI

## Context
Skill harus berjalan di agent apa pun tanpa dependensi runtime, tapi tetap butuh validasi otomatis struktur.

## Decision
Konten skill murni markdown (Agent Skills). CI memakai script Python stdlib (~80 baris) di scripts/.

## Alternatives
- Super-linter/marketplace actions: praktis tapi berat & noisy.
- Tanpa CI script: mengandalkan GitHub lint bawaan — tidak mengecek keberadaan file rujukan.

## Trade-offs
Validator sendiri harus dirawat; tapi ringan, deterministik, tanpa dependensi.

## Consequences
PR menyentuh SKILL.md/references wajib lewat validate_skill.py.
## Status
Accepted (D020, D021)
