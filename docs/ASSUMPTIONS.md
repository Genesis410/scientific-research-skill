# ASSUMPTIONS

A001
Assumption: Pengguna mempunya akses runtime agent dengan tool web (web_search/web_extract).
Reason: D013 hanya mensyaratkan akses web.
Impact: Tanpa tool web, fase discovery/audit tidak berjalan.
Needs confirmation: Tidak — sudah jadi prasyarat resmi skill.

A002
Assumption: Akun GitHub Genesis410 dipakai untuk repo publik ini.
Reason: gh CLI terautentikasi dengan akun tersebut saat pembuatan.
Impact: Repo berada di bawah akun Genesis410.
Needs confirmation: Tidak, kecuali ingin dipindah ke organisasi.

A003
Assumption: Skill berbahasa Indonesia sebagai basis tidak menghambat kontribusi internasional.
Reason: README menyertakan ringkasan Inggris.
Impact: minor — kontributor asing perlu penerjemahan prosedur.
Needs confirmation: Tidak untuk MVP.
