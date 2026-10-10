# PRD — scientific-research-skill

## Problem
Peneliti (S1/S2, khususnya Indonesia) kehilangan proyek riset di tengah jalan karena (1) tidak ada tracking kontinuitas, (2) tidak tahu apakah topik sudah novelty, (3) sumber tidak valid (predatory journal, SINTA non-terakreditasi). Tidak ada satu sistem kerja end-to-end yang menghubungkan discovery → novelty → metodologi → analisis → penulisan → review.

## Solution
Skill Agent (SKILL.md Agent Skills-compatible, juga berjalan di Hermes) yang memandu manusia + AI agent melalui 9 fase riset dengan checkpoint gate antar fase. Semi-otomatis: agent eksekripsi, manusia validasi tiap gate.

## Users
- Primer: manusia + AI agent berdua (manusia review tiap gate, agent eksekusi tugas)
- Konteks: peneliti Indonesia S1/S2, berlaku umum semua bidang ilmiah

## Goals (MVP)
- Skill terbit di GitHub (open-source, MIT) dan dipakai pada 1 riset nyata berikutnya
- Semua gate lulus pada pilot tersebut

## Non-Goals (MVP)
- Repo template riset terpisah (rilis menyusul)
- Website dokumentasi
- Otomatisasi penuh (training model, data collection otomatis)
- Golden test end-to-end di CI (setelah workflow stabil)
- Integrasi Elsevier/Scopus API (opsional masa depan, tidak mensyaratkan API key)

## Features
Lihat docs/FEATURE_SPEC.md. Ringkas: inisialisasi proyek, discovery & literature review, novelty & innovation lab, audit validitas sumber (tiered), desain riset & metodologi, data pipeline & analisis statistik, penulisan & sitasi BibTeX, critical review & reproducibility, kontinuitas proyek.

## User Journey
1. Peneliti punya ide/topik → jalankan skill → agent inisialisasi folder proyek (progress.md, decisions.md)
2. Agent discovery (web_search/web_extract) → pemetaan paper sesuai tujuan → gate G1 manusia approve
3. Novelty lab → gap analysis + analisis efek samping solusi → gate G2
4. Audit sumber (SINTA/DOAJ/Crossref/Scopus Sources) → gate G3
5. Metodologi → gate G4 → analisis → gate G5 → penulisan+BibTeX → gate G6 → critical review & reproducibility → gate G7
6. Setiap sesi: skill membaca progress.md → lanjut dari fase terakhir

## Success Metrics
- MVP dinyatakan selesai saat: pilot riset nyata menuntaskan ≥1 alur lengkap tanpa fase terlewat
- CI hijau di setiap push
- Deskripsi skill ≤60 char, semua file references ada

## Business Rules
- Gate antar fase tidak boleh dilewati tanpa persetulan eksplisit manusia
- Status sumber yang ragu = "belum terverifikasi", bukan valid/invalid
- Skill tidak pernah mensyaratkan API key sebagai dependensi wajib

## Constraints
- Skill murni markdown (D021) — tanpa scripts Python di dalam skill
- Dependency minimum: akses web (web_search, web_extract) saja (D013)
- Bahasa: Indonesia basis, istilah internasional dipertahankan (D014)

## Assumptions
Lihat docs/ASSUMPTIONS.md.
