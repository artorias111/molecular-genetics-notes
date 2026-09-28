#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "28", title: "One read, two possible origins")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 10, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true)
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

Today is the staggered genotype-likelihood session. *Five-minute core:* Q1, the primer, and Q2. Q3 is optional; Q4 is the calculus finish if time remains. The core counts as complete.

#source[Bishop & Bishop, _Deep Learning_ · §8.1.1 Single-layer networks, Eq.8.2, PDF p.251 / printed p.234; §19.1.1 Linear autoencoders, PDF p.575 / printed p.564. Day 27 Q2 recall; tutor item.]
#question(space: 0.1in, gap: 0em)[
*Recall · 30 seconds.* An encoder maps a $2 times 1$ input column to a $1 times 1$ code using $z=E x$. The shape of $E$ is: *A.* $2 times 1$; *B.* $2 times 2$; *C.* $1 times 2$.
]
#ref_box[
*The biological question:* how much does one observed base tell us about a fish's genotype at an A/T site?

The fish is diploid: it has two chromosome copies. $G$ is the genotype; $B$ is the base reported by one read. The chromosome that supplied the read is hidden. A read comes from *one* chromosome, not from both simultaneously.

*Toy assumptions:* the read is correctly aligned; either chromosome is equally likely to supply it; there is no allele bias. Error probability is fixed at $epsilon=0.06$. A correct base is reported with probability $1-epsilon$; an error is equally likely to be any of the other three DNA bases, so a particular wrong base has probability $epsilon/3$.

Q2 holds $G="AT"$ fixed and asks for $P(B=T|G="AT")$. This is a probability of the observed base given a genotype, not a posterior probability of genotype.
]
#text(size: 9pt)[Pointers are not extra reading. Try Q2 before its optional hint; mark any help used. After two minutes stuck, use the hint or move on. \
Actual minutes: #box(width: 0.65in)[#line(length: 100%)]  Hint(s) used: #box(width: 0.85in)[#line(length: 100%)]]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor changed-number recall from Days 22–23; toy adaptation of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] (web source; historical model).]
#question(space: 3.5in, gap: 0em)[
*Core: reconstruct one read probability · 3 minutes.* The fish has genotype AT and the error probability is $epsilon=0.06$. Each chromosome is equally likely to supply the read; a particular wrong base has probability $epsilon/3$.

Calculate $P(B=T|G="AT")$. Write and label the contribution from each possible chromosome of origin, then combine them into one probability. Start without the hint if you can.

*First step:* label the two possible origins A and T.

*Optional hint:* multiply the chance of each origin by the chance of reporting T from that origin. Add the two alternative-origin contributions. There is only one observed read here.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 / printed pp.28–29. Tutor Day 24 posterior-normalization repair; separate supplied likelihood example, with assumed priors.]
#question(space: 0in, gap: 0em)[
*Optional: turn evidence into probabilities · 4 minutes.* For a separate read dataset $R$, relative likelihoods $L_g$ and prior-weighted evidence are supplied below. The likelihoods have a common rescaling, so need not lie below one. The prior $pi_g$ is an assumed genotype probability before these data.

Add the three weights $w_g=L_g pi_g$ to get one shared total $Z$. Fill each posterior as $w_g/Z$ and check their sum. Calculator allowed; three decimal places are enough.
]
#v(0.1in)
#table(columns: (0.6in,0.85in,0.65in,0.9in,1fr), rows: (auto,0.75in,0.75in,0.75in), inset: 5pt,
[Genotype], [Relative likelihood], [Prior], [Weight $w_g$], [Posterior $w_g/Z$],
[AA], [1], [0.50], [0.50], [],
[AT], [4], [0.40], [1.60], [],
[TT], [1], [0.10], [0.10], [])
#v(0.15in)
Shared total $Z=$
#block(height: 0.6in)[]
Posterior sum check:
#block(height: 0.65in)[]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2 Probability Densities, Eq.2.25, PDF p.52 / printed p.32; §2.2.1 Example distributions, exponential form, PDF p.54 / printed p.34. Tutor normalization application and substitution refresher, not a book exercise.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish: one substitution · 2–4 minutes.* On $0 <= t <= 1$, a nonnegative weight function is $w(t)=2t exp(-t^2)$. Its total area is
$ Z=integral_0^1 2t exp(-t^2) dif t. $
Calculate $Z$ exactly, showing a substitution or an antiderivative and both bounds. Here $exp(v)=e^v$.

*ML connection:* dividing by the total area gives a normalized density $p(t)=w(t)/Z$ on this interval (zero outside). Only calculate $Z$ today. This $Z$ belongs to this continuous example, separate from Q3's genotype weights.

*Optional hint:* try $u=t^2$, so $dif u=2t dif t$. Also $integral exp(-u) dif u=-exp(-u)+C$.
]
]
