#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#let read_table() = table(
  columns: (1.3fr, 1fr, 1fr, 1fr, 1fr, 1fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.5in, 0.5in),
  [*Genotype*], [*$B=A$*], [*$B=C$*], [*$B=G$*], [*$B=T$*], [*Sum*],
  [AT], [], [], [], [], [],
  [AA], [], [], [], [], [],
)
#let post_table() = table(
  columns: (1fr, 1fr, 1.2fr, 1.4fr, 1.2fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.42in, 0.42in, 0.42in, 0.42in),
  [*Genotype $g$*], [*Prior $P(g)$*], [*$L(g)$*], [*Prior × $L(g)$*], [*Posterior*],
  [AA], [0.70], [], [], [],
  [AT], [0.20], [], [], [],
  [TT], [0.10], [], [], [],
  [*Sum*], [1], [—], [], [],
)
#let proj_table() = table(
  columns: (0.8fr, 1.1fr, 1.1fr, 1.8fr, 1fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.4in, 0.4in, 0.4in, 0.4in, 0.4in),
  [*Fish*], [*Centered $x_1$*], [*Centered $x_2$*], [*Score $z$*], [*$z^2$*],
  [1], [$-1$], [$-1$], [], [],
  [2], [$-1$], [0], [], [],
  [3], [1], [0], [], [],
  [4], [1], [1], [], [],
  [*Mean*], [0], [0], [], [],
)
#sheet(day: "39", title: "One read, weighted origins", set_label: "set 39")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 2, math: 9, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true, closing_label: "Math refresher: projection")
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* Q1, the worked example and Q2. Q3 is optional. Q4 is the math refresher if time remains. The core counts as complete.

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, Eq.2.9, PDF p.48 / printed p.28. Set 37 Q1 repair; tutor changed-context item.]
#question(space: 1.1in, gap: 0em)[
*Recall: conditional from joint · 1–2 minutes.* $P(G="AA", B=T)=0.014$ and $P(G="AA")=0.70$.

Write:
- $P(B=T | G="AA")$.
- $P(G="AA")$ written as a sum over the four bases $N$. Joint or conditional terms?
]

#ref_box[
*Worked example: one read, weighted origins.* Genotype AT. The read comes from the A copy with probability $1/2$ and the T copy with probability $1/2$. It reports the true base with probability $0.94$, each particular wrong base with $0.02$.
$ P(B=A | "AT") = underbrace(1/2, "A copy") dot 0.94 + underbrace(1/2, "T copy") dot 0.02 = 0.48. $
*Check:* for one read, the four bases must sum to 1. Here $P(A)=P(T)=0.48$ and $P(C)=P(G)=0.02$. Total $1$.

*Homozygote AA:* both copies are A, so $P(B=A | "AA") = 1/2 dot 0.94 + 1/2 dot 0.94 = 0.94$. Errors still happen.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor application of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] (historical model; web source). Set 37 Q2–Q3 repair.]
#question(space: 2.2in, gap: 0em)[
*Core: your turn, new error rate · 3–4 minutes.* A better sequencer: each read reports the true base with probability $0.97$, and each particular wrong base with $0.01$. Copies are still chosen with probability $1/2$ each.

Fill in $P(B=b | G)$ for one read:
#read_table()

Write:
- The sum for each row.
- One line showing your $B=A$ calculation for AT as a weighted sum.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 / printed pp.28–29; §2.1.5 Prior and posterior probabilities, PDF p.51 / printed p.31. Tutor application; same toy priors as set 38.]
#question(space: 2.2in, gap: 0em)[
*Optional: what does one T read tell you? · 3 minutes.* One read, $B=T$, same $0.97\/0.01$ sequencer. Sites treated as biallelic (A or T), so three candidates.

#post_table()

Write:
- The three likelihoods, products and posteriors.
- One sentence: can a single read separate AT from TT?
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, Eqs.16.1–16.3 (projection onto a unit vector, variance of projected data, $1\/N$ covariance), PDF pp.511–512 / printed pp.497–498. Tutor numerical preparation for PCA, not Ex.16.1.]
#question(space: 1.3in, gap: 0em)[
*Math refresher: project onto a direction · 3–4 minutes.* These are the set 38 fish, already centered. Do not subtract the mean again. Their covariance was $0.5$, the average of the products $(1+0+0+1)\/4$.

PCA scores each fish along a unit direction $u=(0.6, 0.8)$, where $0.6^2+0.8^2=1$:
$ z = 0.6 x_1 + 0.8 x_2. $

#proj_table()

Write:
- The four scores $z$.
- The variance of the scores, $1/N sum z^2$ (their mean is already 0).
- One sentence: is it larger or smaller than the variance along SNP 1 alone, which is 1?

*Optional hint:* PCA picks the unit direction with the largest such variance.
]
]
