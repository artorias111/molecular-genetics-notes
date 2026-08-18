#import "../template.typ": *

#show: sheet.with(
  day: "05",
  title: "Lane A Synthesis - Prions & Vector Dot Products"
)

#section_heading("Timer")

#timer_table(
  genetics: "25m",
  math: "20m",
  code: "10m",
  total: "55m"
)

#section_heading("Section 1: The Histone Cheat Sheet (Untimed)")

#ref_box[
  *By Request: The Histone & Methylation Cheat Sheet.* Don't memorize the strings, memorize the logic!
  - *H3K4me3:* Active Promoters. (Think: 4 is a small number, it's at the start of the gene).
  - *H3K4me1:* Enhancers. (1 is less than 3, so it's a distant regulatory element).
  - *H3K27ac:* Active Enhancers. (Acetylation = Always Active/Open).
  - *H3K9me3:* Constitutive Heterochromatin. (Permanent lockdown, HP1 binds here).
  - *H3K27me3:* Facultative Heterochromatin / Repressed. (Temporary lockdown, Polycomb binds here. A "poised" enhancer has H3K4me1 + H3K27me3).
  
  *The Methyltransferases:*
  - *DNMT3a / DNMT3b:* _De novo_ methyltransferases. They write NEW methylation marks on naked DNA during early development.
  - *DNMT1:* _Maintenance_ methyltransferase. It copies the methylation pattern from the old strand to the new strand during cell division. Without this, imprinting would be lost!
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 4.5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Missed-Day04] Exact function of DNMT1 during cell division: ____________________________________________________________
  
  (2) [Missed-Day04] Algebraic reason that $y^T X theta$ is exactly equal to its transpose $(y^T X theta)^T$: ________________________________
  
  (3) [Missed-Day02] Histone mark combination that characterizes a "poised" enhancer: ________________________________
  
  (4) [Day04] DNA methylation status of the maternal Igf2/H19 Imprinting Control Region (ICR): ________________________________
  
  (5) [Day04] Dimension of the result when a $1 times n$ vector multiplies an $n times d$ matrix and a $d times 1$ vector: ________________________________
  
  (6) [Day04] Exact transcript type of Xist (e.g., mRNA, tRNA): ________________________________
  
  (7) [Day02] Protein domain that specifically binds to H3K9me3 to initiate heterochromatin boundaries: ________________________________
  
  (8) [Day02] Expansion of $nabla_x (x^T A x)$ for a symmetric matrix $A$: ________________________________
  
  (9) [Day01] Geometric meaning of two vectors whose dot product is zero: ________________________________
  
  (10) [Day01] Protein complex that typically bounds Topological Associating Domains (TADs) along with CTCF: ________________________________
]


#pagebreak()

#section_heading("Section 3: Genetics - Prions (20 mins)")

#ref_box[
  *Reading (5-7 mins):* Genes XII, Chapter 28 (Epigenetics II), PDF pages ~2831–2833. 
  Section: 28.6 Prions Cause Diseases in Mammals
]

#question(space: 2in)[
  *2. Epigenetic Inheritance.* A researcher injects infectious $"PrP"^"Sc"$ into a mouse genetically engineered to completely lack the $"Prnp"$ gene (a knockout). Trace the consequence for the accumulation of amyloid plaques in this mouse's brain over time.
]

#question(space: 2in)[
  *3. Sequence.* You isolate a normal $"PrP"^"C"$ protein and a disease-causing $"PrP"^"Sc"$ protein from the same animal. Trace what difference, if any, you will find between their primary amino acid sequences, and explain the mechanism behind this result.
]


#section_heading("Section 4: Math/ML - Vector Dot Products (20 mins)")

#ref_box[
  *Reading (5-7 mins):* Linear Algebra. Theory, Intuition, Code.pdf, Chapter 3, PDF pages 46–49.
  Section: 3.2 The dot product.
]

#question(space: 1.5in)[
  *4. Dot Product Algebra.* Given $x = [1, -2, 3]^T$ and $y = [4, 5, -1]^T$. Compute $x^T y$. Show your arithmetic.
]

#question(space: 1.5in)[
  *5. Commutativity.* Using the LIVE EVIL transpose rule, expand the expression $(x^T y)^T$. Given that the dot product evaluates to a scalar, state the consequence for the algebraic relationship between $x^T y$ and $y^T x$.
]


#pagebreak()

#section_heading("Section 5: CS / Code (10 mins)")

#question(space: 2in)[
  *6. Nextflow Combinators.* You have a channel `ch_reads` emitting `[sample_id, path(reads)]` and a channel `ch_ref` emitting a single value `path(genome_fasta)`. Write a Nextflow snippet to combine the reference genome with every item in `ch_reads` so the resulting channel emits `[sample_id, path(reads), path(genome_fasta)]`.
]

#question(space: 2in)[
  *7. Rust Borrows.* A function signature is defined as `fn count_words(text: &String) -> usize`. Inside `main()`, you have declared `let mut my_text = String::from("hello");` and you want to pass it to `count_words`. Write the exact syntax to call the function and pass `my_text` without giving up ownership and without allowing the function to mutate it.
]


#pagebreak()

#section_heading("Section 6: Appendix (Bonus/Targeted Practice)")

#ref_box[
  *Untimed Practice.* These are optional, low-pressure questions to keep you sharp!
]

#question(space: 2in)[
  *Bonus 1: Scalar Trick Practice.* Expand the matrix product $(A B x)^T (A B x)$ where $x$ is a column vector and $A, B$ are matrices. State the dimension of the final result.
]

#question(space: 2in)[
  *Bonus 2: Easy Biology.* A gene is actively being transcribed at a high rate. State the expected state of histone acetylation at its promoter.
]

#closing_block()
