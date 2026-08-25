#import "../template.typ": *

#show: sheet.with(
  day: "15",
  title: "Lane A Synthesis - Intro to EM, Power, & End-Replication"
)

#section_heading("Section 1: Spaced Repetition Review (Untimed)")

#ref_box[
  *Yesterday's Misses & Clarifications:*
  - *Matrix Inverse:* You *cannot* distribute a matrix inverse over addition. $(A + B)^(-1) != A^(-1) + B^(-1)$. Stop once you have $(2A^T A + lambda I)^(-1) 2A^T y$. 
  - *Big Data & p-values:* With a massive sample size (e.g., $N=2,000,000$), statistical tests gain so much power that they will flag *any* tiny, biologically irrelevant effect size as "highly significant" (astronomically small p-value). P-value is a function of sample size!
  - *HMM Algorithms:* 
    - *Viterbi:* Finds the single most probable path of hidden states.
    - *Forward-Backward:* Calculates the posterior probability of a specific state by summing over *all possible* paths.
    - *Baum-Welch:* Used to *train* the HMM parameters (transition/emission probabilities) using Expectation-Maximization.
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 3.5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Day 14] True or False: Algebraically, $(X^T X + lambda I)^(-1) = (X^T X)^(-1) + (lambda I)^(-1)$. \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (2) [Day 14] Why does a differential expression test on 2 million cells yield a p-value of $10^(-150)$ even when the log-fold change is a negligible 0.01? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (3) [Day 14] Which dynamic programming algorithm calculates the posterior probability of an HMM state by summing over all possible paths? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (4) [Day 14] Which HMM algorithm is used to *train* the transition and emission probabilities? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (5) [Day 14] Spontaneous deamination of unmethylated Cytosine (C) at an active promoter creates what abnormal DNA base (which is quickly repaired)? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (6) [Day 14] What is the exact closed-form solution for $theta$ in Ridge Regression? $theta = $ \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (7) [Day 13] In bootstrapping, why does drawing 50 points from 50 points result in a slightly different mean every time? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (8) [Day 13] What keyword in Rust cleans up generic trait bounds by moving them to the end of the signature? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (9) [Day 13] During NAHR, a deletion on one chromatid is always accompanied by what specific variant on the other chromatid? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (10) [Day 12] To build a null distribution for a differential expression test, what do you physically shuffle across the dataset? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
]

#pagebreak()

#section_heading("Section 3: Math/ML - Intro to Expectation-Maximization (20 mins)")

#question(space: 4.5in)[
  *2. The EM Intuition.* The Expectation-Maximization (EM) algorithm is used when you want to fit a model to data, but you have *hidden (latent) variables*. 
  
  *Scenario:* You measure the height of 1,000 cells. You suspect there are two distinct sub-populations (e.g., wild-type and mutant), each normally distributed (a Gaussian Mixture Model). However, the cell labels (WT vs Mutant) are *hidden*.
  
  If you knew the labels, you could easily calculate the mean ($mu$) and variance ($sigma^2$) for each group. If you knew $mu$ and $sigma^2$, you could easily guess the labels based on which distribution a cell's height fits best. EM solves this chicken-and-egg problem by iterating between two steps.
  
  *(a) The E-Step (Expectation):* Given random initial guesses for $mu_1, sigma_1^2$ and $mu_2, sigma_2^2$, what specifically do you calculate for every single cell in your dataset?
  
  *(b) The M-Step (Maximization):* Now that you have the output of the E-step, how do you use it to update your estimates for $mu_1, sigma_1^2$ and $mu_2, sigma_2^2$?
]

#pagebreak()

#section_heading("Section 4: CS / Code - Rust Iterators (10 mins)")

#question(space: 3.5in)[
  *3. Functional Chaining.* In Rust, processing collections using iterators and closures is idiomatic and fast. You have a vector of Phred quality scores: `let scores = vec![20, 35, 10, 40, 15];`.
  
  Write a single, chained Rust expression (using `.iter()`, `.filter()`, `.map()`, and `.collect()`) that does the following:
  1. Filters the scores to keep only those strictly greater than 20.
  2. Maps the remaining scores by adding 5 to them.
  3. Collects the result into a new `Vec<u8>`.
  
  *(Hint: the closure syntax in Rust looks like `|x| x > ...`)*
]

#pagebreak()

#section_heading("Section 5: Stats - Statistical Power (5 mins)")

#ref_box[
  *Concept 10: Statistical Power* — The probability that your test will correctly reject the null hypothesis, *given that a true effect actually exists*.
]

#question(space: 3.5in)[
  *4. The Value of "Nothing".* You run an expensive CRISPR screen to see if knocking out Gene Y reduces cancer cell growth. The p-value is 0.45 (not significant). 
  
  Your PI asks: "Does Gene Y have no effect, or did our experiment just fail to detect it?"
  
  *(a)* How does calculating the *Statistical Power* of your experiment before you ran it help answer the PI's question?
  
  *(b)* Name two things you could have increased in your experimental design to boost the statistical power.
]

#pagebreak()

#section_heading("Section 6: Genetics - The End-Replication Problem (20 mins)")

#question(space: 4.5in)[
  *5. Telomeres & Polymerase.* This is a classic "random surprise" mechanistic puzzle. In linear eukaryotic chromosomes, the very ends of the DNA (telomeres) gradually shorten with every cell division in somatic cells.
  
  *(a) The Problem:* Mechanistically, why does the lagging strand inevitably shorten? Focus on the exact biochemical requirement of DNA Polymerase that prevents it from filling in the gap left by the final RNA primer at the extreme 5' end of the newly synthesized strand.
  
  *(b) The Solution:* Stem cells and cancer cells express the enzyme *Telomerase* to fix this. Telomerase is a ribonucleoprotein (it contains both protein and an RNA molecule). How does Telomerase use its own built-in RNA molecule to solve the lagging strand problem?
]

#pagebreak()

#section_heading("Section 7: Bonus - Bioinformatics MCQs (30 mins)")

#ref_box[
  *Bonus Challenge:* Write the letter of the correct answer and briefly justify your choice.
]

#question(space: 2in)[
  *6. Mixture Models.* In a Gaussian Mixture Model trained via the EM algorithm, the "responsibilities" computed during the E-step represent:
  (A) The probability that a specific data point belongs to a specific Gaussian cluster.
  (B) The variance of the specific Gaussian cluster.
  (C) The learning rate of the gradient descent optimizer.
  (D) The categorical true label of the data point.
]

#question(space: 2in)[
  *7. Experimental Design.* Which of the following best describes "Batch Effect"?
  (A) A biological variable that drives the primary difference between groups.
  (B) A technical source of variation that correlates with your biological condition, confounding the results.
  (C) The random noise expected from Poisson sampling in RNA-seq.
  (D) The failure of a sequencer lane leading to data loss.
]

#question(space: 2in)[
  *8. Rust Borrow Checker.* What is the primary difference between `String` and `&str` in Rust?
  (A) `String` is stored entirely on the stack, while `&str` is stored on the heap.
  (B) `&str` owns its data and can be mutated, while `String` is read-only.
  (C) `String` is an owned, heap-allocated, growable buffer, while `&str` is an immutable, borrowed view into a string slice.
  (D) There is no difference; they are aliases for the same underlying type.
]

#question(space: 2in)[
  *9. Alignment Algorithms.* The Burrows-Wheeler Transform (BWT) is heavily utilized by read aligners like BWA and Bowtie. What makes the BWT so useful for genomic alignment?
  (A) It generates a local alignment using affine gap penalties.
  (B) It compresses the reference genome into a suffix array-like structure that allows for $O("length")$ exact string matching.
  (C) It probabilistically models the sequence substitution rates over evolutionary time.
  (D) It relies on an Expectation-Maximization step to handle multi-mapping reads.
]

#question(space: 2in)[
  *10. Structural Variants.* Which sequencing technology is inherently *best* suited for identifying large (e.g., >10kb) structural variants, such as those caused by NAHR, without ambiguity?
  (A) Illumina short-read whole exome sequencing
  (B) 10x Genomics scRNA-seq
  (C) PacBio / Oxford Nanopore long-read sequencing
  (D) Whole-Genome Bisulfite Sequencing
]

#closing_block()
