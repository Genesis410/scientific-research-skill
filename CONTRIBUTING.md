# Contributing

Terima kasih. Aturan singkat:

1. Baca `AGENTS.md` dulu — stack, rules, forbidden.
2. Sebelum commit: `python scripts/validate_skill.py` harus `OK` (jalan juga otomatis di CI).
3. PR deskripsi: apa yang berubah + kenapa; perubahan aturan gate/audit butuh justifikasi dan memicu review manusia.
4. Bahasa konten: Indonesia basis, istilah internasional dipertahankan.
5. Jangan commit artefak riset pribadi.
6. Rilis: ubah CHANGELOG.md + tag semver (`vX.Y.Z`) — review manusia + agent sebelum tag (docs/DECISIONS.md D028).
