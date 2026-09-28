#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "33", title: "How far should a step go?", set_label: "molbio/ml set 33")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 0, ml: 10, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true)
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* this primer, Q1 and Q2. Q3 is optional; Q4 is the calculus finish if time remains. The core counts as complete.

#ref_box[
*Same model, one new decision.* Input $x=(2,6)^T$ is encoded by averaging, giving $z=4$. The decoder reconstructs $hat(x)=(4a,4)^T$; only the weight $a$ changes.
$ L(a)=1/2 (4a-2)^2+2, quad L'(a)=16a-8. $
Gradient descent uses the slope at the *old* weight:
$ a_("new")=a_("old")-eta L'(a_("old")), quad eta>0. $
The learning rate $eta$ controls how far the weight moves. At $a_("old")=1$, $L=4$ and $L'=8$. In set 32, $eta=1/32$ gave $a_("new")=3/4$ and $L=5/2$.

Today test a different step size, then optionally work backward to choose one. A direction of local decrease tells us about sufficiently small steps; calculate the actual loss to judge a finite step.
]

#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Set 32 Q3 review; tutor item.]
#question(space: 0.65in, gap: 0em)[
*Recall · 1 minute.* For this loss, the minimum over $a$ occurs at $a=1/2$. What is $L'(1/2)$? Does this force the loss itself to be zero? Give a short reason.
]
#text(size: 9pt)[Sources are pointers, not extra reading. After two minutes stuck, use one hint or mark and move on. \
Hint(s) used: #box(width: 0.85in)[#line(length: 100%)]]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §7.2.2 Batch gradient descent, Eq.7.16, PDF p.231 / printed p.214; §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Tutor learning-rate comparison, not a numbered exercise.]
#question(space: 3.5in, gap: 0em)[
*Core: judge a larger step · 3 minutes.* Start again at $a_("old")=1$, with $L'(1)=8$ and old loss 4. This time choose $eta=3/16$.

Use $a_("new")=a_("old")-eta L'(a_("old"))$ to find the new weight, then calculate its loss:
$ L(a)=1/2 (4a-2)^2+2. $
Compare with 4. In one sentence, use your result to judge this claim: “Subtracting a positive multiple of the gradient always lowers the loss.”

*Optional hint:* mark the old weight, your new weight and the minimum at $a=1/2$ on a number line. Which side of the minimum does the step reach?
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §7.2.2 Batch gradient descent, Eq.7.16, PDF p.231 / printed p.214; §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Tutor inverse step-size problem, not a numbered exercise.]
#question(space: 3.5in, gap: 0em)[
*Optional: choose the step yourself · 4 minutes.* Start at $a_("old")=1$ with slope 8. You know that this particular loss reaches its minimum at $a=1/2$.

Find a positive learning rate $eta$ that lands *exactly* at that weight in one update. Set up an equation from
$ a_("new")=a_("old")-eta L'(a_("old")), $
solve for $eta$, and check by substituting your rate back into the update.

*Scope:* this is a one-weight quadratic with its minimum supplied. It is not a general recipe for choosing learning rates in neural networks.

*Optional hint:* put the desired new weight on the left of the update rule; leave the learning rate unknown.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2 Probability Densities, Eqs.2.23–2.25, PDF p.52 / printed p.32. Tutor piecewise density-normalization application and calculus refresher, not a numbered exercise.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish: a rule that changes · 2–4 minutes.* A model gives a continuous quantity $t$ the nonnegative weight
$ w(t)=cases(t & "if" 0<=t<=1, 1 & "if" 1<t<=2, 0 & "otherwise"). $
Find the total area $Z=integral_0^2 w(t) dif t$ exactly. Write the integral as two pieces, using the appropriate rule on each interval, and show the bounds when evaluating.

*Model connection:* dividing by $Z$ gives a probability density $p(t)=w(t)/Z$. You only need to find $Z$ today.

*Optional hint:* split at the point where the formula changes. Add the two areas.
]
]
