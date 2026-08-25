#import "../template.typ": *

#show: sheet.with(
  day: "14",
  title: "Lane A Synthesis - Matrix Algebra, Effect Size, & CpG Islands"
)

#section_heading("Section 1: Spaced Repetition Review (Untimed)")

#ref_box[
  *Yesterday's Misses & Clarifications:*
  - *Inner vs Outer Product Notation:* You nailed the dimensions, but swapped the notation! For a column vector $x$: the scalar inner product is $x^T x$. The matrix outer product is $x x^T$.
  - *Matrix Algebra:* You cannot algebraically "divide" by a matrix to isolate a variable! If you have the equation $A theta = b$, you isolate $theta$ by multiplying both sides by the inverse of $A$ (denoted $A^(-1)$). Thus, $theta = A^(-1) b$.
  - *Bootstrapping:* You described Jackknife/Cross-validation. Bootstrapping is sampling *with replacement*. To bootstrap a mean from 50 data points, you draw 50 points *with replacement* (meaning some points are picked multiple times, some zero), compute the mean, and repeat 10,000 times.
  - *Rust Where Clauses:* Instead of writing `fn compute<T: Sub + Display>(x: T)`, you write `fn compute<T>(x: T) where T: Sub + Display`. It moves the messy bounds to the end of the signature.
  - *scRNA-seq UMIs:* The *Cell Barcode* tells you which cell the transcript came from. The *UMI (Unique Molecular Identifier)* is a random tag attached to individual mRNA molecules to computationally remove PCR duplication artifacts later.
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 3.5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Day 13] Write the algebraic notation for the $N times N$ *outer product* matrix of a column vector $x$: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (2) [Day 13] If you have the matrix equation $X^T W X theta = X^T W y$, algebraically solve for $theta$ (assuming $X^T W X$ is invertible): \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (3) [Day 13] When building a Bootstrap Confidence Interval for a sample of $N=50$, you repeatedly draw 50 data points from your original sample. Crucially, this sampling must be done *with* \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
  
  (4) [Day 13] In scRNA-seq, what is the primary purpose of the UMI? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (5) [Day 13] In scRNA-seq, what is the primary purpose of the Cell Barcode? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (6) [Day 13] What keyword in Rust allows you to move trait bounds from inside the `< >` to the end of the function signature? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (7) [Day 13] During NAHR (Non-Allelic Homologous Recombination), a deletion on one chromatid is always accompanied by what specific structural variant on the other participating chromatid? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (8) [Day 12] To build a null distribution for a differential expression test, you physically shuffle the \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ across the entire dataset.
  
  (9) [Day 11] Which specific histone mark combo uniquely defines a "poised" enhancer? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (10) [Day 10] If you invert a CTCF site at a TAD boundary, what happens to cohesin extrusion arriving from *outside* the TAD? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
]

#pagebreak()

#section_heading("Section 3: Math/ML - Matrix Algebra Drills (20 mins)")

#question(space: 3.5in)[
  *2. Matrix Algebra Isolation.* You are deriving the update rule for a machine learning model. You've taken the gradient of your cost function and set it to zero, resulting in the following equation:
  
  $ 2 A^T A theta - 2 A^T y + lambda I theta = 0 $
  
  Where $A$ is a matrix, $theta$ and $y$ are vectors, $I$ is the identity matrix, and $lambda$ is a scalar constant.
  
  *(a)* Factor out $theta$ from the left side. (Be careful with matrix dimensions and the identity matrix).
  
  *(b)* Algebraically isolate $theta$ to find the final closed-form solution. (Remember, no dividing by matrices!)
]

#pagebreak()

#section_heading("Section 4: CS / Code - Rust Where Clauses (10 mins)")

#question(space: 4in)[
  *3. Cleaning up Trait Bounds.* You are writing a generic function that takes two sequences, aligns them, and prints the result. The initial signature is:
  
  `fn align_sequences<T: Iterator<Item = u8> + Clone, U: std::fmt::Display>(seq1: T, seq2: T, metadata: U) -> usize { ... }`
  
  Rewrite this exact function signature using a Rust `where` clause to make it more readable. (Just the signature, no function body needed).
]

#pagebreak()

#section_heading("Section 5: Stats - Effect Size vs p-value (5 mins)")

#ref_box[
  *Concept 9: Effect Size* — How big the difference is, in units someone actually cares about. This is completely distinct from statistical significance (p-value).
]

#question(space: 3.5in)[
  *4. Big Data, Small Effects.* You run a differential expression test on a massive single-cell dataset of 2 million cells. You find that Gene X has a p-value of $10^(-150)$ between Treatment and Control. However, the log2-fold change (effect size) is only 0.01.
  
  *(a)* Is this result statistically significant? 
  
  *(b)* Explain why the p-value is astronomically small even though the actual biological change in expression is practically zero.
]

#pagebreak()

#section_heading("Section 6: Genetics - CpG Islands & Mutation Rates (20 mins)")

#question(space: 5in)[
  *5. The Mechanism of CpG Islands.* In the mammalian genome, the dinucleotide "CpG" is globally heavily depleted (it appears much less often than you'd expect by chance). However, at active promoters, CpGs are highly enriched, forming what we call "CpG Islands".
  
  We know two facts:
  1. Spontaneous deamination of *unmethylated* Cytosine (C) turns it into Uracil (U).
  2. Spontaneous deamination of *5-methylcytosine* (5mC) turns it into Thymine (T).
  
  Using these two chemical facts, explain *mechanistically* why CpGs are globally lost throughout the genome over evolutionary time, but are specifically preserved in active promoter regions. (Hint: Think about how the cell's DNA repair machinery recognizes U vs T, and remember the methylation state of active promoters!).
]

#pagebreak()

#section_heading("Section 7: Bonus - Bioinformatics MCQs (30 mins)")

#ref_box[
  *Bonus Challenge:* Write the letter of the correct answer and briefly justify your choice.
]

#question(space: 2in)[
  *6. Base Calling.* In Illumina sequencing, what physical event causes "phasing", leading to a drop in Phred quality scores toward the end of a read?
  (A) RNA degradation in the library.
  (B) Fluorophores failing to cleave, or polymerase incorporating 0 or 2 nucleotides instead of exactly 1 per cycle.
  (C) Over-amplification during the PCR bridge amplification step.
  (D) Adapter dimers overwhelming the flow cell.
]

#question(space: 2in)[
  *7. BAM Flags.* In a BAM file, the bitwise FLAG `0x10` (decimal 16) indicates:
  (A) The read is unmapped.
  (B) The read is a PCR duplicate.
  (C) The read maps to the reverse strand.
  (D) The read failed quality control.
]

#question(space: 2in)[
  *8. HMM Algorithms.* While the Viterbi algorithm finds the single most probable path through an HMM, which algorithm calculates the *posterior probability* of a specific hidden state at a specific position, summing over all possible paths?
  (A) Forward-Backward Algorithm
  (B) Baum-Welch Algorithm
  (C) Needleman-Wunsch Algorithm
  (D) Burrows-Wheeler Transform
]

#question(space: 2in)[
  *9. Rust Semantics.* What happens if you try to modify a value through an immutable reference (`&T`) in safe Rust?
  (A) A runtime panic.
  (B) The compiler throws a compilation error.
  (C) The value is modified safely using interior mutability by default.
  (D) A segmentation fault.
]

#question(space: 2in)[
  *10. ChIP-Seq.* In a ChIP-seq experiment, what is the primary purpose of the "Input" control sample?
  (A) To measure total RNA expression levels.
  (B) To control for sonication bias, open chromatin bias, and sequencing bias.
  (C) To serve as a spike-in for absolute quantification.
  (D) To ensure the antibody specifically binds the target protein.
]

#closing_block()
