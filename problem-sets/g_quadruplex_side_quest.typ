#import "../template.typ": *

#show: sheet.with(
  day: "Side Quest",
  title: "Advanced pG4 Detection: Algorithms, Topologies, & Rust Edge Cases"
)

#section_heading("Part 1: Algorithmic Edge Cases & Topology")

#question(space: 4in)[
  *Q1. The Regex Trap & Overlapping Tracts.* \
  The classic regex approach for finding putative G-quadruplexes (pG4s) is `(G{3,}N{1,7}){3}G{3,}`. While computationally trivial, it is biologically inadequate. 
  
  First, identify three specific, biologically validated structural exceptions to this canonical rule that a naive regex would completely miss (consider bulges, loop anomalies, or alternative stem lengths). 
  
  Second, consider the sequence `TTAGGGGGGTT`. A naive regex engine or sliding window might yield overlapping/conflicting matches depending on greediness. In your Rust algorithm, how do you handle contiguous G-runs longer than your minimum stem length? Do you return the maximum spanning G4, enumerate all combinatorial possibilities, or apply a greedy left-to-right approach? Justify your choice biologically.
]

#question(space: 3.5in)[
  *Q2. Topological Constraints & Loop Thermodynamics.* \
  Loop length inversely correlates with G4 thermodynamic stability, but the relationship is highly dependent on strand topology. 
  
  Explain why a 1-nucleotide loop (e.g., a single 'A') strongly biases a G4 toward a *parallel* topology, whereas longer loops permit antiparallel or hybrid (3+1) structures. If your tool detects a sequence with loops of `[1, 1, 1]`, how should your algorithm score its structural predictability compared to a sequence with loops of `[7, 7, 7]`?
]

#pagebreak()

#section_heading("Part 2: Rust Systems Engineering for Genomics")

#question(space: 3.5in)[
  *Q3. Zero-Copy FASTA Parsing & Performance.* \
  You are scanning the 3.2 GB human genome (or larger plant genomes). Explain the memory and performance implications of reading lines into owned `String` variables versus memory-mapping the file and using zero-copy byte slices (`&[u8]`). 
  
  Specifically, why is searching for the byte `b'G'` using a crate like `memchr` orders of magnitude faster than iterating over `.chars()`, and how does UTF-8 validation overhead factor into your architectural decisions for this tool?
]

#question(space: 4in)[
  *Q4. Struct Definitions & Explicit Lifetimes.* \
  Design the core Rust data structures for your tool. Write the exact Rust code to define a `PG4Match<'a>` struct. It must hold a reference to the sequence slice (to avoid allocation), the start index, the stem length, and a vector of the three loop lengths.
  
  Then, write an `impl` block that implements a custom trait `Scorable` for your struct, providing a method `fn penalty_score(&self) -> f32` that calculates a penalty based on the sum of the loop lengths (since longer loops are less stable).
]

#pagebreak()

#section_heading("Part 3: Biological Validation")

#question(space: 4in)[
  *Q5. Orthogonal Cross-Referencing & Competing Structures.* \
  Your Rust tool flags a high-confidence, canonical pG4 sequence in the promoter of an oncogene. However, sequence presence does not guarantee *in vivo* formation. The sequence might be locked in Watson-Crick double-stranded chromatin, or the C-rich complementary strand might form an i-motif that out-competes the G4.
  
  What specific orthogonal genomic sequencing datasets (e.g., highly specific sequencing assays designed for secondary structures or chromatin accessibility) would you computationally cross-reference against your tool's coordinate outputs to strongly infer that the G4 actually forms in living cells? Name at least two specific assays and what they measure.
]

#closing_block()
