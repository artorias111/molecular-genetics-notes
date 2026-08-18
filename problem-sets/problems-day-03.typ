#import "../template.typ": *

#show: sheet.with(
  day: "03",
  title: "Lane A Synthesis - X-Inactivation & Probabilistic ML"
)

#section_heading("Timer")

#timer_table(
  genetics: "25m",
  math: "20m",
  code: "10m",
  total: "55m"
)

#section_heading("Section 1: Genetics - Spaced Repetition (5 mins)")

#ref_box[
  *Active Recall:* 10 quick MCQs on previous concepts (TADs, HP1, Math derivations). Do this before the reading.
]

#question(space: 4in)[
  *1. Spaced Repetition (Write A, B, or C for each):*
  
  (1) What specific histone mark combo typically characterizes a "poised" enhancer? (A) H3K9me3 + H3K27me3 (B) H3K4me1 + H3K27me3 (C) H3K27ac + H3K4me3
  
  (2) Which protein domain "reads" H3K9me3 to initiate heterochromatin spreading? (A) Bromodomain (B) Chromodomain (C) PHD finger
  
  (3) If $x^T y = 0$, what does this mean geometrically for vectors $x$ and $y$? (A) Parallel (B) Orthogonal (C) Unitary
  
  (4) What Nextflow operator creates a Cartesian product of two channels? (A) mix (B) join (C) combine
  
  (5) The gradient with respect to $x$ of $x^T A x$ for symmetric $A$ is: (A) $A x$ (B) $2 A x$ (C) $x^T A$
  
  (6) True or False: In Rust, calling `.clear()` on a `String` requires a mutable borrow.
  
  (7) Which `samtools view` parameter filters by bitwise flags? (A) -F / -f (B) -q (C) -c
  
  (8) In heterochromatin, if HP1 is mutated but SUV39H1 is active: (A) Methylation stops completely (B) Methylation continues but compaction and boundaries fail
  
  (9) In a $n times d$ design matrix $X$, what is the dimension of $X^T X$? (A) $n times n$ (B) $d times d$ (C) $n times d$
  
  (10) Topological Associating Domains (TADs) are typically bounded by which protein complexes? (A) CTCF and Cohesin (B) RNA Pol II (C) HP1
]

#pagebreak()

#section_heading("Section 2: Genetics - Main (20 mins)")

#ref_box[
  *Reading (7-8 mins):* Genes XII, Chapter 28 (Epigenetics II), PDF pages ~2803–2808, Sections:
  - 28.2 (X Chromosomes Undergo Global Changes)
  - 28.3 (Chromosome Condensation)
]

#question(space: 2in)[
  *2. Application.* A researcher deletes the Xist locus entirely from the paternal X chromosome ($X_p$) in a female mammalian embryo very early in development. The maternal X chromosome ($X_m$) is left wild-type. Trace which chromosome becomes the Barr body and state the consequence for the physical state of both chromosomes in the adult somatic cells.
]

#section_heading("Section 3: Math/ML (20 mins)")

#ref_box[
  *Reading (5-7 mins):* CS 229 notes Andrew Ng.pdf, Chapter 1 (Supervised Learning), PDF pages 17–18 (Section 1.3 Probabilistic interpretation).
]

#question(space: 2in)[
  *3. Probabilistic Derivation.* In the probabilistic interpretation of linear regression, we assume the errors $epsilon^{(i)}$ are IID Gaussian. Why does maximizing the log-likelihood $ell(theta)$ lead to exactly the same objective as minimizing the Least Mean Squares (LMS) $J(theta)$? Walk through the algebraic steps showing what happens to the negative sign and the exponential.
]

#section_heading("Section 4: CS / Code (10 mins)")

#ref_box[
  *Note:* Addressing the CIGAR string confusion from yesterday's bonus.
]

#question(space: 2in)[
  *4. Bioinformatics CLI.* Yesterday, you used `samtools view -F 100M`. Explain why `-F` is logically incorrect for parsing "100M", and write a correct `awk` one-liner to count the number of reads with exactly "100M" in their CIGAR string from `alignments.sam`. (Hint: The CIGAR string is the 6th column in a SAM file).
]

#section_heading("Section 5: Appendix (Targeted Practice)")

#question(space: 1.5in)[
  *Bonus 1 (Nextflow).* You have `ch_bams` emitting 3 items, and `ch_vcf` emitting 1 item. If you run `ch_bams.combine(ch_vcf)`, how many total items will the resulting channel emit? Trace its execution when `ch_vcf` is delayed.
]

#closing_block()
