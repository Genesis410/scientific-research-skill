# EVAL-001 without_skill

## Catatan akses (kejujuran epistemik)

- DOI yang Anda berikan ternyata **nyata, bukan fiktif-sintetis**: `10.1016/j.artint.2023.103974` meresolusi ke artikel *"Automatic generation of dominance breaking nogoods for a class of constraint optimization problems"*, **Artificial Intelligence**, terbit **12 Juli 2023**, penulis **Jimmy H. M. Lee** dan **Allen Z. Zhong** (Chinese University of Hong Kong).
- Saya **tidak mengakses versi final berbayar** dari Elsevier. Yang saya baca adalah **prerelease/preprint** yang di-host penulis: `http://www.cse.cuhk.edu.hk/~jlee/publ/23/aij23AutoDomBreak.pdf` (pratinjau teks bertanggal 13 September 2023, "Preprint submitted to Journal of Artificial Intelligence"), plus metadata halaman DOI dan halaman Monash/ACM. Semua klaim di bawah berasal dari preprint itu; angka halaman/typo bisa berbeda sedikit dari versi final.
- Paper ini adalah versi jurnal dari paper konferensi **IJCAI-PRICAI 2020** (Lee & Zhong, hlm. 1192–1200) — referensi [22] di dalam teks.
- Karena saya tidak tahu isi ide penelitian Anda, bagian "relevansi" saya berikan sebagai **kerangka kait yang bisa Anda isi sendiri**, bukan klaim bahwa ide Anda pasti cocok.

---

## 1. Tujuan

COP (*Constraint Optimization Problems*) = cari penugasan nilai untuk variabel yang memaksimumkan/meminimumkan fungsi sasaran sambil memenuhi himpunan constraints; biasanya diselesaikan dengan Branch & Bound (B&B).

**Dominance breaking** = membuang penugasan yang "kalah" terhadap penugasan lain (lebih buruk pada sasaran dan/atau lebih ketat pada feasibility). Manfaatnya besar, tapi masalahnya:

> identifikasi penugasan suboptimal dan derivasi constraint dominance breaking **bersifat problem-specific dan butuh wawasan manusia yang mendalam** tentang struktur masalah.

Jadi tujuan paper: **kerangka teoretis dan praktis pertama untuk menghasilkan dominance breaking constraints secara otomatis** untuk kelas COP yang objective dan constraints-nya *efficiently checkable*. Sasaran sekunder: membuat teknik ini bisa dipakai *non-expert*, serta bisa **mengontrol jumlah dan kekuatan agregat** nogoods yang dihasilkan.

## 2. Metode

Ide inti: **menjadikan generasi nogood sebagai penyelesaian CSP bantu** (*generation CSP*), bukan proses manual.

**Alur kerja (5 langkah):** model COP → bangun generation CSP untuk setiap pasangan partial assignment (θ, θ′) yang relevan → selesaikan CSP untuk menemukan pasangan yang memenuhi syarat kebenaran → tambahkan nogood `¬θ′` ke model → selesaikan COP yang sudah diperkaya dengan solver constraint.

**Lapisan teori (bab 3–4)** — tiga syarat cukup yang harus dipenuhi pasangan (θ, θ′):

1. **Betterment** — objektif tidak memburuk saat θ′ "dipindahkan" ke θ. Didekati dengan **fungsi proyeksi** `f↓S` ke scope S. Dibuktikan untuk dua kelas objective yang efficiently checkable:
   - **separable** (linear kombinasi fungsi per-variabel, Theorem 4);
   - **supermodular/submodular** pada COP biner (Theorem 5, Corollary 1).
2. **Implied satisfaction** — θ′ memenuhi constraint c ⇒ θ juga memenuhi c. Cukup cek constraint yang scope-nya beririsan dengan S (Theorem 6), lalu per kelas constraint:
   - **unary/domain** (Thm 7),
   - **linear inequality** `Σ wᵢxᵢ ≤ b` (Thm 8),
   - **Boolean disjunction** (4.3.3),
   - **counting** (4.3.4),
   - **circuit** (4.3.5) — penting untuk scheduling/packing.
3. **Compatibility** — syarat agar seluruh nogood yang ditambahkan *bersamaan* tidak menghabiskan semua solusi optimal. Contoh kegagalan di Example 4: dua nogood yang masing-masing sah dapat bersama-sama membuang seluruh solusi optimal. Solusinya: **ordering leksikografis** `θ <_lex θ′` (Theorem 16), lalu diperluas jadi syarat yang lebih longgar untuk menghasilkan lebih banyak nogood (Theorem 17).

**Pembatasan agar tetap efisien (bab 5):**

- **Mutasi mapping** `μθ′→θ` menggantikan enumerasi brute-force pasangan full assignment; ditambah pembatasan ke pasangan dengan **scope sama**.
- **Batas panjang L**: jumlah pasangan kandidat panjang l = O(C(|X|,l) · (d^l pilih 2)) — polinomial terhadap |X| dan d, tapi **eksponensial terhadap l**. Jadi hanya nogood berpanjang `l ≤ L` yang dihasilkan (metode disebut **L-dom**, l = 2…L).
- Generation CSP berbagai scope berukuran sama **digabung jadi satu model** memakai *element constraint* di MiniZinc.

**Implementasi & eksperimen (bab 6):** bahasa pemodelan **MiniZinc**, solver **Chuffed** (untuk generasi nogood *dan* penyelesaian), pembanding MIP **CBC 2.10**. Timeout total 2 jam, dialokasikan 1 jam untuk generasi nogood; mesin Xeon Platinum 8268 2.90 GHz, MiniZinc 2.6.0. Kode + benchmark: `https://github.com/AllenZzw/auto_dom/tree/dominance`.

Variabel pembanding: `no-dom` (tanpa dominance), `manual` (constraint dominance buatan manusia dari literatur), `2-dom/3-dom/4-dom`, dan MIP. Dua opsi pencarian: *fixed search heuristic* dan *free search*.

## 3. Temuan utama

**Empiris:**

- **Standard benchmarks (6 masalah, 20 instan per grup)**: 0-1 Knapsack, Disjunctively Constrained Knapsack, Capacitated Concert Hall Scheduling, Combinatorial Auction, Set Covering, dan satu masalah linear lain. Turunan waktu penyelesaian `3-dom` vs `no-dom`: **minimal 34.75%** (fixed search) dan **minimal 45.37%** (free search); perbaikan bisa **sampai tiga order of magnitude**; `no-dom` timeout pada banyak instan besar (Knapsack, DisjKnapsack, CombAuc, SetCover).
- `L-dom` **mengalahkan constraint dominance manual** pada instan besar dan sulit — ini klaim utama paper.
- **Benchmark non-linear (varian B2B meeting scheduling)**: nokood otomatis memangkas waktu penyelesaian **43.56%–81.52%** vs `no-dom`; `4-dom` terbaik pada instan >35 meeting; **MIP (CBC) timeout di semua instan** — di sini CP menang.
- **Benchmark real-life (bus driver scheduling, 12 instan industri)**: hasil **campuran**. `3-dom` memangkas total waktu 33.92% (instan r1) dan ≥39.20% (r1a), tapi pada r2, r3, t1 **`no-dom` justru tercepat** — waktu penyelesaian yang dihemat tidak menutup overhead generasi nogood. Pada r3, generasi `3-dom`/`4-dom` sendiri timeout 1 jam tanpa menghasilkan nogood tambahan.
- **MIP unggul** pada standar + real-life benchmark (masalahnya linearizable/mudah untuk integer programming); keunggulan L-dom justru di masalah berstruktur non-linear.

**Teoretis (bab 7)** — analisis kekuatan logis nogood otomatis vs constraint manual per masalah (Knapsack, DisjKnapsack, Concert Hall Scheduling, Weighted Max-Cut, Combinatorial Auction, Set Covering). Contoh: Theorem 23 (combinatorial auction) dan Theorem 24 (set covering) membuktikan nogood otomatis panjang 2 **ekuivalen** dengan constraint manual Chu & Stuckey — dan untuk kasus lain dihitung lebih kuat. Ini menjelaskan *mengapa* hasil empirisnya bagus.

## 4. Keterbatasan (dinyatakan sendiri oleh paper)

Dari bagian *Concluding Remarks*:

1. **Overhead per-instance.** Nogood dihasilkan ulang untuk tiap instan; pada masalah berstruktur linier waktu generasi besar sehingga performa total **tidak kompetitif dengan integer programming**. Perbaikan yang dicetuskan: generalisasi nogood dari instan kecil ke instan besar dalam satu kelas masalah.
2. **Pemeriksaan pola nogood masih butuh intervensi manusia** (mengutip kerja mereka [67]).
3. **Cakupan kelas masalah sempit.** Syarat cukup betterment dan implied satisfaction hanya didefinisikan untuk objective/constraint yang *efficiently checkable* (separable, supermodular/submodular; unary, linear, disjunction, counting, circuit).
4. **Masalah dunia nyata bertumpuk struktur** — mis. instan MiniZinc Challenge — tidak bisa ditangani metode sekarang; gagasan: analisis struktur sintaksis dan memanfaatkan *functional dependency* antarvariabel.
5. **Redundansi.** Belum ada ukuran efektivitas tiap nogood terhadap pruning, sehingga tidak diketahui subset mana yang layak disimpan; usul: *clause vivification* berbasis SAT untuk menyederhanakan nogood.

Keterbatasan tambahan yang saya lihat dari desain eksperimen (penilaian saya, bukan klaim paper): dominasi berbagai *baseline* (hanya Chuffed + CBC), timeout 2 jam, dan hasil yang tidak konsisten pada benchmark real-life membuat generalisasi ke solver/Domain lain belum terbukti. Angka-angka di atas berasal dari preprint; tabel lengkap (Table 1–4) ada di PDF.

## 5. Relevansi terhadap ide penelitian Anda

Saya tidak tahu ide Anda, jadi ini peta kait dua arah — cek mana yang nyangkut:

**Kalau ide Anda menyentuh salah satu ini, paper ini relevan langsung:**

- **Automated modelling / automated configuration** → paper ini contoh nyata "otomatiskan satu teknik hand-tuned" dengan pola *syarat cukup + CSP generator + knob kekuatan (L)*. Pola itu bisa ditiru untuk teknik lain (symmetry breaking, tabel channeling, explanation-based learning).
- **Constraint programming, B&B pruning, combinatorial optimization** → kontribusi langsung: baseline wajib. Kekuatan nogood sudah dianalisis teoretis (bab 7), jadi bisa jadi rujukan pembanding kekuatan.
- **Metaheuristik/hybrid yang pakai pengetahuan dominasi** → syarat betterment/implied satisfaction/compatibility adalah alat untuk *membuktikan* heuristik Anda tidak membuang solusi optimal (Compatibility paling sering dilupakan orang).
- **MiniZinc / model pipelines** → kode & benchmark publik, jadi mudah dipakai sebagai artefak replikasi.

**Kalau ide Anda di luar itu**, nilai paper ini tetap dua: (a) studi kasus metodologi — bagaimana mengubah aturan praktik berbasis wawasan manusia menjadi prosedur otomatis yang *terbukti benar* secara teoretis lalu divalidasi empiris; (b) daftar keterbatasan §4 di atas adalah **kumpulan celah penelitian yang sudah diakui penulisnya** (overhead generasi, generalisasi lintas instan, otomasi analisis pola, ekspansi ke struktur MiniZinc Challenge, pengukuran efektivitas per-nogood) — masing-masing bisa jadi titik masuk penelitian baru.

**Peringatan kecil:** paper ini sudah menutup banyak celah klasik (otomatisasi + bukti teoretis + benchmark), jadi kalau ide Anda berada di area yang sama, Anda perlu menyebut perbedaan yang jelas — paling gampang lewat salah satu keterbatasan §4 yang belum mereka selesaikan.

---

**Ringkas:** tujuan = otomatiskan dominance breaking; metode = syarat cukup teoretis (betterment, implied satisfaction, compatibility) + generation CSP dengan batas panjang L; temuan = penurunan waktu ≥34.75% (standar) dan 43.56–81.52% (non-linear), nogood otomatis ≥ manual, tapi kalah dari MIP pada masalah linier; keterbatasan = overhead per-instan, cakupan kelas sempit, manusia masih ikut, redundansi; relevansi = tergantung ide Anda — lihat peta kait §5.
