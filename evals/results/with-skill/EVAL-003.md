# EVAL-003 with_skill

## Pertanyaan riset
Paper (2021–2026, Scopus Q1) tentang evaluasi/model assessment untuk klasifikasi data imbalanced — dengan verifikasi venue, periode cakupan, kuartil, tautan paper, dan sumber verifikasi.

## Sumber verifikasi yang dipakai
1. **Crossref REST API** (`https://api.crossref.org/works/<DOI>`) — metadata primer: judul, jurnal, ISSN, tanggal terbit, volume/halaman. (7 DOI dicek.)
2. **SCImago Journal Rank** (`scimagojr.com/journalsearch.php?q=<id>&tip=sid`) — pencocokan ISSN, kuartil per tahun per kategori, periode cakupan Scopus. Halaman per venue: Knowledge-Based Systems `q=24772`, Applied Soft Computing `q=18136`, Machine Learning `q=24775`, Artificial Intelligence Review `q=24141`, Scientific Reports `q=21100200805`, PLOS Digital Health `q=21101242952`, IEEE Access `q=21100374601`, Computational Statistics `q=28930`.
3. **OpenAlex API** dan **Semantic Scholar API** — keywords/abstrak pendukung untuk skrining relevansi.
4. **Halaman penerbit**: `link.springer.com` (abstrak Machine Learning Springer), `nature.com` (Scientific Reports).

Catatan teknis: scimagojr.com berada di balik Cloudflare; data diambil per 10 Okt 2026 lewat browser otomatis yang lolos verifikasi otomatis. Kuartil = kuartil Scimago (SJR), bukan CiteScore Scopus resmi Elsevier.

## Hasil: 6 paper Q1 terverifikasi

| # | Paper (tautan DOI) | Venue | Kuartil Scimago (kategori, tahun) | Cakupan Scopus venue |
|---|---|---|---|---|
| 1 | Moniz & Monteiro (2021), *No Free Lunch in imbalanced learning*, doi:10.1016/j.knosys.2021.107222, vol. 227, art. 107222 | Knowledge-Based Systems (ISSN 0950-7051) | Q1 Artificial Intelligence 2021–2025; Q1 Information Systems and Management 2021–2025; SJR 2025 = 1.753 Q1 | 1987–2026 |
| 2 | Rezvani & Wang (2023), *A broad review on class imbalance learning techniques*, doi:10.1016/j.asoc.2023.110415, vol. 143, art. 110415 | Applied Soft Computing (ISSN 1568-4946) | Q1 Software 2021–2025; SJR 2025 = 1.456 Q1 | 2001–2026 |
| 3 | Ghosh, Bellinger, Corizzo & Branco (2022), *The class imbalance problem in deep learning*, doi:10.1007/s10994-022-06268-8, vol. 113(7), hlm. 4845–4901 (online 28 Des 2022, issue 2023) | Machine Learning (ISSN 0885-6125) | Q1 Artificial Intelligence 2021–2025 (Q2 2020); Q1 Software 2020–2025 | 1986–2026 |
| 4 | Gaudreault & Branco (2024), *Empirical analysis of performance assessment for imbalanced classification*, doi:10.1007/s10994-023-06497-5, vol. 113(8), hlm. 5533–5575 | Machine Learning (ISSN 0885-6125) | Q1 Artificial Intelligence 2021–2025 | 1986–2026 |
| 5 | Chen, Yang, Yu & Shi (2024), *A survey on imbalanced learning: latest research, applications and future directions*, doi:10.1007/s10462-024-10759-6, vol. 57(6), art. 137 | Artificial Intelligence Review (ISSN 1573-7462) | Q1 Artificial Intelligence 2020–2025; Q1 Linguistics and Language 2020–2025; SJR 2025 = 3.638 Q1 | 1986–2026 |
| 6 | Aguilar-Ruiz & Michalak (2024), *Classification performance assessment for imbalanced multiclass data*, doi:10.1038/s41598-024-61365-z, vol. 14, art. 10759 | Scientific Reports (ISSN 2045-2322) | Q1 Multidisciplinary 2020–2025; SJR 2025 = 0.893 Q1 | 2011–2026 |

Semua venue tercakup Scopus pada **tahun terbit paper masing-masing** (cek: tahun terbit ≥ awal cakupan, dan kuartil Scimago tersedia untuk tahun tersebut).

## Catatan skrining (dasar relevansi)
1. **KBS 2021 (No Free Lunch)** — kinerja algoritma ML pada data imbalanced; kata kunci OpenAlex: *model evaluation, class imbalance, resampling strategies, binary classification*. lolos. (abstrak penerbit tidak terbuka gratis; disimpulkan dari judul + kata kunci.)
2. **Applied Soft Computing 2023** — tinjauan luas teknik class imbalance (termasuk tahapan evaluasi); kata kunci: *class imbalance, imbalanced classification, data preprocessing*. lolos.
3. **Machine Learning 2022** — abstrak penerbit (link.springer.com): menelaah apakah deep learning menuntaskan masalah imbalance, termasuk cara menilai kinerja pada distribusi tidak seimbang. lolos.
4. **Machine Learning 2024 (Gaudreault & Branco)** — abstrak penerbit: studi eksperimental dampak pemilihan metrik evaluasi (accuracy, F1, PR/ROC, dll.) pada klasifikasi imbalanced; paling langsung menjawab pertanyaan. lolos.
5. **AI Review 2024** — abstrak (Crossref/Springer): survei imbalanced learning terbaru, aplikasi, dan arah riset; mencakup metrik evaluasi. lolos.
6. **Scientific Reports 2024** — abstrak (nature.com): memperkenalkan metrik penilaian kinerja untuk klasifikasi multiclass imbalanced. lolos.

## Sumber yang dikeluarkan (exclusion log, alasannya dicatat agar bisa diaudit)
- **Huayanay, Bazán & Russo (2024), *Performance of evaluation metrics for classification in imbalanced data*, Computational Statistics, doi:10.1007/s00180-024-01539-5** — paling pas topiknya, tetapi Scimago Q2 (Statistics and Probability dan Computational Mathematics, 2021–2025) → gugur pada syarat Q1.
- **Owusu-Adjei dkk. (2023), PLOS Digital Health, doi:10.1371/journal.pdig.0000290** — kuartil Scimago untuk PLOS Digital Health baru tersedia mulai 2024 (Q1 Health Informatics 2024–2025); terbitan 2023 tidak bisa diverifikasi Q1-nya. Selain itu ada **Expression of Concern** (doi:10.1371/journal.pdig.0000984, 8 Agu 2025).
- **IEEE Access 2025** — venue Q1 terverifikasi (Computer Science/Engineering miscellaneous, Q1 2021–2025), tetapi kandidat paper yang ditemukan bertopik active learning, bukan evaluasi metrik → tidak lolos skrining relevansi.
- **Preprint arXiv** (mis. *Robust performance metrics for imbalanced classification problems*, arXiv:2404.07661; *Balancing the Scales*, arXiv:2409.19751) — belum terbit di jurnal, tidak bisa memenuhi syarat Q1.

## Sintesis
- Fokus evaluasi paling langsung: **Gaudreault & Branco 2024** (dampak pilihan metrik, eksperimen) dan **Aguilar-Ruiz & Michalak 2024** (metrik untuk multiclass imbalanced).
- Tinjauan luas: **Chen dkk. 2024 (AI Review)**, **Rezvani & Wang 2023 (ASOC)**, **Ghosh dkk. 2022 (Machine Learning)**.
- Konteks evaluasi-vs-algoritma: **Moniz & Monteiro 2021 (KBS)** — kerangka evaluasi "no free lunch" untuk imbalanced learning.
- Semua venue menempati Q1 Scimago pada seluruh rentang 2021–2025 kecuali Machine Learning (Springer) yang Q2 pada 2020 di kategori AI; paper-papernya terbit 2021–2024 sehingga tetap Q1 pada tahun terbit.

## Kontradiksi & keterbatasan
- Kuartil di sini = Scimago/SJR; jika kebijakan Q1 Anda memakai CiteScore Scopus resmi, perlu cek ulang di Scopus Sources (butuh akses institusi) — umumnya selaras untuk keenam venue ini, tetapi belum saya verifikasi langsung.
- Abstrak dua paper Elsevier (KBS, ASOC) tidak tersedia secara gratis; relevansi disimpulkan dari judul, kata kunci OpenAlex, dan topik venue — keyakinan sedang untuk dua itu, tinggi untuk empat sisanya.
- Kuartil 2026 belum ada (SJR 2025 adalah rilis terbaru).

## Langkah lanjut bila perlu
- Verifikasi kuartil CiteScore Scopus resmi via akses Scopus/SciVal institusi.
- Ambil abstrak penuh KBS 2021 & ASOC 2023 (Sci-Hub tidak dipakai; lelang akses penerbit/perpustakaan).
