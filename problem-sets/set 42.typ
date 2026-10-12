#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#let route_table() = table(
  columns: (2.2fr, 1.2fr, 1.4fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.55in, 0.55in),
  [*Step (genotype AT)*], [*Either/or, or both?*], [*Value*],
  [One read shows A: it came from the A copy or the T copy], [], [],
  [Two reads both show A: read 1 and read 2], [], [],
)
#let fish_table() = table(
  columns: (0.6fr, 1.2fr, 1.2fr, 1.4fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.45in, 0.5in, 0.5in),
  [*$f$*], [*Fish 1 (A, T reads)*], [*Fish 2 (A, A reads)*], [*Both fish: $P("all reads" | f)$*],
  [0], [0.01], [0.94], [0.0094],
  [0.5], [0.125], [], [],
  [0.25], [], [], [],
)
#let post_table() = table(
  columns: (1fr, 1fr, 1fr, 1.4fr), inset: 6pt, stroke: 0.5pt, rows: (auto, auto, auto, 0.45in),
  [*Genotype*], [*Posterior*], [*T copies*], [*Posterior × T copies*],
  [AA], [0.6], [0], [],
  [AT], [0.3], [1], [],
  [TT], [0.1], [2], [],
)
#sheet(day: "42", title: "Many fish, one allele frequency", set_label: "set 42")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 2, math: 6, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true, closing_label: "Math refresher: posterior-weighted expectation")
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* Q1 and the first two bullets of Q2. The rest is extra. The core counts as complete.

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor application of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] (historical model; web source). Repair of set 41 Q2.]
#question(space: 0.6in, gap: 0em)[
*Recall: either/or, or both? · 2 minutes.* Same sequencer: true base reported with probability $0.97$, each particular wrong base $0.01$. Each read picks a chromosome copy with probability $1/2$.

Either/or means add the weighted routes. Both means multiply.

#route_table()

Write:
- In the middle column, write either/or or both for each step.
- Fill in the value for each step.
]

#pagebreak(weak: true)
#ref_box[
*From one fish to many.* Set 41 summed over hidden genotypes for one fish:
$ P("reads" | f) = sum_g P("reads" | g) P(g | f) $
$ P("AA" | f)=(1-f)^2, quad P("AT" | f)=2f(1-f), quad P("TT" | f)=f^2. $
Different fish are independent given $f$. So for several fish, multiply each fish's sum:
$ P("all reads" | f) = P("fish 1 reads" | f) times P("fish 2 reads" | f). $
Likelihoods: fish 1 (A, T): $L = 0.01, 0.24, 0.01$ for AA, AT, TT. Fish 2 (A, A): $L = 0.94, 0.24, 0.0001$ (rounded).
]

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28; §2.1.6 Independent variables, PDF p.51 / printed p.31. Tutor toy version of #link("https://popgen.dk/angsd/index.php/Allele_Frequencies")[ANGSD, Allele Frequencies] (`-doMaf`, Kim et al. 2011). Web source.]
#question(space: 0.5in, gap: 0em)[
*Core: two fish, one $f$ · 6 minutes.* The $f=0$ row and fish 1 at $f=0.5$ are filled in for you.

#fish_table()

Write:
- Compute fish 2's sum at $f=0.5$.
- Multiply to fill in both fish at $f=0.5$.
- One sentence: is $f=0$ or $f=0.5$ favored?
- Optional: fill in the $f=0.25$ row. Priors are $0.5625$, $0.375$, $0.0625$.
]

#pagebreak(weak: true)
#ref_box[
*Primer: expected value.* An expectation is a weighted average: multiply each value by its probability, then add. Bishop Eq.2.38: $EE[f] = sum_x p(x) f(x)$.

We never know how many T copies a fish has. But given its reads, the posterior tells us how likely each genotype is. The expected T count is our best average guess.
]

#source[Bishop & Bishop, _Deep Learning_ · §2.2.2 Expectations and covariances, Eq.2.38, PDF p.54 / printed p.34. Tutor toy of the EM idea behind allele-frequency estimation; §15.3 EM starts PDF p.489 / printed p.474 (not required reading).]
#question(space: 1.3in, gap: 0em)[
*Math refresher: expected T count · 4 minutes.* A fish's posterior genotype probabilities, given its reads:

#post_table()

Write:
- Fill in the last column.
- Add it up to get the expected number of T copies in this fish.
- Optional: a second fish has expected T count $1.5$. Each fish has 2 copies. Estimate $f$ as (total expected T copies) / (total copies).
]
]
