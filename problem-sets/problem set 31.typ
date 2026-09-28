#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "31", title: "Where did the read come from?", set_label: "molbio/ml set 31")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 10, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true)
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

Today is the staggered genotype-likelihood session. *Five-minute core:* Q1, the primer and Q2. Q3 is optional; Q4 is a brief calculus finish if time remains. The core counts as complete.

#source[Bishop & Bishop, _Deep Learning_ · §8.1.1 Single-layer networks, Eqs.8.3–8.4, PDF pp.251–252 / printed pp.234–235. Day 30 Q3 recall; tutor item.]
#question(space: 0.1in, gap: 0em)[
*Recall · 30 seconds.* A loss has derivative $L'(1)=8$. A sufficiently small decrease in its weight $a$ from 1 should: *A.* lower the loss; *B.* raise it; *C.* leave it unchanged.
]
#ref_box[
*Biological question:* how can a T read arise from an AT genotype?

A diploid fish has one A chromosome copy and one T copy at this site. $G$ denotes its genotype, $O$ the chromosome's true base of origin, and $B$ the base reported by a read. The origin is hidden; the reported base is observed.

*Toy sampling story:* first choose one chromosome copy, then report its base with possible sequencing error. Either copy is equally likely; the read is correctly aligned and there is no allele bias. Error probability is $epsilon=0.06$; a correct report has probability $0.94$, and each particular wrong base has probability $0.02$.

Think about one read at a time. Alternative origins describe different ways that *the same observation* could have arisen. Q2 asks you to explain how often each route is available.
]
#text(size: 9pt)[Sources are pointers, not extra reading. After two minutes stuck, use one hint or mark and move on. \
Hint(s) used: #box(width: 0.85in)[#line(length: 100%)]]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Day 28 Q2 reasoning repair; tutor toy adaptation of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] (historical model; web source).]
#question(space: 3.5in, gap: 0em)[
*Core: explain the two routes · 3 minutes.* Hold $G="AT"$ fixed. A read chooses either chromosome with equal probability; reporting T has probability $0.02$ from an A origin and $0.94$ from a T origin.

Write a two-route expression for $P(B=T | G="AT")$ and calculate it. Beside it, explain in one sentence *why adding $0.02+0.94$ alone misses a step in the sampling story*.

*First step:* write “choose A → report T” and “choose T → report T,” and label the chance of each initial choice.

*Optional hint:* a route needs both its origin choice and its base report. Combine probabilities along a route, then combine the alternative routes.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor error-free limiting case of the same ANGSD-based model; no new book exercise.]
#question(space: 3.5in, gap: 0em)[
*Optional: check the model without sequencing errors · 4 minutes.* Keep genotype AT and equal chromosome sampling, but now suppose $epsilon=0$: every read reports its chromosome's true base perfectly.

What is $P(B=T | G="AT")$ now? Explain why perfect base calls still do not make every read T. Use this error-free case to check the proposal
$ P(B=T | G="AT") = (1-epsilon)+epsilon/3. $
Does that proposal represent the sampling story? Explain using your result, without needing a table.

*Optional hint:* remove the reporting error from the story, but keep the chromosome-selection step. Error-free sequencing does not remove the two chromosome copies.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2.1 Example distributions, PDF p.54 / printed p.34; §2.2.2 Expectations and covariances, Eq.2.39, PDF p.55 / printed p.35. Day 30 Q4 sign repair; tutor antiderivative check for a partial exponential expectation.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish: check before using the bounds · 2–4 minutes.* For the exponential density $p(t)=e^(-t)$ on $t>=0$, consider
$ J=integral_0^1 t e^(-t) dif t. $
Two candidate antiderivatives are
$ F(t)=-(t+1)e^(-t), quad H(t)=(1-t)e^(-t). $
Differentiate both to choose the valid one, then use it to evaluate $J$ exactly. Check whether the sign of your result agrees with the integrand on $[0,1]$.

*ML connection:* this integral contributes to the mean of the exponential distribution. Today checks the sign from the previous attempt; no fresh integration-by-parts derivation is needed.

*Optional hint:* use $(u v)'=u'v+u v'$ and $(e^(-t))'=-e^(-t)$, then evaluate the chosen antiderivative at 1 minus its value at 0.
]
]
