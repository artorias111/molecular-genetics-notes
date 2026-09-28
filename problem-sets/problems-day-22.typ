#import "../template.typ": *
#let source(body) = { set text(size: 9pt); ref_box(body) }

#sheet(day: "22", title: "Average over what you cannot observe")[
  *Today's connection:* when you do not know which chromosome supplied a read,
  keep both possible origins in the calculation. In chromatin, keep a modification
  separate from the protein that recognizes it.

  #daily_timer()
  #v(0.7em)
  Seven questions. Source boxes name the exact book section and PDF viewer pages.
  The supplied primers are the required reading and count inside the hour; textbook
  pointers do not add homework. Every question has generous blank working space.

  Day 21 showed that Bernoulli normalization, expectation and Phred conversion are
  ready to build on. We will repair the three-state Bayes denominator and assay
  interpretation while taking the next small step. No coding is required.

  #pagebreak()
  #section_heading("1. Spaced repetition · 10 min for Q1–Q2")
  #ref_box[
    *Day 21 correction: keep the three routes separate.*
    With genotype $G$ and fixed reads $D$, let $L(g)=P(D | G=g)$.
    The total probability of the data is
    $ P(D)=L("AA")P("AA") + L("AT")P("AT") + L("TT")P("TT"). $
    Divide each genotype's product by this same total to obtain its posterior.
    “Not AA” groups AT and TT; its likelihood is a *weighted average* of their
    likelihoods, not their sum. For now, writing all three routes is simpler.
  ]
  #ref_box[
    *Day 21 correction: match the assay to the assumption.*
    ATAC reports DNA accessibility. It does not count the histone subunits that remain
    assembled in a core. A direct assembly check should examine the intact particle's
    mass/composition or structure. Evidence for accessibility, core assembly and RNA
    abundance answers three different questions.
  ]

  #pagebreak()
  #source[
    *Bishop & Bishop, Deep Learning* · §2.1.2–2.1.3, Sum/product rules and Bayes' theorem ·
    PDF pp.46–48 (printed pp.26–28). Day 21 Q1 repair, new numbers; tutor application.
  ]
  #question(space: 3.5in)[
    *Three routes, one denominator.* For fixed reads $D$, use:
    #table(columns: (1fr, 1fr, 1fr, 1fr), inset: 5pt,
      [Genotype], [AA], [AT], [TT],
      [Likelihood], [0.2], [0.6], [0.1],
      [Prior], [0.6], [0.3], [0.1])
    Make a three-row table showing each likelihood-times-prior product and the
    corresponding posterior. Write the shared denominator explicitly and check that
    your three posterior probabilities sum to 1. Exact fractions are enough.
  ]

  #pagebreak()
  #source[
    *Lewin's Genes XII* (2018) · §8.3, The Nucleosome Is the Subunit of All Chromatin ·
    PDF pp.743–746 (core subassemblies); §8.11, DNase Sensitivity Detects Changes in
    Chromatin Structure · PDF pp.817–818 (accessibility principle).
    Day 21 Q6 repair; tutor assay comparison. Printed-page mapping unavailable.
  ]
  #question(space: 3.8in)[
    *What did the measurement establish?* A histone mutant produces greater DNA
    accessibility. A separate analysis of purified intact particles finds the same
    eight core histone subunits, in the same stoichiometry, as the control.
    A colleague says, “The accessibility increase proves that the core fell apart.”
    Explain how the two observations can coexist without that conclusion. State what
    the particle-composition measurement adds that an accessibility measurement does not.
    You do not need to name an instrument.
  ]

  #pagebreak()
  #section_heading("2. Math · 20 min for primer and Q3–Q4")
  #ref_box[
    *Read for about 5 minutes: two kinds of averaging.*
    On Day 21 you derived $E[X]=mu$ for $X in {0,1}$ with
    $P(X=1)=mu$ and $P(X=0)=1-mu$.
    Variance measures average squared distance from that mean:
    $ "Var"(X)=sum_(x in {0,1}) (x-mu)^2 P(X=x). $
    Expand the two terms before simplifying. It is a weighted average of squared
    distances, not the mean itself.

    A different weighted average appears when a read has an unknown origin.
    For a diploid AT genotype, suppose a read samples either chromosome with
    probability $1/2$. Call that hidden allele of origin $Z in {"A", "T"}$ and
    the observed base $B$. To obtain $P(B | G="AT")$, add the probabilities of
    the two mutually exclusive routes through $Z$. Each route needs its own weight.
  ]
  #ref_box[
    *Toy sequencing model for Q4.* The base-call error probability is
    $epsilon=0.03$. For a fixed true allele, a correct base has probability
    $1-epsilon$; errors are equally distributed among the *three* other bases,
    each with probability $epsilon/3$.
    Even though this site has only A/T alleles, the sequencer can report A, C, G or T.
    Assume correct alignment, equal chromosome sampling and no allele-specific bias.
  ]

  #pagebreak()
  #source[
    *Bishop & Bishop, Deep Learning* · §3.1.1, Bernoulli distribution · PDF pp.85–86
    (printed pp.66–67); Exercise 3.1, variance part only, PDF p.124 (printed p.105).
    Variance definition: §2.2.2, Expectations and covariances, PDF p.55 (printed p.35).
    Paraphrased textbook exercise; entropy deferred. Read worked results after attempting.
  ]
  #question(space: 3.8in)[
    *Finish the Bernoulli result.* For $P(X=1)=mu$, $P(X=0)=1-mu$ and
    $E[X]=mu$, derive $"Var"(X)=mu(1-mu)$ by expanding the two terms in
    $sum_(x in {0,1}) (x-mu)^2 P(X=x)$.
    Show your algebra, then give a one-sentence check of what the expression approaches
    as $mu$ tends to zero. Explain the check in terms of possible trial outcomes.
  ]

  #pagebreak()
  #source[
    *Bishop & Bishop, Deep Learning* · §2.1.2, Sum/product rules · PDF pp.46–48
    (printed pp.26–28), applied to a hidden allele of origin.
    Genomics model: #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods")[ANGSD Genotype Likelihoods,
    Theory / GATK genotype likelihoods] (web source, no PDF pages).
    Tutor one-read application, not a numbered Bishop genotype exercise.
  ]
  #question(space: 3.5in)[
    *Where could the observed A have come from?* A single read reports $B="A"$.
    The error probability is $epsilon=0.03$, split equally among three wrong bases;
    a correct base has probability $1-epsilon$.
    For $G="AT"$, draw the two routes through allele of origin A or T, each sampled
    with probability $1/2$, and calculate $P(B="A" | G="AT")$.
    Then calculate $P(B="A" | G="AA")$ under the same error model.
    These are likelihoods for the fixed observed base; do not normalize them into posteriors.
  ]

  #pagebreak()
  #section_heading("3. Biology · 20 min for primer and Q5–Q6")
  #ref_box[
    *Read for about 5 minutes: a chemical change and a binding site.*
    Lysine side chains normally carry a positive charge. Histone lysine acetylation
    neutralizes that charge; lysine methylation retains it. Changes to direct
    electrostatic contacts are therefore not identical for these two modifications.

    A histone modification can also create a recognition site for another protein.
    A *writer* deposits a modification, a *reader* recognizes it, and an *eraser*
    removes it. These names describe functions; one protein can contain several domains.
    Bromodomains recognize acetylated lysines in an appropriate sequence context.
    Several other domains recognize particular methylated sites.

    Charge effects and reader binding are distinct mechanisms. An acetylation signal
    is not a guarantee of transcription, and a methylation signal is not universally
    activating or repressing: the modified residue, other marks and interacting proteins matter.
  ]
  #text(size: 9pt)[
    Optional within-slot reading: Genes XII §8.4, PDF p.755 and pp.762–763.
    Use the supplied primer if you prefer to spend the slot on the questions.
  ]

  #pagebreak()
  #source[
    *Lewin's Genes XII* (2018) · §8.4, Nucleosomes Are Covalently Modified ·
    PDF p.755 (lysine charge), p.757 (structural effects) and p.762 (reader binding).
    Tutor mechanistic comparison. Printed-page mapping unavailable.
  ]
  #question(space: 3.8in)[
    *Same residue, different chemistry.* A researcher proposes that lysine methylation
    should weaken DNA contacts by exactly the same charge-neutralization mechanism
    as lysine acetylation. Correct that mechanism in a small diagram or table comparing
    the charge after the two modifications. Explain how methylation could still change
    chromatin behavior even when that positive charge is retained.
    You do not need to memorize a specific histone mark.
  ]

  #pagebreak()
  #source[
    *Lewin's Genes XII* (2018) · §8.4, Nucleosomes Are Covalently Modified ·
    PDF pp.762–763, bromodomain recognition and Fig.8.20.
    Tutor writer/reader perturbation experiment. Printed-page mapping unavailable.
  ]
  #question(space: 3.8in)[
    *The mark stays, its reader leaves.* In a toy experiment, a drug blocks only the
    acetyl-lysine-binding pocket of a reader's bromodomain. The drug does not inhibit
    the acetylation writer. Measurements show unchanged histone acetylation but less
    reader bound to chromatin; reader abundance is unchanged too.
    Draw a writer → modified histone → reader pathway and mark the step blocked by
    the drug. Use it to explain why unchanged acetylation does not imply that the
    drug failed. Do not predict RNA output from these data alone.
  ]

  #pagebreak()
  #section_heading("4. Stats · 5 min")
  #source[
    *Bishop & Bishop, Deep Learning* · §3.1.1–3.1.2, Bernoulli/binomial distributions ·
    PDF pp.85–87 (printed pp.66–68). Tutor allele-frequency application;
    Day 21 Q7 sampling-level follow-up.
  ]
  #question(space: 3.5in)[
    *Name the quantity before counting reads.* For this toy example, three unrelated
    diploid fish have known genotypes AA, AT and TT. Their sequencing depths are 100,
    10 and 10 reads. The goal is the frequency of allele T among chromosome copies
    in the fish population, with no copy-number variation.
    Calculate the T-allele fraction among the sampled chromosome copies. Explain why
    giving the first fish ten times the weight solely because it has more reads would
    target a different quantity. Your sample fraction estimates an unknown population frequency.
  ]

  #pagebreak()
  #ref_box[
    *Close the hour.* Use the five-minute buffer and stop. Record actual minutes if tracked:
    review #raw("____"), math #raw("____"), biology #raw("____"), stats #raw("____").
    Mark anything unfinished; a short complete explanation is enough.
  ]
  *Optional Python · at most 10 extra minutes.* Task 001 remains in
  #raw("projects/lcwgs-lab/current-task.md"). Your handwritten Phred derivation is correct;
  the code task stays pending until you submit or mark the code ready. No new coding task today.
]
