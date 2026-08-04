# The Master Syllabus: "Lane A Synthesis"
*Expected Arc: ~8-10 Months | 45-55 mins/day*

This syllabus unifies CS229, Math-CS, Code-Learn, and Genetics into a single daily 45-min trajectory optimized for the ML-genomics postdoc (Lane A).

## The Rules
- **Daily 45-min Typst Paper:** Split into Genetics (20m), Math/ML (15m), and CS/Code (10m).
- **Biology Question Design:** Must be application-based (like a manageable Bio Olympiad problem), avoiding simple "What is X" recall questions.
- **Adaptive Difficulty:** Coding sections must be challenging (assume strong baseline knowledge). The Appendix (~1 hour optional practice) must adaptively target identified weaknesses from previous days (e.g., vector calculus, geometry) rather than generic trivia.
- **Problem Sets:** All daily sheets go into `problem-sets/problems-day-NN.typ`.

## Module 1: The Linear & Sequence Foundations (Months 1–2)
* **Genetics (20m):** Core chromatin architecture, transcription, and epigenetics. *(Source: Genes XII, Ch. 29-30)*
* **Math/ML (15m):** Linear regression, gradient descent, and the continuous calculus block. *(Sources: CS229 notes Part 1, PIM Calculus)*
* **CS/Code (10m):** Rust ownership semantics (`&mut`, `&str`) and Nextflow channel dataflow. *(Source: Rust in a Month of Lunches)*
* **Appendix (Untimed):** Easy calculus limits, basic awk/shell scripting.

## Module 2: Hidden Markov Models & Biological Sequences (Month 3)
* **Genetics (20m):** Sequence motifs, CpG islands, and biological sequence alignments. *(Source: Biological Sequence Analysis (Durbin), Ch. 2 & 3)*
* **Math/ML (15m):** Markov chains, transition matrices, Viterbi algorithm, and the Forward-Backward algorithm. *(Source: Biological Sequence Analysis (Durbin), Ch. 3)*
* **CS/Code (10m):** Implementing basic dynamic programming algorithms (like Viterbi) in Rust/Python.
* **Appendix (Untimed):** Edge cases in HMMs (e.g., silent states, numerical underflow in probabilities).

## Module 3: Generative Models & Sequence Parsing (Months 4–5)
* **Genetics (20m):** Regulatory networks, non-coding elements, variant-effect mappings.
* **Math/ML (15m):** Generative Learning Algorithms (GDA, Naive Bayes) + Probability fundamentals. *(Sources: CS229 notes Part 2, Wasserman)*
* **CS/Code (10m):** Building custom sequence parsers (Go) + Advanced Rust Traits. *(Source: Writing an interpreter in Go)*
* **Appendix (Untimed):** CS229 "limit case" derivations.

## Module 4: Dimensionality & Structural Bioinformatics (Months 6–7)
* **Genetics (20m):** Structural genomics, loops, and 3D folding models.
* **Math/ML (15m):** Support Vector Machines, Kernels, and Linear Algebra (Eigenvalues/SVD). *(Sources: CS229 Kernels, PIM Linear Algebra)*
* **CS/Code (10m):** Memory layout, pointers, tracing errors. *(Source: Let us C)*
* **Appendix (Untimed):** Biological Sequence Analysis (Durbin) — HMM extensions and phylogenetic trees.

## Module 5: Scale, Unsupervised Learning & The Artifact (Months 8–10)
* **Genetics (20m):** Genomic LMs and repeats (shifting to your active literature/papers).
* **Math/ML (15m):** Unsupervised Learning, EM Algorithm, PCA. *(Source: CS229 Part 3 & 4)*
* **CS/Code (10m):** Multi-language optimization, Python/Rust FFI.
* **Appendix (Untimed):** High-level architectural design for your thesis artifact.
