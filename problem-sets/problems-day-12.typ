#import "../template.typ": *

#show: sheet.with(
  day: "12",
  title: "Lane A Synthesis - Ridge Derivation, Loop Extrusion, & p-values"
)

#section_heading("Section 1: Spaced Repetition Review (Untimed)")

#ref_box[
  *Yesterday's Misses & Clarifications:*
  - *OLS Cross-Terms:* In $(X theta - y)^T (X theta - y)$, the cross terms are $-(X theta)^T y$ and $-y^T (X theta)$. These are scalars! Thus $theta^T X^T y = (theta^T X^T y)^T = y^T X theta$. You MUST combine them into $-2 theta^T X^T y$ *before* taking the gradient, otherwise you get stuck.
  - *Permutation Test (Null Distribution):* To build a null distribution from your 20 mice, you physically *shuffle* the Treatment/Control labels across the entire dataset of 20, recompute the fold-change, and repeat 10,000 times. You don't just sample from the controls.
  - *Imprinting Mechanism:* PWS and AS deletions cause disease because the *intact* allele inherited from the other parent is naturally silenced (imprinted) for those genes. Deleting the active copy leaves the patient with exactly 0 functional copies.
  - *Rust Lifetimes:* The syntax is `struct FastqRecord<'a>`. The ambiguity it resolves is that the compiler doesn't know *which* input reference a function returns, so you force the output to live exactly as long as the shortest input lifetime.
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 3.5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Day 11] To build a null distribution for a differential expression test, what physical operation do you perform on the sample labels across your entire dataset? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (2) [Day 11] Apply the transpose rule to combine the scalar cross-terms $theta^T X^T y + y^T X theta$ into a single term: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (3) [Day 11] Why does inheriting a large 15q11-q13 deletion from the father cause Prader-Willi Syndrome, rather than just leaving the patient with one functional maternal copy? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (4) [Day 11] Correct Rust syntax to declare a struct `Point` with an explicit lifetime `'a`: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (5) [Day 11] In an HMM, the probability of observing a specific nucleotide while already inside a hidden state is called the: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (6) [Day 11] Which two histone marks, when found together, strictly define a "poised" enhancer? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (7) [Day 10] If you invert a CTCF site at a TAD boundary, what happens to cohesin extrusion arriving from the *opposite* (previously unblocked) direction? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (8) [Day 10] In the Igf2/H19 locus, which parental allele has a methylated Imprinting Control Region (ICR)? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (9) [Day 08] What is the strict algebraic requirement for a matrix $X$ to be orthogonal? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (10) [Day 08] Rust explicit trait bound syntax on an `impl` block for `Matrix<T>` restricting `T` to `Float`: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
]

#pagebreak()

#section_heading("Section 3: Math/ML - Ridge Regression Gradient (20 mins)")

#question(space: 5.5in)[
  *2. Deriving Ridge Regression.* Ridge regression adds a penalty term $lambda$ to prevent overfitting. The cost function is:
  $ J(theta) = (X theta - y)^T (X theta - y) + lambda theta^T theta $
  
  *(a)* Expand $(X theta - y)^T (X theta - y)$ into a polynomial. Then, *crucially*, use the transpose rule to combine the two scalar cross-terms into a single term *before* proceeding. Write the fully expanded and combined $J(theta)$.
  
  *(b)* Now, take the gradient $nabla_theta J(theta)$ of your combined polynomial. Use the rules $nabla_theta (theta^T A theta) = 2A theta$ and $nabla_theta (b^T theta) = b$.
  
  *(c)* Set the gradient to zero and solve algebraically for $theta$. (Hint: you will need to factor $theta$ out of two terms, creating an identity matrix $I$ in the process).
]

#pagebreak()

#section_heading("Section 4: CS / Code - Generics & Trait Bounds (10 mins)")

#question(space: 4in)[
  *3. Scaffolded Rust Generics.* You want to build a reusable genomic interval struct.
  
  *(a)* Write the definition for a struct named `GenomicInterval` that takes a generic type parameter `T`, and has two fields: `start` of type `T`, and `end` of type `T`.
  
  *(b)* Write the `impl` block signature (just the signature, not the function body) to add methods to `GenomicInterval`. Apply a trait bound so that this `impl` block *only* exists for types `T` that implement the standard library `Sub` (subtraction) trait.
]

#pagebreak()

#section_heading("Section 5: Stats - The p-value (5 mins)")

#ref_box[
  *Concept 7: p-value* — The tail probability of your statistic under the null distribution. Nothing more, nothing less.
]

#question(space: 3in)[
  *4. Defining the p-value.* Yesterday, you designed a permutation test by shuffling Treatment/Control labels across 20 mice 10,000 times, computing the mean log-fold change (LFC) each time to build the Null Distribution.
  
  Your *actual* unshuffled dataset had a mean LFC of 2.5. 
  
  Using the 10,000 values in your Null Distribution, exactly how do you compute the p-value for your observed LFC of 2.5? What is the literal arithmetic operation you perform on those 10,000 numbers?
]

#pagebreak()

#section_heading("Section 6: Genetics - Loop Extrusion & Imprinting (20 mins)")

#question(space: 2.5in)[
  *5. The Loop Extrusion Model.* Let's break down chromatin topology.
  
  *(a)* Cohesin rings load onto DNA and extrude it into a loop until they hit a directional "stop sign." What specific DNA-binding protein acts as this stop sign?
]

#question(space: 3in)[
  *(b)* The stop sign is directional: cohesin stops if it approaches from the "front", but slides right through if it approaches from the "back." 
  If you use CRISPR to perfectly invert the DNA sequence of a left-sided boundary site, describe mechanistically what happens to cohesin rings arriving from *inside* the TAD versus cohesin arriving from *outside* the TAD.
]

#question(space: 3.5in)[
  *(c)* *Imprinting.* In the Igf2/H19 locus, the paternal allele's Imprinting Control Region (ICR) is heavily methylated. Explain step-by-step how this methylation chemically alters the topology (specifically regarding the protein from part a), and why that topological change causes the enhancer to activate Igf2 on the paternal allele.
]

#pagebreak()

#section_heading("Section 7: Bonus - Bioinformatics MCQs (30 mins)")

#ref_box[
  *Bonus Challenge:* Write the letter of the correct answer and briefly justify your choice.
]

#question(space: 2in)[
  *6. Bisulfite Sequencing.* In whole-genome bisulfite sequencing (WGBS), chemical treatment converts unmethylated cytosines (C) into which base (which is then read as T by the sequencer)?
  (A) Guanine (G)
  (B) Uracil (U)
  (C) 5-methylcytosine (5mC)
  (D) Adenine (A)
]

#question(space: 2in)[
  *7. HMM Algorithms.* Which dynamic programming algorithm is used to find the single most probable path of hidden states (e.g., Exon -> Intron -> Exon) given an observed sequence of emissions?
  (A) Forward Algorithm
  (B) Backward Algorithm
  (C) Viterbi Algorithm
  (D) Baum-Welch Algorithm
]

#question(space: 2in)[
  *8. FastQC.* In a standard Illumina sequencing run, you notice the Phred quality scores consistently drop off toward the 3' end (the end of the read) of all sequences. This is:
  (A) A sign of severe adapter contamination.
  (B) Normal behavior due to phasing/pre-phasing accumulation over cycle time.
  (C) Indicative of RNA degradation in the input library.
  (D) Caused by barcode swapping in the flow cell.
]

#question(space: 2in)[
  *9. Multiple Testing.* You are testing 20,000 genes for differential expression. If you apply the Bonferroni correction, you are strictly controlling the:
  (A) False Discovery Rate (FDR)
  (B) Family-Wise Error Rate (FWER)
  (C) False Negative Rate (FNR)
  (D) Positive Predictive Value (PPV)
]

#question(space: 2in)[
  *10. Nextflow Channels.* Which Nextflow channel operator takes two channels emitting tuples (e.g., `[sample_id, reads]`) and matches them together *only* when their `sample_id` keys match?
  (A) `.mix()`
  (B) `.combine()`
  (C) `.join()`
  (D) `.collect()`
]

#closing_block()
