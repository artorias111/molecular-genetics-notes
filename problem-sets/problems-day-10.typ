#import "../template.typ": *

#show: sheet.with(
  day: "10",
  title: "Lane A Synthesis - Quadratic Gradients, Lifetimes, & BWTs"
)

#section_heading("Section 1: Spaced Repetition Review (Untimed)")

#ref_box[
  *Yesterday's Misses & Clarifications:*
  - *Poised Enhancer Marks:* H3K4me1 (enhancer mark) PLUS H3K27me3 (repressive mark).
  - *Orthogonal Projection:* The vector being projected *onto* forms the "floor/base". So projecting $a$ onto $b$ means $b^T b$ is in the denominator: $text("proj")_b (a) = (a^T b / b^T b) b$.
  - *Rust Trait Bounds on Impls:* Trait bounds go on the `impl` block, not the function. Correct syntax: `impl<T: Float> Dataset<T> { ... }`.
  - *Completing the Square:* To rigorously prove positive definiteness, you must complete the square. $3x_1^2 + 2x_1x_2 + 3x_2^2 = 3(x_1^2 + 2/3 x_1 x_2 + 1/9 x_2^2) + 8/3 x_2^2 = 3(x_1 + 1/3 x_2)^2 + 8/3 x_2^2$. Since squares are always positive, the sum is strictly positive for non-zero vectors.
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 3.5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Day 09] The two histone marks that strictly define a "poised" enhancer: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (2) [Day 09] The algebraic formula for the orthogonal projection of vector $a$ onto vector $b$: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (3) [Day 09] Rust syntax to open an `impl` block for a generic struct `Dataset<T>`, restricting it only to types where `T` implements `Float`: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (4) [Day 08] The defining algebraic requirement for a matrix $X$ to be orthogonal (what does $X^T X$ equal?): \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (5) [Day 08] The specific molecular mechanism of prion transmission (what exact property is transmitted to the healthy protein?): \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (6) [Day 08] Rust explicit lifetime syntax to define a struct `FastqRead` holding a string slice reference `seq`: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (7) [Day 06] The biological division of labor between DNMT1 and DNMT3a/3b: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (8) [Day 06] In the Igf2/H19 locus, which parent's allele (maternal or paternal) has a *methylated* Imprinting Control Region (ICR)? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (9) [Day 06] The algebraic expansion of $(X theta)^T (X theta)$ using the LIVE EVIL transpose rule: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (10) [Day 06] Name the protein complexes that anchor Topological Associating Domain (TAD) boundaries: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
]

#pagebreak()

#section_heading("Section 3: Math/ML - Completing the Square & Gradients (20 mins)")

#question(space: 3.5in)[
  *2. Proving Positive Definiteness (Redo).* Let $A = mat(2, -1; -1, 2)$. 
  Expand the quadratic form $x^T A x$ into a polynomial, and then strictly *complete the square* to rigorously prove that $x^T A x > 0$ for all non-zero vectors $x$. Show all algebraic steps.
]

#question(space: 3.5in)[
  *3. The Gradient of a Quadratic Form.* In machine learning optimization, you must take the derivative of the cost function with respect to the parameter vector $theta$.
  For a symmetric matrix $A$, derive the gradient $nabla_theta (theta^T A theta)$. 
  *Hint:* Expand it for a 2x2 matrix first to see the pattern, then generalize it. What does it equal?
]

#pagebreak()

#section_heading("Section 4: CS / Code - Traits & Lifetimes (10 mins)")

#question(space: 3in)[
  *4. Rust Trait Bounds (Redo).* You have a generic struct `struct Matrix<T> { data: Vec<T> }`. You want to implement a method `fn invert(&self)` that is *only* available if the inner type `T` implements the `Float` trait. Write the complete, syntactically correct `impl` block containing an empty `invert` function body.
]

#question(space: 3in)[
  *5. Rust Lifetimes.* A FASTQ parser reads a massive 10GB file into memory as a `String`. You want to create `FastqRecord` structs that hold references to slices of this string to avoid copying data. Define the `FastqRecord` struct using an explicit lifetime parameter `'a` to ensure the struct cannot outlive the string it references.
]

#pagebreak()

#section_heading("Section 5: Stats - Sampling Distributions (5 mins)")

#ref_box[
  *Concept 5: Sampling Distribution* — The master concept. What does this statistic do under repetition?
]

#question(space: 3in)[
  *6. Defining the Sampling Distribution.* You calculate the mean log-fold change of Gene X in 5 treated mice vs 5 control mice. The result is +2.1. 
  Conceptually, what exactly *is* the "sampling distribution" of this mean? Describe the physical/hypothetical process required to generate it.
]

#pagebreak()

#section_heading("Section 6: Genetics - TADs & Insulators (20 mins)")

#question(space: 4in)[
  *7. Insulator Perturbations.* 
  Locus $L$ contains an enhancer ($E$), a CTCF-bound insulator ($I$), and a promoter ($P$) in the linear genomic order $E - I - P$. Normally, $I$ prevents $E$ from activating $P$.
  
  Experiment A: You use CRISPR to delete the CTCF binding motifs at $I$. 
  Experiment B: You use CRISPR to invert the CTCF binding motifs at $I$ (flip their sequence orientation).
  
  Assuming CTCF binding is highly directional (which drives cohesin stalling), describe the specific functional consequence on the expression of the gene at $P$ for *both* experiments. Explain the mechanistic difference between deletion and inversion here.
]

#pagebreak()

#section_heading("Section 7: Bonus - JEE-Style Bioinformatics MCQs (30 mins)")

#ref_box[
  *Bonus Challenge:* 30 minutes of hard, competitive-exam style MCQs spanning core bioinformatics algorithms and concepts. Write the letter of the correct answer and briefly justify your choice.
]

#question(space: 2in)[
  *8. Burrows-Wheeler Transform (BWT).* Which of the following is the primary reason the BWT is the foundational algorithm for short-read aligners like BWA and Bowtie?
  (A) It compresses the genome into a suffix tree that fits directly into L1 CPU cache.
  (B) It clusters identical characters together, allowing run-length encoding and enabling extremely fast $O(m)$ search time (where $m$ is read length) via the FM-index.
  (C) It directly translates nucleotide sequences into k-mer hash tables with zero collision probability.
  (D) It aligns reads in local space by computing the longest common subsequence using dynamic programming.
]

#question(space: 2in)[
  *9. Dynamic Programming.* In the Needleman-Wunsch algorithm for global alignment, what does a horizontal move in the scoring matrix geometrically represent in the final alignment?
  (A) A match or mismatch between the two sequences.
  (B) An insertion in the query sequence (a gap in the reference).
  (C) A deletion in the query sequence (a gap in the query).
  (D) The termination of the alignment.
]

#question(space: 2in)[
  *10. Hidden Markov Models (HMMs).* When using an HMM for *ab initio* gene prediction (like Augustus), which algorithm is used to find the most probable sequence of hidden states (e.g., Exon, Intron, Intergenic) given the observed DNA sequence?
  (A) The Forward Algorithm
  (B) The Backward Algorithm
  (C) The Viterbi Algorithm
  (D) The Baum-Welch Algorithm
]

#question(space: 2in)[
  *11. Variant Calling.* In a standard VCF (Variant Call Format) file, what does a `GT` field value of `0/1` in the sample column signify?
  (A) The sample is homozygous for the reference allele.
  (B) The sample is heterozygous, carrying one reference allele and one alternate allele.
  (C) The sample is homozygous for the alternate allele.
  (D) The variant failed quality control (0 mapped, 1 unmapped).
]

#question(space: 2in)[
  *12. RNA-Seq Quantification.* Why do tools like Salmon and Kallisto use "pseudoalignment" instead of standard base-level alignment (like STAR)?
  (A) To identify novel unannotated splice junctions.
  (B) Because they align reads to the genome rather than the transcriptome.
  (C) To determine which transcripts a read is compatible with, skipping base-by-base dynamic programming, thereby vastly increasing quantification speed.
  (D) To accurately call SNPs in expressed RNA sequences.
]

#closing_block()
