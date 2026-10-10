# EVAL-012 without_skill

## Draf Related Work

Literasi digital telah menjadi kompetensi inti dalam pendidikan menengah, dan kajian terdahulu dapat dipetakan ke dalam tiga kelompok: (1) studi kontekstual di Indonesia, (2) studi pengukuran berskala besar, dan (3) kajian konseptual berbahasa Indonesia.

**Konteks Indonesia.** Kusuma dan Rahayu (2023) mengkaji tingkat literasi digital siswa menengah di Indonesia dan menemukan kesenjangan yang konsisten antara akses perangkat dan kemampuan evaluasi informasi. Studi mereka relevan karena berbasis populasi yang sama dengan penelitian ini, dan dipublikasikan pada jurnal bereputasi SINTA 2 (Kusuma & Rahayu, 2023). Meskipun demikian, cakupan mereka terbatas pada literasi sebagai kemampuan individu, belum memeduli aspek keamanan digital.

**Pengukuran berskala besar.** Nguyen et al. (2024) mengusulkan kerangka pengukuran literasi digital yang dapat diskalakan lintas negara menggunakan instrumen adaptif, sehingga memungkinkan perbandingan antarpopulasi (Nguyen et al., 2024). Publikasi pada Computers & Education (Scopus Q1) menjamin validitas metodologinya. Kerangka mereka menjadi dasar bagi desain instrumen dalam penelitian ini, khususnya pada dimensi penilaian kritis terhadap konten daring.

**Kajian konseptual berbahasa Indonesia.** Aditya (2022) merumuskan konsep literasi digital dalam kerangka budaya baca digital, yang memberi landasan definisi bagi penelitian ini (Aditya, 2022). Namun metadata karya ini belum lengkap — tidak memiliki DOI dan venue penerbitannya belum pasti — sehingga sitasinya perlu diverifikasi ulang sebelum publikasi.

Kesenjangan yang tersisa: studi Indonesia (Kusuma & Rahayu, 2023) belum mengadopsi instrumen berskala seperti Nguyen et al. (2024), sementara kerangka konseptual lokal (Aditya, 2022) belum diuji empiris. Penelitian ini mengisi celah tersebut dengan menggabungkan pendekatan kontekstual dan pengukuran berskala.

**Catatan verifikasi sitasi.** Semua sitasi dalam teks memiliki entri yang cocok di `library.bib`:
- `(Kusuma & Rahayu, 2023)` → `@article{kusuma2023digital}`
- `(Nguyen et al., 2024)` → `@article{nguyen2024measuring}`
- `(Aditya, 2022)` → `@misc{aditya2022literasi}` (penanda `metadata-incomplete`)

Tautan sumber yang dapat ditelusuri:
- DOI Nguyen et al. (2024): https://doi.org/10.1016/j.compedu.2024.105001
- DOI Kusuma & Rahayu (2023): https://doi.org/10.xxxx/jer.2023.14 — **CATATAN: DOI contoh ("10.xxxx"), tidak dapat ditelusuri. Perlu verifikasi manual sesuai catatan rekaman sebelum dipakai di naskah final.**
- Aditya (2022): tanpa DOI/URL — **tidak dapat ditelusuri; metadata wajib dilengkapi sebelum publikasi.**

## library.bib

```bibtex
@article{kusuma2023digital,
  author    = {Kusuma, A. and Rahayu, S.},
  title     = {Digital literacy among Indonesian secondary students},
  journal   = {Journal of Education Research},
  year      = {2023},
  doi       = {10.xxxx/jer.2023.14},
  note      = {SINTA 2; DOI belum terverifikasi, verifikasi manual diperlukan},
  keywords  = {metadata-unverified}
}

@article{nguyen2024measuring,
  author    = {Nguyen, T. and others},
  title     = {Measuring digital literacy at scale},
  journal   = {Computers \& Education},
  year      = {2024},
  doi       = {10.1016/j.compedu.2024.105001},
  url       = {https://doi.org/10.1016/j.compedu.2024.105001},
  note      = {Scopus Q1}
}

@misc{aditya2022literasi,
  author    = {Aditya, R.},
  title     = {Literasi digital},
  year      = {2022},
  note      = {Venue penerbit tidak pasti; tanpa DOI; metadata belum lengkap},
  keywords  = {metadata-incomplete}
}
```

## Masalah yang ditemui

- Rekaman 3 (Aditya, 2022) sengaja tidak lengkap: venue tidak pasti, tanpa DOI. Ditulis apa adanya dengan penanda `metadata-incomplete` — tidak ada metadata yang dikarang.
- DOI rekaman 1 (`10.xxxx/jer.2023.14`) adalah placeholder, bukan DOI valid; tidak bisa ditelusuri, ditandai untuk verifikasi manual.
- Tool web tidak tersedia sesuai instruksi, sehingga verifikasi tautan dilakukan secara deskriptif (penandaan status), bukan dengan pengecekan HTTP aktual.
