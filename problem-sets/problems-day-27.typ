#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "27", title: "The same model, in matrices")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 0, ml: 10, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true)
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* Q1, this primer, and Q2. Q3 is optional; finish with Q4 if time remains. The core alone counts as a complete session.

#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Day 26 Q3 recall; tutor item.]
#question(space: 0.1in, gap: 0em)[
*Recall · 30 seconds.* Squared reconstruction loss is zero when: \
*A.* the code is zero; *B.* the reconstructed input matches the original exactly; *C.* the code contains fewer numbers than the input.
]
#ref_box[
*One new idea: a matrix organizes the weights.*
The encoder turns an input column $x$ into a code $z$; the decoder turns $z$ into a reconstruction $hat(x)$. Write them as
$ z=E x, quad hat(x)=D z, quad E=mat(1/2,1/2), quad D=mat(1;1). $
$E$ and $D$ are the encoder and decoder weight matrices. They are fixed today; there are no biases or nonlinear activations.

A matrix's *shape* is its number of *rows × columns*. Multiplying a matrix by an input column takes one dot product per row. Thus, each row produces one output number. For example, $mat(2,3) mat(a;b)=2a+3b$.

Here $x$ has two entries; the code $z$ has one entry (a scalar, treated as a $1 times 1$ column for shape checks). The reconstructed column has two entries. $D z$ multiplies each entry of $D$ by $z$.
]
#text(size: 9pt)[Sources are pointers, not extra reading. Use one hint or mark the sticking point after two minutes stuck. \
Actual minutes: #box(width: 0.6in)[#line(length: 100%)]  Hint(s) used: #box(width: 0.85in)[#line(length: 100%)]]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §8.1.1 Single-layer networks, Eq.8.2, PDF p.251 / printed p.234; §19.1.1 Linear autoencoders, PDF p.575 / printed p.564. Tutor matrix-notation bridge, not a numbered exercise.]
#question(space: 0in, gap: 0em)[
*Core: two matrix operations · 3 minutes.* Use
$ x=mat(2;6), quad E=mat(1/2,1/2), quad D=mat(1;1). $
Complete this single forward-pass table. Give each weight matrix's shape as rows × columns, then calculate its output. Show the arithmetic in the working column.
]
#v(0.12in)
#table(columns: (0.7in,0.9in,1fr,1.0in), rows: (auto,1in,1in), inset: 6pt,
[Operation], [Weight matrix shape], [Working], [Output],
[$z=E x$], [$E$: #line(length: 0.45in)], [], [$z=$],
[$hat(x)=D z$], [$D$: #line(length: 0.45in)], [], [$hat(x)=$])
#v(0.1in)
*First step:* count the rows and columns in $E$.

*Optional shape hint:* $(m times n)(n times 1)$ produces an $m times 1$ output; the inner dimensions must agree.
#block(height: 1.5in)[]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Day 26 Q3 transfer to a changed input; tutor application.]
#question(space: 3.5in, gap: 0em)[
*Optional: check the reconstruction · 4 minutes.* For $x=(2,6)^T$, use your Q2 output $hat(x)$ to calculate
$ L=1/2 ((hat(x)_1-2)^2+(hat(x)_2-6)^2). $
Show the substitution and the result. This is the same squared reconstruction loss, now applied to the output of your matrix calculation. The superscript $T$ writes the pair as a column.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2 Probability Densities, Eq.2.23, PDF p.52 / printed p.32. Day 26 Q4 technique revisited with a different polynomial density; tutor integration refresher.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish · 2–4 minutes.* A continuous variable $t$ has density $p(t)=3t^2$ for $0 <= t <= 1$, and zero elsewhere. Calculate
$ P(1/2 <= t <= 1)=integral_(1/2)^1 3t^2 dif t. $
Show an antiderivative and evaluate it at both bounds.

*ML connection:* this area gives probability in a specified range of a continuous variable, a basic operation in probabilistic models.

*Optional hint:* seek an antiderivative of the form $c t^3$; differentiating it should recover $3t^2$.
]
]
