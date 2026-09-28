#import "../template.typ": *
#let source(body) = { set text(size: 9pt); ref_box(body) }
#sheet(day: "23", title: "From one read to a likelihood")[
  *Bishop → statistical model → population genetics.* Build the probability of
  sequencing data under candidate genotypes. This is a step toward estimating
  population allele frequencies when individual genotypes are uncertain.
  #daily_timer()
  #v(0.8em)
  Seven questions; ten requested responses including subparts. Reading and repairs
  fit inside the hour. Exact products are acceptable; a calculator is optional.

  *Book route:* Bishop & Bishop, _Deep Learning_, §2.1.2 sum/product rules →
  §2.1.6 independence → one selected rule from §11.2 conditional independence.
  Q1 revisits Exercise 3.1. Q3–Q4 are explicitly labeled popgen applications,
  not numbered book exercises. No other Chapter 11 material is assumed.

  Your Day 22 follow-up correctly combined two routes to get 0.48.
  Today starts from that success and adds only one new math step: two reads.
  Supplied primers are the required reading; source boxes are optional book pointers.

  #pagebreak()
  #section_heading("1. Spaced repetition · 10 min")
  #ref_box[
    *Day 22 algebra repair.* A square means multiply the whole expression by itself:
    $(-u)^2=(-u)(-u)$ and $(1-u)^2=(1-u)(1-u)$.
    Distribute all four products before combining terms. A correct final answer
    does not validate intermediate equalities.

    *Bayes check.* Multiply each likelihood by its prior, add those products,
    then divide each product by the same total. Exact fractions make the sum check easy.
  ]

  #pagebreak()
  #source[
    *Bishop & Bishop, Deep Learning* · Exercise 3.1, variance part, PDF p.124
    (printed p.105); §2.2.2, Expectations and covariances, PDF p.55
    (printed p.35). Day 22 Q3 repair; paraphrased textbook exercise.
  ]
  #question(space: 3.8in)[
    *Make every equality true.* For a Bernoulli variable $X$, let
    $P(X=1)=mu$, $P(X=0)=1-mu$, and $E[X]=mu$.

    *(a)* Starting from $(0-mu)^2(1-mu)+(1-mu)^2 mu$, derive
    $"Var"(X)=mu(1-mu)$. Show the square expansions explicitly.

    *(b)* As $mu$ approaches zero, explain in one sentence why the variance
    approaches zero using the possible trial outcomes.
  ]

  #pagebreak()
  #source[
    *Bishop & Bishop, Deep Learning* · §2.1.3, Bayes' theorem, PDF pp.48–49
    (printed pp.28–29). Day 22 Q1 recall; tutor genotype application.
  ]
  #question(space: 3.8in)[
    *Finish with an exact check.* For fixed data $D$, candidate genotypes
    AA, AT, TT have likelihoods $(0.1,0.4,0.2)$ and priors $(0.5,0.25,0.25)$,
    respectively. In one table, calculate the three likelihood-times-prior products
    and posterior probabilities. Include the shared denominator and a sum-to-one
    check beneath the table. Fractions are enough.
  ]

  #pagebreak()
  #section_heading("2. Math · 20 min including primers")
  #ref_box[
    *Build the model before calculating · about 3 min.*
    Scientific target: which genotype could explain this fish's reads?
    $G$ is the candidate genotype (AA, AT or TT). $B_i$ is the base reported
    by read $i$; $Z_i$ is its hidden true allele of origin. The error probability
    $epsilon$ is a fixed, known model input here, not something to estimate today.

    A read first samples a chromosome; then the sequencer reports a base.
    Assume a diploid A/T site, equal chromosome sampling, correct alignment,
    no allele bias, and errors spread equally over the three wrong bases.
    The sequencer can report A, C, G or T even at an A/T site.

    For AT, each origin has weight $1/2$. Given the origin, a correct call has
    probability $1-epsilon$; one particular wrong call has probability $epsilon/3$.
    Multiply within a route and add the alternative origins. This applies Bishop's
    product rule followed by the sum rule: the hidden origin is summed out.
  ]
  #ref_box[
    *Reading pointer within the math slot:* Bishop §2.1.2, PDF pp.47–48
    (printed pp.27–28), especially the sum and product rules. Use the primer
    instead if opening the book would consume your working time.
  ]

  #pagebreak()
  #source[
    *Bishop & Bishop, Deep Learning* · §2.1.2, The sum and product rules,
    PDF pp.46–48 (printed pp.26–28).
    #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD Genotype Likelihoods, Theory / GATK genotype likelihoods]
    (web source, no PDF pages). Tutor popgen adaptation; Day 22 follow-up transfer.
  ]
  #question(space: 3.5in)[
    *Construct the one-read building block.* Use $epsilon=0.09$.
    Calculate $P(B="A" | G=g)$ and $P(B="T" | G=g)$ for each candidate
    $g$ in AA, AT, TT. Present a three-row, two-column probability table.
    Show the two weighted routes for at least one AT entry beside your table.
    For AA and TT, remember that either chromosome carries the same allele.
    These are data probabilities given a genotype; do not normalize across genotypes.
  ]

  #pagebreak()
  #ref_box[
    *One new step: two reads · about 2 min.*
    Suppose two reads come from independent DNA molecules, with independent
    chromosome sampling and calling errors *given the genotype*. This is a modeling
    assumption. It lets us multiply the two data probabilities:
    $ P(B_1=b_1,B_2=b_2 | G=g)
       =P(B_1=b_1 | G=g) P(B_2=b_2 | G=g). $
    Read this as: “assuming genotype $g$, the chance of both reported bases
    equals the product of their individual chances.”

    In Bishop §11.2, Eq.11.23, substitute $B_1$ for $a$, $B_2$ for $b$,
    and $G$ for $c$. We are borrowing this one rule, not studying the chapter now.
    The genotype is held fixed in each calculation; this does not assert that the
    reads are independent after averaging over an unknown genotype.

    Once the observed pair $D$ is fixed, $L(g)=P(D | G=g)$ is its likelihood
    as a function of candidate genotype. A larger value means that genotype makes
    these data more probable. It is not the posterior probability that $g$ is true.
  ]

  #pagebreak()
  #source[
    *Bishop & Bishop, Deep Learning* · §2.1.6, Independent variables,
    PDF p.51 (printed p.31); §11.2, Conditional Independence, Eq.11.23,
    PDF p.353 (printed p.337). Genomics model: ANGSD Genotype Likelihoods,
    Theory / GATK (linked at Q3). Tutor two-read application.
  ]
  #question(space: 3.8in)[
    *Score the genotypes with the model you built.* The ordered observations are
    $D=(B_1="A", B_2="T")$. Both reads follow Q3's error model
    ($epsilon=0.09$) and the conditional-independence assumption above.
    Use your Q3 table to calculate $L("AA")$, $L("AT")$ and $L("TT")$,
    showing the product for each. Circle the largest likelihood.
    The data are this specific ordered pair; do not add the reversed order.
    No priors or posterior calculation are requested.
  ]

  #pagebreak()
  #section_heading("3. Biology · 20 min including primer")
  #ref_box[
    *Repair the measurement distinction · about 3 min.*
    A nucleosome includes a histone core and DNA wrapped around it. Contacts
    between DNA and histones can weaken without loss of core subunits.
    A composition measurement asks which proteins are in the measured intact
    particles and in what proportions. Accessibility asks how exposed DNA is.
    Neither measurement alone gives RNA abundance.

    *Keep the chemical mark and its reader separate.* A writer deposits a mark;
    a reader binds it. In Day 22's experiment, the drug blocked the reader's
    pocket, not the histone. Reader binding can fall while acetylation stays constant.
    By contrast, inhibiting a writer can reduce the available binding sites as
    existing acetylation is removed. Effects on RNA require further evidence.
  ]

  #pagebreak()
  #source[
    *Lewin's Genes XII* (2018) · §8.3, The Nucleosome Is the Subunit of All
    Chromatin, PDF pp.743–746; §8.4, Nucleosomes Are Covalently Modified,
    PDF p.757 (DNA contacts). Day 22 Q2 repair; tutor experiment.
    Printed-page mapping unavailable.
  ]
  #question(space: 3.8in)[
    *Explain both observations with one mechanism.* In a controlled assay,
    a mutant's nucleosomal DNA is more exposed than the control's. Purified intact
    particles from both samples contain two copies each of H2A, H2B, H3 and H4.
    Draw a possible mutant particle beside a control particle, then use a short
    caption to explain how exposure can increase with those subunit counts unchanged.
    Label what the composition measurement establishes about the measured particles.
  ]

  #pagebreak()
  #source[
    *Lewin's Genes XII* (2018) · §8.4, Nucleosomes Are Covalently Modified,
    PDF pp.757–759 (reversible marks), pp.762–763 (bromodomain recognition).
    Day 22 Q6 transfer; tutor writer/reader experiment. Printed pages unavailable.
  ]
  #question(space: 3.5in)[
    *Two ways to lose a reader.* In a toy system, this reader binds only through
    its acetyl-lysine pocket. Reader abundance is constant. Drug W inhibits only
    the writer; after mark turnover, acetylation falls. Drug R blocks only the
    reader pocket; acetylation stays unchanged. Reader binding falls under both drugs.

    *(a)* Draw the writer → acetylated histone → bound reader pathway and mark
    the different step affected by each drug.

    *(b)* A colleague says less bound reader proves that acetylation fell.
    Use these two treatments to explain why that inference is not justified.
  ]

  #pagebreak()
  #text(weight: "bold")[4. Stats · 5 min]
  #source[
    *Bishop & Bishop, Deep Learning* · §3.1.1, Bernoulli distribution,
    PDF pp.85–86 (printed pp.66–67). Tutor allele-copy counting application;
    Day 22 Q7 repair, not a numbered book exercise.
  ]
  #question(space: 3.5in)[
    *Population target, chromosome counts.* Four unrelated diploid fish have
    known genotypes AA, AA, AT, TT and sequencing depths 80, 10, 10, 20.
    Assume no copy-number variation. The target is the population frequency of T
    among chromosome copies; this sample supplies an estimate.

    *(a)* Calculate the sampled T-allele fraction by counting chromosome copies.
    Show numerator and denominator; do not turn genotypes into simulated reads.

    *(b)* If the first fish is resequenced to 800 reads and its known genotype
    stays AA, should this sample fraction change? Explain using the counted unit.
  ]

  #pagebreak()
  #ref_box[
    *Close the hour.* Use the five-minute buffer, then stop. Record minutes if tracked:
    review #raw("____"), math #raw("____"), biology #raw("____"), stats #raw("____").
    Mark anything unfinished. A labeled sketch or short complete explanation is enough.
  ]
  *Optional Python:* task 001 remains pending in
  #raw("projects/lcwgs-lab/current-task.md"), at most 10 extra opt-in minutes.
  No new coding task. No extra catch-up assignment.
]
