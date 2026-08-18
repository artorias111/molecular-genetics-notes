#import "../template.typ": *

#show: sheet.with(
  day: "06",
  title: "Lane A Synthesis - NAHR, Vector Norms, & Estimands"
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
  *Yesterday's Misses:*
  - *Prion Sequence:* The primary amino acid sequence of a normal prion ($"PrP"^"C"$) and an infectious prion ($"PrP"^"Sc"$) are *100% identical*. The mutation is purely structural (epigenetic folding into beta-sheets), not a change in the genome.
  - *Nextflow `.combine()` vs `.join()`:* Use `.join()` when you want to merge two channels based on a matching key (like a sample ID). Use `.combine()` when you want to attach a single, un-keyed value (like a reference genome path) to *every* item in another channel.
  - *Chromodomains vs CTCF:* CTCF binds to insulator regions to form TAD boundaries. The *Chromodomain* (found in proteins like HP1) specifically reads H3K9me3 to initiate the spreading of heterochromatin.
  - *Cohesin:* The ring-like protein complex that extrudes DNA loops until it hits CTCF, forming the TAD boundaries.
]

#pagebreak()

#section_heading("Section 2: Spaced Repetition (5 mins)")

#question(space: 5in)[
  *1. Cued Recall (Fill in the blank):*
  
  (1) [Yesterday] Exact difference in the primary amino acid sequence between $"PrP"^"C"$ and $"PrP"^"Sc"$: __________________________________________________________________
  
  (2) [Yesterday] Nextflow operator used to attach a single un-keyed value (like a reference genome) to every item in a channel: ________________________________
  
  (3) [Yesterday] Algebraic reason that $(y^T X theta)^T$ is exactly equal to $y^T X theta$: ________________________________
  
  (4) [Missed-Day04] Histone mark combination that characterizes a "poised" enhancer: ________________________________
  
  (5) [Missed-Day04] Protein domain (found in HP1) that specifically binds to H3K9me3: ________________________________
  
  (6) [Missed-Day04] Protein complex that bounds Topological Associating Domains (TADs) by physically stalling at CTCF sites: ________________________________
  
  (7) [~Day 02] Exact function of DNMT1 during cell division: ________________________________
  
  (8) [~Day 02] DNA methylation status of the maternal Igf2/H19 Imprinting Control Region (ICR): ________________________________
  
  (9) [Missed Box] `samtools view` parameter used to filter reads based on bitwise flags (e.g., unmapped, paired): ________________________________
  
  (10) [Missed Box] The derivative $nabla_z (z^T z)$ with respect to the vector $z$: ________________________________
]


#pagebreak()

#section_heading("Section 3: Genetics - NAHR (20 mins)")

#ref_box[
  *Reading (5-7 mins):* Genes XII, Chapter 6 (Clusters and Repeats), PDF pages ~564–566. 
  Section: 6.2 Unequal Crossing-Over Rearranges Gene Clusters
]

#question(space: 2.5in)[
  *2. Unequal Crossing-Over.* Two homologous chromosomes misalign during meiosis because of tandemly repeated gene clusters (e.g., globin genes). A crossing-over event occurs in this misaligned region. Trace the exact structural consequence for the two resulting recombinant chromatids. 
]

#question(space: 2.5in)[
  *3. Non-Allelic Homologous Recombination (NAHR).* A genome contains two highly identical LTR retrotransposons situated 500kb apart on the same chromosome in the *same* direct orientation. During meiosis, these two non-allelic repeats pair up and undergo homologous recombination. Trace the structural consequence for the DNA sequence located between these two repeats.
]


#section_heading("Section 4: Math/ML - Norms & Projections (20 mins)")

#ref_box[
  *Reading (5-7 mins):* Linear Algebra. Theory, Intuition, Code.pdf, Chapter 3, PDF pages ~50–54.
  Section: Vector length (magnitude/norm) and Unit vectors.
]

#question(space: 1.5in)[
  *4. L2 Norm.* Given the vector $v = [3, -4, 0]^T$. Compute its $L_2$ norm (length), denoted as $||v||$. Show your arithmetic.
]

#question(space: 1.5in)[
  *5. Unit Vectors.* Using the same vector $v$, compute the corresponding unit vector $hat(v)$ that points in the exact same direction but has a length of exactly 1.
]


#pagebreak()

#section_heading("Section 5: CS / Code (10 mins)")

#question(space: 2in)[
  *6. Rust Lifetimes.* You write a function that returns the longest of two string slices: `fn longest(x: &str, y: &str) -> &str`. The compiler rejects this, demanding lifetime annotations. Rewrite the function signature using the explicit lifetime annotation `<'a>` to tell the compiler that the returned reference will live at least as long as both inputs.
]

#question(space: 2in)[
  *7. Nextflow Combinators.* You have a channel `ch_bams` emitting 3 items, and `ch_vcf` emitting 1 item. You write a process that requires both a BAM and the VCF. Write the Nextflow channel manipulation snippet that will yield a channel emitting 3 items, where each item is a tuple of the BAM and the VCF.
]

#pagebreak()

#section_heading("Section 6: Stats (5 mins)")

#ref_box[
  *Concept 1: Estimand* — What single number am I trying to know? Write it as a sentence *before* running any code.
]

#question(space: 1.5in)[
  *8. Defining the Estimand.* You are designing a single-cell RNA-seq experiment comparing tumor cells to healthy adjacent tissue. You want to see if the gene *TP53* is downregulated. Before writing any differential expression code (e.g., DESeq2 or Seurat), define the strict estimand for this biological question in one sentence.
]

#section_heading("Section 7: Appendix (Bonus/Targeted Practice)")

#ref_box[
  *Untimed Practice.* These are optional, low-pressure questions to keep you sharp!
]

#question(space: 2in)[
  *Bonus 1: Transpose Matrix Algebra.* Expand $(X beta - y)^T (X beta - y)$. (Hint: Apply the LIVE EVIL rule to the cross terms and remember they are scalars).
]

#question(space: 2in)[
  *Bonus 2: Easy Biology.* If a deletion occurs via NAHR and removes an entire enhancer region but leaves the promoter and gene body intact, trace the consequence for the expression of that gene in the specific tissue where that enhancer was active.
]

#closing_block()
