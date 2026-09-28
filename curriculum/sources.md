# Source map and verified page locations

Checked 2026-09-07 against the local PDFs. All PDF page numbers below are one-based viewer
pages. Bishop's printed/PDF offset changes through this file: never use a global +20 rule.
Genes XII is a reflowed 3,194-page ebook; printed-page correspondence is not available, so use
section headings and explicit PDF pages. These are source ranges, not a daily reading quota.

| Book/topic | Section | Printed pages | PDF pages |
|---|---|---|---|
| Bishop: sum/product rules and Bayes | §2.1.2–2.1.3 | 26–29 | 46–49 |
| Bishop: priors, posteriors, independence | §2.1.5–2.1.6 | 31 | 51 |
| Bishop: likelihood and log likelihood | §2.3.2 | 37–38 (start) | 57–58 |
| Bishop: Bayesian parameters | §2.6.1–2.6.2 | 55–56 (start) | 75–76 |
| Bishop: Bernoulli/binomial | §3.1.1–3.1.2 | 66–68 | 85–87 |
| Bishop: conditional independence | §11.2 | section starts 337 | starts 353 |
| Bishop: EM | §15.3 | section starts 474 | starts 489 |
| Bishop: PCA | §16.1 | section starts 497 | starts 511 |
| Genes XII: nucleosomes and linker/core DNA | §8.2 | unavailable | 733–739 |
| Genes XII: DNase sensitivity | §8.11 | unavailable | starts 817 |
| Genes XII: chromatin remodeling | §26.8 | unavailable | starts 2651 |
| Genes XII: histone acetylation | §26.10 | unavailable | starts 2665 |
| Genes XII: mutations | §1.11; §1.15 | unavailable | starts 111; 123 |
| Genes XII: repair | Ch.14 | unavailable | starts 1292 |

Local book files live in `textbooks/`: `Deep Learning Bishop.pdf`, `Lewin’s Genes XII (2018).pdf`,
`A programmer_s Introduction to math 2020.pdf`, `Linear Algebra. Theory, Intuition, Code.pdf`,
`All of statistics.pdf`, and `Biological Sequence Analysis.pdf`. The last four and the math
cheatsheets were rescued from the old math course; they are supporting resources.

## Concise math supplement — learner recommendation, 2026-09-18

- Terence Parr and Jeremy Howard, [The Matrix Calculus You Need For Deep Learning](https://explained.ai/matrix-calculus/). HTML headings checked 2026-09-18. Learner likes its concise, direct explanations; use selected sections alongside the Bishop & Bishop spine within existing math time.
- Useful reading pointers: “Review: Scalar derivative rules”; “Introduction to vector calculus and partial derivatives”; “Matrix calculus” → “Generalization of the Jacobian”; “The Chain Rules”; and “Matrix Calculus Reference.” Use derivative/gradient refreshers when needed, then Jacobians and chain rules as prerequisites permit.
- Notation: the article uses numerator-layout Jacobians and row gradients. Explicitly translate orientation when a worksheet uses column gradients; check dimensions before combining formulas.
- Cite the actual HTML heading and URL in worksheet source boxes. No PDF pages verified; verify separately before citing the printable version. Label tutor-authored applications honestly. This is supplementary explanation, not a new course or extra reading assignment; Bishop remains the exercise/math spine.

## Genomics supplements (primary documentation/research)

- [ANGSD genotype likelihoods](https://popgen.dk/angsd/index.php/Genotype_Likelihoods):
  read-data likelihood given genotype, model assumptions and output representations. Its
  Beagle section explicitly distinguishes normalized GLs from posterior genotype probabilities.
- [ANGSD allele frequencies](https://popgen.dk/angsd/index.php/Allele_Frequencies):
  connection between uncertain genotypes and per-site frequency estimation.
- [ANGSD realSFS method](https://popgen.dk/angsd/index.php/RealSFSmethod):
  site allele-count likelihoods and the subsequent across-site spectrum inference.
- [Buenrostro et al. (2013), original ATAC-seq study](https://doi.org/10.1038/nmeth.2688):
  transposition into native chromatin as an accessibility measurement. Genes XII supplies
  the nucleosome/regulation mechanism; this study supplies the assay bridge.

These sources anchor the opening applications. Modern single-cell methods, cancer assay
interpretation, uncertainty-aware PCA, and downstream population-genetic estimators require
additional primary sources when their lessons are authored; do not attribute those algorithms
to Genes XII or Bishop or invent exercise numbers. No software run is required in the hour.

## Daily reading rule

Source citations go in the worksheet, reachable on the handwriting device. A primer can
replace external reading for the day's core; do not silently add textbook pages outside the
budget. Specify whether reading is before or after an attempt. Use a short excerpt/figure,
not a full chapter or a universal pages-per-minute estimate.

## Additional verified locations for Day 22 (2026-09-08)

- Bishop §2.2.2, Expectations and covariances: variance definition on printed p.35 = PDF p.55.
- Bishop Ex.3.1 variance part: printed p.105 = PDF p.124; normalization/mean completed on Day 21.
- Genes XII §8.4: PDF p.755 (acetylation neutralizes lysine charge; methylation retains it),
  p.757 (contact effects), pp.762–763 (reader domains/bromodomain recognition).
- ANGSD Genotype Likelihoods, Theory / GATK genotype likelihoods (web source linked above):
  one-read equal-allele mixture and symmetric error model. Day 22 adapts only the single-read
  case, with correct alignment and no allele bias; no multi-read calculation assigned yet.

## Day 23 verification — 2026-09-10

- Bishop §2.1.6 Independent variables: PDF p.51 / printed p.31.
- Bishop §11.2 Conditional Independence, Eqs.11.22–11.23: PDF p.353 / printed p.337. Only the conditional factorization rule used, no graph prerequisite imposed.
- Genes XII §8.3 PDF pp.743–746 core subassemblies/DNA contacts; §8.4 PDF pp.757–759 reversible modifications and pp.762–763 reader binding, checked directly.
- ANGSD Genotype Likelihoods / Theory / GATK model, verified online: product across reads of equal-allele mixtures; correct call 1-e, specific wrong base e/3. Worksheet is a toy adaptation of this documented historical model, not a claim about current GATK implementation.

## Day 24 verification — 2026-09-15

- Bishop §16.1.1 Maximum variance formulation, PDF pp.511–512 / printed pp.497–498: projection scores, sample covariance, variance uᵀSu, unit constraint and eigenvector criterion. Ex.16.1 is PDF pp.541–542 / printed pp.527–528, induction from M to M+1 dimensions. Day 24 is explicitly tutor numerical preparation, not that full exercise.
- Bishop §§4.1.2–4.1.3 PDF pp.134–135 / printed pp.115–116; §4.1.6 Regularized least squares PDF p.137 / printed p.118; Ex.4.6 PDF p.148 / printed p.129, verified for later regression transfer, not issued on Day 24.
- Genes XII §18.8 Initiation Is Followed by Promoter Clearance and Elongation starts PDF p.1850; P-TEFb/CDK9 and CTD on p.1852, pause release pp.1855–1856. Printed mapping unverified.
- Gressel et al. (2017), [CDK9-dependent RNA polymerase II pausing controls transcription initiation](https://elifesciences.org/articles/29736), primary research; web abstract/results checked. Day 24's occupancy/output scenario is hypothetical, not reproduced data or a unique mechanistic diagnosis.

## Day 25 verification — 2026-09-17

- Genes XII §18.8: PDF p.1853 Fig.18.14 and p.1854 CTD docking/capping and processing recruitment; extracted directly from local PDF. Printed mapping unavailable. Day 25 uses a labeled hypothetical perturbation, not reproduced experimental results.
- Bishop §16.1.1 PDF pp.511–512 / printed pp.497–498 checked directly: Eq.16.1 centering, Eq.16.3 covariance with 1/N convention. Tutor numerical prerequisites, not the full Ex.16.1 induction.
- Bishop §2.1.2 title checked directly: The sum and product rules, PDF p.46. Existing Bayes/conditional-independence pointers reused.
- ANGSD Genotype Likelihoods, Theory / GATK and Beagle note rechecked online: equal-allele mixture and product across reads; normalized likelihoods are not automatically genotype probabilities. No claim about current GATK implementation.

## Autoencoder route / Day 26 verification — 2026-09-19

- Bishop Ch.19 Autoencoders: PDF p.574 / printed p.563, encoder/decoder and constraints. §19.1 Deterministic Autoencoders and §19.1.1 Linear autoencoders: PDF p.575 / printed p.564, reconstruction loss Eq.19.1. Continuation and §19.1.2 Deep autoencoders: PDF p.576 / printed p.565. Checked directly in local PDF extraction. Day 26 is a tutor numerical adaptation, not a numbered book exercise.
- Bishop §2.2 Probability Densities: PDF p.52 / printed p.32, interval probability Eq.2.23 and normalization Eq.2.25. Day 26 polynomial integration is a tutor refresher/application. §2.2.1 Example distributions: PDF pp.53–54 / printed pp.33–34 for later uniform/exponential examples.
- Bishop §8.1 Evaluation of Gradients / §8.1.1 Single-layer networks: PDF p.251 / printed p.234, linear outputs and squared-error loss, checked for later prerequisite work; not assigned in Day 26.

## Day 27 verification — 2026-09-19

Bishop §8.1.1 Single-layer networks, Eq.8.2, PDF p.251 / printed p.234 rechecked for weighted linear outputs; §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564 rechecked for the autoencoder and reconstruction loss. Day 27 uses a tutor-authored matrix notation/dimension bridge, not a numbered book exercise. §2.2 Probability Densities, Eq.2.23, PDF p.52 / printed p.32 rechecked for the tutor polynomial-density interval integral.

## Day 28 verification — 2026-09-20

- Bishop §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28, and §2.1.3 Bayes' theorem, PDF pp.48–49 / printed pp.28–29 re-extracted for GL/normalization scaffolds. Tutor adaptations, not numbered exercises.
- ANGSD Genotype Likelihoods → Theory / GATK rechecked online: equal chromosome mixture, specific wrong-base probability epsilon/3. Beagle note distinguishes normalized GLs from posterior probabilities. Worksheet uses a toy historical-model adaptation; no current GATK implementation claim. Optional posterior problem has separate supplied relative likelihoods, not the Q2 answer.
- Bishop §2.2 Probability Densities, Eq.2.25, PDF p.52 / printed p.32 and §2.2.1 Example distributions, PDF p.54 / printed p.34 rechecked for normalized densities/exponential functions. The 2t exp(−t²) integral is a tutor substitution refresher, not a Bishop exercise. Existing §8.1.1 and §19.1.1 pointers reused for matrix recall.

## Day 29 verification — 2026-09-20

Rechecked local Bishop §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564; §8.1.1 Single-layer networks, Eqs.8.2–8.3, PDF p.251 / printed p.234; §2.2 Probability Densities, Eq.2.25, PDF p.52 / printed p.32. Questions are tutor numerical/symbolic parameter-loss and normalization applications, not numbered book exercises.

## Day 30 verification — 2026-09-21

Bishop §8.1.1 Single-layer networks, Eqs.8.3–8.4, PDF pp.251–252 / printed pp.234–235, rechecked for squared-error derivative. Existing §19.1.1 PDF p.575 / printed p.564 supports autoencoder loss. §2.2.1 Example distributions PDF p.54 / printed p.34 and §2.2.2 Expectations and covariances, Eq.2.39, PDF p.55 / printed p.35 rechecked for exponential density and continuous expectations. Day 30 questions are tutor applications; the integration-by-parts rule is supplied as a refresher, not attributed as a book exercise. Finite interval integral is a contribution to the mean, not a conditional/full mean.

## Set 31 verification — 2026-09-21

Re-extracted Bishop §2.1.2, PDF pp.46–48 / printed pp.26–28. Reused verified §8.1.1 pp.251–252 and §§2.2.1–2.2.2 pp.54–55 pointers from Day 30. Rechecked ANGSD Genotype Likelihoods, Theory / GATK: equal-chromosome mixture with epsilon/3 specific-base errors (historical model). All questions tutor-authored applications/repairs, not numbered exercises. Optional error-free limit tests the same model; calculus revisits the observed sign error through differentiation.

## Set 32 verification — 2026-09-22

Verified Bishop §7.2.2 Batch gradient descent, Eq.7.16, PDF p.231 / printed p.214 directly in local PDF text. Rechecked §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Reused previously verified §8.1.1 pp.251–252 and §2.2 Eq.2.25 p.52 pointers. All questions tutor applications; the logarithmic integral is a supplied-rule refresher for normalization, not a numbered Bishop exercise.

## Set 33 verification — 2026-09-23

Directly re-extracted Bishop §7.2.2 Batch gradient descent, Eq.7.16, PDF p.231 / printed p.214; §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564; §2.2 Probability Densities, Eqs.2.23–2.25, PDF p.52 / printed p.32. All set 33 questions are labeled tutor applications, not numbered exercises. Ex.3.1 and neighboring exercises rechecked on PDF p.124 / printed p.105 for future original-exercise calibration; not assigned anew here.

## Set 34 verification — 2026-09-23

Re-extracted Bishop §8.1.1 Single-layer networks, Eqs.8.3–8.4, PDF pp.251–252 / printed pp.234–235; §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28; §2.2.2 Expectations and covariances, Eq.2.39, PDF p.55 / printed p.35. ANGSD Genotype Likelihoods → Theory / GATK rechecked online for historical equal-origin mixture and particular-base error probabilities. Q3 explicitly labels unequal origin weights as a tutor hypothetical extension, not the equal-allele ANGSD formula. All questions tutor applications, not numbered Bishop exercises.

## Set 35 verification — 2026-09-24

Directly re-extracted Bishop §8.1.2 General feed-forward networks, Eq.8.7 chain rule, PDF p.252 / printed p.235; §2.2.2 Expectations and covariances, Eq.2.39, PDF p.55 / printed p.35. Reused verified §19.1.1 Eq.19.1 PDF p.575 / printed p.564 and §7.2.2 Eq.7.16 PDF p.231 / printed p.214. All questions tutor scalar applications, not numbered exercises. Changed-prediction calculus deliberately repairs observed set 34 cross-term/fraction errors within the regular finish.

## Independent Markov-chain side quest — 2026-09-24 (codex)

Verified local scanned *Biological Sequence Analysis* (Durbin et al.) visually: §3.1 Markov chains, Eqs.3.1–3.2 PDF p.58 / printed p.48; starting probabilities PDF p.59 / printed p.49; “Using Markov chains for discrimination,” transition-count estimate Eq.3.3 PDF p.60 / printed p.50. §3.2 Hidden Markov models, “Formal definition of an HMM,” transition/emission definitions PDF p.63 / printed p.53; generative example and joint probability Eq.3.6 PDF p.64 / printed p.54. Exact short excerpt on the state path is from PDF p.63. Re-extracted Bishop & Bishop §2.1.2 The sum and product rules PDF pp.46–48 / printed pp.26–28; §2.1.3 Bayes' theorem begins PDF p.48 / printed p.28 (continuation p.49 / printed p.29 previously verified). All quiz questions and copy-number values are tutor-authored adaptations, not book exercises. Six pages, 22–26 minutes including HMM reading; no answer key issued.

## Set 36 and Markov feedback — 2026-09-25 (codex)

Visually reverified Durbin et al., *Biological Sequence Analysis*: §3.1 Markov chains, Eqs.3.1–3.2 PDF p.58 / printed p.48; initial probabilities PDF p.59 / printed p.49 previously verified; transition estimation Eq.3.3 PDF p.60 / printed p.50 and sequence comparison PDF p.61 / printed p.51. HMM transition/emission definitions PDF p.63 / printed p.53 and generative/joint model PDF p.64 / printed p.54 reverified for feedback. Bishop & Bishop §2.1.2 PDF pp.46–48 / printed pp.26–28 reused from checked source; §2.2 Probability Densities Eqs.2.23–2.25 PDF p.52 / printed p.32 re-extracted for interval probability. Set 36 is entirely tutor-authored with an invented four-base transition matrix, not a numbered exercise or empirical CpG classifier. Logarithmic integration is a supplied-rule refresher with a normalized density.

## Set 37 — 2026-09-25 (codex)

Re-extracted Bishop & Bishop, *Deep Learning*, §2.1.2 sum/product Eq.2.9 PDF p.48 / printed p.28; §2.1.5 Prior and posterior probabilities and §2.1.6 Independent variables PDF p.51 / printed p.31; §2.2.1 Example distributions exponential Eq.2.34 PDF p.54 / printed p.34. Reused verified §2.2 interval Eq.2.23 PDF p.52 / printed p.32. ANGSD Genotype Likelihoods (https://popgen.dk/angsd/index.php/Genotype_Likelihoods), Theory → GATK and Beagle normalization note rechecked online: equal-copy mixtures, product over reads, epsilon/3 particular errors; documentation explicitly refers to historical first-GATK model, not current GATK. All set 37 items tutor-authored; toy distinct-fragment reads assumed conditionally independent, ordered data avoid an unrequested count combinatorial factor. No key issued.
