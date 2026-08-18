#import "../template.typ": *

#show: sheet.with(
  day: "07",
  title: "Lane A Synthesis - NAHR Reciprocals, Projections, & Unit of Replication"
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
  - *NAHR Reciprocals:* You correctly identified that when two non-allelic repeats pair and cross over, it can cause a *duplication* of the sequence between them. However, homologous recombination is a reciprocal exchange! One chromatid gets the duplication (3 repeats, 2 interstitial sequences), while the *other* chromatid suffers a *deletion* (1 repeat, 0 interstitial sequences). They always come in pairs.
  - *Histone marks:* A poised enhancer is marked by *H3K4me1* (enhancer mark) PLUS *H3K27me3* (repressive mark from Polycomb).
  - *Chromodomains:* CTCF binds insulators to make boundaries. The *Chromodomain* (found in HP1) is the specific protein module that reads H3K9me3 to initiate heterochromatin lockdown.
  - *Orthogonal Matrices:* We discussed this, but remember: $X^T X$ only equals the Identity matrix ($I$) if $X$ is an *Orthogonal Matrix* (where every column is a unit vector and perpendicular to every other column). In machine learning, $X$ is your feature matrix, which is rarely orthogonal!
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Yesterday] Exact structural consequence for the *two* resulting chromatids when NAHR occurs between two direct repeats on the same chromosome: __________________________________________________________________
  
  (2) [Yesterday] Rust syntax to explicitly annotate that a returned reference lives at least as long as an input reference `x`: ________________________________
  
  (3) [Yesterday] The strict requirement for a matrix $X$ if $X^T X = I$: ________________________________
  
  (4) [Yesterday] Definition of an "estimand": ________________________________
  
  (5) [Missed-Day06] The two histone marks that characterize a "poised" enhancer: ________________________________
  
  (6) [Missed-Day06] Protein domain (found in HP1) that specifically binds to H3K9me3: ________________________________
  
  (7) [~Day 05] Nextflow operator used to attach a single un-keyed value to every item in a channel: ________________________________
  
  (8) [~Day 01] Geometric meaning of two vectors whose dot product is zero: ________________________________
  
  (9) [~Day 02] Expansion of $nabla_z (z^T z)$: ________________________________
  
  (10) [~Day 05] Exact difference in primary amino acid sequence between $"PrP"^"C"$ and $"PrP"^"Sc"$: ________________________________
]


#pagebreak()

#section_heading("Section 3: Genetics - Thalassemia & NAHR (20 mins)")

#ref_box[
  *Reading (5-7 mins):* Genes XII, Chapter 6 (Clusters and Repeats), PDF pages ~566–568. 
  Section: 6.2 Unequal Crossing-Over (Focus strictly on the alpha-thalassemia examples).
]

#question(space: 2.5in)[
  *2. Thalassemia Deletions.* The human alpha-globin cluster contains two functional genes, $alpha 1$ and $alpha 2$. Unequal crossing-over can produce the $alpha^"thal-2"$ deletion (which removes one alpha gene) or the $alpha^"thal-1"$ deletion (which removes both alpha genes). Trace how an $alpha^"thal-1"$ deletion could be generated if the region flanking the entire alpha-globin cluster contained large direct repeats. Draw or describe the exact pairing and crossover.
]

#question(space: 2.5in)[
  *3. Reversion.* Can a chromosome carrying the $alpha^"thal-2"$ deletion (which has exactly one $alpha$ gene remaining) undergo unequal crossing-over with a normal homolog (which has two $alpha$ genes) to regenerate a chromosome with three $alpha$ genes? Trace the pairing and recombination required for this to occur.
]


#section_heading("Section 4: Math/ML - Orthogonal Projections (20 mins)")

#ref_box[
  *Reading (5-7 mins):* Linear Algebra. Theory, Intuition, Code.pdf, Chapter 3, PDF pages ~59–63.
  Section: Orthogonal projection.
]

#question(space: 2in)[
  *4. The Projection Formula.* You want to project vector $a$ onto vector $b$. Write down the full algebraic formula for the projection vector $text("proj")_b (a)$, using dot products.
]

#question(space: 2in)[
  *5. Computing a Projection.* Let $a = [1, 2]^T$ and $b = [3, 0]^T$. Compute the orthogonal projection of $a$ onto $b$. Show your arithmetic.
]


#pagebreak()

#section_heading("Section 5: CS / Code (10 mins)")

#question(space: 2in)[
  *6. Rust Traits.* In Rust, interfaces are called Traits. Write the exact syntax to define a public trait called `Summarizable` that requires a single method signature: `fn summarize(&self) -> String;`. (You do not need to implement it for a struct, just define the trait itself).
]

#question(space: 2in)[
  *7. Trait Bounds.* Write a function signature for `print_summary` that accepts *any* type `T` as long as `T` implements the `Summarizable` trait. The function should take an immutable reference to the item.
]

#pagebreak()

#section_heading("Section 6: Stats (5 mins)")

#ref_box[
  *Concept 2: Unit of Replication* — What is my $n$ actually? 
  (e.g., Running RNA-seq on 40,000 cells taken from 3 mice is $n=3$, not $n=40,000$. This is the #1 error in single-cell and it's everywhere in genomics).
]

#question(space: 2in)[
  *8. Defining the Unit.* You are testing a new drug on cancer organoids. You grow 5 separate organoids from a single patient's tumor. You treat 2 organoids with the drug, and 3 with a vehicle control. You then sequence 10,000 cells from each organoid (50,000 cells total). If you want to claim "this drug alters gene expression in this patient's cancer", what is your $n$ (degrees of freedom) for the treatment group, and what is your $n$ for the control group?
]

#section_heading("Section 7: Appendix (Bonus/Targeted Practice)")

#ref_box[
  *Untimed Practice.* These are optional, low-pressure questions to keep you sharp!
]

#question(space: 2in)[
  *Bonus 1: Projection Matrix.* In the formula for projecting $a$ onto $b$, you compute $beta = (a^T b) / (b^T b)$. The projection vector is $b beta$. By rearranging the scalars and vectors (using the fact that $a^T b = b^T a$), show that the projection vector can be written as $P a$, where $P$ is the *projection matrix* $P = (b b^T) / (b^T b)$. 
]

#closing_block()
