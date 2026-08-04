#import "../template.typ": *

#show: sheet.with(
  day: "01",
  title: "Lane A Synthesis - Linear & Sequence Foundations"
)

#section_heading("Timer")

#timer_table(
  reading: "10m",
  drill: "15m",
  written: "20m",
  total: "45m"
)

#section_heading("Section 1: Genetics (20 mins)")

#ref_box[
  *Reading (8-10 mins):* Genes XII, Chapter 29 (Chromatin), pages ~830–835 (Nucleosomes and TADs).
]

#question(space: 1.5in)[
  *1.* Briefly describe the role of CTCF and cohesin in loop extrusion. Why is the orientation of the CTCF binding motifs critical for this process?
]

#question(space: 1.5in)[
  *2.* Given a Hi-C contact matrix representing a TAD, dimension-check the matrix (i.e. what are the axes and shape?) and sketch the visual pattern that indicates a TAD boundary.
]

#pagebreak()

#section_heading("Section 2: Math/ML (15 mins)")

#ref_box[
  *Reading (5-7 mins):* CS 229 notes Andrew Ng.pdf, Chapter 1 (Supervised Learning), pages 3–6 (up to the LMS update rule).
]

#question(space: 2in)[
  *3. Derive it.* Get from the definition of the single-example cost function $J(theta) = 1/2 (h_theta(x) - y)^2$ to the gradient $partial / (partial theta_j) J(theta)$. Show your steps.
]

#question(space: 1in)[
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
  *Bonus (Trace it):* What exact output is printed when this Python code is executed?
  
  #code_block(lang: "python", "def gen():
    for i in range(2):
        yield i
        yield i * 10

result = list(gen())
print(result)")
]

#closing_block[Stop the timer. Grade your paper, then return it for feedback.]
