# Adaptive route: explain a tiny autoencoder

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


## Chapter 3 scope confirmed — 2026-09-25

Learner explicitly designates `/Users/shriram/Documents/PhD/Learning/molecular-genetics-notes/refresher-notes-quizzes` as the Chapter 3 scope reference. The request for a separate methods list/path is resolved; do not ask again merely because the source is a refresher series. Use `curriculum/chapter-3-math-plan.md` for the focused ~14-session allocation toward mid-October, covering GL/allele-frequency/SFS math, diversity/divergence/FST, PCA/LD, coalescent/ABBA–BABA and uncertainty/nulls. Old refresher schedules do not override the short-session contract. Source-check technical definitions and qualified claims at authoring; do not infer completion from the files. After the mid-October checkpoint, strong ML focus toward Evo 2 remains the plan.


## Priority correction: Chapter 3 by mid-October, then ML — 2026-09-25

LATEST learner instruction supersedes the same-day month-long HMM/GL cycle and parallel-through-December framing. Target explaining the mathematics of the actual Chapter 3 population-genetics analyses by approximately October 15, 2026. After that, shift strongly to ML mathematics toward the confirmed December 31 Evo 2 explanation target. Chapter 3 is the near-term priority, not a secondary application to defer until November/December.

Until the mid-October checkpoint, use the main teaching slot primarily for the required Chapter 3 mathematical chain: read/error model and GLs → genotype uncertainty, priors and allele-frequency inference → required SFS/diversity/divergence and structure methods. Exact coverage must follow the current chapter methods inventory; the older refresher is only provisional context. Ask for the current required methods/path and do not assume admixture tests, demographic inference or every historical refresher topic is required. Technical estimators/assumptions must be source-verified at authoring; old refresher simplifications are not authoritative.

HMMs and general nucleotide modeling are optional side interests and must not consume the limited Chapter 3 preparation window unless directly required by its methods. Remove the obligatory two-ML/one-GL/one-HMM cycle and month-long HMM completion target. Autoencoder ideas may receive a brief relevant recall item, but do not force a separate competing ML section before the chapter deadline. Set 36 remains issued and available, without regeneration or a catch-up requirement; the next newly requested sheet should address Chapter 3 priorities once current attempted work and scope are checked.

Preserve the learner's existing ~12-minute target / 15-minute stop, five-minute core, optional extension and brief calculus; the user has changed priority/deadline, not authorized longer sessions. Around three weeks at 4–5 sessions/week provides only ~12–15 sessions (~2.4–3.75 hours), so target explaining and checking the actual pipeline's essential mathematics, not mastery of all population genetics. Use small worked setups, interpretation and changed-example checks; report gaps honestly rather than guaranteeing readiness or extending the deadline silently.

At mid-October, assess ability to identify each required method's estimand, data, latent quantities/parameters, assumptions, key expression and uncertainty/failure modes. Then prioritize Bishop-guided ML: neural-network/autoencoder foundations, matrix calculus and optimization, categorical prediction/softmax and negative log-likelihood, then sequence architectures and Evo 2 paper explanation as progress supports. Remaining popgen repairs should be explicit and learner-directed, not an indefinitely scheduled strand. No grades, original sheets or returns change with this correction.


Day 26 return calibration (2026-09-19): learner explicitly confirms the short format works; retain it, targeting about 12 minutes with a 15-minute stop for upcoming sheets. All four answers correct. Remove repeated elementary negative-sign/squaring reminders per margin feedback; reserve hints for new concepts or observed errors. Do not expand workload because this first attempt succeeded.

Revised 2026-09-19 by codex. This replaces the former Days 24–37 calendar. These are small milestones, not deadlines; split or repair them based on attempts. Main sessions take 10–20 minutes including recall and a 2–4-minute calculus finish. A five-minute core counts as complete.

| Milestone | Five-minute core | Optional next step |
|---|---|---|
| 1. Follow the model (Day 26) | Encode two numbers into one; decode back into two | Calculate one reconstruction loss |
| 2. Understand the shapes | Match input, code and output dimensions to matrices | Change one input; compare reconstructions |
| 3. Understand error | Compute squared reconstruction error | Compare two supplied parameter choices |
| 4. Change one weight | Express reconstruction loss as a function of one weight | Differentiate a small polynomial loss |
| 5. Connect the chain | Differentiate decoder output with respect to the code | Trace one encoder weight's effect through the decoder |
| 6. Learn one step | Use a supplied gradient and learning rate | Recompute loss after the update |
| 7. Explain the bottleneck | Show two inputs that share a code in a toy linear model | Connect linear reconstruction to PCA with assumptions supplied |
| 8. Add nonlinearity | Apply a supplied activation in a tiny forward pass | Explain why training loss alone does not ensure a useful representation |
| 9. Explain the full model | Annotate encoder, decoder, loss and update in one diagram | Give a short end-to-end explanation in your own words |

Bishop Ch.19 / §§19.1.1–19.1.2 anchors the destination; Ch.6–8 supplies only prerequisites needed at each step. Exact assignment pointers are verified at authoring. This route establishes deterministic autoencoders; VAEs require a later probability/inference extension.

Every second or third completed session, offer one genotype-likelihood task, replacing ML if preferred. The first restores pending delayed read-origin reconstruction with assistance recorded; then normalize genotype likelihood × prior weights using one shared sum. Do not require the old Day 25 sheet as catch-up. Biology is optional on request; no separate stats quota.

Calculus finishes rotate familiar ML-relevant material: bounded polynomial density area, polynomial expected loss, exponential density area, simple substitution, then expectations. Start with one integral; use two only if comfortably within time. Keep methods familiar before increasing complexity and do not claim integrations are required for the initial forward pass. Integrate one or two relevant recall items, with no ten-question gateway.

## Day 28 adaptation — 2026-09-20

Normalization succeeds with the supplied table, but single-read reconstruction again omits half weights. Learner reports procedural table-filling, not fluency. Next scheduled GL task should elicit choose-chromosome → generate-base reasoning and why origin probabilities weight the routes; fade one scaffold at a time before multi-read progression. Keep pre-drawn tables when needed, but do not use repeated arithmetic completion as the sole test of understanding. Keep this within the current short budget. Resume autoencoder parameter/loss work next; no extra catch-up.

## Calculus variety calibration — 2026-09-21 (codex)

Learner flags repetition after two polynomial integrals and two nearly identical exponential substitutions, all solved correctly. Rotate technique/purpose rather than changing coefficients in consecutive sessions. Next: brief integration by parts linked to an exponential expectation; later logarithmic integrals, expected losses and piecewise integration as prerequisites allow. Revisit successful techniques after a gap, or sooner only for observed errors. Keep one question by default, optional hint, 2–4 minutes inside the same 15-minute session cap; verify exact source pointers at authoring. This is variety, not an increase in workload.

## Assumptions to likelihoods and objectives — learner priority, 2026-09-22

The learner explicitly wants long-term fluency translating modeling assumptions into a likelihood or objective through the existing problem sets. Make this a recurring thread within the short-session budget, not a separate course or extra homework. Build from a concrete scientific question: identify observed data, unknown quantities and parameters; state a sampling/noise model; derive the probability of observations; combine observations only under explicit dependence/independence assumptions; form a likelihood and, when useful, a negative-log-likelihood objective. Explain any regularization or other objective terms separately rather than implying all losses automatically follow from a likelihood. Connect squared reconstruction error to an explicitly assumed Gaussian observation model when prerequisites are ready. Include interpretation and a small assumption/failure-mode check. Fade scaffolding based on submitted reasoning: complete a missing step, explain a supplied model, then construct a small model independently. Use both autoencoder/ML and staggered genotype-likelihood applications; preserve the current 15-minute cap and calculus finish. No resequencing or retroactive sheet changes required; set 32 remains issued as-is.

## Progression toward Bishop exercises — 2026-09-23 (codex)

Learner reports slowly becoming comfortable with current difficulty and explicitly wants harder problems over time and a realistic route to Bishop exercises. Current short questions are introductory and scaffolded; set 32 supports removing one support at a time, not increasing duration. Set 33 adds judging a claim and an optional inverse problem. Plan an appropriate verified original Bishop exercise or clearly identified part within the next 5–10 completed sets, replacing ordinary work within the cap. Earlier Ex.3.1 parts were already attempted; distinguish a fresh independent checkpoint from first-ever exposure. A tentative 20–40 further short sets is a planning range for comfort with selected foundational exercises, not a guarantee or a forecast of whole-book proficiency. Reassess from independent setup, multi-step reasoning, checks and transfer; completion count alone is insufficient. Broader proof/matrix-heavy exercises need longer development. Continue fading scaffolds and preserve staggered GL, calculus variety and no backlog.

## Set 34 adaptation — 2026-09-24 (codex)

Changed-assumption origin weighting succeeds: learner predicts direction and constructs the 3/4–1/4 mixture correctly, with clear origin labels. Q2 equal mixture also correct, explanation sentence missing; do not equate absent prose with misconception. Next staggered GL may test a small two-read product with conditional independence explicit; independent posterior construction remains pending. Resume ML in between. Calculus integration method correct but square cross term and fraction addition fail: replace next finish with a compact repair and nonnegative-error check within existing time. Slope/value prompted recall repaired. Preserve scaffold fading and original Bishop checkpoint; no workload increase or automatic mastery promotion.

## Set 35 adaptation — 2026-09-25 (codex)

All four answers correct, including supplied-factor encoder chain rule, update/actual-loss check and polynomial repair. Fade one gradient scaffold in a later transfer or proceed to a small bottleneck interpretation; no broad independent-gradient mastery inferred. Calculus expansion/fraction/check repaired: rotate technique/purpose, not another coefficient-only repeat. Margin asks why density 1 coexists with prediction 1/4; explicitly label p_T(t) versus constant prediction a and show E[(T−a)²]=integral (t−a)²p_T(t)dt in the normal budget. Keep ~12-minute target / 15-minute stop, staggered GL and pending posterior construction; no new sheet or workload increase.

## Nucleotide-sequence modeling integration — learner request, 2026-09-25

From set 36 onward, integrate classical nucleotide-sequence modeling into the existing mathematics/model-building strand. Learner wants intuition for how DNA is represented statistically. Keep Bishop & Bishop as the explicit mathematics spine; use Durbin et al., *Biological Sequence Analysis*, with verified local section/page pointers, for sequence applications. Label toy values and tutor adaptations honestly.

Rotate nucleotide modeling with autoencoder/ML and genotype-likelihood tasks inside the existing ~12-minute target / 15-minute stop. This is not an extra compulsory section or a second course; preserve the five-minute complete core, one optional extension, brief calculus finish, staggered GL repairs, autoencoder route and planned Bishop exercise checkpoint. Not every strand must appear on every sheet. Advance from attempts rather than issuance.

Adaptive sequence: conditional product rule and initial-vs-conditional string probabilities → four-base transition counts and normalization → independent-base versus first-order sequence models, base order and log-likelihood/model comparisons → simple hidden genomic regimes, emissions versus transitions and sums over paths → small forward updates when ready. Supply prerequisites before use and distinguish adjacent-position transitions from evolutionary substitution models. Do not treat a toy high-CG sequence as proof of a biological CpG island. HMM algorithms and evolutionary-time models require later explicit assumptions, not an immediate jump.

Current evidence: Markov side quest 4/5, with correct route sums, row-normalized estimates and first-emission Bayes posterior. Repair exact conditioning, unconditional path factor and joint pair frequencies. Set 36 begins that repair using observed A/C/G/T strings. Preserve all original sheets and returned solutions.

## Bounded HMM/GL block; ML remains central — learner clarification, 2026-09-25

This narrows the earlier same-day nucleotide-integration plan. The learner wants to finish an introductory HMM/genotype-likelihood block in roughly one month, then focus scheduled work on ML mathematics. Treat this as a scope and direction preference, not a promise of mastery or daily attendance. Autoencoders remain central throughout; nucleotide modeling is an application within the bounded HMM block, not a third expanding genomics strand.

Planning estimate: about 20 completed short sessions over roughly 4–6 weeks if feasible (~4–5 hours total at 12–15 minutes per session). Use a flexible four-session cycle: two autoencoder/ML sessions, one GL session, one Markov/HMM session. This temporarily replaces the earlier every-second/third-session GL cadence. Set 36 is already issued and counts as the first sequence-modeling session when attempted; return to autoencoder/ML next. Keep the five-minute complete core, optional extension, brief calculus, existing cap, no backlog and original Bishop checkpoint. Fewer completed sessions mean less coverage, not extra homework.

Bounded exit targets, checked with tiny changed examples and minimal scaffolding:
- GL: construct a one-read genotype likelihood by summing weighted chromosome-origin routes; multiply reads only under explicit conditional independence; normalize likelihood × genotype prior; explain likelihood versus posterior and a sampling/error assumption.
- Markov/HMM: distinguish observed bases/measurements, hidden states and parameters; form joint versus conditional sequence probabilities; distinguish transitions from emissions; sum a two-step hidden-path example and perform one small forward update; explain sequence likelihood (sum over paths) versus most-probable path (Viterbi idea, no full implementation required).
- ML: continue forward passes, loss, chain rule/update, bottleneck interpretation and gradual scaffold fading during the block.

Do not expand the required block into full forward-backward derivations, Baum–Welch/EM training, population SFS/EM, evolutionary substitution theory or production implementations. These are deferred, not implied learned. At around 20 completed sessions / the month review, record which exit targets are demonstrated and remaining gaps. Transition scheduled work to Bishop-guided ML mathematics as requested; do not indefinitely extend genomics until perfect. Any extra focused repair beyond this block is optional and learner-directed. No new sheet or alteration of set 36 is required by this clarification.

## Confirmed outcomes: Evo 2 explanation and Chapter 3 mathematics — 2026-09-25

Learner explicitly confirms the December 31, 2026 target: give a technically grounded 10–15-minute explanation of Evo 2 to another biology PhD, supported by a tiny numerical example and answers about the training objective, architecture's purpose, evidence and limitations. This is an educational target, not a guarantee of mastery, full architectural derivation or implementation. In parallel, learner wants sufficient mathematical understanding for their Chapter 3 analyses; GL work serves that research need.

Keep the bounded introductory HMM/GL block and autoencoder-first route. After its month-scale review, scheduled work becomes primarily Bishop-guided ML mathematics, with Chapter 3 examples used selectively to apply the same probability, optimization and matrix concepts. Do not interpret the earlier transition as abandoning thesis-relevant mathematical gaps or mark full Chapter 3 readiness from a small GL checkpoint. Do not expand HMMs into an indefinite side course or add workload.

Tentative route to December: finish introductory conditional-probability/GL/HMM targets alongside autoencoders through roughly late October; move toward embeddings, categorical prediction/softmax, negative log-likelihood/cross-entropy and backpropagation during November; teach small convolution/attention examples and read selected Evo 2 architecture/results in December as attempts permit. Advance by demonstrated setup and explanation, not dates alone. Preserve 12–15-minute sessions, five-minute core, calculus and the original Bishop exercise checkpoint; no required coding.

Chapter 3 alignment: local `refresher-notes-quizzes/README.md` identifies the Gadus lcWGS chapter; the existing day-5 refresher discusses GLs, allele-frequency/SFS inference and PCAngsd. These are orientation sources, not a verified current chapter methods inventory. Ground future chapter-specific exercises in the actual current analysis/methods when available, and source-check technical claims before authoring. Near-term outcomes: explain the read-error model, likelihood versus posterior, conditioning/marginalization and uncertainty rather than hard calls. Later connect shared mathematics to allele-frequency/latent-genotype estimation, SFS and covariance/PCA only to the depth the chapter needs. Population EM/SFS remains outside the one-month introductory completion promise; any later focused treatment replaces ordinary practice rather than adding a compulsory strand.

Keep the two outcomes visible: explain how Evo 2 learns and how evidence supports its claims; explain why Chapter 3 estimators/analyses are appropriate, including assumptions and uncertainty. Reassess feasibility from independent changed-example performance; no guarantee that 11–17 hours by year end establishes all chapter mathematics.

## Set 36 calibration — 2026-09-25 (codex)

Conditioning on the immediately previous base is now correctly written in both path calculations. Full-string initial factor present, but the requested start-given probability is absent and its explanation confuses the Markov assumption with conditioning. Use a brief transferable joint/conditional check in the next Chapter 3 GL session; later weekly HMM recall can test it with changed values. Correct GCC factors followed by a decimal slip; calculus method and exact logarithmic result correct, range check omitted. No full redo or workload expansion; preserve learner-requested ML interleaving and mid-October priority.
