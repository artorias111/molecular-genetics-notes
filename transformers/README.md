# Building ML models as math, with transformers and DNA language models
Started [[10-28-2026]]. 15-20 min a day. Reshuffled [[11-03-2026]]: main goal is confidence building ML models by end of December. Transformers and DNA LMs are one part of it. Popgen is paused.

- DNA LM goal (learner, 10-28): explain DNABERT, StripedHyena, and why Evo 2 is a language model whose architecture is StripedHyena 2 (mostly convolution, a few attention layers) rather than a plain transformer.
- DNA model days added 10-28. Papers in `transformers/papers/` (no Hyena Hierarchy paper; Evo 1 describes StripedHyena):
  - `btab083.pdf`: DNABERT, Ji et al. 2021, Bioinformatics. Overlapping k-mer tokens, 12 transformer blocks, masked k-mer pretraining, CLS token for classification.
  - `2024.02.27.582234v1.full.pdf`: Evo 1, Nguyen et al. 2024 bioRxiv. Autoregressive, StripedHyena = hybrid of attention and Hyena operators, 7B.
  - `2503.01868v1.pdf`: Ku et al. 2025, convolutional multi-hybrid LMs (StripedHyena 2).
  - `s41586-026-10176-5.pdf`: Evo 2, Brixi et al. 2026 Nature. 9T bp, 1M token context, single-nucleotide tokens, autoregressive, StripedHyena 2 (short explicit, medium regularized, long implicit Hyena layers plus rotary attention).

- Build: `pixi run typst compile --root . --font-path ~/Documents/fonts --input day=N "transformers/day NN.typ"`
- Design: root `design.typ`, guide in `design-guide.md`. White pages, colors rotate daily from `palettes.typ`. Text voice: root `writing-style.md`.
- Fonts in `~/Documents/fonts`: Solway (headings), Google Sans (body), Google Sans Code (sources, code), Noto Sans Math (equations), Mansalva (asides).
- Each day: compact header and primer on page 1, 3 tasks (see / do / use), wrap-up sentence.
- Blocks (reshuffled 11-03): 1-9 done, 10 loss, 11-27 linear models, GLMs, choosing a loss, generalization, 28-38 neural nets and sequence models, 39-44 flow matching, 45-58 attention and DNA LMs, 59-67 generative and latent models, 68-69 capstone.
- Copy each PDF to iCloud `exercises/` at issuance. No key on the sheet.
- Adapts to returns. Skipped days push the plan, no backlog.

## Weekly coding session
Kept 11-03 (learner). One a week, about 20-30 min, in `ml-notebooks/`. Format from 11-01: one `.py` with `# %%` cells run in Zed's REPL, learner writes the code, checks use the learner's own hand answers from the sheets, predict before running, one debugging task. Tutor writes the blog post from the code and answers.
- Each week codes the model from that week's sheets, from scratch in numpy first, PyTorch once backprop is done by hand. Rough order:
  - Notebook 2: finish notebook 1 leftovers ((d)-(h), scores_fixed), then linear regression by gradient descent
  - Notebook 3: logistic regression on promoters, GC and k-mer features, vs the 54% baseline, loss you derived on paper
  - Notebook 4: same counts fit with MSE and with Poisson loss, see which one is wrong and why. Counts from a small PBMC dataset, one gene, Poisson vs NB
  - Notebook 5: two-layer MLP with hand-written backprop, checked against finite differences
  - Notebook 6: k-mer features plus linear model vs a 1D CNN in PyTorch on promoters (old CNN route steps 2-6)
  - Notebook 7: flow matching on a 2D toy
  - Notebook 8: one attention head on promoter tokens
  - Notebook 9: score variants with a small pretrained DNA language model
- Test weekends: the test's code half counts as that week's session.

## Weekend unit tests
Added 11-03 (learner). 5 tests, about 2 hours each, on a weekend. Not counted as days. Files `transformers/unit test N.typ/.pdf`.
- Each test is issued on the first weekend after its unit is done. If the unit isn't done, the test waits. No backlog.
- Format: about 75 min on paper, about 45 min in code (implement the model you wrote on paper, small numpy, promoter or count data). One handwritten page of notes allowed. About 25% of questions come from earlier units.
- Question types: write a model from a plain-English problem with no scaffold, pick and justify a loss, derive a gradient, trace shapes, critique a model or code that has a real flaw, predict before computing.
- Graded with a key after the return. Weak spots become repairs in the next few daily sheets.
- Rough timing at about a sheet a day:
  - Test 1, after day 23 (vectors, softmax, cross-entropy, linear and logistic regression, GLMs, choosing a loss). About Nov 21-22.
  - Test 2, after day 38 (generalization, neural nets and backprop, kernels to 1D CNN). About Dec 5-6.
  - Test 3, after day 50 (flow matching, attention). About Dec 12-13.
  - Test 4, after day 58 (DNA language models, Evo 2). About Dec 19-20.
  - Test 5, after day 67 (generative and latent models), merged with the capstone: pick a biology question, write the model, say why that loss, code it. About Dec 27-28. Days 68-69 drop if this covers the capstone.

## Explaining out loud
Added 11-03 (learner). Goal: explain ML models to other scientists with the same ease as code and biology. Fumbling comes from never having said this material out loud, not from not knowing it.
- Each sheet: the write-the-model box gets one "say it" line: the equation as a plain sentence a biologist would follow.
- Weekly, about 5 min: learner records a 2-3 min voice memo explaining one concept from that week to a biologist, pastes the transcript in chat. Tutor checks it for accuracy, jargon, missing example, then asks 2-3 follow-up questions like a committee member and pushes back on weak answers.
- Fixed shape for every explanation: the problem, what the model assumes, what it computes (one equation), a bio example, what it can't do.
- One anchor bio example per concept, reused until it's automatic (promoters for classifiers, read counts for Poisson, expression for regression).
- Each weekend test ends with a 10-min spoken part: explain one model from the unit, recorded, tutor critiques the transcript.
- Real reps: explain a unit to a labmate, and present Evo 2 at lab meeting or journal club in January 2027.

## Single-cell bits
Added [[11-09-2026]] (learner). Source: Single-cell Best Practices, Heumos et al. 2023 Nat Rev Genet, online book sc-best-practices.org.
- Not a new strand. A single-cell example replaces the toy example on days already in the plan, no extra days.
- Swaps marked "sc:" on days 21, 22, 23, 25, 26, 62, 66, 67, and notebook 4.
- Skipped: pipeline and tooling chapters (QC thresholds, doublets, annotation, scanpy workflow), trajectories, RNA velocity, spatial, multiome. Coding notebook only, on request.
- Check the book chapter and cite it in the source box at authoring. No invented section numbers.

## Plan
Reshuffled 11-03 (learner): the goal is confidence building ML models, day by day, by end of December. Transformers aren't urgent. Days 1-9 done as before. Each day should add something you could build or write down. About 69 days, a little slack before the old 71.

- Rules for days 10+
  - Source: CS229 lecture notes, Ng and Ma, June 2023 (`textbooks/CS 229 notes Andrew Ng.pdf`). PDF page = printed page + 1 (checked ch 1, 7, 11). Bishop for depth where useful.
  - Prereqs (vector gradients, Gaussian, MLE, Hessian, multivariate normal, Jensen, eigenvectors) come as a primer on the day they're first needed.
  - Every sheet ends with a "write the model" box: the day's model in full notation, no prose.
  - Loss thread (learner, 11-03): every loss gets a reason. The write-the-model box always has a line for the assumed noise model and the loss it gives. Later days tie back: hinge loss (36), flow matching squared error (41), next-token cross-entropy (47), ELBO = reconstruction + KL (65-66).
  - Bio data each day where it fits: expression, promoters, read counts, k-mers.
- Days 1-9, done: vectors, matrices, QKᵀ, embeddings, softmax, temperature, √d, categorical, whole-model map
- 10 cross-entropy, negative log-likelihood, perplexity (§2.3)
- Days 11-15, linear regression (ch 1)
  - 11 notation: x⁽ⁱ⁾, y⁽ⁱ⁾, θ, h_θ(x) = θᵀx, design matrix X is n × d
  - 12 derivatives, squared loss J(θ), one gradient descent step by hand (§1.1)
  - 13 gradient with respect to a vector: ∇(θᵀx), ∇(θᵀAθ) (§1.2.1)
  - 14 normal equations XᵀXθ = Xᵀy, two parameters by hand (§1.2.2)
  - 15 Gaussian noise makes least squares the MLE (§1.3)
- Days 16-19, classification (ch 2)
  - 16 Bernoulli likelihood, sigmoid, logistic regression (§2.1)
  - 17 its gradient is (y − h)x
  - 18 softmax regression, softmax plus cross-entropy gradient is p − y (§2.3)
  - 19 second derivatives, Hessian, one Newton step (§2.4)
- Days 20-22, generalized linear models (ch 3)
  - 20 exponential family: Bernoulli and Gaussian rewritten (§3.1)
  - 21 Poisson GLM for read counts (tutor application of §3.2). sc: UMI counts for one gene across cells
  - 22 the recipe: pick a noise model for y, its negative log-likelihood is the loss. MSE = Gaussian, cross-entropy = categorical, Poisson loss = counts. sc: normalization and log1p read as a noise-model choice
  - 23 when the default loss is wrong: outliers (MAE = Laplace, Huber), overdispersed counts (negative binomial), multi-label (one sigmoid + BCE per label, e.g. several TFs bound), class imbalance (weighted cross-entropy). sc: scRNA counts as the main NB example, why MSE on raw counts fails
- Days 24-27, will it work on new data (ch 8-9)
  - 24 train vs test error, bias-variance decomposition (§8.1)
  - 25 L2 regularization (§9.1). sc: shrinkage of fold changes in DE
  - 26 cross validation (§9.3). sc: pseudobulk vs cell-level DE, cells are not independent replicates
  - 27 a prior turns MLE into MAP, which is regularization (§9.4)
- Days 28-33, neural networks written out (ch 7)
  - 28 two-layer MLP in matrix notation (§7.2)
  - 29 chain rule
  - 30 partial derivatives of matrix functions, backward functions (§7.4.1-7.4.3)
  - 31 backprop through a two-layer MLP by hand (§7.4.4)
  - 32 vectorizing over a batch, shapes (§7.5)
  - 33 modules: residual connections, layer norm (§7.3)
- Days 34-38, sequences: kernels to 1D CNNs (ch 5-6, §7.3)
  - 34 feature maps: a sequence as its k-mer count vector (§5.1-5.2)
  - 35 kernel trick: K(x, z) = φ(x)ᵀφ(z), spectrum kernel on two short DNA sequences by hand (§5.3-5.4; Leslie et al. 2002; gapped k-mers as in gkm-SVM, Ghandi et al. 2014)
  - 36 margins and hinge loss, soft margin (§6.1-6.4, §6.7)
  - 37 convolution as a sliding dot product, conv1d (§7.3)
  - 38 kernel SVM vs 1D CNN: fixed k-mer features vs learned filters, a filter as a motif detector
  - Lagrange duality and SMO (§6.5-6.6, §6.8) only on request
- Days 39-44, flow matching (learner's PI suggested it, 10-30). Its loss is squared-error regression of a velocity, so it builds on 11-15 and 28-32.
  - 39 vector fields: an arrow at every point
  - 40 one Euler step: moving a point along the field
  - 41 flow matching loss: regress the velocity on a noise-to-data path, squared error
  - 42 toy 2D flow by hand
  - 43 DNA version: Dirichlet flow matching (Stark et al. 2024), sequences on the simplex
  - 44 flow matching vs autoregressive (Evo 2): generating all positions at once vs one base at a time
- Days 45-50, attention by hand
  - 45 weights times values, weighted average
  - 46 one attention head end to end
  - 47 causal mask; masked vs next-token objectives, bidirectional vs causal
  - 48 multi-head, split and concat
  - 49 positional information, rotary embeddings (Evo 2 uses rotary attention)
  - 50 feed-forward block, parameter count, a whole transformer block on one page
- Days 51-58, DNA language models (ch 14 for framing)
  - 51 tokenizing DNA: overlapping k-mers (DNABERT), single bases (Evo)
  - 52 DNABERT end to end: masked k-mers, CLS, fine-tuning
  - 53 cost: attention is L², long convolution via FFT is about L log L
  - 54 gating and long implicit filters: the Hyena operator
  - 55 StripedHyena (Evo 1): striping attention and Hyena layers
  - 56 StripedHyena 2: short explicit, medium regularized, long implicit filters
  - 57 Evo 2 in use: log-likelihood of a mutant vs reference sequence as a variant score
  - 58 explain Evo 2 on one page
- Days 59-61, generative models (ch 4)
  - 59 multivariate normal, covariance matrix (§4.1.1)
  - 60 GDA vs logistic regression (§4.1.2-4.1.3)
  - 61 naive Bayes on k-mer counts, Laplace smoothing (§4.2)
- Days 62-67, latent variables (ch 10-12)
  - 62 k-means (ch 10). sc: clustering cells, why the book uses a kNN graph and Leiden instead
  - 63 Jensen's inequality (§11.2)
  - 64 EM for a Gaussian mixture (§11.1), link to allele frequency EM
  - 65 ELBO (§11.3)
  - 66 variational autoencoder (§11.5), closes the old autoencoder thread. sc: scVI as a VAE with an NB likelihood
  - 67 PCA as maximum variance, eigenvectors (ch 12), link to Chapter 3 PCA. sc: PCA on log-normalized expression
- Days 68-69, capstone: learner picks a biology question, writes the model on paper end to end, including why that loss (68), then codes it (69)
- Skipped on purpose: sample complexity bounds (§8.3), ICA (ch 13). Add on request.
