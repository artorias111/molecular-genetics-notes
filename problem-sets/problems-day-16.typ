#import "../template.typ": *

#show: sheet.with(
  day: "16",
  title: "Lane A Synthesis - The Return of Gradients, Multiple Testing, & XCI"
)

#section_heading("Section 1: Spaced Repetition Review (Untimed)")

#ref_box[
  *Yesterday's Misses & Clarifications:*
  - *EM Algorithm:* E-step calculates the "soft guesses" (probabilities) of the *hidden labels* for each point. M-step updates the *parameters* ($mu, sigma^2$) using a weighted average based on those soft guesses.
  - *Polymerase Directionality:* DNA Polymerase synthesizes strictly $5' -> 3'$. It absolutely requires a free *3'-OH group* to attach the next nucleotide. When the 5'-most RNA primer is removed, there is no upstream 3'-OH, creating the end-replication problem.
  - *Rust Iterators & References:* `.iter()` yields references (`&T`). Therefore, closures inside `.filter(|x| ...)` receive a double reference (`&&T`). You must dereference it (e.g., `|&x| *x > 20` or `|x| **x > 20`) to compare it to a raw value.
  - *Boosting Power:* To increase Statistical Power, you can increase sample size ($N$), increase the **Effect Size** (e.g., higher drug dose), or reduce technical variance/noise.
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 3.5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Day 15] During the Expectation-Maximization algorithm, which step computes the posterior probability of the hidden labels for each data point? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (2) [Day 15] During the EM algorithm, which step updates the model parameters ($mu, sigma^2$)? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (3) [Day 15] DNA Polymerase strictly requires a free \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ group to attach the next nucleotide.
  
  (4) [Day 15] If you have a `Vec<i32>`, the closure in `.iter().filter(|x| ...)` receives `x` as what exact Rust type? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (5) [Day 15] Name one experimental lever to boost statistical power *other* than increasing the sample size ($N$). \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (6) [Day 14] With a massive sample size (e.g., $N=2,000,000$), what happens to the p-value of a tiny, biologically irrelevant difference? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (7) [Day 14] In a mammalian cell, spontaneous deamination of 5-methylcytosine (5mC) produces what base? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (8) [Day 13] In scRNA-seq, which barcode is used to computationally collapse PCR duplicates? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (9) [Day 13] Bootstrapping a mean from 50 data points requires sampling 50 points *with* \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
  
  (10) [Day 11] Which two histone marks, when found together, uniquely define a "poised" enhancer? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
]

#pagebreak()

#section_heading("Section 3: Math/ML - The Return of Gradients (20 mins)")

#question(space: 5in)[
  *2. Weighted Ridge Regression.* You are fitting a model where some training examples are more trustworthy than others. You use a symmetric, diagonal weight matrix $W$. Your cost function is:
  
  $ J(theta) = (X theta - y)^T W (X theta - y) + lambda theta^T theta $
  
  *(a)* Expand the polynomial. Use the transpose rule to combine the scalar cross-terms into a single term. (Hint: $(A B C)^T = C^T B^T A^T$, and $W^T = W$).
  
  *(b)* Take the gradient $nabla_theta J(theta)$.
  
  *(c)* Set the gradient to zero, factor out $theta$, and algebraically isolate $theta$ to find the closed-form solution. (Remember to multiply by the inverse, do not "divide" by matrices!).
]

#pagebreak()

#question(space: 4in)[
  *3. The E-Step (Bayes' Theorem).* You asked for EM alongside gradients! In a Gaussian Mixture Model (GMM) with 2 clusters, let $z^(i)$ be the hidden label for data point $x^(i)$. 
  
  You know the prior probability of each cluster: $P(z=1) = phi_1$ and $P(z=2) = phi_2$.
  You know the probability densities (likelihoods) for each cluster: $P(x^(i) | z=1) = cal(N)(x^(i) | mu_1, Sigma_1)$ and $P(x^(i) | z=2) = cal(N)(x^(i) | mu_2, Sigma_2)$.
  
  During the E-step, you must calculate the "responsibility" (the posterior probability) that data point $i$ belongs to cluster 1. 
  
  Using Bayes' Theorem, write the exact algebraic formula for $P(z^(i)=1 | x^(i))$ in terms of the priors and likelihoods given above.
]

#pagebreak()

#section_heading("Section 4: CS / Code - Rust Iterator References (10 mins)")

#question(space: 3.5in)[
  *4. Battling the Borrow Checker.* You write the following Rust code to filter out low mapping qualities:
  
  ```rust
  let qualities: Vec<u8> = vec![60, 20, 10, 45, 0];
  let high_qual: Vec<u8> = qualities.iter()
      .filter(|q| q > 30)
      .map(|q| q + 5)
      .collect();
  ```
  
  The compiler throws an error on `q > 30` saying: `no implementation for &&u8 > {integer}`. 
  
  Rewrite the `.filter()` and `.map()` lines to correctly handle the references. Show at least two valid ways to fix the `.filter()` closure.
]

#pagebreak()

#section_heading("Section 5: Stats - Multiple Testing (5 mins)")

#ref_box[
  *Concept 11: Multiple Testing* — FDR (False Discovery Rate) controls the expected *proportion* of false positives among your hits. FWER (Family-Wise Error Rate, e.g., Bonferroni) strictly controls the probability of making even *one* false positive.
]

#question(space: 3.5in)[
  *5. FDR vs FWER.* 
  
  *(a)* You run an RNA-seq experiment screening 20,000 genes to find candidates for a downstream pathway analysis. Which correction (FDR or FWER) should you use, and why?
  
  *(b)* You run a Phase III clinical trial testing a single new drug on 5 different primary endpoints. To get FDA approval, the drug must show significance on *any* of the 5 endpoints. Which correction (FDR or FWER) should you use for your 5 p-values, and why?
]

#pagebreak()

#section_heading("Section 6: Genetics - X-Chromosome Inactivation (20 mins)")

#question(space: 4.5in)[
  *6. Dosage Compensation.* In female mammals, one X chromosome must be silenced to equalize gene dosage with males. This massive epigenetic event is orchestrated by a famous long non-coding RNA (lncRNA).
  
  *(a)* What is the name of this lncRNA, and from which chromosome is it transcribed (the active one or the soon-to-be inactive one)?
  
  *(b)* Describe the mechanistic sequence of events: How does this RNA physically coat the chromosome, and what specific protein complex does it recruit to establish the repressive heterochromatin state? (Hint: Think about the repressive histone mark deposited).
]

#pagebreak()

#section_heading("Section 7: Bonus - Bioinformatics MCQs (30 mins)")

#ref_box[
  *Bonus Challenge:* Write the letter of the correct answer and briefly justify your choice.
]

#question(space: 2in)[
  *7. EM Algorithm.* In a Gaussian Mixture Model, if you change your covariance matrices from "spherical" (diagonal with equal variances) to "full" (allowing off-diagonal covariance), what geometric shape will your clusters be allowed to take?
  (A) Perfect spheres of varying sizes.
  (B) Axis-aligned ellipses.
  (C) Tilted/rotated ellipses.
  (D) Non-convex crescents.
]

#question(space: 2in)[
  *8. Multiple Testing.* The Benjamini-Hochberg procedure is a widely used method in bioinformatics to control the:
  (A) Family-Wise Error Rate (FWER)
  (B) False Discovery Rate (FDR)
  (C) Positive Predictive Value (PPV)
  (D) Type II Error Rate ($beta$)
]

#question(space: 2in)[
  *9. Rust Iterators.* Which iterator adapter would you use if you have a `Vec<Option<i32>>` and want to simultaneously filter out the `None` values and unwrap the `Some` values into a `Vec<i32>`?
  (A) `.filter()`
  (B) `.map()`
  (C) `.filter_map()`
  (D) `.flatten()`
]

#question(space: 2in)[
  *10. Epigenetics.* The Polycomb Repressive Complex 2 (PRC2) is responsible for depositing which of the following histone marks?
  (A) H3K4me3
  (B) H3K9ac
  (C) H3K27me3
  (D) H3K36me3
]

#question(space: 2in)[
  *11. Telomeres.* The RNA component of human telomerase (TERC) contains the sequence `3'-CAAUCCCAA-5'`. Which sequence will be synthesized onto the 3' end of the telomeric DNA?
  (A) 5'-CAAUCCCAA-3'
  (B) 5'-GTTAGGGTT-3'
  (C) 5'-CAACCCAAA-3'
  (D) 5'-GUUAGGGUU-3'
]

#closing_block()
