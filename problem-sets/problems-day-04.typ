#import "../template.typ": *

#show: sheet.with(
  day: "04",
  title: "Lane A Synthesis - Imprinting & Matrix Transposes"
)

#section_heading("Timer")

#timer_table(
  genetics: "25m",
  math: "20m",
  code: "10m",
  total: "55m"
)

#section_heading("Section 1: Spaced Repetition (5 mins)")

#ref_box[
  *Active Recall:* 10 quick MCQs on previous concepts. Bio and Math/ML only!
]

#question(space: 4in)[
  *1. Write A, B, or C for each:*
  
  (1) What does the chromodomain of HP1 specifically bind to? (A) H3K27ac (B) H3K9me3 (C) Unmethylated CpG
  
  (2) In linear regression with $n$ samples and $d$ features, what is the dimension of the target vector $y$? (A) $n times d$ (B) $n times 1$ (C) $d times 1$
  
  (3) A "poised" enhancer usually has which two marks? (A) H3K4me1 + H3K27me3 (B) H3K9me3 + H3K4me3 (C) H3K27ac + H3K4me1
  
  (4) What is the derivative $nabla_z (z^T z)$? (A) $z^2$ (B) $z$ (C) $2z$
  
  (5) Which enzyme is generally responsible for *maintaining* DNA methylation after replication? (A) DNMT1 (B) DNMT3a (C) TET
  
  (6) If $x^T y = 0$, what does this mean geometrically for vectors $x$ and $y$? (A) Linearly dependent (B) Orthogonal (C) Parallel
  
  (7) In the Normal Equations, the term $X^T X$ results in a matrix of size: (A) $d times d$ (B) $n times n$ (C) $n times d$
  
  (8) The Xist transcript is a classic example of a: (A) Coding mRNA (B) Long non-coding RNA (lncRNA) (C) Short hairpin RNA
  
  (9) To find the optimal parameters $theta$ that minimize the cost function $J(theta)$, we set the gradient $nabla_theta J(theta)$ to: (A) $1$ (B) the vector $0$ (C) the identity matrix $I$
  
  (10) Which histone mark is generally associated with transcriptionally active promoters? (A) H3K4me3 (B) H3K9me3 (C) H3K27me3
]

#pagebreak()

#section_heading("Section 2: Genetics - Imprinting (15 mins)")

#ref_box[
  *Reading (5-7 mins):* Genes XII, Chapter 28 (Epigenetics II), PDF pages ~2823–2825. 
  Section: 28.4 DNA Methylation Is Responsible for Imprinting
]

#question(space: 1.5in)[
  *2.* An allele is said to be "imprinted" depending on its parent of origin. A paternal allele is actively imprinted at a locus. Trace the consequence of this imprint on its transcription and local chromatin structure compared to the maternal allele.
]

#question(space: 1.5in)[
  *3.* Describe how the Igf2/H19 locus illustrates imprinting. Specifically, which allele (paternal or maternal) is methylated at the ICR (Imprinting Control Region), and how does that affect the expression of Igf2?
]

#question(space: 1.5in)[
  *4.* When a somatic cell undergoes mitosis, does the maintenance methyltransferase (DNMT1) preserve the imprinted (asymmetric) methylation pattern.
]

#pagebreak()

#section_heading("Section 3: Math/ML - The LIVE EVIL Rule (15 mins)")

#ref_box[
  *Reading (5 mins):* Linear Algebra. Theory, Intuition, Code.pdf, Chapter 6, PDF pages 153–155.
  Section: The LIVE EVIL rule (Transposing Matrix Products).
]

#question(space: 1.5in)[
  *5.* The LIVE EVIL rule states that $(A B)^T = B^T A^T$. Using this rule, expand the transpose of three multiplied matrices: $(X Y Z)^T = ?$
]

#question(space: 1.5in)[
  *6.* Let $X in RR^{n times d}$ and $theta in RR^d$. Expand the expression $(X theta)^T (X theta)$ into a matrix product that does not have a grouped transpose. What is the final dimension of the resulting matrix/scalar?
]

#question(space: 2in)[
  *7.* In scalar algebra, $(a - b)^2 = a^2 - 2 a b + b^2$. In matrix algebra, expand the scalar loss $L = (X theta - y)^T (X theta - y)$. Why are the two cross-terms $theta^T X^T y$ and $y^T X theta$ exactly equal to each other, allowing you to combine them into $-2 theta^T X^T y$? (Hint: what is the dimension of the cross-term?)
]


#pagebreak()

#section_heading("Section 4: CS / Code (10 mins)")

#question(space: 1.5in)[
  *8. Nextflow joins.* You have a channel `ch_bams` emitting `[sample_id, path(bam)]` and `ch_vcf` emitting `[sample_id, path(vcf)]`. Write a quick Nextflow snippet to join them strictly by `sample_id` into a channel that emits `[sample_id, path(bam), path(vcf)]`. (Hint: use the `.join()` operator).
]

#question(space: 1.5in)[
  *9. Rust Lifetimes.* Consider the signature `fn get_first_word<'a>(s: &'a String) -> &'a str`. Why is the explicit lifetime `'a` physically tying the output to the input? What specific bug is the compiler preventing the user from writing when it enforces this?
]

#closing_block()
