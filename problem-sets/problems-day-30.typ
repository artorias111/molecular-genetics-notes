#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "30", title: "From loss to slope")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 0, ml: 10, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true)
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* Q1, this primer and Q2. Q3 is optional; Q4 is a different calculus technique if time remains. The core counts as complete.

#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Day 29 parameter/loss recall; tutor item.]
#question(space: 0.1in, gap: 0em)[
*Recall · 30 seconds.* With a fixed input and fixed encoder, changing only a decoder weight changes: *A.* the input data; *B.* the code produced by the encoder; *C.* the reconstruction, potentially changing its loss.
]
#ref_box[
*Same model, one check before moving on.*
The input is $x=(2,6)^T$. The encoder averages its entries, giving the fixed code $z=4$. The decoder is $D(a)=(a,1)^T$, so its output is $hat(x)=(4a,4)^T$. Only the weight $a$ varies.

Half the sum of squared reconstruction errors gives
$ L(a)=1/2 (4a-2)^2+2. $
Your numerical results were $L(1)=4$ and $L(1/2)=2$. Use a known value to check algebra before trusting a rewritten expression. A mismatch disproves equivalence; one match alone does not prove it.

Q2 keeps the square intact. If that check makes sense and time remains, Q3 introduces the *slope*: how the loss changes when this one weight changes slightly. Keep the other weights and the input fixed.
]
#text(size: 9pt)[Sources are pointers, not extra reading. After two minutes stuck, use one hint or mark and move on. \
Actual minutes: #box(width: 0.65in)[#line(length: 100%)]  Hint(s) used: #box(width: 0.85in)[#line(length: 100%)]]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Tutor Day 29 Q3 algebra-consistency repair.]
#question(space: 3.5in, gap: 0em)[
*Core: a quick check on the formula · 3 minutes.* Two proposed expressions for the same loss are
$ F(a)=1/2 (4a-2)^2+2, quad H(a)=a(2a-1). $
At $a=1$, the decoder reconstructs $(4,4)^T$ from input $(2,6)^T$, giving actual loss 4.

Substitute $a=1$ into both expressions and identify which one this check rules out. Keep the square intact. Show the two evaluations and one short conclusion.

*First step:* replace each $a$ by 1 before doing arithmetic.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §8.1.1 Single-layer networks, Eqs.8.3–8.4, PDF pp.251–252 / printed pp.234–235; §19.1.1 Linear autoencoders, PDF p.575 / printed p.564. Tutor one-weight derivative application.]
#question(space: 3.5in, gap: 0em)[
*Optional: what does the slope tell us? · 4 minutes.* Use the correct loss
$ L(a)=1/2 (4a-2)^2+2. $
Find $L'(a)$ and evaluate it at $a=1$. From its sign, state whether a sufficiently small *decrease* in $a$ should raise or lower the loss near 1.

*A derivative is a local slope:* a positive slope means a small increase in $a$ raises $L$; a negative slope means a small increase lowers $L$. This is local, not a guarantee for an arbitrary large change.

*Optional chain-rule hint:* for $q(a)$, the derivative of $1/2 q(a)^2$ is $q(a)q'(a)$. Here identify $q(a)=4a-2$; the final constant 2 has derivative zero.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2.1 Example distributions, exponential density, PDF p.54 / printed p.34; §2.2.2 Expectations and covariances, Eq.2.39, PDF p.55 / printed p.35. Tutor integration-by-parts refresher, not a numbered exercise.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish: integration by parts · 2–4 minutes.* For a nonnegative variable $T$ with exponential density $p(t)=e^(-t)$, calculate
$ I=integral_0^1 t e^(-t) dif t. $
Use integration by parts and give an exact result.

*ML connection:* a mean is a density-weighted integral. This is the contribution from $0 <= T <= 1$ to the overall mean, not the full mean or a conditional mean.

*Optional refresher:* $integral u dif v=u v-integral v dif u$. Try $u=t$ and $dif v=e^(-t) dif t$, so $dif u=dif t$ and $v=-e^(-t)$. Evaluate the boundary term and remaining integral at 0 and 1.
]
]
