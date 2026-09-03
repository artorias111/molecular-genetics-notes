#import "../template.typ": *

#show: sheet.with(
  day: "17",
  title: "Lane A Synthesis - Charge Neutralization, Sigmoids, & Rust Borrowing"
)

#section_heading("Section 1: Spaced Repetition Review (Untimed)")

#ref_box[
  *Yesterday's Misses & Clarifications:*
  - *FDR vs FWER:* Use *FDR* (False Discovery Rate) when screening (e.g., RNA-seq) because you can tolerate a known proportion of false positives to get candidates. Use *FWER* (e.g., Bonferroni) when you need strict control against even *one* false positive (e.g., FDA trials).
  - *XCI Mechanism:* *XIST* RNA coats the chromosome *in cis*, recruiting *PRC2*. PRC2 is a methyltransferase that deposits *H3K27me3* (a repressive mark) to shut down transcription.
  - *Rust `.filter()`:* Iterating over a collection of references yields double references. The closure in `.filter()` must handle `&&T` (e.g., `|&&q| q > 30` or `|q| **q > 30`).
  - *Linear Algebra:* You cannot add a scalar directly to a matrix. You must multiply the scalar by the Identity matrix (e.g., $X^T X + lambda I$).
  - *GMM Covariances:* Spherical = perfect circles. Diagonal = axis-aligned ellipses. Full = tilted/rotated ellipses.
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 3.5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Day 16] If you are running a GWAS with 1 million SNPs and want to find a list of candidate genes for future study, which multiple testing correction should you use? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (2) [Day 16] To physically silence the X chromosome, XIST RNA recruits the protein complex \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
  
  (3) [Day 16] The protein complex from the previous question deposits which specific repressive histone mark? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (4) [Day 16] Complete this Rust filter closure to successfully compile: `.filter(|___q| q > 30)` (Assume the iterator yields `&u8`).
  
  (5) [Day 16] In a Gaussian Mixture Model, using a "Full" covariance matrix allows the clusters to take the shape of \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
  
  (6) [Day 16] Fix this invalid matrix algebra expression: $A + 5$. \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
  
  (7) [Day 11] Which two histone marks, when found together, uniquely define a "poised" enhancer? \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
]

#pagebreak()

#section_heading("Section 3: Genetics - Chromatin Accessibility (20 mins)")

#ref_box[
  *Tutor Note:* We are dialing the biology difficulty back just a notch today to focus on a highly intuitive, purely mechanistic, biochemical concept: Charge. 
]

#question(space: 4.5in)[
  *2. The Biochemistry of Open Chromatin.* Histone Acetyltransferases (HATs) and Histone Deacetylases (HDACs) are the classic "on/off" switches for chromatin accessibility.
  
  *(a)* DNA is highly negatively charged. Why? (Name the specific chemical group in the DNA backbone responsible for this).
  
  *(b)* Histone tails are rich in the amino acid Lysine. At physiological pH, what is the electrical charge of an unmodified Lysine residue?
  
  *(c)* Mechanistically, explain exactly how the addition of an acetyl group by a HAT leads to the physical "opening" or "loosening" of chromatin. (Focus on the physics/electrostatics, not just "it recruits readers").
]

#pagebreak()

#section_heading("Section 4: Math/ML - The Sigmoid Derivative (15 mins)")

#question(space: 5in)[
  *3. The Logistic Function.* In Logistic Regression, we squash our linear output into a probability between 0 and 1 using the sigmoid function:
  
  $ g(z) = 1 / (1 + e^(-z)) $
  
  To perform gradient descent, we need to know the derivative of this function with respect to $z$.
  
  *(a)* Using the quotient rule (or chain rule), calculate $g'(z)$.
  
  *(b)* Manipulate your result from (a) to prove that the derivative can be elegantly rewritten in terms of the function itself: 
  
  $ g'(z) = g(z)(1 - g(z)) $
  
  *(Hint: You will need to add and subtract a term in the numerator to get things to factor cleanly!)*
]

#pagebreak()

#section_heading("Section 5: CS / Code - Rust Ownership (10 mins)")

#question(space: 4in)[
  *4. Moving vs Borrowing.* You are writing a FASTQ parser in Rust. You read a sequence into a `String` and want to calculate its GC content and its length.
  
  ```rust
  fn print_length(seq: String) {
      println!("Length: {}", seq.len());
  }
  
  fn main() {
      let my_seq = String::from("ATGCGTA");
      print_length(my_seq);
      
      // Now I want to do something else with it
      println!("Original sequence was: {}", my_seq);
  }
  ```
  
  *(a)* The compiler throws a "borrow of moved value" error on the final `println!`. Mechanistically, what happened to the memory backing `my_seq` when it was passed to `print_length`?
  
  *(b)* Rewrite the function signature of `print_length` and the function call in `main` so that `my_seq` is only *borrowed*, allowing the final `println!` to execute successfully.
]

#closing_block()
