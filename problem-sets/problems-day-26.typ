#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "26", title: "A tiny autoencoder")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 0, ml: 10, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true)
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* read this primer, circle Q1, and try Q2. That counts as a complete session. Q3 is optional; Q4 is a short calculus finish if time remains. No catch-up if you stop early.

#ref_box[
*Today's idea: compress, then reconstruct.*
An autoencoder has an *encoder* that turns input $x$ into a smaller code $z$, and a *decoder* that turns $z$ into a reconstruction $hat(x)$. The hat means “reconstructed,” not a different input.

Our toy model has two input numbers, one code number, and two output numbers. Its weights are supplied and fixed today. There are no biases or nonlinear activations in this first example.

#align(center)[$(x_1,x_2) -> z -> (hat(x)_1,hat(x)_2)$]

The encoder averages the two inputs. The decoder copies that average into both output positions. Reconstruction can lose information. Later, we will learn to adjust weights to reduce that loss.
]
#source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, PDF pp.511–512 / printed pp.497–498. Day 24 Q8 dot-product repair; tutor recall item.]
#question(space: 0.25in, gap: 0em)[
*Recall · 30 seconds.* A dot product multiplies matching entries and adds. $(1,-1) dot (1,-1)$ equals: *A.* 0  #h(0.15in) *B.* 2  #h(0.15in) *C.* -2.
]
#text(size: 9pt)[*Stop at 15 minutes.* Actual minutes: #box(width: 0.65in)[#line(length: 100%)]  Hint(s) used: #box(width: 0.8in)[#line(length: 100%)] \
Submit whatever you reached. Skipping the optional extension carries no penalty.]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · Ch.19 Autoencoders, PDF p.574 / printed p.563; §19.1.1 Linear autoencoders, PDF p.575 / printed p.564. Tutor numerical application, not a numbered book exercise.]
#question(space: 3.5in, gap: 0em)[
*Core: follow one input · 3 minutes.* For input $x=(2,4)^T$, the encoder and decoder are
$ z = (1/2)x_1 + (1/2)x_2, quad hat(x)=(z,z)^T. $
The superscript $T$ means these pairs are column vectors.

Fill the single path with numbers:
$ (2,4)^T -> z=underline(#h(0.45in)) -> hat(x)=(underline(#h(0.45in)),underline(#h(0.45in)))^T. $

*Tiny first step:* substitute 2 for $x_1$ and 4 for $x_2$.

*Hint if needed:* multiply each input by one-half, then add. Put the resulting code into both output positions.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Tutor single-input application of squared reconstruction error.]
#question(space: 3.5in, gap: 0em)[
*Optional: measure the mismatch · 4 minutes.* Use your reconstruction from Q2. For this one input, define the loss
$ L=1/2 ((hat(x)_1-2)^2+(hat(x)_2-4)^2). $
Calculate $L$, showing the two differences before squaring. A loss of zero would mean both reconstructed entries match the input exactly. The factor $1/2$ is a convenient convention.

*First step:* subtract 2 from your first reconstructed entry.

*Hint if needed:* keep each difference in parentheses when squaring. A negative number squared is positive.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2 Probability Densities, Eq.2.23, PDF p.52 / printed p.32. Tutor high-school integration refresher; polynomial density application, not a book exercise.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish · 2–4 minutes.* A continuous variable $t$ has density $p(t)=2t$ for $0 <= t <= 1$, and zero elsewhere. Interval probabilities are areas under the density. Calculate
$ P(0 <= t <= 1/2)=integral_0^(1/2) 2t dif t. $
Show an antiderivative and evaluate it at the two bounds.

*ML connection:* integrating a density gives probability over a range. This will help with continuous-variable models; today's autoencoder forward pass does not require it.

*Hint if needed:* $integral t^n dif t=t^(n+1)/(n+1)+C$ for $n != -1$. For a definite integral, subtract the lower-bound value from the upper-bound value.
]

]
