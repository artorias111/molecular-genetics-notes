#import "../template.typ": *

#show: sheet.with(
  day: "02",
  title: "Lane A Synthesis - Matrix Derivatives & Histone Marks"
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
  *Reading (8-10 mins):* Genes XII, Chapter 27 (Epigenetics I), PDF pages ~2729–2736 (Histone Modifications, Readers/Writers, and Heterochromatin spreading).
]

#question(space: 1.5in)[
  *1.* You perform ChIP-seq on a cell line and find strong enrichment of H3K27ac at a distal intergenic region, but RNA-seq shows absolutely no transcript being produced from the nearest promoter. What other specific histone modification would you assay for to determine if this is a "poised" enhancer waiting for a developmental signal, rather than just an inactive region with residual acetylation?
]

#question(space: 1.5in)[
  *2.* A mutation deletes the chromodomain (the "reader" domain) of the HP1 protein, preventing it from binding to H3K9me3. However, the histone methyltransferase (SUV39H1) remains fully functional. Sketch a diagram showing what happens to a previously well-defined boundary of heterochromatin spreading, and explain the mechanistic failure.
]

#pagebreak()

#section_heading("Section 2: Math/ML (15 mins)")

#ref_box[
  *Reading (5-7 mins):* CS 229 notes Andrew Ng.pdf, Chapter 1 (Supervised Learning), PDF pages 14–16 (Matrix Derivatives and the Normal Equations).
]

#question(space: 1.5in)[
  *3. Dimension check.* Given the design matrix $X in RR^(n times d)$ and target vector $y in RR^n$, what is the exact dimension (shape) of the matrix product $X^T X$, and the dimension of $X^T y$?
]

#question(space: 2in)[
  *4. Derive it.* In the reading, you see that for a symmetric matrix $A$, $nabla_x (x^T A x) = 2 A x$. Prove this for a simple 2D case where $x = [[x_1], [x_2]]$ and $A = [[a, b], [b, c]]$. Expand $x^T A x$ algebraically, take the partial derivatives with respect to $x_1$ and $x_2$, and show it equals $2 A x$.
]

#section_heading("Section 3: CS / Code (10 mins)")

#ref_box[
  *Note:* Increasing the difficulty here since ownership basics are solid.
]

#question(space: 1.5in)[
  *5. Point out the error (Rust).* Explain exactly why the following code fails the borrow checker, and rewrite it so it safely compiles without cloning the string.
  #code_block(lang: "rust", "fn get_first_word(s: &mut String) -> &str {
    let bytes = s.as_bytes();
    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' { return &s[0..i]; }
    }
    &s[..]
}
fn main() {
    let mut text = String::from(\"hello world\");
    let word = get_first_word(&mut text);
    text.clear();
    println!(\"{}\", word);
}")
]

#question(space: 1.5in)[
  *6. Nextflow Channels.* You have a channel `ch_bams` containing `[sample_id, path(bam)]` and a channel `ch_vcf` containing a single `path(vcf)`. You want to run a process that takes `[sample_id, path(bam), path(vcf)]` for every BAM file. If you use `ch_bams.combine(ch_vcf)`, does it work? If `ch_vcf` updates dynamically from a previous process, will `combine` block until the VCF is ready?
]

#pagebreak()

#section_heading("Section 4: Appendix (Drilling Weaknesses)")

#ref_box[
  *Targeted Practice:* ~1 hour budget. Focused on Vector Geometry, Chain Rule, and applied Bioinformatics.
]

#question(space: 1.5in)[
  *Bonus 1 (Geometry):* We established that $x^T y = 0$ means orthogonal vectors. If $x^T y = ||x|| ||y|| cos(theta)$, what is the geometric meaning of $x^T y$ if $x$ is a unit vector ($||x|| = 1$)?
]

#question(space: 1.5in)[
  *Bonus 2 (Chain Rule):* Let $z = W x - y$ (where $z$ is a vector of errors). Let the scalar loss $L = z^T z$. What is the gradient of $L$ with respect to the vector $z$ (i.e., $nabla_z L$)?
]

#question(space: 1.5in)[
  *Bonus 3 (Bioinformatics CLI):* You have a SAM file (`alignments.sam`). Write a one-liner using `awk` or `samtools` to count the exact number of reads that are perfectly mapped (assume perfect matches have a CIGAR string of exactly `100M` for 100bp reads, or use the `NM:i:0` tag).
]

#closing_block()
