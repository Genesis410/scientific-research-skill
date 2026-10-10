# ADR: Monolith induk + references per fase

## Context
Cakupan riset end-to-end (9 fase) tapi skill harus tetap ringan di konteks agent.

## Decision
Satu SKILL.md induk (routing + aturan global), prosedur detail di references/01..08, lazy-load per fase.

## Alternatives
- Multi-skill pack: rapi tapi fragmentasi rujukan antar skill.
- Satu file besar: membanjiri konteks.

## Trade-offs
Induk harus disintesis bila aturan global berubah.

## Consequences
Agent memuat references/<fase>.md hanya saat fase aktif.
## Status
Accepted (D011, D023)
