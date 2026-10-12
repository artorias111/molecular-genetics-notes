# Agent notes
Summary as of [[10-09-2026]] (replaces any earlier summary). Read this first.

- Contract: AGENTS.md (CLAUDE.md symlinks to it). Daily sheets ~12 min target / 15 min stop, Chapter 3 popgen priority until ~Oct 24 checkpoint, then ML toward Evo 2 explanation by Dec 31.
- Daily sets: latest issued set 42 (GL two fish, expected T count), not yet returned. Recurring weak spot: joint vs conditional; multiplying route halves across reads instead of summing within a read. Next: TT two-A-reads check, then set 42 Q2/Q3.
- ML refresher workbook graded 8.5/13 (sick, rushed). Computations solid; gaps are loss choice by target type, MSE vanishing push, .grad accumulation, curve diagnosis, permute vs squeeze. Feedback in `ai-grader/ml-refresher-feedback.md`.
- Issued `misc/ml-refresher-part-2.pdf` (one sitting, 10 Q, answers in the 10-09 entry). Then a Bishop reading week (list on its last page), then a new ML quiz ~10-16-2026 on the same gaps.
- Weekly ML notebooks replace the weekly ML sheet: `ml-notebooks/` (uv, marimo). `01-data.py` issued, not attempted. Copy cells build `projects/promoter-cnn/` (own future repo, gitignored). Roadmap in `ml-notebooks/README.md`. Test each notebook via a filled scratch copy.
- Redirect rule: after 2 sets in a Mon–Sun week with no notebook, refuse the next set and send learner to the notebook. Starts Oct 12–18. Learner has Nextflow Summit Oct 13–14.
- Learner worried about postdoc readiness. Be honest: coding is a real gap, misses are fixable recognition knowledge.
- Tools: typst and poppler pinned in pixi.toml. Archive PDFs with `scripts/archive_learning.py` at issuance/grading.

---
---
[[10-11-2026]]
agent: claude

- Graded set 42: 1.5/3. Learner sick most of the week. Q1 labels right, both-reads value 1/2(0.97) x 1/2(0.01) = 0.0024 instead of 0.49 x 0.49 = 0.2401 (3rd time). Q2 blank, wrote "help!". Q3 expected T = 0.5 correct. Feedback in `ai-grader/set-42-feedback.md`.
- Learner asks for ~25 min/day this week only (Oct 12-18) to catch up on Chapter 3. Recorded in AGENTS.md.
- Plan change for GL: stop repeating "collapse each box" rule. Use counts (100 reads, 48.5 + 0.5 = 49 show A), which is what fixed joint vs conditional in set 41.
- Honest status: still in plan units 1-3 (GL to allele frequency). Units 4-14 untouched with 13 days to Oct 24. Raised scope vs date with learner.
- Archived set 36 PDF at set 43 issuance. Manifest `course/archive-manifests/20261011-211053-324098.json`.
- Issued `problem-sets/set 43.typ/.pdf`, 5 pages, 25-min week format, no key. Counts-framed GL, new sequencer 0.94/0.02. Q1 AT one read 47 + 1 = 48 → 0.48; pairs 23.04 → 0.2304. Q2 two A reads: AA 0.94/0.8836, AT 0.48/0.2304, TT 0.02/0.0004. Q3 fish 2 at f=0.5 as 100 fish: 23.5 + 12 + 0.0025 = 35.5 → 0.355; optional f=0.25 → 0.6188. Q4 0.125 x 0.355 = 0.0444 vs 0.0094 (~4.7x); optional 0.0963 x 0.6188 = 0.0596. Q5 covariance: means 1, 1; products 1,0,0,1; cov 0.5, positive.
- Learner found Q1 table vague ("fraction of what?"). Remade set 43: every header says what goes in the cell and how; Q2 got a step-by-step pairs table (a)-(d); answer line for Q1. Same answers as above.
- Verifier agent solved it from the sheet alone: answers matched. Fixed its flags: undefined fish 2, old vs new sequencer, fish 1 read order and L, f=0 cell source, Q5 centering wording, spurious "Recall 5 min" (template now hides Recall when review = 0; sets 38/42 still compile).
- New rule: second agent verifies every sheet before issuing. In AGENTS.md and memory.
- Graded set 43: 4.4/5. Counting framing worked: pairs table 0.2304, GL table, fish 2 = 0.355, product 0.0443 all right. Slips: AT one-read cell 0.94 (copy), covariance sign read as "dosage below mean". Learner asked "wdym better supported?": undefined term, verifier missed it. Feedback in `ai-grader/set-43-feedback.md`.
- Next: unscaffolded two-read GL with changed error (does counting transfer?), likelihood over an f grid, covariance sign.
- Learner: tables felt like instruction-following, wants varied formats and real by-hand math. Recorded in AGENTS.md and memory.
- Issued `problem-sets/set 44.typ/.pdf`, 5 pages, 25 min, no tables, no key. First varied-format sheet. Q1 derive P(A|AT) = 1/2(1-e) + 1/2(e/3) = 1/2 - e/3; e=0.06 gives 0.48; both reads (1/2 - e/3)^2; e=0 gives 1/2. Q2 find the mistake (1/2(0.94) x 1/2(0.02) = 0.0047 is one origin combo; add within a read, multiply across independent reads). Q3 predict f ~ 0.25 (1 T of 4 copies); compute f=0.25: 0.09625 x 0.61876 = 0.0596. Q4 sketch 5 points, peak ~0.28 (grid max 0.281), ratio 0.0596/0.0094 ~ 6.3. Q5 covariance sign: X positive, Y = -2/3.
- Verifier agent answers matched. Fixed: read and fish independence, HWE, f defined as T frequency, L defined, old sequencer spelled out, covariance formula on sheet, y ticks and aligned x ticks on axes.
- This week's sets: 44 is set 1 of 2 for Oct 12-18 (set 43 was done Oct 11). After one more set, notebook 01.
- Sources reused from verified pointers (Bishop §2.1.2, §2.1.6, §16.1.1; ANGSD web pages). Not re-extracted.
- Learner decision: keep Oct 24, trim scope. GL, allele freq, SFS, FST, PCA full depth. Coalescent, ABBA-BABA, jackknife explain-only. At least 1 ML/week always (this week notebook 01). ML part 2 and quiz moved to after checkpoint. Recorded in AGENTS.md and chapter-3 plan.

---

[[10-09-2026]]
agent: claude

- Graded ML refresher workbook return: 8.5/13 core, optional Q11 0.5, Q15 skipped. Learner sick, rushed. Feedback in `ai-grader/ml-refresher-feedback.md`, log row added.
- Solid: conv/189, CE values, gradient, GD step, ReLU collapse. Missed: permute vs squeeze, softmax shift algebra, loss by target type (log-TPM/counts swapped), MSE vanishing push, .grad accumulation (-8), steps per epoch, curve diagnosis (flat ln K, nan).
- Issued `misc/ml-refresher-part-2.typ/.pdf`, 10 pages, 10 Q, one sitting ~25 min, no key. Last page: Bishop reading list for the week (§6.4, §4.1.2, §7.2.2-7.2.4, §9.2-9.3, optional §7.3, §8.1).
- Answers checked privately: Q1 (64,4,200), unchanged, (64,32), permute(0,2,1). Q2 e^2/(e^2+1)=0.881, differences. Q3 count/Poisson, real/MSE, one of 3/CE, yes-no/BCE, real/MSE. Q4 one of 4, CE, (N,4,L). Q5 -0.953, 0.0448, -0.0427, ~22x. Q6 -4,-8,-12; w=1.8. Q7 L=0,1,9,49; best 0.125. Q8 1/10, 16/160, 500/5000; last batch 20. Q9 not learning/raise lr or check opt.step; lr too high/lower; overfit/early stop at 6; underfit/bigger model. Q10 0.1, 1e-5, -1e-5; Adam 0.001, 0.001, -0.001.
- Plan: learner does part 2, reads a week, new ML quiz ~10-16-2026.
- Learner worried about postdoc readiness after the score. Told them the misses are recognition knowledge, fixable, and one sick-week sheet can't judge readiness.
- Learner wants hands-on building. Can't recall old TATA CNN (synthetic data) or liver AE. Decision: one marimo notebook a week replaces the weekly ML session. Recorded in AGENTS.md.
- Set up `ml-notebooks/` (uv env, marimo 0.25.1, torch) and `projects/promoter-cnn/` skeleton (gitignored here, future own repo).
- Issued `ml-notebooks/01-data.py`: download, baseline 54.4%, gc_content, one_hot, encode with permute. 4 TODOs with assert checks. Tested: filled scratch copy passes, copy cells run as a package (`torch.Size([8, 4, 251])`).
- Corrected myself to learner: earlier I said they had already built real models. Not true if they can't recall them.
- Redirect rule added to AGENTS.md: after 2 sets in a Mon–Sun week with no notebook, refuse the next set and send learner to the notebook. No calendar event made, learner preferred this.
- Pinned poppler 26.9.0 in pixi.toml to render handwritten returns. Archived 4 PDFs (returns 38-41). Manifest `course/archive-manifests/20261009-185156-888671.json`.

---

[[10-06-2026]]
agent: claude

- Learner request: ML refresher (blanked in a meeting on why loss choice matters), plus optimizer and the rest of the pipeline. Read `Notes/ml journal.md` and linked notes (loss, CE, optimizer, SGD, batch GD, Adam, softmax, logit, regularization, MLE, MLP, CNN, PyTorch, autoencoder, backprop, data split).
- First draft (prose then quiz) replaced on learner feedback: wants an interleaved workbook (text, question, text, question), broad coverage, not overwhelming.
- Issued `misc/ml-refresher-workbook.typ/.pdf`, 13 pages, 15 questions, 3 sittings (~15 min each), no key. Parts: tensors/one-hot/embedding, neuron + ReLU collapse, Conv1d as PWM + pooling, logits/softmax, loss = NLL table, CE pairing vs MSE gradient, backprop/zero_grad, optimizers (GD, momentum, Adam), batches/epochs, overfitting/regularization, autoencoders, optional alignment per-site CE. Last page: full annotated MotifCNN + loop.
- Note misconceptions flagged in-sheet (notes not edited): ReLU called regularization; batch GD vs mini-batch; MLE as alternative to loss + GD.
- Answers checked privately: Q1 (64,4,200) via permute(0,2,1); G row (-0.4,0.8). Q2 z=0.5 ReLU 0.5; z=-1.5 ReLU 0. Q3 no act -5, 7; ReLU 1, 7. Q4 0,3,0,1,2; length 5, max 3; 189. Q5 0.881/0.119, same. Q6 Gaussian/MSE, Bernoulli/BCEWithLogits, categorical/CE, Poisson or NB/PoissonNLL. Q7 0.357, 2.303, 1.386 (ln 4). Q8 a=0: -0.5 vs -0.125; a=-5: -0.993 vs -0.0066 (~150x). Q9 y=2, L=1, grad -4; -8 without zero_grad. Q10 w=1.4, y=2.8; eta 1: w=5, y=10, L=49. Q11 SGD 0.1, 1e-5; Adam 0.001 both. Q12 1, 16, 1000; last batch 40. Q13 overfit/early stop or dropout; lr too small or bug; lr too big. Q14 Gaussian constant variance; (N,4,L) logits + CE; too few numbers. Q15 0.105, 0.511, 1.386, 2.996, mean 1.25; no, irreducible floor.
- Bishop §4.1.2, §6.4, §7.2-7.3, §9.2-9.3 pages verified from archived PDF; logged in `curriculum/sources.md`.
- Archived 2 PDFs (reticulation-mtdna-day, set 37 return). Manifest `course/archive-manifests/20261006-112818-678788.json`.

---


[[10-02-2026]]
agent: claude

- Answered learner question on genetic/evolutionary algorithms (uses, GARLI link, peripheral to Evo 2 and Chapter 3).
- Learner accepted one optional GA vs gradient-step sheet after the ~Oct 24 checkpoint. Recorded in AGENTS.md.
- Graded set 41: 2.25/3. Q1 denominators all correct (first clean joint vs conditional). Q2 multiplied the 1/2 halves across reads instead of summing routes within a read. Q3 sum over genotypes correct, favored-f sentence omitted. Feedback in `ai-grader/set-41-feedback.md`.
- Issued `problem-sets/set 42.typ/.pdf`, 3 pages, no key. Q1 either/or vs both for AT (0.49, 0.2401). Q2 two fish: fish 2 at f=0.5 = 0.355, product 0.0444; optional f=0.25 gives 0.0963 x 0.6188 = 0.0596 (best of the three). Q3 expected T count 0.5; optional f = (0.5+1.5)/4 = 0.5.
- Learner felt slow. Kept to 3 questions, prefilled f=0 row.
- d_xy vs d_a pop quiz moved from Fri 10-02 to Wed [[10-07-2026]], learner schedule. Build it that day.
- Evening chat session (no Kindle): did set 42 Q1 by typing. Either/or sum right every time (0.49, 0.97). Both step wrong twice: multiplied inner pieces, 1/2(0.97) x 1/2(0.97), instead of box totals. Explained it as 1 of 4 route terms; rule "collapse each box to one number, then multiply". Stopped tired before the TT check. Not graded.
- Next: open with TT two-A-reads check (box 0.01, product 0.0001), then set 42 Q2/Q3. Q1 answers already seen.
- Archived 6 PDFs (set 35 sheet, returns 35/36, Markov side quest, zebrafish quiz). Manifest `course/archive-manifests/20261002-163559-969681.json`.

---

[[10-01-2026]]
agent: claude

- Issued `problem-sets/set 41.typ/.pdf`, 3 pages, no key. Q1 circle-the-denominator table (700/1000, 14/1000, 14/700). Q2 unscaffolded two-read L for A,A reads, 0.97/0.01 (.9409/.2401/.0001). HWE primer. Q3 refresher: P(reads given f) summing over genotypes for an A,T fish with L = .01/.24/.01: f=0 gives .01, f=0.5 gives .125, optional f=0.1 gives .0514.
- ANGSD Allele Frequencies page checked online: -doMaf, Kim et al. 2011 estimator via EM, allows HWE departures; page gives no formula, so the sum-over-genotypes form is labeled a tutor toy version.
- Learner said today felt slow; sheet kept to 3 questions.
- Graded set 40: 2.25/4. Q4 partial derivative and AE = PCA idea right. Q1 count table wrong (4th joint/conditional miss, 1/2 GL weights over-applied). Q2 fish 1 sign error flipped the conclusion. Feedback in `ai-grader/set-40-feedback.md`.
- Next recall: circle-the-denominator only, no algebra. Phrase every bullet as an instruction (bare "1.5 - 1.16" confused learner).

---

[[09-30-2026]]
agent: claude

- Issued `problem-sets/set 40.typ/.pdf` (weekly ML session), 4 pages, no key. Q1 count-table joint vs conditional (14/1000 vs 14/700). Primer: linear AE, 1-number bottleneck, encoder = set 39 projection. Q2 reconstruct fish 1 and 3. Optional Q3 mean error 0.34 = 1.5 - 1.16. Q4 refresher dE/dz = 2z + 2.8, zero at z = -1.4.
- Answers checked privately: Q2 xhat (-0.84,-1.12) err 0.04; (0.36,0.48) err 0.64.
- Learner self-report: mixes up P(B|G) and P(G,B), knows meanings. Drilling P(B|G) = P(G,B)/P(G).
- Graded set 39: 3/4. GL one-read table, one-read posterior and projection correct. Joint to conditional missed a 3rd time; plan a count-table primer. Next: set 40 ML session, then allele-frequency likelihood.
- Learner moved Chapter 3 checkpoint to ~Oct 24 to fit coalescent, ABBA-BABA, jackknife and synthesis (4–6 extra sessions). Recorded in AGENTS.md, chapter-3 plan and progress.
- Issued `problem-sets/set 39.typ/.pdf`, 4 pages, no key. Q1 joint to conditional (0.014/0.70). Worked one-read example with 1/2 origin weights, then Q2 core: fill P(B given AT/AA) for 0.97/0.01 sequencer with row sums. Optional Q3: one T read posterior (same 0.7/0.2/0.1 priors). Q4 refresher: projection of set 38 centered fish onto u=(0.6,0.8), variance 1.16 vs SNP 1 alone 1.
- Each requested output listed as its own line, per set 38 pattern.
- Answers checked privately: Q2 AT .49/.01/.01/.49, AA .97/.01/.01/.01. Q3 posteriors .035/.485/.480. Q4 z = -1.4, -0.6, 0.6, 1.4.

---

[[09-30-2026]]
agent: claude

- Graded set 38 return: 3.25/4. Posterior normalization and HMM posterior correct. Q4 covariance table right but re-centered in formula (3/2 vs 0.5). Emissions and sign interpretation omitted. Feedback in `ai-grader/set-38-feedback.md`; log and progress updated.
- Pattern across 36–38: last ask of a multi-part question dropped. Future sheets list each requested output on its own line.
- Answered margin "why 3?": biallelic restriction; ANGSD computes all 10.

---

[[09-29-2026]]
agent: claude

- Fixed `misc/reticulation-mtdna-day.typ` primer §2 and Q6 (three-times rule is Palumbi 2001, CR = l/d for ogac), recompiled. His returned answers live in the gadus-assembly repo, `reading-background/`. Discussed, not graded.
- Friday 10-02 pop quiz on d_xy vs d_a agreed; build it that day.

---

[[09-29-2026]]
agent: claude

- Graded set 37 return: 1.75/4. Main gap: 1/2 chromosome-origin weights missing in one-read mixture (Q2, Q3). Also Q1 conditional from joint wrong, P(A given AA) set to 1, range check skipped again. Feedback in `ai-grader/set-37-feedback.md`; log and progress updated.
- Set 39 plan: one-read mixture repair with sums-to-1 check plus short joint/conditional item before allele-frequency work.

---

[[09-28-2026]]
agent: claude

- Issued standalone `misc/reticulation-mtdna-day.typ/.pdf` for the Ch2 paper (reading day 09-29). Imports refresher template helpers, own header. 14 pages, 15 questions, visually checked, no key.
- Did not run the archive script; this is not a numbered set.

---

[[09-28-2026]]
agent: claude

- Took over from codex. Issued `problem-sets/set 38.typ/.pdf`: weekly HMM first-observation posterior recall, core GL posterior normalization table (likelihood max AT, posterior max AA), optional likelihood vs posterior, first closing math refresher (centering + 1/N covariance on 4 fish dosages). 3 pages, visually checked, no key.
- Set 37 still unreturned; set 38 does not depend on it.
- Added `closing_label` option to `daily_timer` in root `template.typ` (default "Calculus", old sheets unchanged).
- Added `pixi.toml` + `pixi.lock` pinning typst 0.15.1 (conda-forge). Compile: `pixi run typst compile --root . "problem-sets/set NN.typ"`. `.pixi/` gitignored, README compile line updated.
- Ran archive: 5 PDFs to OneDrive incl. set 31 PDF (now keeps 32–38). Manifest `course/archive-manifests/20260928-160629-940002.json`.

---

[[09-26-2026]]
agent: codex

- Archived 78 PDFs (228,545,345 bytes) to OneDrive `project-files/molecular-genetics-notes/`, preserving repository-relative paths. Includes older worksheets/returns, historical course/refresher PDFs, all seven textbooks and the zebrafish source paper. Copied and SHA-256 verified before unlinking; independently verified all archived hashes afterward.
- Retained numbered sets 31–37 and returns/standalone quizzes dated September 20–26. Kept every editable source and all templates, grades and learning state local, per learner clarification. No solution contents changed.
- Added recurring tutor-maintenance rule to AGENTS.md, archive lookup pointers to reference READMEs, and `scripts/archive_learning.py` (preview by default, explicit apply). Recorded mirrored manifest in `course/archive-manifests/20260926-064816-460583.json`; repeat preview selects zero files. No background scheduler installed.
- Historical external archive recorded in `course/refactor-record.json` is absent at its recorded path; did not migrate or claim verification of that separate archive.

---
[[09-25-2026]]
agent: codex

- Visually reviewed all seven zebrafish quiz return pages: 3/5 attempted, optional Q6 excluded; Q1 chat hint recorded. Saved `misc/zebrafish-math-feedback.md` with rubric, corrections and concise discussion pointers; originals preserved.
- Distinguished correct model/arithmetic work from new-term interpretation gaps and simple slips. Recorded tutor calibration that the introductory terminology load exceeded a reasonable quick first-exposure quiz. Updated grade/progress/profile/recall evidence; no daily advancement, new sheet or mastery promotion.

---
[[09-25-2026]]
agent: codex

- Created requested independent reading-discussion quiz beside its source: `misc/zebrafish-math-quiz.typ/.pdf`, based on `misc/jkae299.pdf` (McCluskey et al., The hybrid history of zebrafish). Ignored annotations/highlights; original paper preserved.
- Five core questions plus optional synthesis, 21–25 minutes including terminology primer / 30-minute stop. D from actual Table 1 counts, fixed-information windows/overlap, binomial enrichment, log-likelihood versus topology frequency, toy ancestry mixture explicitly distinguished from HyDe estimation, and inference limits. Verified local paper pages and privately checked calculations; all seven output pages visually reviewed with 3.5-inch workspaces.
- Saved in misc as explicitly requested, no answer key or numbered daily set. No grades, daily sequence or existing returns changed.

---
[[09-25-2026]]
agent: codex

- Saved learner-approved replacement of routine closing integrals from set 38 onward: 2–4-minute rotation through uncertain-genotype sums, covariance/PCA, partial derivatives/gradients and chain rule/Jacobians/backpropagation. Integrals occasional and model-motivated; no differential-equation strand.
- Updated controlling contract/syllabus/adaptive route/Chapter 3 plan/progress. Same session cap, one closing item, chapter priority and ML/HMM interleaving preserved. Set 37, earlier sheets, returns and grades unchanged; no new worksheet issued.

---
[[09-25-2026]]
agent: codex

- Issued `problem-sets/set 37.typ/.pdf`: Chapter 3 two-read GL construction, joint/conditional transfer recall, optional AA comparison and exponential interval probability/range check. Four pages, same short-session cap and generous workspace; assumptions/source boxes explicit, no key.
- Rechecked Bishop/ANGSD sources, privately verified calculations, compiled and visually inspected all pages. Updated issuance/source/progress/recall records; noted learner's acknowledgement of set 36 explanation without inferring demonstrated repair. Grades, original returns and optional Python preserved.

---
[[09-25-2026]]
agent: codex

- Visually graded all four set 36 return pages: 3/4 including optional Q3. Correct previous-base conditioning labels and logarithmic integral; conditional answer/explanation incomplete, GCC decimal error, range check omitted. Saved explicit rubric/corrections and updated progress/log/profile/recall/teaching calibration; time/hint use unknown.
- Preserved all original returns and scores; no recall promotion, worksheet issuance or optional Python advancement. Next requested sheet resumes Chapter 3 GL with a compact conditioning repair, retaining ML interleaving and weekly HMM retrieval.

---
[[09-25-2026]]
agent: codex

- Refined pre-mid-October balance at learner request: Chapter 3 remains primary, with roughly one dedicated ML/autoencoder session per week and one short weekly HMM retrieval item replacing existing sheet content. Same time cap, no recall backlog or new HMM curriculum requirement.
- Updated controlling teaching instructions and Chapter 3 plan; explicitly reduced available popgen session allocation instead of stacking ML onto the previous 14-session estimate. Original worksheets/returns and grades unchanged.

---
[[09-25-2026]]
agent: codex

- Accepted learner-designated `refresher-notes-quizzes/` as the Chapter 3 scope source; reviewed the five topic/question sets and mapped their mathematical dependencies. No further methods-path clarification needed.
- Added `curriculum/chapter-3-math-plan.md`: focused ~14 short-session allocation toward mid-October, then strong ML focus. Updated controlling references in contract/syllabus/plan/progress; kept original refreshers, issued sheets and grades unchanged.
- Explicitly separated curricular scope from technical correctness/mastery; older categorical claims require source checks before use. No added workload, mandatory HMM detour or new worksheet.

---
[[09-25-2026]]
agent: codex

- Corrected priorities per learner: Chapter 3 population-genetics math by mid-October (~Oct 15), then strong ML-math focus toward Dec 31 Evo 2 explanation. Added controlling instruction near the top of teaching contract/syllabus/plan/progress, superseding the month-long HMM rotation and parallel-through-December framing.
- HMM/nucleotide side thread is optional unless chapter-relevant; preserve existing session cap and issued set 36. Requested current chapter methods/path to constrain preparation; historical refresher is provisional, not a verified inventory or estimator authority. No new worksheet or grade.

---
[[09-25-2026]]
agent: codex

- Saved learner-confirmed December 31 Evo 2 explanation target and parallel Chapter 3 mathematical-readiness purpose for GL work. Preserved bounded introductory HMM/GL block, autoencoder focus, short budget and no mastery promise.
- Located existing local Gadus lcWGS refresher context; distinguished its GL/SFS/PCA orientation from a verified current chapter methods inventory. Later thesis-relevant gaps can use shared ML-math examples without extending HMMs or adding compulsory workload. No sheets, grades or learner work changed.

---
[[09-25-2026]]
agent: codex

- Recorded learner clarification: keep autoencoders central; bound HMM/GL work to an introductory month-scale block, then transition scheduled work to ML math. Nucleotide models stay inside HMM applications, not an expanding third strand.
- Updated teaching contract/syllabus/plan/progress with tentative ~20 completed sessions, flexible 2 ML : 1 GL : 1 HMM cycle, concrete introductory exit targets and a review/transition rather than indefinite extension. Preserved 12–15-minute cap, no backlog, issued set 36 and historical evidence; no mastery guarantee.

---
[[09-25-2026]]
agent: codex

- Visually graded all six Markov return pages: 4/5. Saved rubric and explanations for conditioning versus independence, factors, latent variables, HMM observation dependence and joint-pair frequencies; updated grade/progress/profile/recall evidence without box promotion. Time/hint use unknown.
- Saved learner's requested nucleotide-modeling integration from set 36 in AGENTS/syllabus/adaptive plan/progress: Bishop math plus Durbin sequence applications, rotating within existing 12–15-minute budget; retain autoencoder, staggered GL and Bishop checkpoint. No extra daily section.
- Issued `problem-sets/set 36.typ/.pdf`: four-base sequence probabilities, targeted conditioning repair, optional base-order comparison and logarithmic density-area finish. Four pages visually checked; private arithmetic checks, verified sources, generous workspace and no answer key. Added optional timer math_label with unchanged default.
- Preserved original sheets/returns, earlier grades and optional Python. AGENTS remains local-only; no commit or publication.

---
[[09-25-2026]]
agent: codex

- Visually reviewed all four pages of set 35 return: 4/4 correct, including optional Q3. Saved evidence/rubric and updated progress, running log, profile, recall evidence and adaptive route; actual time/hint use unknown.
- Answered margin question distinguishing uniform density 1 from a model's chosen constant prediction 1/4. Encoder chain rule/update and calculus repair correct; next teaching fades scaffolding and rotates calculus inside the same short budget.
- Preserved original return, prior grades and recall boxes. No new sheet, Markov-side-quest grade or optional Python advancement.

---
[[09-24-2026]]
agent: codex

- Created requested independent `problem-sets/markov-chain-side-quest.typ/.pdf`: four core Markov-chain questions, short sourced HMM reading and one optional first-emission Bayes question; about 22–26 minutes, 30-minute stop including reading.
- Calibrated to graded conditional-probability/hidden-origin work. Visually verified Durbin et al. §§3.1–3.2 scanned source pages; included a brief exact excerpt with tutor copy-number adaptation. Rechecked Bishop sum/product rules. Checked arithmetic privately and visually reviewed all six output pages, preserving 6.2 × 8.27 inch geometry and substantial same-page workspace.
- Issued only, no key or grade; daily sequence/set 35, returns, existing HMM notebook and optional Python task unchanged.

---
[[09-24-2026]]
agent: codex

- Issued `problem-sets/set 35.typ/.pdf`: encoder chain-rule bridge, forward recall, optional learning step and targeted calculus repair. Same four-page short format and 3.5-inch substantial workspaces; no key.
- Applied and persisted user's new future naming: `set NN` filenames, title and header label. Prior sheets/returns unchanged. Verified sources/calculations, compiled and visually checked; updated issuance records without grades/promotion.

---
[[09-24-2026]]
agent: codex

- Visually graded all four set 34 return pages: 3.25/4. Slope/value repaired and equal/biased mixtures correct; Q2 explanatory sentence missing. Q4 cross-term and fraction errors isolated from correct termwise integration.
- Saved feedback; updated grade/progress/profile/recall and adaptive route. Time/hint use unknown. Next calculus gets a compact repair inside the cap; GL changed-assumption success supports later conditional-independent read transfer. No new sheet, recall promotion or changes to original sheets/returns; optional Python preserved.

---
[[09-23-2026]]
agent: codex

- Issued set 34: slope/value recall, reduced-scaffold read-origin likelihood, optional unequal-sampling assumption check, expected-loss calculus. Four pages, five-minute core/~12-minute aim/15-minute cap and 3.5-inch substantial workspace.
- Verified Bishop/ANGSD sources and arithmetic, compiled and visually inspected all four pages. Removed requested reminder/hints-used footer; updated issuance/source/recall records without grades, promotion or answer key. Prior sheets, returns and optional Python preserved.

---
[[09-23-2026]]
agent: codex

- Visually graded all four set 33 return pages: 3.5/4. Q1 slope/value mix-up; Q2 counterexample, Q3 inverse rate/check and Q4 piecewise integral correct. Saved feedback and updated grade/progress/profile/recall evidence; time/hint use unknown.
- Recorded explicit margin preference: remove page-one source/stuck reminder and hints-used footer starting set 34; preserve actual source boxes, optional hints and short cap. No returned/issued files changed, new set issued, or recall promotion. Next staggered GL due.

---
[[09-23-2026]]
agent: codex

- Issued set 33: larger-rate loss check, optional inverse rate choice, stationary-point recall and piecewise integration. Four pages, same short cap and 3.5-inch substantial workspace. Compiled and visually checked; sources reverified, no answer key.
- Recorded learner's request for gradual difficulty growth and Bishop exercise readiness: fade supports, plan a verified original-exercise checkpoint within 5–10 completed sets, treat 20–40 as a provisional range for selected foundational comfort only. No grade/recall promotion or changes to prior returns.

---
[[09-23-2026]]
agent: codex

- Visually reviewed all four set 32 return pages: 4/4 correct, including optional minimum/fixed-coordinate explanation. Saved feedback and updated progress, grade log, recall evidence and profile; time/hint use unknown.
- Retain short budget, staggered GL reasoning and calculus variety. No new worksheet, recall promotion or changes to returned solutions; optional Python untouched.

---
[[09-22-2026]]
agent: codex

- Recorded learner's explicit long-term priority: derive likelihoods/objectives from modeling assumptions. Updated syllabus, adaptive route and progress to reinforce recurring ML/popgen modeling with fading scaffolds inside the existing budget. No new workload, grading or changes to issued set 32.

---
[[09-22-2026]]
agent: codex

- Issued `problem-sets/problem set 32.typ/.pdf`: constant recall, one gradient step and actual-loss comparison, optional stationary-point/reconstruction interpretation, logarithmic normalization integral. Four pages, five-minute core, ~12 minutes / 15-minute cap.
- Verified gradient-descent source, checked calculations, compiled and visually inspected all pages. Preserved requested naming/headers, geometry and 3.5-inch workspace; no elapsed-time blank or answer key. Updated issuance/source records; prior returns and grades unchanged.

---
[[09-22-2026]]
agent: codex

- Visually graded all four set 31 return pages: 3.5/4. Calculations correct; missing Q2 explanation and Q3 explicit formula rejection. Origin weights and calculus sign repaired with scaffolding; clarified origin notation and answered margin question about zero slope versus zero loss.
- Saved feedback and updated progress/log/recall/profile. Time/hint use unknown. No returned work changed, new sheet issued, or recall promotion; next ML resumes small gradient update with varied calculus.

---
[[09-21-2026]]
agent: codex

- Issued `problem-sets/problem set 31.typ/.pdf`: slope recall, GL origin reasoning, optional error-free check and calculus antiderivative sign repair. Four pages, five-minute core, ~12 minutes / 15-minute cap. Compiled and visually checked all pages; generous workspace and source boxes retained.
- Added optional set-label support to root template, preserving legacy defaults; set 31 uses requested title/headers and omits elapsed-time blank. Existing sheets/returns unchanged. Updated issuance/source records; no answer key, grades or recall promotion.

---
[[09-21-2026]]
agent: codex

- Visually reviewed all four Day 30 return pages; saved feedback and updated progress/log/recall/profile. 2/3 attempted; Q1 unmarked/excluded. Correct slope/direction; arithmetic, constant preservation and integration-by-parts sign corrections documented. Actual time/hint use unknown.
- No new sheet issued, return modified, or recall promotion. Set 31 naming preferences retained; staggered GL reasoning due, with a brief calculus sign check inside the existing budget.

---
[[09-21-2026]]
agent: codex

- Saved learner's formatting-only preference for set 31 onward: filenames `problem set NN.typ/.pdf`, title `molbio/ml set NN`, corresponding page-header label, and no elapsed-time fill-in blank. Keep all other content, timing guidance and layout; existing sheets/returns unchanged.

---
[[09-21-2026]]
agent: codex

- Issued Day 30: symbolic-loss check before optional derivative/local-slope interpretation, one recall question, and integration by parts instead of repeated substitution. Four pages, five-minute core, ~12 minutes / 15-minute cap. Rechecked sources and calculations; compiled and visually verified all pages with generous working space.
- Updated issuance/source records; no key, new grades or recall promotion. Researched Send to Kindle command-line options in response to the user's question; no software installed or documents sent.

---
[[09-21-2026]]
agent: codex

- Visually graded all four Day 29 pages: 3.5/4. Correct numeric decoder/loss comparison, correct symbolic setup followed by algebra errors, correct changed-scale substitution. Saved rubric and updated grade/progress/recall/profile; actual time/hint use unknown.
- Acknowledged learner complaint that calculus repeats; updated teaching rules to rotate techniques, beginning with a short integration-by-parts/expectation bridge, within the existing time cap. Next ML includes one consistency check of symbolic loss. No new sheet issued or returned work changed; GL repairs and optional Python remain pending.

---
[[09-20-2026]]
agent: codex

- Issued Day 29 at learner request: fixed encoder/code, compare two values of one decoder weight, optional symbolic loss and one changed-scale substitution integral, plus target recall. Four questions; five-minute core, ~12 minutes / 15-minute cap.
- Rechecked Bishop pointers, checked calculations privately, compiled and visually verified all four pages with source boxes and generous same-page workspace. Updated issuance/source records; no key, grades or recall promotion. GL generative reasoning repair remains pending for the next staggered session; prior returns and optional Python preserved.

---
[[09-20-2026]]
agent: codex

- Visually graded all four Day 28 pages: 3.5/4. One-read origin/error terms identified but half weights omitted; scaffolded posterior normalization and substitution correct. Recorded coarse TT rounding and genotype/origin notation distinction. Time and hint use unknown.
- Saved rubric and updated grade/progress/recall/profile/plan. Recorded learner concern about table-following; next GL uses generative explanation with gradually reduced scaffolding, within existing time. No new worksheet, extra homework, recall promotion, or modifications to returned work; optional Python unchanged.

---
[[09-20-2026]]
agent: codex

- Visually graded all four Day 27 return pages: 4/4 correct, including matrix/output shapes, optional loss and 7/8 integral. Time/hint use unknown. Recorded “Too easy” calculus note; modest substitution next, no workload increase.
- Issued Day 28 as the planned staggered GL session after two ML sessions: matrix recall, one-read reconstruction, optional posterior normalization and one ML-relevant substitution integral. Four pages, five-minute core, ~12 minutes / 15-minute stop; source-checked, compiled and visually verified. Updated short-session timer to show GL allocation when used.
- Saved rubric and updated grade/progress/recall/profile/source records. Preserved returns, earlier scores and optional Python. Multi-read recall remains pending; return to autoencoder parameter/loss work after GL.

---
[[09-19-2026]]
agent: codex

- Issued Day 27 at learner request in the successful short format: one loss recall MCQ, familiar autoencoder in matrix notation with changed input and pre-drawn table, optional reconstruction loss, one relevant polynomial integral. About 12 minutes / 15-minute stop; five-minute core counts.
- Rechecked Bishop source pages, compiled and visually inspected all four pages at 6.2 × 8.27 inches; retained substantial same-page work space. Verified numerical tasks without publishing solutions. Updated issuance/source records; prior grades, submitted work and optional Python unchanged. GL repairs remain for the next staggered session.

---
[[09-19-2026]]
agent: codex

- Visually graded all four Day 26 return pages: 4/4 questions correct, including optional reconstruction loss and integration. Saved rubric and updated progress, grade log, recall and profile; actual time/hint use unknown because fields are blank.
- Recorded learner endorsement of short sessions and handwritten request to stop repeated negative-number-squaring reminders. Keep approximately 12-minute sessions / 15-minute stop, with new-concept scaffolding; next step is matrix shapes in the same autoencoder. No new worksheet issued, no historical grades/returns changed, GL repairs and optional Python remain pending.

---
[[09-19-2026]]
agent: codex

- Replaced the hour-long multi-subject schedule and ten-MCQ requirement with learner-approved short autoencoder math sessions: five-minute complete core, optional extension, 1–2 integrated recall items; 10–20-minute ceiling. GL every second/third completed session can replace ML; biology optional.
- Added one or two brief ML-relevant integration refreshers at session end, inside the ceiling. Preserved historical syllabus/plan snapshots, grades, returns and Day 25; no catch-up required. DateNotes remains an eligible pool without a quota.
- Authored Day 26 at learner request: tiny linear autoencoder, optional squared reconstruction loss and polynomial density integral, using verified Bishop pointers. Four pages visually checked; 3.5-inch same-page working blocks, five-minute core, about 12 minutes with a 15-minute hard cap. Added opt-in short-session timer parameters while retaining legacy defaults. Issuance is not completion or mastery.

---
[[09-19-2026]]
agent: codex

- Recorded that daily notes are incomplete: missing logs do not imply no learning, and no backfilling is required. Build the pool gradually.
- Saved learner-requested ten-MCQ recall split: five course items and five general-learning items from chat or read-only DateNotes. Checked recent note structure; support both stated ISO dates and existing month-day-year filenames.
- Added selection/provenance rules distinguishing studied concepts from pending tasks, excluding thesis and administrative content, and handling insufficient eligible material. Preserved five-minute recall/60-minute total by default; future sheets use two recall pages and up to fifteen total responses. Existing worksheets and grades unchanged.

---
[[09-18-2026]]
agent: codex

- Added learner-recommended Parr & Howard matrix-calculus article to curriculum/sources.md after checking the web source. Recorded preference for concise explanations, relevant section headings and row-gradient notation; use alongside Bishop within existing math slots.

---
[[09-17-2026]]
agent: codex

- Updated independent likelihood paper wording at learner request: removed exam-style references and replaced “marks” with “points”; scoring and questions unchanged. Rebuilt PDF and checked the revised opening page.

---
[[09-17-2026]]
agent: codex

- Created independent likelihood challenge 01 at learner request: 60 minutes, 10 original JEE Advanced–style MCQs, custom negative marking/partial credit, 34 marks. Source-based genotype, Bernoulli and Gaussian likelihood applications; no key published.
- Used the learner-added 2023 Ng & Ma CS229 PDF and verified exact local pages. Explicitly distinguished the handbook's binary-error example from ANGSD's four-base error model. Saved source and scoring notes in independent-practice/likelihood/README.md.
- Visually verified all 12 PDF pages, including 3.5-inch same-page writing areas and source boxes; checked numerical options and scoring rules. Daily sheets, schedules, scores, recall and optional Python unchanged.

---
[[09-17-2026]]
agent: codex

- Issued Day 25 from graded Day 24: posterior normalization and dot-product repairs inside existing slots, small covariance application, CTD recruitment/capping and read-versus-fish sampling. Ten questions, 60-minute cap; no answer key.
- Implemented requested pre-drawn tables and preserved 6.2 × 8.27 inch geometry with generous same-page working areas. Compiled and visually checked all nine final pages; verified new local book pointers and ANGSD model source.
- Updated progress/source/recall issuance records. Prior scores, submitted solutions and optional Python unchanged; delayed recall remains conditional on attempt date and assistance.

---
[[09-17-2026]]
agent: codex

- Visually graded all nine Day 24 solution pages: 16/20; Q6 coaching distinguished from independent performance. Saved detailed rubric, margin-question explanations and targeted next-slot repairs; updated progress, grade log, recall, profile and stats calibration.
- Recorded learner preference for pre-drawn blank tables. Preserved submitted PDF, historical scores/recall boxes, optional Python task and daily budget; no full redo or new worksheet issued.

---
[[09-15-2026]]
agent: codex

- Built Day 24 and the adaptive Days 24–37 syllabus under the learner's revised 5/20/20/10/5 budget. Broad ML foundations begin with a small PCA quadratic/gradient example; biology moves to promoter-proximal pausing.
- Updated syllabus, local teaching contract, active tracker, source ledger and recall scheduling. Added compact timer and optional question spacing without changing legacy defaults. Preserved generous worksheet writing areas; five MCQs on one page; no solutions published.
- Added small starting steps, in-slot hints, partial-attempt closure and planned consolidation to reduce repeated multi-day blocks. Visually checked all nine final pages, including sources and 3.5–3.8-inch same-page working areas. Prior scores/returns and optional Python preserved.

---
[[09-15-2026]]
agent: codex

- Graded all 13 Day 23 return pages: 17/20 with coaching recorded. All questions attempted; course advances with targeted repairs, no full redo.
- Saved rubric and updated progress, grade log, profile, recall evidence and stats calibration. Preserved returned PDF, previous grades and delayed recall request; Python unchanged.

---
[[09-15-2026]]
agent: codex

- Recorded Day 23 coached one-read reasoning and self-reported spaced-repetition/Q4 completion; no grade or mastery inferred.
- Queued learner-requested delayed recall for September 18–19 or next session within the normal review budget; biology guidance remains next. Use plain-text chat math.

---
[[09-10-2026]]
agent: codex

- Issued Day 23: Bishop → explicit statistical model → popgen; seven questions, ten responses, 13 visually checked Scribe pages. Algebra/Bayes repair, one-read table then conditional two-read likelihood, biology and chromosome-count consolidation.
- Recorded successful scaffolded chat retry separately from Day 22's unchanged 11/20. Saved ongoing Bishop/modeling/popgen preference in AGENTS.md and progress; no code review or answer key.

---
[[09-10-2026]]
agent: codex

- Graded all 12 pages of Day 22: 11/20 including unfinished Q4; saved explicit rubric and updated active progress, grade log and learning evidence.
- Prioritize origin/output read modeling, square expansion and measurement/counting explanations; no Day 23 or optional code issued/reviewed.

---
# Agent notes — Molecular genetics course

Running log. Newest entry at the top; the `---` separator goes after each entry.
Dates are wikilinks — `[[09-08-2026]]
agent: codex

- Saved the learner's enthusiasm for biological problem → statistical model questions; make model construction a recurring scaffolded thread and increase complexity based on graded work.
- Updated teaching instructions and progress preference; preserve the likelihood-first sequence and hour cap. Existing sheets unchanged.

---

[[09-08-2026]]
agent: codex

- Graded Day 21 at 15/20; saved rubric/corrections and updated tracking. Bernoulli/Phred/bootstrap/histone structure correct; Bayes weighting, assay evidence and sampling levels need repair.
- Created Day 22 with targeted review, Bernoulli variance, a one-read heterozygote likelihood, histone modification/readers and an allele-frequency estimand; seven questions within the hour.
- Verified section/PDF-page source boxes, generous working space and rendered layout. Preserved submitted solutions and pending optional Python task.

---

[[09-08-2026]]
agent: codex

- Graded Day 20 submitted PDF: 13.5/18 (75%); saved per-question rubric and updated progress, grade log, recall evidence and profile.
- Main repairs are Bayes decimal/count interpretation and incomplete bootstrap/ATAC explanations; matrix, GL/equal-prior reasoning, MNase sketch and donor replication correct.
- Kept Day 21, submitted solutions and optional Python unchanged; no actual timing data available.

---

[[09-08-2026]]
agent: codex

- Recorded Day 20 as completed by self-report and ungraded: “pretty easy,” with Kindle sharing blocked; no inferred score or recall promotion.
- Issued Day 21: Bishop Bernoulli normalization/mean, Phred error probability, Genes XII histone-core architecture and binding, and sampling levels; modest progression within the hour.
- Included a verified source box above every question and generous handwriting space; compiled and visually checked the PDF. Optional Python task 001 unchanged.

---

[[MM-DD-YYYY]]`.
Format and rules: see `AGENTS.md`.

[[09-07-2026]]
agent: codex

- Saved next-sheet preference: a small source box above every question with book, section/subsection and verified PDF page numbers; exercise/printed-page references when applicable.
- Updated AGENTS.md and setup-prompt.md only as teaching instructions; existing worksheets/PDFs unchanged.

---

[[09-07-2026]]
agent: codex

- Expanded Day 20 handwriting space while preserving the questions and hour cap; moved primers onto separate pages where needed.
- Saved the learner's preference in AGENTS.md, setup-prompt.md and course/progress.md: add pages rather than squeeze calculations or diagrams.

---

[[09-07-2026]]
agent: codex

- Refactored the combined course from Day 20: spaced repetition, handwritten Bishop math, Genes XII biology, stats; 60-minute cap including reading, with optional Python limited to 10 extra minutes.
- Front-loaded probability/likelihood, genotype uncertainty, allele-frequency inference and EM/SFS; biology builds from chromatin/regulation toward single-cell, cancer and genome evolution.
- Preserved old progress/decks, retired required CS/Rust drills, rescued supporting books/references and moved intact vendored repos to a sibling archive with integrity manifests.
- Issued Day 20 without an answer key; Days 18–19 remain incomplete and no grades were invented. Optional project has one pending task and explicit submission gating.

---

[[09-06-2026]]
agent: claude

- New `refresher-notes-quizzes/` — a 5-day reading+questions series for the Chapter 3 *Gadus* lcWGS analyses, for the week of Mon 07 Sep. Separate cadence from `problem-sets/`: 1–1.5 h/day, reading then closed-book questions.
- Days: (1) species concepts + the pi / dxy / da / Fst identities, (2) ILS + ABBA-BABA + why *G. morhua* fails as an outgroup, (3) inversions/fusions/supergenes, (4) genomic islands + demographic nulls, (5) genotype likelihoods + reference bias + relatedness.
- Built because Codweb (Árnason & Halldórsdóttir 2019) and Hoff et al. 2026 were not getting read from the chapter's reading list; each is now the anchor of a day rather than a list entry.
- `refresher-template.typ` is new — same A5 geometry as `problem-sets/template.typ`, adds prose/reading macros (`key`, `trap`, `carry`, `eq`, `sources`). Font is Libertinus Serif; **"Linux Libertine" in `problem-sets/template.typ` is not installed on this machine and is silently falling back.**
- No answer key published, per `AGENTS.md`. Sheets return as a set at the end of the week.

---

[[09-03-2026]]
agent: claude

- `AGENTS.md` authored from scratch -- repo had none. Sourced from `setup-prompt.md`, `SYLLABUS.md`, `course/progress.md`.
- `course/progress.md`: 73 log dates flipped to MM-DD-YYYY; file keeps its name.
- `.gitignore` entry `CLAUDE.md` -> `AGENTS.md`, so AGENTS.md stays local-only.

---
