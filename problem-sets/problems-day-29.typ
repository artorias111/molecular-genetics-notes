#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "29", title: "Change one weight")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 0, ml: 10, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true)
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* Q1, the primer, and Q2. Q3 is optional; Q4 is the calculus finish if time remains. The core alone counts as complete.

#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Days 26–27 reconstruction-loss recall; tutor item.]
#question(space: 0.1in, gap: 0em)[
*Recall · 30 seconds.* When training an autoencoder to reconstruct input $x$, the target used in its reconstruction loss is: *A.* its code $z$; *B.* the original input $x$; *C.* the encoder weight matrix.
]
#ref_box[
*One new idea: the loss depends on the weights.*
The input stays $x=(2,6)^T$, and the encoder stays $E=mat(1/2,1/2)$. Its code is $z=E x=4$. The superscript $T$ writes a pair as a column.

Now let the decoder's first weight be a parameter $a$:
$ D(a)=mat(a;1), quad hat(x)=D(a)z. $
A parameter is a model number we can change. The decoder's second weight remains 1. There are no biases or nonlinear activations today.

Compare two choices of $a$ using the same squared reconstruction loss:
$ L=1/2 ((hat(x)_1-2)^2+(hat(x)_2-6)^2). $
Lower loss means a closer reconstruction of *this input*. This single-example comparison does not establish performance on other inputs. Later, derivatives will help choose weight changes systematically.
]
#text(size: 9pt)[Sources are pointers, not extra reading. After two minutes stuck, use the hint or mark the sticking point. \
Actual minutes: #box(width: 0.65in)[#line(length: 100%)]  Hint(s) used: #box(width: 0.85in)[#line(length: 100%)]]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §8.1.1 Single-layer networks, Eqs.8.2–8.3, PDF p.251 / printed p.234; §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Tutor parameter-comparison application, not a numbered book exercise.]
#question(space: 0in, gap: 0em)[
*Core: compare two decoder weights · 3 minutes.* The input is $x=(2,6)^T$ and the fixed code is $z=4$. For each value of $a$, calculate $hat(x)=mat(a;1)4$ and $L=1/2 ((hat(x)_1-2)^2+(hat(x)_2-6)^2)$. Complete the table and circle the row with the lower loss.
]
#v(0.12in)
#table(columns: (0.6in,1.1in,1fr,0.65in), rows: (auto,1.2in,1.2in), inset: 6pt,
[Weight $a$], [Reconstruction $hat(x)$], [Loss calculation], [Loss $L$],
[1], [], [], [],
[1/2], [], [], [])
#v(0.1in)
*First step:* multiply the decoder column by the supplied code 4.
#block(height: 1.1in)[]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564; §8.1.1 Single-layer networks, Eqs.8.2–8.3, PDF p.251 / printed p.234. Tutor bridge from numerical loss to a parameter-dependent expression.]
#question(space: 3.5in, gap: 0em)[
*Optional: write the loss as a function · 4 minutes.* Keep the same input $x=(2,6)^T$, code $z=4$ and decoder $D(a)=(a,1)^T$.

Write one expression $L(a)$ for the reconstruction loss, leaving $a$ as a variable. Substitute the two reconstructed entries into
$ L=1/2 ((hat(x)_1-2)^2+(hat(x)_2-6)^2). $
Simplify the constant part; you may leave the square involving $a$ unexpanded. No differentiation yet.

*Optional hint:* the first reconstructed entry is $a z$ and the second is $z$. The code $z$ stays fixed while $a$ changes.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2 Probability Densities, Eq.2.25, PDF p.52 / printed p.32. Day 28 Q4 substitution revisited with a changed scale; tutor normalization application, not a book exercise.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish: track the scale · 2–4 minutes.* On $0 <= t <= 1$, a nonnegative weight function is $w(t)=4t exp(-2t^2)$. Calculate its total area exactly:
$ Z=integral_0^1 4t exp(-2t^2) dif t. $
Show your substitution and its bounds, or an antiderivative evaluated at both original bounds. Here $exp(v)=e^v$.

*ML connection:* $p(t)=w(t)/Z$ on this interval (zero outside) is a normalized density. Only calculate $Z$ today.

*Optional hint:* choose the positive expression inside the exponent as $u$; calculate $dif u$ and the new upper bound. Differentiate your antiderivative if you want to check it.
]
]
