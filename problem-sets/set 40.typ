#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#let count_table() = table(
  columns: (1.4fr, 1fr, 1fr, 1fr), inset: 6pt, stroke: 0.5pt,
  [*Count of fish*], [*Read shows T*], [*Read not T*], [*Row total*],
  [AA], [14], [686], [700],
  [AT or TT], [286], [14], [300],
  [*Column total*], [300], [700], [1000],
)
#let recon_table() = table(
  columns: (0.8fr, 1fr, 0.8fr, 1.6fr, 1.4fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.55in, 0.55in),
  [*Fish*], [*$x=(x_1,x_2)$*], [*Code $z$*], [*Reconstruction $hat(x)=(0.6z, 0.8z)$*], [*Error $||x-hat(x)||^2$*],
  [1], [$(-1,-1)$], [$-1.4$], [], [],
  [3], [$(1, 0)$], [$0.6$], [], [],
)
#sheet(day: "40", title: "A bottleneck is a projection", set_label: "set 40")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 2, math: 9, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true, math_label: "Autoencoder", closing_label: "Math refresher: partial derivative")
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* Q1, the primer and Q2. Q3 is optional. Q4 is the math refresher if time remains. The core counts as complete.

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, Eq.2.9, PDF p.48 / printed p.28. Joint-versus-conditional repair (sets 36, 37, 39); tutor count table.]
#question(space: 0.9in, gap: 0em)[
*Recall: joint or conditional? · 2 minutes.* 1000 fish, one read each.
#count_table()
Write:
- $P(G="AA", B=T)$ as a fraction of counts.
- $P(B=T | G="AA")$ as a fraction of counts.
- Which denominator each used: the grand total or the AA row total?
]

#ref_box[
*Primer: a linear autoencoder with a one-number bottleneck.* Use the four centered fish from sets 38–39, each with two SNP dosages $x=(x_1,x_2)$.

*Encoder:* squeeze each fish to one number, the code $z = 0.6 x_1 + 0.8 x_2$. This is the set 39 projection score.

*Decoder:* rebuild two numbers from one, $hat(x) = (0.6 z, 0.8 z)$.

*Loss:* the squared reconstruction error, $||x-hat(x)||^2 = (x_1-hat(x)_1)^2 + (x_2-hat(x)_2)^2$. Training would change the direction $(0.6, 0.8)$ to make the average loss small.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Tutor numerical application, not a numbered exercise.]
#question(space: 2.6in, gap: 0em)[
*Core: squeeze and rebuild · 4 minutes.* Codes are given from set 39.
#recon_table()
Write:
- $hat(x)$ for fish 1 and fish 3.
- The error for each.
- One sentence: which fish lost more information in the bottleneck, and why?

*Optional hint:* fish 1 lies almost along the direction $(0.6,0.8)$; fish 3 does not.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, PDF p.575 / printed p.564; §16.1.1 Maximum variance formulation, PDF pp.511–512 / printed pp.497–498. Tutor application.]
#question(space: 2.6in, gap: 0em)[
*Optional: error lost equals variance missed · 3 minutes.* By symmetry, fish 2 has the same error as fish 3, and fish 4 the same as fish 1.

Write:
- The average error over all four fish.
- $1.5 - 1.16$, where $1.5$ is the total variance (SNP 1 variance 1 plus SNP 2 variance 0.5) and $1.16$ is the projected variance from set 39.
- One sentence: what does the match suggest about minimizing reconstruction error versus maximizing projected variance?
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §8.1.2 General feed-forward networks, Eq.8.7 chain rule, PDF p.252 / printed p.235. Tutor partial-derivative application; set 35 chain-rule follow-up with less scaffolding.]
#question(space: 2.8in, gap: 0em)[
*Math refresher: is the projection the best code? · 3–4 minutes.* For fish 1, $x=(-1,-1)$. Hold the direction $(0.6,0.8)$ fixed and treat the code $z$ as free:
$ E(z) = (-1 - 0.6 z)^2 + (-1 - 0.8 z)^2. $

Write:
- $partial E \/ partial z$, as a formula in $z$.
- Its value at $z=-1.4$.
- One sentence: what does that value say about the encoder's choice $z=-1.4$?

*Optional hint:* differentiate each squared term with the chain rule: outer square, then inner linear term.
]
]
