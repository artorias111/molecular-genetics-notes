#import "../template.typ": *
#let source(body) = { set text(size: 8.5pt); ref_box(body) }
#let mini(body) = block(fill: luma(245), stroke: 0.4pt + luma(180), inset: 4pt, width: 100%)[#text(size: 7.5pt, body)]
#sheet(day: "24", title: "Evidence and PCA")[
  #daily_timer(review: 5, math: 20, ml: 20, biology: 10, stats: 5, buffer: 0, compact: true)
  #parbreak()
  #text(size: 10pt)[*1. Recall · 5 min.* Circle one choice per item. No written justification.]
  #v(0.4em)
  #mini[Bishop & Bishop, _Deep Learning_ · §2.2.2 Expectations and covariances, PDF p.55 (printed p.35); Ex.3.1 PDF p.124 (printed p.105). Day 23 Q1 review.]
  #question(space: 0in, gap: 0.2em)[#text(size: 10pt)[Which expansion is valid? \
    A. $(1-u)^2=1-u^2$   B. $(1-u)^2=1-2u+u^2$ \
    C. $(-u)^2=-u^2$]]
  #mini[Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 (printed pp.28–29). Day 23 Q2 review; tutor item.]
  #question(space: 0in, gap: 0.2em)[#text(size: 10pt)[Three likelihood × prior products are 2, 3 and 5 after a common rescaling. The middle posterior is: A. $3/5$   B. $3/2$   C. $3/10$]]
  #mini[Lewin's _Genes XII_ · §8.3 The Nucleosome Is the Subunit of All Chromatin, PDF pp.743–746. Day 23 Q5 repair; tutor item.]
  #question(space: 0in, gap: 0.2em)[#text(size: 10pt)[Two copies each of H2A/H2B/H3/H4 in measured intact particles establish: A. the listed core composition; B. absence of H1; C. unchanged DNA exposure.]]
  #mini[Lewin's _Genes XII_ · §8.4 Nucleosomes Are Covalently Modified, PDF pp.757–759, 762–763. Day 23 Q6 review; tutor item.]
  #question(space: 0in, gap: 0.2em)[#text(size: 10pt)[A drug blocks only a reader's binding pocket. Less bound reader proves: A. acetylation fell; B. binding fell, but the mark may remain; C. the writer was inhibited.]]
  #mini[Bishop & Bishop, _Deep Learning_ · §3.1.1 Bernoulli distribution, PDF pp.85–86 (printed pp.66–67). Day 23 Q7; tutor allele-count application.]
  #question(space: 0in, gap: 0.2em)[#text(size: 10pt)[With known diploid genotypes, sequencing the same fish more deeply changes: A. its number of sampled allele copies; B. the known-genotype sample T fraction; C. neither of those.]]

  #pagebreak()
  #section_heading("2. Popgen math · 20 min total")
  #ref_box[
    *Primer · 4 min; calculation · 16 min.*
    We supply the one-read table; delayed recall remains separate.
    Primers count as reading; book pointers are optional. Calculator allowed.

    $G$ is a candidate genotype; $B_i$ is the base reported by read $i$.
    A read samples one of the two chromosomes equally. Correct calls have probability
    $1-epsilon$ and each particular wrong base has probability $epsilon/3$.
    Assume correct alignment, no allele bias and $epsilon=0.09$.

    #table(columns: 3, inset: 6pt, [Genotype], [$P(B_i=A|G)$], [$P(B_i=T|G)$],
      [AA], [0.91], [0.03], [AT], [0.47], [0.47], [TT], [0.03], [0.91])

    *Two stages, two meanings.* For independent molecules and independent errors
    conditional on $G$, multiply the two read probabilities to obtain $L(g)=P(D|G=g)$.
    Then weight by the prior $pi_g=P(G=g)$ to obtain $w_g=L(g)pi_g$.
    The posterior is $w_g / (sum_h w_h)$, with the sum over AA, AT and TT.

    Likelihood holds the candidate genotype fixed; posterior combines that evidence
    with a prior. The toy prior is supplied, without an equilibrium assumption.

    *If stuck:* do just the AA likelihood cell first. After two minutes without
    a next step, mark the sticking point and ask for a hint. Stop at the slot limit.
  ]
  #source[Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 (printed pp.28–29); §11.2 Conditional Independence, Eq.11.23, PDF p.353 (printed p.337). Model adapted from #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods")[ANGSD Genotype Likelihoods, Theory / GATK] (web source, no PDF pages).]


  #pagebreak()
  #source[Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 (printed pp.28–29); §11.2 Conditional Independence, PDF p.353 (printed p.337). Tutor popgen adaptation of Day 23 Q2–Q4; ANGSD model cited on preceding page.]
  #question(space: 3.6in)[
    *Same evidence, explicit prior.* A fish gives the ordered reads $D=(A,T)$.
    For AA, AT and TT, the one-read (A,T) probabilities are respectively
    $(0.91,0.03)$, $(0.47,0.47)$ and $(0.03,0.91)$.
    Reads are independent given genotype. The prior weights for AA, AT, TT are
    $(0.90,0.08,0.02)$.

    Complete one three-row table with columns: genotype; two-read likelihood
    $L(g)$ (show product); $L(g)pi_g$; posterior. Write the shared denominator
    and posterior sum check below it. Circle the largest entry in each of the
    likelihood and posterior columns. Do not count the reversed read order.
  ]

  #pagebreak()
  #section_heading("3. ML foundations · 20 min total")
  #ref_box[
    *Primer · 5 min; Q7 · 8 min; Q8 · 7 min.*
    *PCA asks:* which direction through a cloud of observations preserves the most
    variation? Today checks two directions, not the whole algorithm.

    Each observation has two fully measured features with their means subtracted:
    $x=(x_1,x_2)^T$. A direction $u=(a,b)^T$ gives score $z=u^T x=a x_1+b x_2$.
    $T$ means transpose: turn a column into a row. The dot product is a weighted sum.

    The supplied covariance matrix $S$ has feature variances on its diagonal and
    their covariance off the diagonal. Positive covariance means the centered
    features tend to vary together. The score variance is $V(u)=u^T S u$.
    Dimensions are $(1 times 2)(2 times 2)(2 times 1)$: the result is a scalar.

    *Unit directions:* $u^T u=a^2+b^2=1$. This compares directions without
    arbitrarily magnifying scores by stretching $u$. Features use comparable scales.

    *Gradient:* $nabla V=(frac(partial V, partial a),frac(partial V, partial b))^T$.
    Differentiate in one variable while holding the other fixed:
    $frac(partial(a b), partial a)=b$ and $frac(partial(a^2), partial a)=2a$.

    *Eigenvector:* a nonzero $u$ satisfying $S u=lambda u$; multiplication only
    scales that vector. The multiplier $lambda$ is its eigenvalue. Bishop shows
    PCA chooses a unit eigenvector with the largest eigenvalue. We will derive
    the constrained-optimization connection in a later session.

    *First step if stuck:* compute only the top entry of $S u$: multiply the first
    row by the column. Ask for one hint after two minutes without a next step;
    stop at 20 minutes even if only part of the calculation is done.
  ]
  #source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, PDF pp.511–512 (printed pp.497–498), Eqs.16.2–16.6. Tutor numerical prerequisite to Ex.16.1, PDF pp.541–542 (printed pp.527–528); not the full induction exercise.]

  #pagebreak()
  #source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, PDF p.512 (printed p.498), Eqs.16.2–16.4. Tutor two-dimensional quadratic/gradient preparation for Ex.16.1 (PDF pp.541–542).]
  #question(space: 3.8in)[
    *The gradient behind a PCA objective.* Two centered features have covariance
    $S=mat(2,1;1,2)$. Let $u=(a,b)^T$ and $V(a,b)=u^T S u$.

    Derive $V(a,b)$ as an explicit polynomial by multiplying $S u$ first,
    then taking its dot product with $u$. Finish the derivation with the gradient
    $nabla V=(frac(partial V, partial a),frac(partial V, partial b))^T$.
    Here $a,b$ are variables; the entries of $S$ are fixed. Do not set this
    unconstrained gradient to zero to find a PCA direction.
  ]

  #pagebreak()
  #source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, PDF pp.511–512 (printed pp.497–498), Eqs.16.2–16.6. Tutor numerical prerequisite to Ex.16.1 (PDF pp.541–542), not its induction proof.]
  #question(space: 3.6in)[
    *Compare directions fairly.* For $S=mat(2,1;1,2)$, compare
    $u_+=1/sqrt(2) (1,1)^T$ and $u_-=1/sqrt(2) (1,-1)^T$.
    Both are column vectors. Keep square roots exact.

    Complete one two-row table with columns: direction; squared length $u^T u$;
    vector $S u$; projected variance $u^T S u$. Circle the direction that retains
    more variance. Beneath its row, write $S u=lambda u$ with the multiplier you
    found. This links the calculation to the meaning of an eigenvector.
  ]

  #pagebreak()
  #section_heading("4. Biology · 10 min total")
  #ref_box[
    *One new concept: promoter-proximal pausing · 3 min reading.*
    RNA polymerase II (Pol II) makes RNA from a DNA template. After starting,
    it can pause near the promoter before progressing through the gene body.
    Recruitment, initiation and productive elongation are therefore distinct steps.

    P-TEFb is a protein complex containing the kinase CDK9. A kinase adds phosphate
    groups to proteins. P-TEFb promotes release from pausing by phosphorylating
    components of the transcription machinery. Today you only need its role in
    pause release, not a list of protein names or phosphorylation sites.

    A promoter can contain polymerase that has not progressed far into the gene.
    Polymerase occupancy measures how much polymerase is present at a position;
    it does not directly measure how many full transcripts are produced per minute.
    Residence time matters: a long pause can maintain occupancy while output falls.

    *Research payoff:* interpret promoter and gene-body signals together when
    evaluating transcriptional regulation. Do not treat a promoter peak alone
    as proof of high RNA production, or as unique proof of a particular mechanism.
  ]
  #source[Lewin's _Genes XII_ (2018) · §18.8 Initiation Is Followed by Promoter Clearance and Elongation, PDF pp.1850, 1852, 1855–1856 (printed pages unverified). Research supplement: #link("https://elifesciences.org/articles/29736")[Gressel et al. (2017), CDK9-dependent RNA polymerase II pausing controls transcription initiation], abstract/results (web source; no PDF pages assigned).]

  #pagebreak()
  #source[Lewin's _Genes XII_ · §18.8 Initiation Is Followed by Promoter Clearance and Elongation, PDF pp.1852, 1855–1856. Gressel et al. (2017), #link("https://elifesciences.org/articles/29736")[eLife 6:e29736]. Tutor hypothetical experiment, not reproduced paper data.]
  #question(space: 3.8in)[
    *A promoter peak with less output · 7 min.* After a brief CDK9 inhibition
    in a controlled experiment, promoter-proximal Pol II occupancy stays high,
    but newly synthesized RNA measured well downstream in the gene body decreases.
    Assume matched measurement normalization and no change in cell number.

    Draw one promoter → pause region → gene-body diagram with a short caption
    explaining how impaired pause release could produce both observations.
    Make clear why high promoter occupancy alone cannot establish high productive
    transcription. Treat the mechanism as consistent with the evidence, not uniquely proven.
  ]

  #pagebreak()
  *5. Stats · 5 min. Stop at 60 minutes total.*
  #source[Bishop & Bishop, _Deep Learning_ · §2.1.6 Independent variables, PDF p.51 (printed p.31); §11.2 Conditional Independence, PDF p.353 (printed p.337). Tutor sequencing application of the independence assumption, following Day 23 Q4.]
  #question(space: 3.5in)[
    *What counts as fresh evidence?* A file contains ten identical read records
    at a site. A processing audit establishes that one observed read record was
    copied nine times by a software mistake. There were no additional molecule
    samples or sequencing calls.

    A program multiplies the one-read probability ten times, treating all records
    as independent evidence about the fish's genotype. Explain in two or three
    sentences whether that likelihood is justified, naming the number of actual
    observed read events. This is exact record duplication, not a PCR model.
  ]
]
