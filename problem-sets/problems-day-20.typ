#import "../template.typ": *

#sheet(day: "20", title: "Evidence, genotypes, and accessible DNA")[
  *One question to carry today:* what did we measure, and what are we trying to infer?
  This is a fresh entry point. Days 18–19 are not prerequisites.
  Short equations, arrows and labeled sketches are enough.

  #v(0.5em)
  #daily_timer()
  #v(0.5em)
  The primer in each section counts as reading time. Stop at 60 minutes and return
  unfinished work as-is. There is no required external reading today.

  #pagebreak()
  #section_heading("1. Spaced repetition · 10 min")
  #question(space: 3.5in)[
    *Matrix repair [Day 16 feedback].* A model adds a penalty of 5 to each diagonal
    entry of $A = mat(2, -1; -1, 3)$. Write the resulting matrix and express the
    operation using $A$ and an identity matrix. (Here “diagonal” means top-left to bottom-right.)
  ]
  #pagebreak()
  #question(space: 3.8in)[
    *Resampling repair [earlier bootstrap confusion].* Four individuals are labeled
    A, B, C and D. A bootstrap replicate draws four labels *with replacement*.
    Give one possible replicate that contains a repeated individual. Explain, in one
    sentence, how replacing a drawn label allows both duplicates and omissions.
  ]

  #pagebreak()
  #section_heading("2. Math · 20 min total, including reading and working pages")
  #ref_box[
    *Read for about 5 minutes: reversing a conditional.*
    $P(T=1 | C=1)$ is read “probability of a positive test, given the condition is present.”
    The bar means *given*. It does not reverse automatically.

    A *prior* describes the condition before the test; a *posterior* describes it after
    using the test result. To reverse the direction, combine the two ways a positive
    test can arise:
    #text(size: 9pt)[$ P(C=1 | T=1) =
      (P(T=1 | C=1) P(C=1)) /
      (P(T=1 | C=1) P(C=1) + P(T=1 | C=0) P(C=0)). $]
    The denominator is the total probability of a positive test. It adds the two
    mutually exclusive routes: condition present, or condition absent.
  ]
  #pagebreak()
  #question(space: 3.8in)[
    *Bishop Exercise 2.1 — original toy screening values, paraphrased.*
    Let $C=1$ mean cancer is present and $T=1$ mean the test is positive.
    Use $P(C=1)=0.001$, $P(T=1 | C=1)=0.90$, and $P(T=1 | C=0)=0.03$.
    Calculate $P(C=1 | T=1)$, showing both terms in the denominator.
    An exact fraction is enough. Explain what those two terms count in a hypothetical
    group of 100,000 tested people; use this to interpret your result.
  ]
  #text(size: 9pt)[
    Source: Bishop & Bishop, *Deep Learning*, §2.1.2–2.1.5, printed pp.26–31
    (PDF pp.46–51); Ex.2.1, printed p.58 = PDF p.78. The supplied primer replaces
    external reading today. Read the book's worked screening example only after your attempt.
  ]

  #pagebreak()
  #section_heading("2. Math, continued · same 20-minute budget")
  #ref_box[
    *The connection to your low-coverage genomes.*
    $D$ denotes observed reads at one site in one individual; $G$ is the unknown
    diploid genotype: AA, AT or TT. A *genotype likelihood* $L(G)=P(D | G)$ compares
    proposed genotypes while keeping the reads fixed.

    The *posterior* is $P(G | D)$. Bayes' rule becomes:
    $ P(G=g | D) = (L(g) P(G=g)) /
      (sum_(h in {"AA", "AT", "TT"}) L(h) P(G=h)). $
    $g$ is the genotype being evaluated; $h$ runs through AA, AT, TT.
    The summation sign means “add those three terms.”
  ]
  #text(size: 9pt)[
    Sources: Bishop §2.3.2, printed pp.37–38 = PDF pp.57–58;
    #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods")[ANGSD: Genotype Likelihoods, Beagle output].
    Invented toy GLs; no extra reading or software assigned.
  ]
  #pagebreak()
  #question(space: 3.8in)[
    *Tutor application of Bishop's probability rules to GLs.*
    For the same observed data, a toy model gives:
    #v(0.4em)
    #table(columns: (1fr, 1fr, 1fr), inset: 6pt,
      [*AA*], [*AT*], [*TT*], [$L=0.8$], [$L=0.4$], [$L=0.1$])
    #v(0.4em)
    Report the likelihood ratio of AA relative to AT.
    A colleague now calls the normalized value $0.8/(0.8+0.4+0.1)$ the posterior
    probability of AA. Identify the assumption about genotype priors that would make
    this calculation valid.
  ]


  #pagebreak()
  #section_heading("3. Biology · 20 min total, including reading and working pages")
  #ref_box[
    *Read for about 4 minutes: DNA as a protected substrate.*
    A nucleosome core contains a histone octamer with roughly 147 base pairs (bp) of
    DNA wrapped around it. Linker DNA connects neighboring cores.
    Micrococcal nuclease (MNase) initially cuts accessible linker DNA more readily
    than protected core DNA. Partial digestion can leave fragments containing several
    neighboring nucleosomes; continued digestion releases shorter protected fragments.
    A change in fragment size can therefore report how DNA is packaged.
  ]
  #pagebreak()
  #question(space: 3.8in)[
    *Genes XII §8.2 — reconstruct the experiment.*
    An idealized chromatin array has one 147-bp core plus 53 bp of linker per repeat.
    A partial MNase digest gives bands near 200, 400 and 600 bp. Sketch three neighboring
    nucleosomes, label core and linker DNA, and show how cutting different linkers
    produces the three bands. Use your drawing to explain why the ladder is evidence
    for repeated protection of one continuous DNA molecule.
  ]
  #text(size: 9pt)[
    Source: Lewin's *Genes XII* (2018), §8.2, PDF pp.733–739, especially the nucleosome
    ladder in Fig.8.3. This ebook has no verified printed-page mapping. The primer supplies
    today's required reading; revisiting the figure must fit the same biology slot.
  ]

  #pagebreak()
  #section_heading("3. Biology, continued · same 20-minute budget")
  #ref_box[
    *An assay bridge: ATAC-seq.*
    ATAC-seq uses Tn5 transposase to insert sequencing adapters into accessible DNA in
    native chromatin. A local concentration of recovered insertion events is called a
    *peak*. This measures access to DNA; RNA abundance is a different measurement.
    For this toy experiment, compare the same purified cell type, with comparable
    library quality and normalized sequencing depth. Ignore copy-number differences.
  ]
  #pagebreak()
  #question(space: 3.8in)[
    *From packaging to a biological claim.*
    After perturbing a chromatin regulator, an ATAC peak near a gene's promoter rises.
    Draw a short causal chain from a possible local nucleosome change to increased
    recovered insertion events. Then a colleague claims, “This gene must now make
    more RNA.” Propose one measurement that tests that claim, explaining why the
    ATAC observation alone leaves it unresolved.
  ]
  #text(size: 9pt)[
    Mechanistic foundation: Genes XII §8.2 and §8.11 (PDF p.817 onward; future reading).
    Assay source: Buenrostro et al. (2013),
    #link("https://doi.org/10.1038/nmeth.2688")[doi:10.1038/nmeth.2688].
    The assay primer is supplied here; the paper is not additional homework.
  ]

  #pagebreak()
  #section_heading("4. Stats · 5 min")
  #question(space: 3.8in)[
    *What is the replicate?*
    A study compares promoter accessibility between a disease group and a control group.
    It samples three independent donors per group and measures 10,000 nuclei from each
    donor. The target is a difference that generalizes to *donors*, not just these sampled
    nuclei. State the number of independent biological replicates per group and explain
    why treating every nucleus as an independent donor would exaggerate the evidence.
  ]
  #pagebreak()
  #ref_box[
    *Close the hour.* Use the five-minute buffer if needed, then stop.
    Record actual minutes if you tracked them:

    Review: #raw("____")  Math: #raw("____")

    Biology: #raw("____")  Stats: #raw("____")

    Mark the point where you stopped. Return the sheet without checking an answer key.
  ]
  #v(1em)
  *Optional Python · at most 10 extra minutes.*
  Task 001 in #raw("projects/lcwgs-lab/current-task.md"): turn a Phred quality into an
  error probability. This has its own budget and is not part of today's grade.
  If skipped, the same task stays available. Submit or mark it ready only when you want review.
]
