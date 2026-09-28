# Opening plan: Day 20 onward

**Scheduling update, 2026-09-15:** Days 24 onward follow `two-week-plan.md` and the revised root syllabus. The table below records the earlier plan, not the current daily budget or next-day instruction.

These are intended objectives, not automatic advancement. Re-slice any unfinished concept
within the next day's hour. Day 18/19 content is not assumed mastered. Each issued sheet cites
its exact section/exercise and verified pages, includes its notation/primer, and records what
was issued in `course/progress.md`. Day 20 is the only sheet issued by this refactor.

| Day | Math (20 min, including primer) | Genes XII biology (20 min) | Stats (5 min) |
|---|---|---|---|
| 20 | Bayes and likelihood orientation; Bishop Ex.2.1, plus a labeled toy GL bridge | §8.2: nucleosome protection → interpret an accessibility measurement | Donors vs nuclei as replication |
| 21 | Decode Bernoulli outcomes; Ex.3.1 normalization/mean only; Phred definition as a genomics bridge | §8.3: histone core and DNA contacts; one perturbation | Read-level vs individual-level sampling noise |
| 22 | Ex.3.1 variance only after expectation; derive one-read heterozygote likelihood by averaging over allele of origin | §8.4: histone modifications and readers | Define a population allele-frequency estimand |
| 23 | §2.1.6 and §11.2 selected: two independent reads conditional on genotype; label as tutor application | §26.8–26.9: remodeling vs modifying histones | PCR duplication and effective information |
| 24 | §3.1.2 binomial count vs ordered reads; Ex.3.3 split, Pascal identity only if counting ready | §8.11: DNase sensitivity, matched accessibility controls | Reference/mapping bias and missingness |
| 25 | Synthesis: GL vs posterior; change a prior with read evidence fixed (Ex.2.1 transfer) | Interpret MNase vs ATAC direction; one integrated figure | Coverage vs certainty |
| 26 | §2.3.2 logs; likelihood ratios and rescaling; re-teach log rules first | §26.2–26.3: cis sites and trans factors | Observed data vs fitted quantities |
| 27 | §2.1 and §2.6: HWE weights from two sampled alleles, sum over hidden genotype | Ch.18 selected: promoter and transcription initiation | HWE as an explicit model assumption |
| 28 | Multiply marginalized likelihoods across individuals; a two-individual toy site | §26.6: activators and the basal machinery | Individuals, sites and linkage |
| 29 | Expectation refresh, Ex.2.11 expectation identity only if ready; posterior dosage | §26.10: acetylation and transcription, mechanism plus limits | Read fraction vs allele frequency |

Spaced repetition is always selected from actual attempts, not filled from this table.
Expect the genotype-frequency/EM/SFS bridge to take additional sessions (roughly Days 30–45,
expand as needed): discrete expectation → an allele-frequency likelihood on a small grid →
one derivative → E/M updates → a two-site allele-count likelihood example → SFS → diversity.
Do not rush directly into Bishop's full multivariate Gaussian EM derivation.

## Verified Bishop exercise bank

| Exercise | Verified location | Use and splitting rule |
|---|---|---|
| 2.1 | printed p.58 = PDF p.78 | Posterior after a positive test with changed prior; Day 20 uses the original toy values and adds a genomics transfer |
| 3.1 | printed p.105 = PDF p.124 | Bernoulli normalization, mean, variance, entropy; split, defer entropy until logs/entropy taught |
| 3.3 | printed pp.105–106 = PDF pp.124–125 | Combinations → Pascal identity → binomial theorem → normalization; separate sessions, not one 20-minute task |
| 2.10 | printed p.59 = PDF p.79 | Mean/variance of sums; requires expectation/variance |
| 2.11 | printed p.59 = PDF p.79 | Total expectation, then total variance on a later day; useful before marginalization/EM |
| 3.4 | printed p.106 = PDF p.125 | Binomial moments via derivatives; only after derivative/prerequisite refresh |

Applications to GLs, HWE, EM for allele frequency, and SFS must be labeled as applications;
they are not numbered genotype-likelihood exercises from Bishop. Verify subsequent exercise
numbers directly in the book before assigning them.
