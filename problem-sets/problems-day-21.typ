#import "../template.typ": *
#let source(body) = {
  set text(size: 9pt)
  ref_box(body)
}

#sheet(day: "21", title: "Read errors and the histone core")[
  *Today's connection:* a read is a noisy observation of DNA; an accessibility assay
  is an observation of how that DNA is packaged.

  #daily_timer()
  #v(0.7em)
  Seven questions. Reading the supplied primers counts inside the hour.
  The source boxes are there if you want the book's explanation; they do not add
  required reading. PDF pages mean the page number shown by the PDF viewer.

  Day 20 is recorded as completed by your report, with grading pending. This is a
  modest next step, not a difficulty jump. Short arguments and labeled sketches are enough.
  Each question has its own working space. Stop at 60 minutes.

  #pagebreak()
  #section_heading("1. Spaced repetition · 10 min for Q1–Q2")
  #source[
    *Bishop & Bishop, Deep Learning* · §2.1.3, Bayes' theorem · PDF p.48
    (printed p.28). Day 20 review; tutor genotype application.
  ]
  #question(space: 3.5in)[
    *Same reads, different prior.* For one individual's observed reads $D$, the
    genotype likelihoods for AA, AT and TT are respectively $0.8$, $0.4$ and $0.1$.
    Now use genotype priors $0.1$, $0.8$ and $0.1$, respectively.
    Compute the three posterior probabilities and identify the largest.
    Explain why a different ranking from the likelihoods does not mean the reads changed.

    Reminder: multiply each likelihood by its prior, then divide by the sum of those
    three products. $P(D | G)$ means “reads given genotype”; $P(G | D)$ reverses the question.
  ]

  #pagebreak()
  #source[
    *Wasserman, All of Statistics* · §8.2, Bootstrap Variance Estimation · PDF p.125
    (printed p.109). Day 20 review and earlier bootstrap/jackknife confusion;
    tutor resampling application.
  ]
  #question(space: 3.8in)[
    *What actually got resampled?* You have four independently sampled individuals,
    labeled A, B, C and D. A bootstrap replicate draws four individuals with replacement.
    A colleague instead makes the four samples BCD, ACD, ABD and ABC.
    Explain which part of the bootstrap rule this procedure fails to implement,
    then write one valid bootstrap replicate containing a duplicate and an omission.
    No definition of “jackknife” is required; reason from the draws.
  ]

  #pagebreak()
  #section_heading("2. Math · 20 min for primer and Q3–Q4")
  #ref_box[
    *Read for about 4 minutes: a binary outcome in one equation.*
    A Bernoulli variable $X$ takes value 0 or 1. In a sequencing example we might
    define $X=1$ as “this base call is wrong” and $X=0$ as “it is correct.”
    The symbol $mu$ (“mu”) is a probability parameter, with $0 < mu < 1$ here.

    The compact probability formula is
    $ p(x | mu) = mu^x (1-mu)^(1-x), quad x in {0,1}. $
    To decode it, substitute each allowed value of $x$ into both exponents.
    For a positive number $a$, $a^0=1$. A probability distribution is *normalized*
    when its probabilities over all possible outcomes add to 1.

    *Expectation* is a probability-weighted average, written $E[X]$:
    $ E[X] = sum_(x in {0,1}) x p(x | mu). $
    The sum here has only two terms. It need not be an outcome a single trial can take.
  ]
  #ref_box[
    *A sequencing connection for Q4.* A Phred base-quality score obeys
    $ Q = -10 log_10(epsilon), $
    where $epsilon$ (“epsilon”) is the estimated probability of an incorrect base call.
    For this exercise ignore score rounding. Recall: $log_10(a)=b$ means $a=10^b$.
    The score concerns the base call, not whether the read is aligned to the correct place.
  ]

  #pagebreak()
  #source[
    *Bishop & Bishop, Deep Learning* · §3.1.1, Bernoulli distribution · PDF pp.85–86
    (printed pp.66–67). Exercise 3.1, PDF p.124 (printed p.105): normalization and
    mean only, paraphrased. Variance and entropy are deferred. Read the worked results
    in §3.1.1 after attempting this question.
  ]
  #question(space: 3.8in)[
    *Unpack, then prove.* For $x in {0,1}$ and $0 < mu < 1$, take
    $p(x | mu)=mu^x(1-mu)^(1-x)$.
    Verify normalization by expanding the two terms of $sum_(x=0)^1 p(x | mu)$.
    Then derive the mean by expanding $E[X]=sum_(x=0)^1 x p(x | mu)$.
    Show the substitutions rather than quoting the two results.
  ]

  #pagebreak()
  #source[
    *Bishop & Bishop, Deep Learning* · §3.1.1, Bernoulli distribution · PDF pp.85–86
    (printed pp.66–67), applied to a base-call error indicator.
    Phred definition: #link("https://samtools.github.io/hts-specs/SAMv1.pdf")[SAM/BAM specification v1.6],
    §1.2, “Phred scale,” PDF p.3 (12 Aug 2025 version). Tutor application, not a Bishop exercise.
  ]
  #question(space: 3.6in)[
    *Turn a quality score into a model.* Using $Q=-10 log_10(epsilon)$,
    calculate $epsilon$ for $Q=10$ and $Q=20$.
    At $Q=20$, define $X=1$ for an incorrect base call and $X=0$ for a correct call.
    Write its Bernoulli probability formula with the numerical parameter substituted,
    and interpret its mean in words. A decimal mean is not a “fractionally wrong” single call.

    Log reminder: $log_10(a)=b$ means $a=10^b$. Assume the reported error probabilities
    are calibrated; you are not estimating calibration today.
  ]

  #pagebreak()
  #section_heading("3. Biology · 20 min for primer and Q5–Q6")
  #ref_box[
    *Read for about 5 minutes: the spool has parts.*
    The core octamer has two copies each of H2A, H2B, H3 and H4.
    Its subassemblies are one $("H3")_2("H4")_2$ tetramer (four proteins) and
    two H2A–H2B dimers (two proteins apiece). About 147 bp of DNA wraps around
    this core. Linker DNA joins neighboring cores.

    H1 is a *linker histone*, associated near DNA entry/exit and linker DNA;
    it is not a ninth member of the core octamer. A dimer, tetramer or octamer
    names a complex of two, four or eight protein subunits, respectively.

    Histones contain basic amino acids such as lysine and arginine. Positively
    charged groups help contact the negatively charged DNA phosphate backbone.
    Many core contacts recognize this backbone rather than a particular base sequence,
    helping histones package many different genomic sequences. This does not imply
    that DNA sequence has no effect on nucleosome positioning.

    Distinguish the folded protein core, which organizes the particle, from flexible
    histone tails, which extend out and can carry regulatory modifications.
    Histone modifications and readers come later; today we isolate structure and binding.
  ]
  #text(size: 9pt)[
    Optional within-slot reading: Genes XII §8.3, PDF pp.740–741 and p.746.
    These are ebook viewer pages; a reliable printed-page mapping is unavailable.
  ]

  #pagebreak()
  #source[
    *Lewin's Genes XII* (2018) · §8.3, The Nucleosome Is the Subunit of All Chromatin ·
    PDF pp.740–746, especially Fig.8.10; H1 distinction on PDF p.752.
    Printed-page mapping unavailable. Tutor structural application.
  ]
  #question(space: 3.8in)[
    *Audit an incomplete particle.* A purified particle contains one
    $("H3")_2("H4")_2$ tetramer but only one H2A–H2B dimer.
    Draw its subassemblies, count the core histone proteins present, and identify
    what must be added to obtain the standard octamer.
    A colleague offers H1 instead. Use the architecture in your sketch to explain
    why that does not replace the missing core component.
    You do not need to predict the particle's exact DNA footprint.
  ]

  #pagebreak()
  #source[
    *Lewin's Genes XII* (2018) · §8.3, The Nucleosome Is the Subunit of All Chromatin ·
    PDF p.741 (basic histones) and p.746 (DNA-backbone contacts).
    Printed-page mapping unavailable. Tutor perturbation experiment.
  ]
  #question(space: 3.8in)[
    *Change the contact, hold the rest fixed.* A hypothetical histone substitution
    removes a positive charge from a DNA-contacting site. Assume the protein fold
    and octamer assembly remain intact. At the same DNA sequence, salt concentration
    and protein concentration, predict the direction of the change in DNA-binding
    affinity and justify it through the lost interaction.
    Name one experimental check of the “octamer assembly remains intact” assumption.
    This is a binding experiment; you do not need to infer gene expression.
  ]

  #pagebreak()
  #section_heading("4. Stats · 5 min")
  #source[
    *Bishop & Bishop, Deep Learning* · §2.1.6, Independent variables · PDF p.51
    (printed p.31); §3.1.2, Binomial distribution · PDF pp.86–87 (printed pp.67–68).
    Tutor population-sampling application; transfers Day 20's replication distinction.
  ]
  #question(space: 3.5in)[
    *More reads or more individuals?* You want the frequency of an allele in a fish
    population. Plan A samples 4 unrelated diploid fish and obtains 100 reads per
    fish at the site. Plan B samples 40 unrelated diploid fish and obtains 10 reads
    per fish. Both yield 400 reads. Assume random sampling, comparable
    sequencing quality and no copy-number variation.
    Distinguish uncertainty about a fish's genotype from uncertainty due to sampling
    only some fish from the population. Use this to explain why the designs are not
    equivalent. No variance calculation is required.
  ]

  #pagebreak()
  #ref_box[
    *Close the hour.* Use the five-minute buffer, then stop.
    Actual minutes, if tracked: review #raw("____"), math #raw("____"),
    biology #raw("____"), stats #raw("____"). Mark any question you did not reach.

    Return your work when sharing is working again. If necessary, you can also type
    the key calculations or describe a sketch in chat; that is enough to begin grading.
  ]
  *Optional Python · at most 10 extra minutes.* Task 001 remains the Phred conversion
  in #raw("projects/lcwgs-lab/current-task.md"). No new coding task is added.
  Submit or mark it ready only when you want review; the handwritten course continues either way.
]
