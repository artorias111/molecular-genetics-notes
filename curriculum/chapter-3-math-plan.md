# Chapter 3 mathematics: focused route to mid-October

## Closing math rotation replaces routine integrals — learner request, 2026-09-25

From the next new sheet (set 38 onward), replace the default closing integration question with one brief 2–4-minute math refresher chosen from:
1. Sums over uncertain genotypes: distinguish likelihoods, prior-weighted marginalization and posterior-weighted expectations; use a tiny biological model and identify what is held fixed/summed out.
2. Covariance/PCA: centering, a small covariance or projection calculation, interpretation of a direction/variance, then eigenvector connections as prerequisites permit. Connect to Chapter 3 structure analysis and the autoencoder bottleneck.
3. Partial derivatives and gradients: change one parameter while holding others fixed, assemble a small gradient and interpret effects on loss.
4. Chain rule, Jacobians and backpropagation: scalar paths first, then a tiny vector example with dimensions/conventions explicit; connect local derivatives to the total loss effect. Supply new prerequisites before asking for independent use.

This explicit preference supersedes all older requirements for an integral/calculus finish on every sheet. Rotate responsively to observed work and relevance, not a rigid four-topic schedule; one item per sheet, not all four. Integrals remain occasional when a density/expectation genuinely calls for one. Differential equations are not added. Label future timing guidance “Math refresher” or the actual topic rather than “Calculus” when the closing item is a sum or linear algebra task.

Keep the same ~12-minute target / 15-minute stop, five-minute complete core, optional extension, source boxes and generous same-page work space. Reading/new-concept hints count within the budget; simplify or split instead of adding workload. Until mid-October prioritize Chapter 3-relevant sums and covariance/PCA while retaining partial-derivative/chain-rule continuity and the previously agreed occasional ML sessions/weekly brief HMM recall. After mid-October increase ML-math emphasis toward Evo 2. This does not postpone the chapter checkpoint, create extra sections or infer mastery. Preserve the already issued set 37 and all earlier sheets/returns; no new worksheet requested in this preference update.


## Balanced recall through mid-October — learner refinement, 2026-09-25

This refines the earlier Chapter-3-first instruction: retain a few dedicated ML/autoencoder sessions before mid-October and approximately weekly HMM spaced recall. Chapter 3 remains the main near-term target; after mid-October, shift strongly toward ML mathematics for Evo 2.

Practical default at 4–5 completed sessions/week: 3–4 Chapter 3 sessions and 1 ML/autoencoder session (about three dedicated ML sessions before the checkpoint). Once that week, use one brief 2–3-minute Markov/HMM retrieval item within the existing recall/optional allocation of a sheet; replace another item rather than append work. Focus on attempted concepts (conditioning, transitions versus emissions, path sums, first-observation posterior, latent states) and repair errors; no compulsory new HMM algorithm sequence. If an HMM prompt needs a primer, count that time and reduce the rest. A full HMM sheet is not the default weekly requirement. Skipped weeks produce no recall backlog.

Preserve ~12-minute target / 15-minute stop, five-minute complete core, brief calculus and generous handwriting space. These are planning proportions, not attendance quotas. Because ML sessions use part of the same finite budget, the previous 14-popgen-session estimate is a topic/dependency map, not 14 popgen sessions plus extra ML/HMM work. Approximately 9–12 Chapter 3 sessions may fit at this cadence; prioritize essential calculations and explanation, combine only demonstrated skills and report remaining gaps at mid-October rather than guaranteeing full coverage. Autoencoder recall/session selection uses graded set 35 evidence; no automatic promotion of mastery. Set 36 and existing returns remain unchanged.


Confirmed scope source: learner-designated `refresher-notes-quizzes/`, 2026-09-25. Agent: codex. This is the Chapter 3 preparation sequence within the existing daily course, not a new worksheet series or an instruction to complete the old 1–1.5-hour refreshers. Preserve those files and any returns.

Target: around October 15, explain the essential mathematics behind the Chapter 3 analyses, demonstrate small calculations, and state assumptions/uncertainty. Then shift strongly to ML mathematics toward the December 31 Evo 2 explanation target. The original 14-unit outline below is a dependency map, not a quota of 14 popgen sessions. With the learner-requested ML interleaving, plan roughly 9–12 Chapter 3 sessions plus about three ML sessions; full coverage remains ambitious, not a mastery promise. Retain ~12 minutes / 15-minute stop, five-minute complete core, one optional extension and brief calculus; choose relevant calculus connections where useful. No backlog from skipped days. Reallocate from successful checks to observed gaps rather than automatically adding sessions.

## Source-to-mathematics map

| Existing refresher | Required mathematical focus |
|---|---|
| Day 5: genotype likelihoods and artifacts | Conditional read model, chromosome-origin mixture, independent-read product, likelihood versus posterior, genotype marginalization, allele-frequency inference; depth/error and non-independent sampling |
| Days 5 and 4: SFS and nulls | Allele-count likelihood versus SFS, folded/unfolded counts, conceptual EM, spectrum weights for diversity and segregating sites, Tajima's D and model-dependent nulls |
| Day 1: species and divergence | Pairwise differences, within/between-population diversity, net divergence, estimator-specific FST, mutation/coalescent-time units and assumptions |
| Days 3 and 5: structure/LD/artifacts | Covariance and PCA interpretation, genotype uncertainty in structure inference, LD and effective information, relatedness/batch confounding; inversion diagnostics as hypotheses rather than unique proofs |
| Day 2: ILS and introgression | Coalescent waiting/survival, discordant-tree symmetry under its assumptions, ABBA–BABA and f4 orientation, outgroup/polarization assumptions, block jackknife and interpretation limits |
| Day 4 and cross-cutting questions | Descriptive rank versus calibrated test, demographic/linked-selection alternatives, effect size versus uncertainty, pipeline explanation |

The directory establishes curricular scope. It does not establish that the learner has attempted/mastered these topics or that every proposed analysis is implemented. Recheck supporting papers and estimator definitions before teaching; these older notes contain categorical simplifications. In particular, verify the assumptions behind net-divergence/time approximations; FST estimator and aggregation conventions; D/f4 sign orientation; what folding protects and does not; inversion/PCA specificity; demographic patterns and artifact directions. Do not silently use these notes as a technical answer key. No corrections to the old files are requested here.

## Topic allocation to prioritize within the remaining sessions

| Original topic units (combine/adapt from attempts) | Focus and check |
|---|---|
| 1–3 | Reconstruct one-read GL, combine two reads, normalize genotype weights; then connect uncertain genotypes to a simple allele-frequency likelihood under explicit genotype-frequency assumptions. Check independent setup with a tiny changed example. |
| 4–6 | Marginalize to allele-count uncertainty; understand the SFS and folding; calculate a small diversity/segregating-site example and explain the different frequency weights behind Tajima's D. One compact conceptual EM step if prerequisites permit; no full software implementation. |
| 7–8 | Compare within/between-population differences, net divergence and a specified FST estimator; explain dependence on diversity and assumptions needed for a time interpretation. |
| 9–10 | Small covariance/projection/PCA interpretation and LD/relatedness effects; explain why depth/reference bias can affect inferred structure without asserting a universal direction. |
| 11–12 | Coalescent survival/ILS symmetry and a small ABBA–BABA/f4 example with explicit population order; explain what the statistic does and does not identify. |
| 13 | Linked observations, block-jackknife logic, standard error/Z and why an empirical quantile alone is not a calibrated null test; connect to demographic alternatives. |
| 14 | Explain a reads → uncertainty → population summaries/structure → interpretation pipeline, with one small calculation and assumption check. Record remaining gaps honestly. |

Order is adaptive: move a source-required prerequisite just before its first use, combine concepts already demonstrated, and use optional space for depth rather than larger required workloads. New HMM algorithms remain outside this urgent route; retain one brief weekly Markov/HMM retrieval item inside an existing sheet and roughly one dedicated ML/autoencoder session per week. Set 36 remains available as already issued; it need not become a gate. The next newly requested sheet should start the chapter-specific GL chain, calibrated to latest attempts. No new sheet is issued by this planning update.
