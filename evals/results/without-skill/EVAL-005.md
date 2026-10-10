# EVAL-005 without_skill

## Prior-art search: klaim "metode pertama dunia" — pendekatan hybrid CNN-attention untuk deteksi kebocoran pipa dari data suara sekolah

### 1. Ruang lingkup pencarian
Kueri yang dijalankan (web search, tanpa akses basis data berbayar):
- "hybrid CNN attention mechanism pipe leak detection acoustic sensor"
- "water pipe leak detection sound sensor CNN transformer attention"
- "school building water leak detection acoustic monitoring machine learning"
- "environmental sound classification CNN attention mechanism audio deep learning leak detection"
- "leak detection building plumbing sound recording school indoor pipe acoustic deep learning"
- "sewer pipe leak sound detection CNN attention first world novelty hybrid model"

### 2. Paper/sistem yang paling mungkin membantah novelty

**(a) Merusak klaim arsitektur — CNN + attention untuk kebocoran pipa dari sinyal akustik:**

1. **SART-1DCNN — "An Improved Convolutional Neural Network for Pipe Leakage Identification Based on Acoustic Emission"**, JMSE 12(10):1720, MDPI (2024).
   https://www.mdpi.com/2077-1312/12/10/1720
   CNN 1D + mekanisme attention + modul transformer + residual, langsung pada sinyal akustik mentah. Akurasi >99%. **Ini lawan paling langsung**: kombinasi persis "CNN-attention" untuk deteksi kebocoran pipa dari suara, sudah dipublikasikan.

2. **"Attention mechanism-based CNN-LSTM hybrid deep learning model for industrial pipeline leak detection"**, Scientific Reports (Umer et al., 2026).
   https://www.nature.com/articles/s41598-026-53776-x
   Arsitektur CNN–LSTM berbasis attention untuk deteksi dan identifikasi ukuran kebocoran dari data acoustic emission.

3. **"A CNN-LSTM-Attention hybrid model for acoustic-based..." (gas pipeline)**, Flow Measurement and Instrumentation (2026).
   https://www.sciencedirect.com/science/article/abs/pii/S095559862600350X
   Hybrid CNN-LSTM-Attention untuk mengenali lima kondisi operasi pipa gas dari akustik, dengan VMD untuk derau.

4. **"ATT-LCNN: An Attention-Enhanced Lightweight CNN for..."**, Informatica.
   https://www.informatica.si/index.php/informatica/article/view/14020
   CNN ringan dengan attention untuk deteksi kebocoran kecil dalam derau tinggi (+6,3%–12,1% akurasi).

5. **"Real-Time Pipeline Leak Detection: A Hybrid Deep Learning Approach Using Acoustic Emission Signals"** (2025).
   https://www.researchgate.net/publication/387512533_Real-Time_Pipeline_Leak_Detection_A_Hybrid_Deep_Learning_Approach_Using_Acoustic_Emission_Signals
   Kerangka hybrid untuk deteksi kebocoran pipa waktu nyata dari sinyal akustik.

6. **Transformer/attention murni untuk kebocoran pipa air:**
   - "Acoustic water pipe leak detection using transformer-based..." (S0963869526000551) — CNN ekstraksi fitur + transformer.
   - "Time-Transformer for acoustic leak detection in water distribution networks" (PolyU).
   - Luo et al. 2024, "A Transformer-Based Approach to Leakage Detection..." https://pmc.ncbi.nlm.nih.gov/articles/PMC11478714

**(b) Merusak klaim "CNN-attention untuk data suara" pada umumnya (domain environmental sound):**

7. Mu et al. 2021, "Environmental sound classification using temporal-frequency attention based CNN (TFCNN)" — https://pmc.ncbi.nlm.nih.gov/articles/PMC8566500 (dikutip 179×).
8. "Environmental Sound Classification with Parallel Temporal-spectral Attention", Interspeech 2020 — attention temporal + spektral pada CNN.
9. "Attention based Convolutional Recurrent Neural Network for Environmental Sound Classification", arXiv:1907.02230.
10. Li et al., "Multi-Stream Network with Temporal Attention for Environmental Sound Classification", Interspeech 2019 (Amazon AI).

Artinya: kombinasi "CNN + attention untuk klasifikasi suara" sudah sangat umum; itu bukan kontribusi metode.

**(c) Sistem komersial yang sudah memakai suara + deep learning untuk kebocoran pipa:**
- FIDO AI (dengan Microsoft/Azure OpenAI, Thames Water, EPCOR) — deteksi kebocoran dari file akustik via deep learning.
- Sydney Water + UTS — akustik + machine learning classifier membedakan leak noise dari derau lingkungan.
- Vanijjirattikhan et al. 2022, "AI-based acoustic leak detection in water distribution systems" (ScienceDirect, 97 sitasi).
- TinyML/Edge Impulse acoustic pipe leak detection (proyek Arduino, klasifikasi audio 3 kelas: tak ada aliran, aliran normal, kebocoran).

### 3. Yang TIDAK ditemukan (cela yang tersisa)
Pencarian dengan frasa "school/gedung sekolah + leak + acoustic + deep learning" **tidak menemukan** paper yang memakai **data suara rekaman di lingkungan sekolah** untuk deteksi kebocoran pipa gedung. Kombinasi spesifik "dataset suara sekolah" + "pipa gedung sekolah" tampak belum dipublikasikan — tetapi ini hanya berdasarkan pencarian web terbuka, bukan sistematis (belum dicek Scopus/Web of Science/IEEE Xplore/Google Scholar secara mendalam, belum dicek juga publikasi non-Inggris dan proceedings kecil).

### 4. Kesimpulan sesuai bukti
- **Klaim "metode pertama di dunia" untuk pendekatan hybrid CNN-attention deteksi kebocoran pipa dari data suara: DIBANTAH.** Minimal ada 6+ paper yang sudah mempublikasikan kombinasi CNN + attention/transformer untuk deteksi kebocoran pipa dari sinyal akustik, terbaru 2024–2026 (SART-1DCNN, CNN-LSTM-Attention, ATT-LCNN, Time-Transformer). Metode hybrid CNN-attention bukan novelty; itu kontribusi arsitektur yang sudah mapan.
- **Klaim pada domain "data suara" umumnya juga lemah**: CNN-attention untuk environmental sound classification sudah puluhan paper sejak 2019–2021.
- **Satu-satunya celah novelty yang masih mungkin bertahan**: konteks aplikasi/dataset — deteksi kebocoran pipa gedung dari rekaman suara lingkungan sekolah (school building acoustic dataset). Itu **novelty aplikasi atau kontribusi dataset**, bukan novelty metode.
- **Rekomendasi**: turunkan klaim menjadi "salah satu yang pertama" atau "studi pertama pada konteks gedung sekolah", setelah prior-art search sistematis di Scopus/WoS/IEEE Xplore/Google Scholar dengan kata kunci ganda (school OR "building interior" OR plumbing) × (leak OR dripping) × (acoustic OR sound) × (CNN OR attention OR deep learning), termasuk literatur bangunan gedung (building services, HVAC/plumbing monitoring) yang sering terlewat. Klaim "first in the world" tanpa verifikasi itu berisiko ditolak reviewer.
- **Catatan metode**: pencarian ini web search terbuka, bukan tinjauan literatur formal; validasi final wajib lewat basis data akademik berbayar dan pemeriksaan forward/backward citation pada paper-lawan utama (SART-1DCNN, Umer 2026, ATT-LCNN).
