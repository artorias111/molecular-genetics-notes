#import "../template.typ": *

#show: sheet.with(
  day: "09",
  title: "Lane A Synthesis - Positive Definiteness, TADs/Hi-C, & Blocking"
)



#section_heading("Section 1: Spaced Repetition Review (Untimed)")

#ref_box[
  *Yesterday's Misses & Clarifications:*
  - *NAHR Inverted Repeats:* If a chromosome loops back on itself to pair two *inverted* repeats, the crossover resolves by flipping the entire region between them. This causes an *inversion*, not a deletion/duplication. You correctly noted that the Y chromosome uses this mechanism to "self-correct" (gene conversion) without a homolog, but the physical structural consequence of a single crossover between inverted repeats is an inversion.
  - *Poised Enhancer Marks:* You wrote `H3K4me3`, but that is the mark for an *active promoter*. A poised enhancer is marked by *H3K4me1* (enhancer) PLUS *H3K27me3* (repressive).
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 4in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Yesterday] Exact structural consequence for the DNA sequence located between two *inverted repeats* that undergo a single homologous recombination crossover: ________________________________
  
  (2) [Yesterday] The algebraic expansion of the quadratic form $x^T A x$ for a $2 times 2$ symmetric matrix $A$: ________________________________
  
  (3) [Yesterday] Rust syntax to define a struct `Point` generic over type `T`: ________________________________
  
  (4) [Yesterday] Definition of a "confounder" in experimental design: ________________________________
  
  (5) [Missed-Day08] The two histone marks that characterize a "poised" enhancer: ________________________________
  
  (6) [~Day 07] The algebraic formula for the orthogonal projection of vector $a$ onto vector $b$: ________________________________
  
  (7) [~Day 07] The exact structural mechanism (involving repeats) that generates an $alpha^"thal-1"$ deletion (where *both* alpha-globin genes are lost): ________________________________
  
  (8) [~Day 02] Nextflow operator used to attach a single un-keyed value to every item in a channel: ________________________________
  
  (9) [~Day 02] Protein domain (found in HP1) that specifically binds to H3K9me3: ________________________________
  
  (10) [~Day 01] Geometric meaning of two vectors whose dot product is zero: ________________________________
]


#pagebreak()

#section_heading("Section 3: Math/ML - Quadratic Forms & Positive Definiteness (25 mins)")

#ref_box[
  *Reading (5-7 mins):* Linear Algebra. Theory, Intuition, Code.pdf. Look up the definition of a *Positive Definite Matrix*. 
  Concept: A symmetric matrix $A$ is positive definite if its quadratic form $x^T A x > 0$ for *all* non-zero vectors $x$. This is the matrix equivalent of a positive number, and it ensures functions like cost functions have a unique global minimum.
]

#question(space: 2.5in)[
  *2. Proving Positive Definiteness.* Let $A = mat(3, 1; 1, 3)$. You proved yesterday that $x^T A x = a_11 x_1^2 + 2 a_12 x_1 x_2 + a_22 x_2^2$. Plug in the values of $A$ and use "completing the square" algebra on the resulting polynomial to rigorously prove that $x^T A x > 0$ for all non-zero $x$.
]

#question(space: 2in)[
  *3. The Identity Matrix.* Prove that the Identity matrix $I$ is positive definite. What is the geometric meaning of $x^T I x$?
]

#question(space: 2in)[
  *4. The Covariance Matrix.* In machine learning, $X^T X$ is the Gram/Covariance matrix. Prove that for *any* matrix $X$, the matrix $(X^T X)$ is at least Positive Semi-Definite (meaning $v^T (X^T X) v >= 0$ for all $v$). Hint: Use matrix grouping/associativity on the $v$ and $X$.
]


#pagebreak()

#section_heading("Section 4: CS / Code (10 mins)")

#question(space: 3in)[
  *5. Trait Bounds on Structs vs Impls.* You have a generic struct `struct Dataset<T> { data: Vec<T> }`. You want to implement a `.mean()` method, but this method should *only* exist if `T` is a floating-point number. Write the `impl` block syntax that provides the `.mean()` method, using a trait bound on the `impl` block itself so it only applies when `T` implements the `Float` trait.
]

#section_heading("Section 5: Stats (5 mins)")

#ref_box[
  *Concept 4: Blocking/Batch* — What varies between groups that isn't the thing I care about? 
]

#question(space: 2.5in)[
  *6. Experimental Blocking.* You are testing a drug on mice. You have 10 male mice and 10 female mice. Sex is known to strongly affect baseline expression of your target gene. You want 10 treated mice and 10 control mice. How exactly do you assign the mice to the Treatment and Control groups to "block" on sex?
]

#pagebreak()

#section_heading("Section 6: Genetics - Hi-C, Alignments, and TADs (20 mins)")

#ref_box[
  *Reading:* Lewin's Genes XII, synthesize concepts from Chapter 6 (Clusters/Repeats) and Chapter 30 (Chromatin Structure) with bioinformatics output.
]

#question(space: 4in)[
  *7. Structural Genomics & Alignments.* You are running a Hi-C experiment to map Topological Associating Domains (TADs). Hi-C works by crosslinking DNA that is physically close in 3D space, cutting it, and ligating the ends together, forming chimeric DNA fragments. You sequence these fragments with paired-end sequencing. 
  
  You align the paired-end reads to the reference genome using `bwa-mem2`. You then generate a contact matrix (a heatmap where axes are genomic coordinates, and pixel intensity is the number of reads linking two loci). 
  
  If the cohesin complex is genetically deleted from the cells before the Hi-C experiment, explain:
  1. What specifically changes in the visual output of the Hi-C contact matrix? 
  2. How would this biological loss-of-function manifest *at the raw alignment level*? (i.e., If you looked at the `bwa-mem2` BAM file, what specific pattern of paired-end read mapping distances would you see disappear?)
]

#closing_block()
