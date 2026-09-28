#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "32", title: "One learning step", set_label: "molbio/ml set 32")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 0, ml: 10, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true)
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* Q1, this primer and Q2. Q3 is optional; Q4 is the calculus finish if time remains. The core counts as complete.

#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564; §8.1.1 Single-layer networks, Eqs.8.3–8.4, PDF pp.251–252 / printed pp.234–235. Day 30 Q3 constant-term review; tutor item.]
#question(space: 0.1in, gap: 0em)[
*Recall · 30 seconds.* Adding a constant 2 to a loss changes: *A.* its value but not its derivative; *B.* its derivative but not its value; *C.* neither.
]
#ref_box[
*From a slope to a learning step.* Input $x=(2,6)^T$ is encoded by averaging its entries, so $z=4$. Decoder $D(a)=(a,1)^T$ reconstructs $hat(x)=(4a,4)^T$. Only $a$ changes; the encoder and second decoder weight stay fixed.

The loss and its derivative are
$ L(a)=1/2 (4a-2)^2+2, quad L'(a)=16a-8. $
At $a=1$, the loss is 4 and the derivative is 8. *Gradient descent* turns this slope into an update:
$ a_("new")=a_("old")-eta L'(a_("old")). $
The *learning rate* $eta>0$ sets the step size. Evaluate the derivative at the old weight, then subtract the scaled slope. Recalculate the actual loss afterward: a large step can overshoot even when its direction is right.
]
#text(size: 9pt)[Sources are pointers, not extra reading. After two minutes stuck, use one hint or mark and move on. \
Hint(s) used: #box(width: 0.85in)[#line(length: 100%)]]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §7.2.2 Batch gradient descent, Eq.7.16, PDF p.231 / printed p.214; §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Tutor single-example, one-weight update; not a numbered exercise.]
#question(space: 3.5in, gap: 0em)[
*Core: take one step · 3 minutes.* Start at $a_("old")=1$, where $L'(1)=8$ and $L(1)=4$. Use learning rate $eta=1/32$:
$ a_("new")=1-1/32 times 8. $
Calculate the new weight and then its actual loss using
$ L(a)=1/2 (4a-2)^2+2. $
Did this update lower the loss? Show the new loss beside the old value 4. Keep the square intact.

*First step:* calculate the amount subtracted from the old weight before substituting into the loss.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Tutor stationary-point application; follows the set 31 margin question and feedback.]
#question(space: 3.5in, gap: 0em)[
*Optional: zero slope, but what loss? · 4 minutes.* For the same fixed encoder and decoder $hat(x)=(4a,4)^T$, target $x=(2,6)^T$, use
$ L(a)=1/2 (4a-2)^2+2, quad L'(a)=16a-8. $
Find the weight where $L'(a)=0$ and calculate its loss. Explain in one sentence which reconstruction coordinate prevents zero loss when only $a$ can change.

*Why this is a minimum here:* the squared term cannot be less than zero. Check whether your weight makes it zero. This argument applies to this particular loss; zero derivative alone is not a general guarantee of a minimum.

*Optional hint:* solve $16a-8=0$, then substitute into the original unexpanded loss and compare the reconstruction with the target.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2 Probability Densities, Eq.2.25, PDF p.52 / printed p.32. Tutor density-normalization application and logarithmic-integral refresher; not a numbered exercise.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish: a logarithmic integral · 2–4 minutes.* A model assigns nonnegative weights
$ w(t)=1/(1+t) quad "for" 0<=t<=1. $
To turn these into a probability density, we need their total area
$ Z=integral_0^1 1/(1+t) dif t. $
Calculate $Z$ exactly, showing an antiderivative and both bounds. Use $ln$ for the natural logarithm. Check your answer by differentiating your antiderivative.

*ML connection:* the normalized density is $p(t)=w(t)/Z$ on this interval, zero outside. Today only calculate $Z$; the integral makes the total probability equal to one.

*Optional hint:* set $u=1+t$. For $u>0$, an antiderivative of $1/u$ is $ln(u)$. Remember to change bounds if integrating in $u$.
]
]
