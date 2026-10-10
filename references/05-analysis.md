# Fase 5 — Data Pipeline & Analisis Statistik (Gate G5)

## Tujuan
Eksekusi analisis sesuai desain yang disepakati, dengan asumsi yang dicek — bukan dilewati.

## Prosedur
1. Baca rencana analisis di decisions.md. Konfirmasi data tersedia & formatnya.
2. Pipeline data: dokumentasikan sumber → pembersihan → transformasi → variabel akhir. Setiap langkah ditulis (reproducibility).
3. Jalankan analisis sesuai desain. Untuk statistik klasik: uji asumsi dulu (normalitas, homoskedastitas, multikolinearitas) — bila asumsi gagal, usulkan alternatif dan minta konfirmasi pengguna.
4. Laporkan: statistik yang sesuai desain (bukan yang "paling signifikan"), effect size bila memungkinkan, kekuatan bukti, dan keterbatasan.
5. Untuk riset komputational: laporkan hasil semua model/baseline pada metrik utama, varians antar-seed bila ada, dan analisis kesalahan.
6. Simpan hasil ringkas + parameter di progress.md; artefak data/analisis tetap di folder proyek.

## QC Checklist (sebelum ajukan G5)
- [ ] Analisis sesuai rencana di decisions.md; deviasi (jika ada) dibuat eksplisit + alasannya
- [ ] Asumsi statistik diuji/dilaporkan
- [ ] Tidak ada p-hacking: metrik/test tidak berubah setelah melihat hasil
- [ ] Hasil dapat direproduksi dari dokumentasi langkah
- [ ] Limitasi hasil ditulis

## Ajukan G5
Tampilkan: temuan analisis + keterbatasan. Minta persetujuan lanjut ke Fase 6.
