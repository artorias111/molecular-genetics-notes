#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "46", title: "EM with clean fractions, then your first SFS", set_label: "set 46")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 0, math: 22, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 3, compact: true, short_session: true, math_label: "Genotype likelihoods, EM and the SFS", closing_label: "Math refresher: covariance")
#parbreak()
*This week only: aim for about 25 minutes. Stop at 30, including reading.*

*Core:* Q1 and Q2 (about 9 minutes). The core counts as complete.

#ref_box[
*Perfect sequencer, $e = 0$.* Every read reports its true base. No errors, so the fractions stay clean all sheet.

*Each read picks its own copy.* For every read, the fish flips a fair coin to choose which chromosome copy it comes from. Within one read, add over the two copies, each weighted $1\/2$. Across reads, multiply.

*Two fish, one SNP.* Fish 1's reads: A, then T. Fish 2's reads: A, then A. Reads are kept in order; don't multiply by the number of orderings. $L = P("fish's reads" | "genotype")$, the genotype likelihood.
]

#pagebreak()

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor application of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] (web source). Limit check of sets 44–45.]
#question(space: 3.0in, gap: 0em)[
*Core: limit check, $e = 0$ · 3 minutes.*

- Write $L$ for AA, AT and TT for fish 1 (A, then T). Then the same three for fish 2 (A, then A). Six numbers, as fractions.
- One line: why is fish 1's $L$ for AA exactly 0?
]

#pagebreak(weak: true)
#source[Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 / printed pp.28–29. Tutor worked example. Repair of set 45 Q3.]
#question(space: 2.8in, gap: 0em)[
*Core: find the two mistakes · 5 minutes.* Someone worked fish 2 (A, A) at $f = 1/4$, where $f$ = frequency of the T allele. Hardy-Weinberg genotype frequencies: AA $(1-f)^2 = 9/16$, AT $2f(1-f) = 6/16$, TT $f^2 = 1/16$.

#block(inset: 6pt, stroke: 0.5pt + luma(160), width: 100%)[
+ Terms ($L$ × genotype frequency): AA $1 times 9/16 = 36/64$. AT $1/4 times 6/16 = 6/64$. TT $0 times 1/16 = 0$.
+ Total $= 36/64 + 6/64 + 0 = 42/64$.
+ Posterior AT $= 1/4 times (6\/64) / (42\/64) = 1/28$.
+ Posterior AA $= 0$, because AA has no T copies.
+ Posterior TT $= 0$.
]

- Circle the two wrong lines. One sentence each on what went wrong.
- Write the correct posteriors for AA, AT and TT. They should add to 1.
]

#pagebreak(weak: true)
#ref_box[
*One EM step* (same recipe as set 45). Start at a guess $f$. For each fish: posteriors = each term ÷ that fish's total. Expected T copies in a fish $= 0 times P("AA") + 1 times P("AT") + 2 times P("TT")$, using posteriors. New $f$ = (expected T copies, both fish) ÷ (4 copies in total).
]

#source[Bishop & Bishop, _Deep Learning_ · §2.2.2 Expectations and covariances, Eq.2.38, PDF p.54 / printed p.34. EM in general: §15.3, starts PDF p.489 / printed p.474 (not required). Tutor toy of the EM idea in #link("https://popgen.dk/angsd/index.php/Allele_Frequencies")[ANGSD, Allele Frequencies] (Kim et al. 2011). Web source.]
#question(space: 3.0in, gap: 0em)[
*Predict, then one EM step, in fractions · 5 minutes.* Start at $f = 1/4$.

- *Predict:* will the new $f$ be above, below or equal to $1/4$? The reads alone show 1 T in 4.
- Fish 1's posteriors (use your Q1 values; no long division needed) and its expected T copies. Fish 2's expected T copies, from your Q2 posteriors.
- New $f$ as a fraction, then as a decimal (3 places).
- *Optional, 4 minutes:* one more step from your new $f$. Is it still moving? By more or by less than the first step?
]

#pagebreak()
#ref_box[
*The site frequency spectrum (SFS).* At each SNP, one allele is *ancestral* (the older one, read off an outgroup species) and the other is *derived* (the newer mutation). Sample 3 diploid fish, so $n = 6$ chromosome copies.

- *Derived count* at a site = number of derived copies among the 6 = sum of the three fishes' dosages (0, 1 or 2 derived copies per fish).
- A site with derived count 0 or 6 is not a SNP in this sample. Leave it out.
- *Unfolded SFS:* for $i = 1, 2, 3, 4, 5$, the number of SNPs with derived count $i$. Five numbers.
- *Folded SFS* (used when the ancestral allele is unknown): count the rarer allele instead, $min(i, 6 - i)$. Bins 1, 2, 3.
- *Neutral expectation.* Constant population size, no selection: the expected number of SNPs in bin $i$ is proportional to $1\/i$ (unfolded bins).
]

#v(0.4em)
#show table.cell: set par(justify: false)
#table(columns: (1fr, 1fr, 1fr, 1fr), inset: 4pt, stroke: 0.5pt + luma(160), align: center,
  [*Site*], [*Fish 1: derived copies*], [*Fish 2: derived copies*], [*Fish 3: derived copies*],
  [S1], [1], [0], [0],
  [S2], [0], [1], [0],
  [S3], [0], [0], [1],
  [S4], [1], [0], [0],
  [S5], [0], [0], [0],
  [S6], [0], [1], [0],
  [S7], [1], [1], [0],
  [S8], [2], [0], [1],
  [S9], [2], [2], [1],
)

#pagebreak()
#source[SFS definition: #link("https://popgen.dk/angsd/index.php/RealSFSmethod")[ANGSD, realSFS method] (web source). Neutral $1\/i$ shape: Fu (1995), _Theor. Popul. Biol._ 48:172–197. Rare-variant excess and history: refresher day 4, §4 (Tajima's D). Tutor toy data.]
#question(space: 4.2in, gap: 0em)[
*Build an SFS by hand · 9 minutes.* Use the dosage table on the previous page.

- Write each site's derived count. Which site is not a SNP?
- Write the unfolded SFS (bins 1–5). Then fold it (bins 1–3).
- *Neutral shape:* add $1 + 1/2 + 1/3 + 1/4 + 1/5$. Expected SNPs in bin $i$ = (your number of SNPs) × $(1\/i)$ ÷ (that sum). Compute bins 1–5, 1 decimal place. Check they roughly add to your number of SNPs.
- Sketch your observed unfolded counts and the neutral expected counts as bars on the same axes (x: bin $i$, y: number of SNPs).
- One sentence: does this sample have more or fewer rare (bin 1) variants than neutral predicts? Would you trust that call from this many SNPs?
]

#pagebreak(weak: true)
#source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, Eq.16.3 (covariance, $1\/N$), PDF pp.511–512 / printed pp.497–498. Tutor numerical example. Repair of set 45 Q4.]
#question(space: 2.4in, gap: 0em)[
*Math refresher: predict the sign · 3 minutes.* Covariance $= 1/N sum_"fish" ("SNP 1" - "mean"_1)("SNP 2" - "mean"_2)$. The rule for predicting: do fish that are high on SNP 1 tend to be high on SNP 2 (positive), low on SNP 2 (negative), or neither (about 0)?

Four fish, dosages. *Pair A:* SNP 1 = 0, 1, 2, 2 and SNP 2 = 0, 1, 1, 2. *Pair B:* SNP 1 = 0, 0, 2, 2 and SNP 2 = 1, 1, 1, 1.

- Predict the sign for pair A and for pair B, one reason each.
- Compute pair A to check. Show each fish's product.
]
]
