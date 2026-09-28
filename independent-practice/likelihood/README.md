# Independent likelihood practice

Paper 01 was requested and issued on 2026-09-17 by codex. It is separate from daily problem sets, daily timing, grades and scheduling. No attempt or mastery is inferred from issuance.

- Paper: `likelihood-challenge-01.pdf`; editable source: `likelihood-challenge-01.typ`.
- Duration: 60 minutes including instructions and review. Basic calculator permitted.
- Ten MCQs: six single-correct (+3/−1/0) and four multiple-correct (exact set +4; a proper nonempty correct subset +1 per selected option; any wrong selection −2; blank 0). Maximum 34.
- Twelve pages, 6.2 × 8.27 inches; one question per page with 3.5 inches of reserved working space. Work is diagnostic, not separately scored.
- No answer key published. Grade after a submitted attempt or provide solutions upon explicit request. Keep independent grades here, not in the daily grade log.

## Sources and verification

All items are tutor-authored adaptations, not reproduced book exercises. Source boxes above questions provide exact reading pointers.

- Andrew Ng and Tengyu Ma, *CS229 Lecture Notes*, June 11, 2023: local `textbooks/CS 229 notes Andrew Ng.pdf` (227 pages). §1.3 Probabilistic interpretation, PDF pp.16–18 / printed pp.15–17; density/likelihood/log-likelihood material on PDF pp.17–18 visually checked. §2.1 Logistic regression, Bernoulli likelihood, PDF p.23 / printed p.22 visually checked. These pointers do not refer to the older 30-page standalone Stanford handout.
- [Practical Computing and Bioinformatics for Conservation and Evolutionary Genomics, Chapter 20](https://eriqande.github.io/eca-bioinf-handbook/variant-calling.html#genotype-likelihoods), §20.1.1 Basic Sketch of Genotype Likelihood Calculations, checked online. Its worked error calculations use a binary flip model. The paper labels that model B explicitly rather than silently mixing its epsilon with the four-base model's epsilon/3.
- [ANGSD Genotype Likelihoods](https://popgen.dk/angsd/index.php/Genotype_Likelihoods), Theory / GATK: equal-origin mixture and symmetric four-base errors, labeled model F. No current software-behavior claim is tested.
- Bishop & Bishop, *Deep Learning*: §2.1.2 PDF pp.46–48; §2.1.3 PDF pp.48–49; §3.1.2 PDF pp.86–87. Uses existing verified local source ledger.

Validation: final pages visually reviewed, arithmetic checked with exact fractions where possible, likelihood comparisons and a counterexample to the unequal-quality shortcut checked, marking-rule selection cases checked. The paper includes no prerequisite derivatives or code requirements.
