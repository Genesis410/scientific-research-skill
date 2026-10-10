# ADR: Gate checkpoint manusia antar fase

## Context
Risiko utama: agent salah melangkah diam-diam di tengah alur riset.

## Decision
Tujuh gate (G1–G7) antar fase; agent mengajukan gate + checklist QC, manusia approve/Reject; status tersimpan di progress.md.

## Alternatives
- Full otomatis: cepat tapi tidak aman untuk keputusan riset.
- Manual penuh: lambat, agent tidak optimal.

## Trade-offs
Human-in-the-loop memperlambat tapi menjaga akuntabilitas.

## Consequences
Skill dilarang menandai fase selesai tanpa approval eksplisit.
## Status
Accepted (D009, D012)
