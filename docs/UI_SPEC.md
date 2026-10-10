# UI_SPEC — tidak applicable

Tidak ada antarmuka visual. Output skill berupa:
- File markdown di folder proyek pengguna (progress.md, decisions.md, sources.md, draf dokumen riset)
- Respons percakapan agent

Perilaku states yang berlaku di level interaksi:
- Menunggu input manusia (gate) → agent berhenti dan menunggu
- Fase berjalan → agent menampilkan status fase aktif dari progress.md
- Error (sumber tidak bisa diakses) → catat "belum terverifikasi" + alasan, jangan gagalkan seluruh fase
