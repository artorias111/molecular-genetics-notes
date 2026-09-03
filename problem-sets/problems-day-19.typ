#import "../template.typ": *

#sheet(day: "19", title: "The Genotype Likelihood & Spaced Rep")[

  #section_heading("Spaced Repetition: Genetics & Stats")

  #question(space: 1.5in)[
    *Genetics:* Trace the mechanistic pipeline of X-chromosome inactivation. Start from the transcription of the lncRNA XIST and end with the deposition of repressive chromatin marks. Explicitly name the core enzymatic complex recruited by XIST and the specific histone modification it writes.
  ]

  #question(space: 1.5in)[
    *Stats:* You run a differential expression analysis and threshold the results at an FDR of 0.05, yielding 200 significant genes. 
    What exactly does the number 0.05 guarantee about this specific set of 200 genes? How does this mathematically and conceptually differ from thresholding at a FWER (e.g., Bonferroni) of 0.05?
  ]

  #section_heading("Spaced Repetition: CS/Code")

  #question(space: 0.5in)[
    *Rust Borrow Checker:* You have an iterator over a vector of `u32` integers: `let iter = vec.iter();`. The `.iter()` method yields items of type `&u32`.
    You want to keep only the even numbers using `.filter()`. Because `filter` passes a reference to the item, the closure receives `&&u32`. Write the closure in two different ways to correctly handle this:
  ]
  #subpart(space: 1in)[Using pattern matching / destructuring in the closure arguments.]
  #subpart(space: 1in)[Using dereferencing inside the closure body.]

  #section_heading("Calculus & Optimization Practice")

  #question(space: 2in)[
    *Gradient of a Cost Function:* Consider a simple linear regression model $f(x) = w x$ (no intercept). The mean squared error (MSE) cost function for a dataset with $N$ samples $(x_i, y_i)$ is:
    
    $ J(w) = 1/N sum_(i=1)^N (w x_i - y_i)^2 $
    
    Derive the gradient of the cost function with respect to the weight $w$, i.e., calculate $(d J) / (d w)$. Show your steps using the chain rule. 
  ]

  #pagebreak()

  #section_heading("Math/ML: The ANGSD/GL Ladder — Rung 1")

  #ref_box[
    *The Core Genotype Likelihood* \
    Let $D$ be the sequencing read data at a single locus for one individual, consisting of $M$ reads: $D = {b_1, b_2, ..., b_M}$. \
    Let $G \in {A A, A a, a a}$ be the unobserved diploid genotype. \
    Let $Q_j$ be the Phred quality score for read $b_j$.
  ]

  #question(space: 1.5in)[
    From the definition of a Phred score $Q$, write the equation for the probability of a sequencing error $P("error")$. 
    If a read $b_j$ is observed as nucleotide 'A', write down the expression for $P(b_j = A | "true allele is " A)$. 
    Then, write the expression for $P(b_j = A | "true allele is " a)$. *(Assume errors are equally likely among the 3 alternative bases).*
  ]

  #question(space: 2in)[
    Derive the likelihood of the full read data $P(D | G)$ for a heterozygous genotype $G = A a$.
    Show algebraically how the diploid nature of the cell creates a mixture model for each individual read. 
    Express the final $P(D | G = A a)$ as a product over the $M$ reads.
  ]

  #question(space: 1.5in)[
    List every independence assumption required to justify taking the product over the $M$ reads in the previous step. Which of these assumptions is most heavily violated by PCR duplicates?
  ]

  #question(space: 2in)[
    *Adversarial Scenario:* You are staring at a VCF file for your 8.6x cod data. At a specific locus, an individual has 10 reads: 5 are 'A' and 5 are 'T'. All 10 reads have a Phred score of 20. 
    
    A colleague's script outputs the likelihood $P(D | G=A A) = 0.0$ exactly. 
    
    Write down the mathematical expression for $P(D | G=A A)$ for these 10 reads. Is it mathematically 0? If not, what is the rough order of magnitude of the true probability, and why did their script likely output exactly 0.0?
  ]

  #pagebreak()

  #section_heading("Bioinformatics Quick-Fire MCQs")
  
  #question(space: 0.25in)[
    *1. Which of the following file formats is typically used to store unaligned sequencing reads along with their quality scores?* \
    A) FASTA \
    B) BAM \
    C) FASTQ \
    D) VCF
  ]

  #question(space: 0.25in)[
    *2. In a SAM/BAM file, what does a CIGAR string represent?* \
    A) The base quality scores of the read \
    B) The mapping status and alignment operations (matches, insertions, deletions) \
    C) The sequence of the reference genome \
    D) The probability of a structural variant
  ]

  #question(space: 0.25in)[
    *3. What is the primary purpose of the Burrows-Wheeler Transform (BWT) in tools like BWA or Bowtie?* \
    A) To compress the reference genome for highly efficient, memory-friendly string matching \
    B) To calculate the statistical significance of an alignment \
    C) To filter out reads with low base quality scores \
    D) To call single nucleotide polymorphisms (SNPs)
  ]

  #question(space: 0.25in)[
    *4. In standard RNA-seq, which normalization metric adjusts for BOTH sequencing depth and gene length?* \
    A) Raw read counts \
    B) CPM (Counts Per Million) \
    C) TPM (Transcripts Per Kilobase Million) \
    D) Log-fold change
  ]

  #question(space: 0.25in)[
    *5. When performing variant calling, what does "depth of coverage" (or read depth) refer to?* \
    A) The length of the sequencing reads \
    B) The percentage of the genome that is sequenced at least once \
    C) The number of unique reads that align to a specific locus \
    D) The insert size of the paired-end library
  ]

  #closing_block()
]
