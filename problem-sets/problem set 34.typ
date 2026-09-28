#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "34", title: "Which assumption sets the weights?", set_label: "molbio/ml set 34")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 10, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true)
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

Today is the staggered genotype-likelihood session. *Five-minute core:* Q1, this primer and Q2. Q3 is optional; Q4 is the calculus finish if time remains. The core counts as complete.

#source[Bishop & Bishop, _Deep Learning_ · §8.1.1 Single-layer networks, Eqs.8.3–8.4, PDF pp.251–252 / printed pp.234–235. Set 33 Q1 slope/value repair; tutor item.]
#question(space: 0.6in, gap: 0em)[
*Recall: label the two quantities · 1 minute.* For
$ L(a)=1/2 (4a-2)^2+2, quad L'(a)=16a-8, $
calculate $L(1/2)$ and $L'(1/2)$. Label one answer *loss value* and the other *slope*.
]

#ref_box[
*Biological question:* how likely is one observed A read if a fish's genotype is AT?

$G$ denotes the diploid genotype, $O$ the true base on the chromosome copy that produced the read, and $B$ the reported base. At this site the fish has one A copy and one T copy. The origin $O$ is hidden; the reported base $B$ is observed.

*Q2 assumptions:* the read is correctly aligned. Either chromosome copy is equally likely to produce it. The base is reported correctly with probability $0.97$; each of the three particular wrong bases is reported with probability $0.01$. These are stipulated toy-model probabilities, not measured data.

Build the probability of the observation from this story. Hold the candidate genotype fixed; this is one genotype's likelihood for the observed read, not a posterior probability of the genotype.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Set 31 origin reasoning with fewer prompts; tutor toy adaptation of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] (historical model; web source).]
#question(space: 3.5in, gap: 0em)[
*Core: build the likelihood · 3 minutes.* A fish has $G="AT"$: one A copy and one T copy. A read samples either copy equally, then reports the true base with probability $0.97$ or each particular wrong base with probability $0.01$.

Construct and calculate $P(B=A | G="AT")$. Write an expression that shows how both possible origins contribute. In one sentence, explain which sampling assumption determines the weights on those contributions.

Use $O=A$ or $O=T$ to label an origin; $G="AT"$ stays fixed throughout.

*Optional hint:* a route requires an origin choice and a base report. Multiply within each route, then add across the alternative origins.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor hypothetical unequal-sampling extension of Q2; not the equal-allele ANGSD formula and not a numbered book exercise.]
#question(space: 3.5in, gap: 0em)[
*Optional: change one assumption · 4 minutes.* The fish still has genotype AT, but suppose an assay favors fragments from its A copy: a read now originates from A with probability $3/4$ and from T with probability $1/4$. Base-reporting probabilities stay the same: $0.97$ for the correct base and $0.01$ for each particular wrong base.

Before calculating, predict whether an A report should become more or less likely than under equal sampling. Then construct and calculate the new $P(B=A | G="AT")$ to check your prediction. Label the origin-choice factors in your expression.

*Model distinction:* this hypothetical bias changes which copy is observed more often; the fish still carries one copy of each allele.

*Optional hint:* keep the reporting probabilities; replace the origin-choice probabilities with the new sampling weights.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2.2 Expectations and covariances, Eq.2.39, PDF p.55 / printed p.35. Tutor expected-squared-error application and polynomial integration refresher; not a numbered exercise.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish: average prediction error · 2–4 minutes.* A quantity $t$ is uniform on $[0,1]$: its density is $p(t)=1$ there and zero outside. A model always predicts $1/2$, so its squared error is $(t-1/2)^2$.

The *expected* squared error averages this loss using the density:
$ E=integral_0^1 (t-1/2)^2 p(t) dif t = integral_0^1 (t-1/2)^2 dif t. $
Calculate $E$ exactly, showing an antiderivative and evaluation at both bounds. This loss has no extra factor of $1/2$ in front.

*Optional hint:* either expand the square or set $u=t-1/2$ and change the bounds. Integrate the resulting polynomial.
]
]
