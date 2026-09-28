#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#let post_table() = table(
  columns: (1fr, 1fr, 1fr, 1.4fr, 1.2fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.45in, 0.45in, 0.45in, 0.45in),
  [*Genotype $g$*], [*Prior $P(g)$*], [*$L(g)$*], [*Prior × $L(g)$*], [*Posterior*],
  [AA], [0.70], [0.08], [], [],
  [AT], [0.20], [0.20], [], [],
  [TT], [0.10], [0.04], [], [],
  [*Sum*], [1], [—], [], [],
)
#let dosage_table() = table(
  columns: (1fr, 1fr, 1fr, 1.2fr, 1.2fr, 1.3fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.4in, 0.4in, 0.4in, 0.4in, 0.4in),
  [*Fish*], [*SNP 1 $x_1$*], [*SNP 2 $x_2$*], [*Centered $x_1$*], [*Centered $x_2$*], [*Product*],
  [1], [0], [0], [], [], [],
  [2], [0], [1], [], [], [],
  [3], [2], [1], [], [], [],
  [4], [2], [2], [], [], [],
  [*Mean*], [], [], [0], [0], [],
)
#sheet(day: "38", title: "Likelihood times prior", set_label: "set 38")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 2, math: 9, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true, closing_label: "Math refresher: covariance")
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* Q1 and Q2. Q3 is optional. Q4 is the math refresher if time remains. The core counts as complete.

#source[Durbin et al., _Biological Sequence Analysis_ · §3.2 Hidden Markov models, "Formal definition of an HMM", PDF p.63 / printed p.53. Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 / printed pp.28–29. Weekly HMM recall; tutor toy values.]
#question(space: 1.6in, gap: 0em)[
*HMM recall: first-observation posterior · 2 minutes.* A hidden regime is either $H$ (GC-rich) or $L$ (GC-poor), with $P(H)=P(L)=0.5$ at the first position. Emissions: $P(C | H)=0.4$ and $P(C | L)=0.1$.

The first observed base is $C$. Find $P(H | C)$. Which of the given numbers are emissions?
]

#ref_box[
*Chapter 3 question:* a read model gives $L(g)=P("reads" | G=g)$. How do we turn that into a probability for each genotype?

Bayes' theorem, with the reads held fixed:
$ P(G=g | "reads") = (P(g) L(g)) / (sum_h P(h) L(h)). $
The denominator sums over all three candidate genotypes. It equals $P("reads")$.

*Toy values for Q2–Q3.* The likelihoods came from some reads at one site. The priors describe a population where A is common. Both are given; do not derive them.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 / printed pp.28–29; §2.1.5 Prior and posterior probabilities, PDF p.51 / printed p.31. Posterior-normalization repair; tutor application of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods")[ANGSD, Genotype Likelihoods] (web source). Not a numbered exercise.]
#question(space: 0.9in, gap: 0em)[
*Core: normalize to a posterior · 3–4 minutes.* Fill in the table. Multiply each prior by its likelihood, add the products, then divide each product by that sum.

#post_table()

Check that your posteriors add to 1.

*Optional hint:* the products should add to a round number.
]

#source[Bishop & Bishop, _Deep Learning_ · §2.1.5 Prior and posterior probabilities, PDF p.51 / printed p.31. Tutor interpretation item.]
#question(space: 1.1in, gap: 0em)[
*Optional: likelihood versus posterior · 2 minutes.* Which genotype has the largest likelihood? Which has the largest posterior? In one or two sentences, explain why they differ.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, Eq.16.1 (mean) and Eq.16.3 (covariance, $1\/N$), PDF pp.511–512 / printed pp.497–498. Tutor numerical preparation for PCA, not Ex.16.1.]
#question(space: 1.6in, gap: 0em)[
*Math refresher: centering and covariance · 3–4 minutes.* Four fish have genotype dosages (number of T alleles) at two SNPs.

#dosage_table()

Find each SNP's mean. Center each column by subtracting its mean. Then compute the covariance, using $1\/N$ as in Bishop:
$ "cov"(x_1,x_2) = 1/N sum_(n=1)^N (x_(n 1) - overline(x)_1)(x_(n 2) - overline(x)_2). $
Is it positive or negative? In one sentence, say what that means about fish with many T alleles at SNP 1.

*Optional hint:* PCA looks for a direction along which such shared variation is largest. You do not need eigenvectors here.
]
]
