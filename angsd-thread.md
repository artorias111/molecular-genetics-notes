# Standing Thread: The ANGSD/GL Derivation Ladder
*Rides the Math/ML 15m slot. Not a new module — do not extend the 60-min cap.*

**Why this exists.** Chapter 3 is ~109 low-coverage cod genomes at ~8.6x analyzed
entirely in genotype-likelihood space (ANGSD → PCAngsd → NGSadmix). I can run the
tools. I cannot currently re-derive what they compute, which means I cannot defend
them in a committee meeting, tell a plausible result from an artifact, or write the
methods section honestly. **Target state: I can read Meisner & Albrechtsen 2018 and
Skotte et al. 2013 and reproduce their update equations on a blank page, unaided.**

**Scheduling note — deliberate front-load.** This thread needs EM, eigendecomposition,
and PCA, which the syllabus places in Module 5 (months 8–10). Pull *only that slice*
forward now; do not resequence the rest of the syllabus. My tracker says EM E-step is
already a strength and GMM covariance geometry is a weakness — build on the first,
repair the second here, since PCAngsd is essentially both objects at once.

**Hard constraint: this is a math thread, not a software thread.** Never give me
ANGSD command lines, flag explanations, or pipeline advice. If a rung can be answered
by reading a man page, it does not belong here.

### The ladder — in order, do not skip
Each rung is a Math/ML slot (~15 min, occasionally two). Do not advance until I have
produced the derivation myself.

1. **The genotype likelihood.** Derive `P(reads = 10^(−Q/10)`,
   the diploid `(1/2)[P(b|A₁) + P(b|A₂)]` per-read mixture, the product over reads.
   Make me state every independence assumption.
2. **Why log-space.** Numerical underflow with 10⁶ sites; log-sum-exp. Make me compute
   a case where the naive product silently underflows.
3. **Bayes to the genotype posterior.** `P(G|D) ∝ P(D|G)P(G)`, the HWE prior, and what
   changes when the prior is wrong — this is the truth.
4. **Depth dependence, derived not asserted.** Show me *algebraically* why low depth
   biases toward homozygosity under hard calling, and why the unbiased estimator
   does not. This rung is the one my thesis actually rests on (§5.2 of the design doc).
5. **ML allele frequency from GLs.** The single-site estimation of f;
   derive the EM update. Contrast with counting alleles from hard calls.
6. **EM properly.** Jensen's inequality, the ELBO, why it increases the
   likelihood, and why it can stall at a local optimum. Not a recipe — a proof.
7. **The SFS by EM** (Nielsen et al. 2012). Estimating the site frequency spectrum as a
   latent-variable problem; folded vs unfolded and what folding costs.
8. **Thetas and Fst from the SFS.** Watterson estimator and other functionals of
   the SFS; how Tajima's D falls out. Tie to Hoff's fusion signature (elevated LD,
   positive Tajima's D, reduced d_XY).
9. **Covariance from posterior dosages.** E[G|D], the covariance matrix, and where
   uneven depth still leaks in despite the GL framework.
10. **PCA as eigendecomposition.** Covariance → eigenvectors, the SVD relationship, what
    a PC *is*. Repair the covariance-geometry gap here.
11. **PCAngsd** (Meisner & Albrechtsen 2018). The iterative loop: individual allele
    frequencies from the PCA → better priors → better covariance.
    Make me identify what kind of fixed-point this is and what guarantees it lacks.
12. **NGSadmix** (Skotte et al. 2013). EM for Q. Make me write
    both update steps and say why the likelihood is non-convex in (Q, F).

### How to run it
- **Use my real numbers.** n = 109 individuals, 4 groups
  (40 / 30 / 12 / 30). Worked examples should use these, not toy values — I need
  intuition calibrated to my actual design, including this.
- **Standing reading rep, pointed at ANGSD.** Most sets, quote one equation *verbatim*
  from ANGSD/PCAngsd/NGSadmix/Nielsen and make me decode the index, state
  what each sum ranges over, say what the object is before and after the operator.
  Rotate the format — symbols→words, words→symbols. This is
  the single highest-value exercise in the thread; the bottleneck is notation, not ideas.
- **Every sheet self-contained.** Restate any equation in a
  `#ref_box()` rather than referring back — sets slip by days and I cannot flip files
  while writing on the tablet.
- **One adversarial question per set.** Give me a plausible-looking wrong result
  (a PC that tracks depth, an admixture plot that is an artifact, a Tajima's D
  driven by a collapsed repeat) and make me diagnose it from the math. Distinguishing
  artifact from biology is the actual skill; the core of it.
- **Grade for derivation, not recall.** If I write a correct formula I cannot derive,
  mark it wrong and put it back in spaced repetition.

### Done when
I can, cold and unaided: (i) write the genotype likelihood from Phred scores;
(ii) derive one full EM update — allele frequencies including why it
converges; (iii) explain PCAngsd's iteration and name what it assumes; and (iv) given a
suspicious PCA from my own data, state which quantity is wrong.
**Capstone artifact:** a marimo notebook that simulates reads at 2x/8.6x/30x for known genotypes,
computes GLs, and shows the hard-call heterozygosity estimate as a
function of depth — a figure I can put straight into the thesis methods section.
