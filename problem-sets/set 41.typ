#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#let count_table() = table(
  columns: (1.3fr, 1fr, 1fr, 1fr), inset: 6pt, stroke: 0.5pt,
  [*Count of fish*], [*Read shows T*], [*Read not T*], [*Row total*],
  [AA], [14], [686], [700],
  [Not AA], [286], [14], [300],
  [*Column total*], [300], [700], [1000],
)
#let denom_table() = table(
  columns: (1.6fr, 1.4fr, 1fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.4in, 0.4in, 0.4in),
  [*Probability*], [*Denominator: grand total or AA row?*], [*Fraction*],
  [$P(G="AA")$], [], [],
  [$P(G="AA", B=T)$], [], [],
  [$P(B=T | G="AA")$], [], [],
)
#let gl_table() = table(
  columns: (1fr, 2.4fr, 1.2fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.5in, 0.5in, 0.5in),
  [*Genotype $g$*], [*$L(g)=P(B_1=A, B_2=A | g)$*], [*Value*],
  [AA], [], [],
  [AT], [], [],
  [TT], [], [],
)
#let freq_table() = table(
  columns: (0.8fr, 1fr, 1fr, 1fr, 1.6fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.45in, 0.45in),
  [*$f$*], [*$P("AA" | f)$*], [*$P("AT" | f)$*], [*$P("TT" | f)$*], [*$P("reads" | f)$*],
  [0], [], [], [], [],
  [0.5], [], [], [], [],
)
#sheet(day: "41", title: "From genotypes to allele frequency", set_label: "set 41")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 2, math: 7, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 6, compact: true, short_session: true, closing_label: "Math refresher: sum over genotypes")
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* Q1 and Q2. Q3 is the math refresher if time remains. Its last bullet is optional. The core counts as complete.

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, Eq.2.9, PDF p.48 / printed p.28. Joint-versus-conditional repair (sets 36, 37, 39, 40); tutor count table.]
#question(space: 0.3in, gap: 0em)[
*Recall: circle the denominator · 2 minutes.* No formulas. Read the table.
#count_table()
Fill in the table below. For each probability, write which total goes on the bottom, then the fraction.
#denom_table()
]

#pagebreak()
#source[Tutor application of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] (historical model; web source). Bishop & Bishop, _Deep Learning_ · §2.1.2, PDF pp.46–48 / printed pp.26–28. Unscaffolded check of sets 37 and 39.]
#question(space: 2.0in, gap: 0em)[
*Core: two reads, no worked example · 4 minutes.* Two reads at one site both show A: $B_1=A$, $B_2=A$. Same sequencer as set 39: true base reported with probability $0.97$, each particular wrong base with $0.01$. Each read picks a chromosome copy with probability $1/2$. Reads are independent given the genotype.

#gl_table()

Write:
- Compute the one-read probability $P(B=A | g)$ for each genotype.
- Combine the two reads to get each $L(g)$ and fill in the table.
- Check: which genotype do two A reads favor?
]

#pagebreak()
#ref_box[
*Primer: genotype priors from an allele frequency.* Let $f$ be the frequency of allele T in the population. If the two copies in a fish are drawn independently (Hardy–Weinberg):
$ P("AA" | f)=(1-f)^2, quad P("AT" | f)=2f(1-f), quad P("TT" | f)=f^2. $
We never see a fish's genotype, only its reads. So to ask how well a value of $f$ explains the reads, sum over the genotypes we cannot see:
$ P("reads" | f) = sum_g P("reads" | g) P(g | f). $
This is a likelihood for $f$. Repeated over many fish, it is the core of allele-frequency estimation from genotype likelihoods.
]

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules (sum rule, marginalization), PDF pp.46–48 / printed pp.26–28. Tutor toy version of #link("https://popgen.dk/angsd/index.php/Allele_Frequencies")[ANGSD, Allele Frequencies → Allele Frequency estimation] (`-doMaf`; estimator of Kim et al. 2011; ANGSD also allows departures from Hardy–Weinberg). Web source.]
#question(space: 1.3in, gap: 0em)[
*Math refresher: sum out the genotype · 4–5 minutes.* A different fish has one A read and one T read. Its rounded likelihoods: $L("AA")=0.01$, $L("AT")=0.24$, $L("TT")=0.01$.

#freq_table()

Write:
- Fill in the three genotype priors for $f=0$ and $f=0.5$.
- Compute $P("reads" | f)$ for each row.
- State which $f$ these reads favor, in one sentence.
- Optional: repeat for $f=0.1$.
]
]
