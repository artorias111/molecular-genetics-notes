#import "../template.typ": *

#show: sheet.with(
  day: "08",
  title: "Lane A Synthesis - NAHR Inversions, Quadratic Forms, & Confounding"
)

#section_heading("Timer")

#timer_table(
  genetics: "25m",
  math: "20m",
  code: "10m",
  stats: "5m",
  total: "60m"
)

#section_heading("Section 1: Spaced Repetition Review (Untimed)")

#ref_box[
  *Yesterday's Misses & Clarifications:*
  - *Projection Formula Base:* The projection of vector $a$ onto vector $b$ means $b$ is the "floor". The formula is $text("proj")_b (a) = (a^T b / b^T b) b$. You swapped $a$ and $b$ in the denominator. A good anchor: whatever you are projecting *onto* provides the structural foundation (the denominator $b^T b$) and the direction (the trailing $b$).
  - *Alpha-thal-1 Deletions:* You successfully drew how misalignment of the $alpha$ *genes themselves* deletes a single gene ($alpha^"thal-2"$). However, the prompt asked about the $alpha^"thal-1"$ deletion (which deletes *both* genes). This happens when large repeats that *flank the entire cluster* misalign and cross over, looping out and deleting everything in between them.
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Yesterday] The algebraic formula for the orthogonal projection of vector $a$ onto vector $b$: __________________________________________________________________
  
  (2) [Yesterday] The exact structural mechanism (involving direct repeats) that generates an $alpha^"thal-1"$ deletion where *both* alpha-globin genes are lost: ________________________________
  
  (3) [Missed-Day07] The two histone marks that characterize a "poised" enhancer: ________________________________
  
  (4) [Missed-Day07] Protein domain (found in HP1) that specifically binds to H3K9me3: ________________________________
  
  (5) [~Day 06] Rust syntax to explicitly annotate that a returned reference lives at least as long as an input reference `x`: ________________________________
  
  (6) [~Day 06] The strict requirement for a matrix $X$ if $X^T X = I$: ________________________________
  
  (7) [~Day 06] Definition of an "estimand": ________________________________
  
  (8) [~Day 06] Exact structural consequence for the *two* resulting chromatids when NAHR occurs between two direct repeats on the same chromosome: ________________________________
  
  (9) [~Day 04] The derivative $nabla_z (z^T z)$ with respect to the vector $z$: ________________________________
  
  (10) [~Day 04] Exact difference in primary amino acid sequence between $"PrP"^"C"$ and $"PrP"^"Sc"$: ________________________________
]


#pagebreak()

#section_heading("Section 3: Genetics - NAHR Inversions (20 mins)")

#ref_box[
  *Reading:* No new reading today. Apply your knowledge of Non-Allelic Homologous Recombination (NAHR) to a new geometric orientation.
]

#question(space: 2.5in)[
  *2. Inverted Repeats.* We know that if a chromosome has two direct repeats (pointing in the same direction, like `->` and `->`), homologous recombination between them loops out the intervening sequence, causing a deletion. 
  
  Now, imagine a chromosome has two *inverted* repeats (pointing towards each other, like `->` and `<-`). For these two sequences to pair up homologously during meiosis, the DNA strand must bend into a specific hairpin shape. Trace or describe the exact structural consequence for the DNA sequence located *between* these two inverted repeats after the crossover resolves. Does it cause a deletion, a duplication, or something else?
]

#question(space: 2in)[
  *3. Recombination Suppression.* The structural consequence you derived in Q2 is famously used by the Y chromosome (which cannot recombine with the X chromosome across most of its length) to prevent the loss of crucial male-specific genes. Why would the arrangement in Q2 prevent the loss of genes during meiosis?
]


#section_heading("Section 4: Math/ML - Quadratic Forms (20 mins)")

#ref_box[
  *Reading (5-7 mins):* Linear Algebra. Theory, Intuition, Code.pdf. Look up the definition of a *Quadratic Form* (usually Chapter 5 or 12). 
  Concept: A quadratic form is a scalar-valued function of a vector $x$, defined by $x^T A x$, where $A$ is a square (usually symmetric) matrix.
]

#question(space: 2in)[
  *4. Expanding a Quadratic Form.* Let $x = [x_1, x_2]^T$ and let $A$ be a $2 times 2$ symmetric matrix with elements $a_11, a_12, a_21, a_22$ (where $a_12 = a_21$). Multiply out the matrices to expand the quadratic form $x^T A x$ into a pure algebraic polynomial equation. 
]


#pagebreak()

#section_heading("Section 5: CS / Code (10 mins)")

#question(space: 2in)[
  *5. Rust Generics.* You want to create a `Point` struct that can hold either integers (`i32`) or floats (`f64`), but both coordinates must be of the *same* type. Write the exact Rust syntax to define a struct named `Point` using a generic type parameter `T`, containing two fields: `x` and `y`.
]

#question(space: 2in)[
  *6. Generic Implementations.* Write the `impl` block syntax to define a method `x_val(&self) -> &T` for your generic `Point<T>` struct that simply returns a reference to the `x` field.
]

#pagebreak()

#section_heading("Section 6: Stats (5 mins)")

#ref_box[
  *Concept 3: Confounding* — What technical variable perfectly tracks my biological one?
]

#question(space: 2in)[
  *7. Identifying the Confounder.* You are running an RNA-seq experiment to find genes differentially expressed in Alzheimer's brains vs Healthy brains. Because Alzheimer's tissue is harder to procure, all 10 Alzheimer's samples were processed in your lab in 2024. All 10 Healthy control samples were processed from a biobank in 2022. You find 5,000 differentially expressed genes. Identify the strict confounder in this experiment and explain why you cannot biologically trust any of these 5,000 genes.
]

#section_heading("Section 7: Appendix (Bonus/Targeted Practice)")

#ref_box[
  *Untimed Practice.* These are optional, low-pressure questions to keep you sharp!
]

#question(space: 2in)[
  *Bonus 1: Generics + Traits.* Combine what you know! Write a function signature `fn distance<T>(p1: &Point<T>, p2: &Point<T>) -> T` but add a trait bound to `T` restricting it to types that implement the `Float` trait.
]

#closing_block()
