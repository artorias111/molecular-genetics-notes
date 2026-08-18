#import "../template.typ": *

#show: sheet.with(
  day: "01",
  title: "Lane A Synthesis - Linear & Sequence Foundations"
)

#section_heading("Timer")

#timer_table(
  genetics: "25m",
  math: "20m",
  code: "10m",
  total: "55m"
)

#section_heading("Section 1: Genetics (20 mins)")

#ref_box[
  *Reading (8-10 mins):* Genes XII, Chapter 29 (Chromatin), pages ~830–835 (Nucleosomes and TADs).
]

#question(space: 1.5in)[
  *1.* You observe a dramatic upregulation of a proto-oncogene. Hi-C data shows that a TAD boundary between this gene and a highly active super-enhancer is missing. If you sequence the CTCF binding sites at this former boundary, what specific mutation (or inversion) would you expect to find that explains the collapse of loop extrusion here?
]

#question(space: 1.5in)[
  *2.* You are designing a synthetic DNA construct and want to artificially insulate a promoter from a downstream enhancer. Sketch the arrangement of CTCF binding motifs (indicating orientation with arrows) you would insert between them, and explain how cohesin would interact with this arrangement to form a new TAD boundary.
]

#pagebreak()

#section_heading("Section 2: Math/ML (15 mins)")

#ref_box[
  *Reading (5-7 mins):* CS 229 notes Andrew Ng.pdf, Chapter 1 (Supervised Learning), pages 3–6 (up to the LMS update rule).
]

#question(space: 2in)[
  *3. Derive it.* Get from the definition of the single-example cost function $J(theta) = 1/2 (h_theta(x) - y)^2$ to the gradient $partial / (partial theta_j) J(theta)$. Show your steps.
]

#question(space: 1.5in)[
  *4.* What is the geometric interpretation of the dot product $x^T y = 0$?
]

#section_heading("Section 3: CS / Code (10 mins)")

#ref_box[
  *Reading:* Rust in a Month of Lunches.pdf, Chapter 2, pages 15–20 (Strings vs String Slices).
]

#question(space: 1.5in)[
  *5.* In Rust, what is the core difference between `String` and `&str` in terms of memory ownership?
]

#question(space: 1.5in)[
  *6. Point out the error.* Identify why the following code fails to compile. Which rule is violated?
  #code_block(lang: "rust", "fn main() {
    let s1 = String::from(\"hello\");
    let s2 = s1;
    println!(\"{}\", s1);
}")
]

#pagebreak()

#section_heading("Section 4: Appendix (Fun / Chill)")

#ref_box[
  *Note:* This section is excluded from the 45-minute timer. Attempt only if you have time to kill.
]

#question(space: 1.5in)[
  *Bonus 1 (Trace it):* What exact output is printed when this Python code is executed?
  #code_block(lang: "python", "print([x * 2 for x in range(3)])")
]

#question(space: 1.5in)[
  *Bonus 2 (Math):* What is the derivative of $f(x) = e^(2x)$?
]

#question(space: 1.5in)[
  *Bonus 3 (Code):* You have a dictionary `freq = {\"A\": 10, \"C\": 5}`. Write a safe one-liner to get the frequency of `\"G\"` without throwing a KeyError (defaulting to 0).
]

#closing_block()
