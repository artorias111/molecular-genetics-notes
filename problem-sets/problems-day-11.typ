#import "../template.typ": *

#show: sheet.with(
  day: "11",
  title: "Lane A Synthesis - OLS Derivation, Null Distributions, & HMMs"
)

#section_heading("Section 1: Spaced Repetition Review (Untimed)")

#ref_box[
  *Yesterday's Misses & Clarifications:*
  - *Igf2/H19 Locus:* The *paternal* allele is methylated at the ICR. This methylation prevents CTCF from binding, which normally insulates the enhancer. Without CTCF, the enhancer reaches over and activates paternal Igf2.
  - *CTCF Topology:* Inverting a CTCF site doesn't just break the insulator; it reverses the directional "stop sign." Cohesin coming from one side slides through, but cohesin from the opposite side now stalls, creating a brand new loop/TAD boundary in the other direction.
  - *Rust Trait Bounds:* Don't forget the trait bound itself! Syntax: `impl<T: Float> Matrix<T> { ... }`.
  - *Needleman-Wunsch:* A horizontal move means you advance in the query (columns) but not the reference (rows). This produces a character in the query aligned to a gap in the reference, which is an *insertion* in the query.
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 3.5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Day 10] Which parental allele has a *methylated* Imprinting Control Region (ICR) at the Igf2/H19 locus? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (2) [Day 10] In the Needleman-Wunsch DP matrix, what does a horizontal move geometrically represent in the final alignment? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (3) [Day 10] Rust syntax to define an `impl` block for `Matrix<T>` restricting it only to types where `T` implements `Float`: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (4) [Day 10] If you use CRISPR to *invert* a CTCF binding site at a TAD boundary, what happens to cohesin extrusion coming from the opposite direction? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (5) [Day 09] The two histone marks that strictly define a "poised" enhancer: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (6) [Day 09] The algebraic formula for the orthogonal projection of vector $a$ onto vector $b$: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (7) [Day 08] Rust explicit lifetime syntax on a generic struct definition, e.g., `struct FastqRecord`: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (8) [Day 06] The biological division of labor between DNMT1 and DNMT3a/3b: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (9) [Day 05] In Nextflow, what is the conceptual difference between `.join()` and `.combine()`? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (10) [Day 04] The algebraic expansion of $(X theta)^T (X theta)$ using the LIVE EVIL transpose rule: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
]

#pagebreak()

#section_heading("Section 3: Math/ML - Ordinary Least Squares (20 mins)")

#question(space: 5in)[
  *2. Deriving OLS.* In linear regression, the cost function is $J(theta) = (X theta - y)^T (X theta - y)$.
  
  (a) Expand this into a polynomial and apply the LIVE EVIL transpose rule to combine the scalar cross-terms.
  (b) Using your knowledge of the quadratic gradient $nabla_theta (theta^T A theta) = 2A theta$ and linear gradient $nabla_theta (b^T theta) = b$, derive the closed-form solution for $theta$ by taking the gradient of $J(theta)$ and setting it to zero.
]

#pagebreak()

#section_heading("Section 4: CS / Code - Lifetimes & Generics (10 mins)")

#question(space: 3.5in)[
  *3. The Borrow Checker's Blind Spot.* You write a function to return the longest of two sequence strings:
  `fn longest_read<'a>(x: &'a str, y: &'a str) -> &'a str { ... }`
  
  Why does Rust force you to manually specify the explicit lifetime `'a` here, rather than just inferring it? What specific ambiguity does this explicit lifetime resolve for the borrow checker when the function is called?
]

#pagebreak()

#section_heading("Section 5: Stats - Null Distributions (5 mins)")

#ref_box[
  *Concept 6: Null Distribution* — What does the statistic do when nothing is going on? Computable by shuffling.
]

#question(space: 3in)[
  *4. Constructing the Null.* You are testing whether Gene X is differentially expressed between 10 treated mice and 10 control mice. You calculate the mean log-fold change. 
  
  Describe computationally how you would construct the "Null Distribution" for this statistic using *only* your existing $n=20$ dataset, without drawing any new mice. What is the physical operation?
]

#pagebreak()

#section_heading("Section 6: Genetics - Imprinting Perturbations (20 mins)")

#question(space: 4.5in)[
  *5. Prader-Willi and Angelman Syndromes.* Chromosome 15q11-q13 is a highly imprinted locus.
  
  Prader-Willi Syndrome (PWS) and Angelman Syndrome (AS) both frequently involve a large structural deletion at this exact locus. 
  If a patient inherits the deletion from their *father*, they get PWS. If they inherit the *exact same structural deletion* from their *mother*, they get AS.
  
  Explain mechanistically how identical DNA deletions result in entirely different clinical phenotypes. What is happening biologically at the *intact* allele (the one inherited from the other parent) in each respective case?
]

#pagebreak()

#section_heading("Section 7: Bonus - Bioinformatics MCQs (30 mins)")

#ref_box[
  *Bonus Challenge:* 30 minutes of competitive-exam style MCQs spanning core bioinformatics algorithms and assays. Write the letter of the correct answer and briefly justify your choice.
]

#question(space: 2in)[
  *6. RNA-Seq Library Prep.* What type of RNA species would be heavily sequenced in a Ribo-Zero (rRNA depleted) library but almost completely absent in a standard Poly-A enriched library?
  (A) Mature protein-coding mRNAs
  (B) Histone mRNAs and circular RNAs
  (C) 18S and 28S ribosomal RNAs
  (D) Spliced precursor tRNAs
]

#question(space: 2in)[
  *7. Hidden Markov Models (HMMs).* In an HMM used to predict GC-rich genomic islands, the probability of observing an 'A' nucleotide while the model is currently inside the "GC-rich" hidden state is mathematically known as an:
  (A) Initial probability
  (B) Transition probability
  (C) Emission probability
  (D) Posterior probability
]

#question(space: 2in)[
  *8. Quality Scores.* A base call in a FASTQ file has a Phred quality score of 30. What is the probability that this specific base call is incorrect?
  (A) 1 in 30
  (B) 1 in 100
  (C) 1 in 1,000
  (D) 1 in 10,000
]

#question(space: 2in)[
  *9. Epigenomic Assays.* You perform ATAC-seq on a population of neuronal cells. Which of the following genomic regions would show the highest pileup of sequenced reads?
  (A) Regions heavily bound by heterochromatin protein 1 (HP1)
  (B) Actively transcribed promoters and poised enhancers
  (C) Exonic regions of permanently silenced genes
  (D) Telomeric and centromeric heterochromatic repeats
]

#question(space: 2in)[
  *10. Data Structures.* Which highly efficient data structure is used by the Salmon pseudo-aligner to store and rapidly query the reference transcriptome k-mers?
  (A) Suffix Tree
  (B) FM-Index
  (C) Bloom Filter
  (D) Transcriptome De Bruijn Graph
]

#closing_block()
