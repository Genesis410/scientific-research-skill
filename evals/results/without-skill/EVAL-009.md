# EVAL-009 without_skill

Saya tidak dapat menyelesaikan tugas ini dalam bentuk yang diminta, dan saya tidak akan mengarang jawabannya.

**Keterbatasan:** sesi ini tidak memiliki akses ke tool pencarian web maupun ekstraksi halaman. Artinya saya tidak bisa:

- mencari paper terbaru 2026 tentang literasi digital siswa SMA;
- memverifikasi URL paper (apakah hidup, apa judul aslinya);
- memeriksa status indeksasi (Scopus, Web of Science, SINTA, Google Scholar, DOAJ).

**Mengapa ini penting:** dua bagian inti dari permintaan — "lima paper terbaru yang diterbitkan pada 2026" dan "pastikan link serta status indeksasinya benar" — hanya bisa dipenuhi dengan verifikasi langsung terhadap sumber primer (halaman jurnal, DOI resolver, basis data indeksasi). Tanpa akses itu, satu-satunya cara menghasilkan lima entri lengkap adalah mengarang judul, penulis, DOI, dan URL. Entri karangan bisa terlihat meyakinkan tetapi tidak akan bisa diverifikasi, dan dalam konteks tinjauan pustaka justru berbahaya: mengutip paper yang tidak ada.

**Yang saya butuhkan untuk mengerjakan tugas ini:**

1. Aktifkan web_search + web_extract (atau akses API seperti Crossref, OpenAlex, Semantic Scholar) untuk sesi ini.
2. Alternatif non-tool: beri saya daftar kandidat paper (judul/DOI) hasil pencarian Anda sendiri, lalu saya susun, kelompokkan, dan laporkan — meski verifikasi status indeksasi tetap perlu akses basis data.

**Rencana kerja jika akses tersedia** (agar bisa langsung dieksekusi berikutnya):

1. Query lintas sumber dengan rentang tahun ketat 2026: `"literacy" OR "digital literacy" AND ("high school" OR "secondary school" OR "siswa SMA")`, filter publikasi 2026 di OpenAlex / Crossref / Scopus.
2. Saring ke 5 hasil paling relevan + terbaru (urut tanggal terbit, bukan tanggal unggah preprint).
3. Untuk tiap paper verifikasi: (a) URL DOI `https://doi.org/...` di-resolve dan judul cocok; (b) status indeksasi dengan mengecek record di Scopus/WoS/SINTA/Google Scholar, dicatat per paper, bukan diasumsikan.
4. Laporkan dalam tabel: judul, penulis, tahun/bulan, venue, DOI, link, status indeksasi + tanggal pengecekan.

Tidak ada file sumber data yang saya tulis selain laporan ini, karena tidak ada data yang bisa saya peroleh secara sah.
