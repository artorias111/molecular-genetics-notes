#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "35", title: "A weight changes both outputs", set_label: "set 35")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 0, ml: 10, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true)
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* this primer, Q1 and Q2. Q3 is optional; Q4 is the calculus finish if time remains. The core counts as complete.

#ref_box[
*Let an encoder weight change.* Input $x=(2,6)^T$ now has encoder weights $(b,1/2)$, so its code is
$ z=b times 2+1/2 times 6=2b+3. $
The fixed decoder copies the code into both outputs: $hat(x)=(z,z)^T$. Only $b$ changes. The reconstruction loss is
$ L=1/2 (z-2)^2+1/2 (z-6)^2. $
Changing $b$ changes $z$, which changes *both* errors. To connect these changes, use the chain rule:
$ (dif L)/(dif b)=(dif L)/(dif z) (dif z)/(dif b). $
For this model, differentiating the two squared errors gives
$ (dif L)/(dif z)=(z-2)+(z-6), quad (dif z)/(dif b)=2. $
The two error contributions add because the loss is their sum. The chain rule then multiplies by how quickly the code changes with $b$.
]

#source[Bishop & Bishop, _Deep Learning_ · §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Sets 26–27 forward-pass recall; tutor changed-encoder item.]
#question(space: 0.65in, gap: 0em)[
*Recall · 1 minute.* At $b=0$, calculate the code $z=2b+3$ and the reconstruction $hat(x)=(z,z)^T$.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §8.1.2 General feed-forward networks, chain rule Eq.8.7, PDF p.252 / printed p.235; §19.1.1 Linear autoencoders, PDF p.575 / printed p.564. Tutor scalar encoder-gradient application, not a numbered exercise.]
#question(space: 3.5in, gap: 0em)[
*Core: follow the effect through the code · 3 minutes.* Input is $(2,6)^T$, code $z=2b+3$, and reconstruction $(z,z)^T$. The loss is
$ L=1/2 (z-2)^2+1/2 (z-6)^2. $
At $b=0$ we have $z=3$. Use
$ (dif L)/(dif z)=(z-2)+(z-6), quad (dif z)/(dif b)=2 $
to calculate $(dif L)/(dif b)$ by the chain rule. Show the two factors before multiplying. Should a sufficiently small *increase* or *decrease* in $b$ lower the loss? Explain using your derivative's sign.

*Optional hint:* add the two contributions to $(dif L)/(dif z)$ first. A negative derivative means the loss falls as the weight increases locally.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §7.2.2 Batch gradient descent, Eq.7.16, PDF p.231 / printed p.214; §19.1.1 Linear autoencoders, Eq.19.1, PDF p.575 / printed p.564. Sets 32–33 update/check transfer; tutor application.]
#question(space: 3.5in, gap: 0em)[
*Optional: train the encoder one step · 4 minutes.* Start at $b_("old")=0$, where the code is 3 and the loss is 5. Use your Q2 derivative with learning rate $eta=1/8$:
$ b_("new")=b_("old")-eta [ (dif L)/(dif b) ]_(b=0). $
Calculate the new weight, then recompute $z=2b_("new")+3$ and the actual loss
$ L=1/2 (z-2)^2+1/2 (z-6)^2. $
Show whether the new loss is below 5. Keep the decoder fixed: it still reconstructs $(z,z)^T$.

*Optional hint:* the learning rule changes the weight first; run the encoder and decoder again before evaluating the new loss.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2.2 Expectations and covariances, Eq.2.39, PDF p.55 / printed p.35. Set 34 algebra/fraction repair with a changed prediction; tutor expected-loss integral, not a numbered exercise.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish: check the algebra before integrating · 2–4 minutes.* A quantity $t$ is uniform on $[0,1]$, with density 1 there. A model always predicts $1/4$. Its expected squared error is
$ E=integral_0^1 (t-1/4)^2 dif t. $
Expand the square, integrate, and give the exact result. Show the evaluation at both bounds and use a common denominator for the final fractions. Check whether the sign is possible for an average squared error.

*Optional hint:* the cross term in $(u-v)^2$ is $-2u v$. Multiply its coefficient before integrating. This revisits the algebra slip; the integration method is unchanged.
]
]
