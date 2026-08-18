#import "../template.typ": *

#show: sheet.with(
  day: "13",
  title: "Lane A Synthesis - Inner vs Outer Products, Bootstrap, & NAHR"
)

#section_heading("Section 1: Spaced Repetition Review (Untimed)")

#ref_box[
  *Yesterday's Misses & Clarifications:*
  - *Inner vs Outer Products:* A column vector $y$ times a row vector $x^T$ ($y x^T$) is an **outer product** that creates an $N times N$ matrix. A row vector $x^T$ times a column vector $y$ ($x^T y$) is an **inner product** that creates a $1 times 1$ scalar! When combining terms in OLS/Ridge, always write them as the scalar inner product (e.g., $theta^T X^T y$), not the outer product.
  - *Empirical p-value:* This is a physical counting operation. To find the p-value of an observed statistic, you literally count the number of values in your null distribution that are as extreme or more extreme than your observed statistic, and divide by the total number of shuffles.
  - *Bisulfite Sequencing:* Unmethylated Cytosine (C) is chemically converted to Uracil (U). 5-methylcytosine is protected.
  - *Multiple Testing:* The Bonferroni correction is extremely conservative because it strictly controls the Family-Wise Error Rate (FWER) - the probability of making even *one* false discovery across all tests.
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 3.5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Day 12] If $a$ and $b$ are $N times 1$ column vectors, what are the dimensions of the product $a b^T$? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (2) [Day 12] You run a permutation test with 10,000 shuffles. 150 of the shuffled fold-changes are strictly greater than your true observed fold-change of 3.0. What is your empirical p-value? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (3) [Day 12] In Whole-Genome Bisulfite Sequencing, what base does the sequencer read if the original genomic DNA had an *unmethylated* Cytosine? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (4) [Day 12] Does the Bonferroni correction control the False Discovery Rate (FDR) or the Family-Wise Error Rate (FWER)? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (5) [Day 12] Which dynamic programming algorithm finds the single most probable path of hidden states in an HMM? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (6) [Day 11] Which specific histone mark combo uniquely defines a "poised" enhancer? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (7) [Day 11] Why does inheriting a large 15q11-q13 deletion from the father cause Prader-Willi Syndrome, rather than leaving the patient with one functional maternal copy? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (8) [Day 10] If you invert a CTCF site at a TAD boundary, what happens to cohesin extrusion arriving from *inside* the TAD? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (9) [Day 09] What is the algebraic formula for the orthogonal projection of vector $a$ onto vector $b$? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (10) [Day 08] Rust explicit lifetime syntax on a generic struct definition, e.g., `FastqRecord`: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
]

#pagebreak()

#section_heading("Section 3: Math/ML - Vector Shapes & Gradient Drills (20 mins)")

#question(space: 4in)[
  *2. Inner vs Outer Products.* Let $x$ be an $N times 1$ column vector, and $W$ be an $N times N$ matrix.
  
  *(a)* Write the expression for the scalar inner product (dot product) of $x$ with itself.
  
  *(b)* Write the expression for the outer product of $x$ with itself. What are its dimensions?
  
  *(c)* Is the expression $x W x^T$ a valid matrix multiplication? If yes, what is the dimension of the output? If no, why not?
]

#question(space: 3.5in)[
  *3. Gradient Drill.* You are given a new cost function for a weighted linear regression: 
  $ J(theta) = theta^T X^T W X theta - 2 theta^T X^T W y $
  where $W$ is a symmetric weight matrix ($W^T = W$).
  
  Using the rules $nabla_theta (theta^T A theta) = 2 A theta$ (when A is symmetric) and $nabla_theta (b^T theta) = b$, derive the gradient $nabla_theta J(theta)$ and set it to zero to solve for $theta$. (Hint: $X^T W X$ is a symmetric matrix).
]

#pagebreak()

#section_heading("Section 4: CS / Code - Rust Where Clauses (10 mins)")

#question(space: 4in)[
  *4. Ergonomic Trait Bounds.* You previously wrote `impl<T: std::ops::Sub> GenomicInterval<T>`. When you have multiple generic types with multiple trait bounds, the `< >` syntax gets unreadable.
  
  Rewrite the following function signature to use a Rust `where` clause instead of inline bounds:
  `fn compute_distance<T: std::ops::Sub + std::fmt::Display, U: Clone>(start: T, end: T, metadata: U) -> T { ... }`
]

#pagebreak()

#section_heading("Section 5: Stats - Bootstrap Confidence Intervals (5 mins)")

#ref_box[
  *Concept 8: Bootstrap CI* — The interval you should almost always report instead of a p-value. It tells you the precision of your estimate.
]

#question(space: 3.5in)[
  *5. Bootstrapping.* You measure the expression of Gene X in 50 wild-type cells and compute the mean. You want to know the 95% Confidence Interval for this mean.
  
  Describe the physical/computational algorithm you would use to generate a Bootstrap Confidence Interval for the mean using *only* your 50 data points. (Pay special attention to *how* you sample).
]

#pagebreak()

#section_heading("Section 6: Genetics - Non-Allelic Homologous Recombination (20 mins)")

#question(space: 4.5in)[
  *6. NAHR Mechanics.* Non-Allelic Homologous Recombination (NAHR) is a major driver of structural variation in the genome.
  
  *(a)* NAHR requires two segments of DNA that share high sequence identity (like segmental duplications or Alu elements). What must be the relative orientation of these two identical repeats on the *same* chromosome for NAHR to cause a genomic **deletion**?
  
  *(b)* During that same NAHR event that causes a deletion on one chromatid, what structural variant is generated on the *other* participating chromatid? Explain why they are reciprocal.
]

#pagebreak()

#section_heading("Section 7: Bonus - Bioinformatics MCQs (30 mins)")

#ref_box[
  *Bonus Challenge:* Write the letter of the correct answer and briefly justify your choice.
]

#question(space: 2in)[
  *7. RNA-Seq Normalization.* Which normalization method explicitly accounts for *both* the total sequencing depth of the library and the length of the specific gene being measured?
  (A) CPM (Counts Per Million)
  (B) TPM (Transcripts Per Kilobase Million)
  (C) DESeq2 Median of Ratios
  (D) TMM (Trimmed Mean of M-values)
]

#question(space: 2in)[
  *8. Single-Cell RNA-Seq.* In droplet-based scRNA-seq (like 10x Genomics), what is the primary purpose of the Unique Molecular Identifier (UMI) attached to the transcripts?
  (A) To multiplex different biological samples in the same sequencing lane.
  (B) To identify which specific cell the transcript originated from.
  (C) To computationally remove PCR duplication artifacts.
  (D) To serve as a primer for the reverse transcriptase enzyme.
]

#question(space: 2in)[
  *9. Epigenetics.* The TET family of enzymes is primarily responsible for:
  (A) Depositing de novo DNA methylation (C to 5mC).
  (B) Oxidizing 5mC to 5hmC to initiate active DNA demethylation.
  (C) Acetylating histone tails to open chromatin.
  (D) Polyubiquitinating proteins for proteasomal degradation.
]

#question(space: 2in)[
  *10. Nextflow Operators.* You have a channel emitting file paths. You want to run a process that requires *all* of those files at once as a single list. Which operator gathers all items emitted by a channel into a single list?
  (A) `.flatten()`
  (B) `.collect()`
  (C) `.mix()`
  (D) `.splitCsv()`
]

#question(space: 2in)[
  *11. Variant Calling.* In a VCF (Variant Call Format) file, what does a `0/1` in the genotype (`GT`) field indicate for a diploid organism?
  (A) Homozygous reference
  (B) Heterozygous
  (C) Homozygous alternate
  (D) No call / Missing data
]

#closing_block()
