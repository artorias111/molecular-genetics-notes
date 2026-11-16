#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "45", title: "Route trees, then one EM step", set_label: "set 45")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 0, math: 20, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 5, compact: true, short_session: true, math_label: "Genotype likelihoods and allele frequency", closing_label: "Math refresher: covariance")
#parbreak()
*This week only: aim for about 25 minutes. Stop at 30, including reading.*

*Core:* Q1 (about 7 minutes). The core counts as complete.

#ref_box[
*Sequencer with error rate $e$.* The true base is reported with probability $1 - e$. Each of the three wrong bases is reported with probability $e\/3$.

*Each read picks its own copy.* For every read, the fish flips a fair coin to choose which chromosome copy it comes from. Read 2's coin does not care what read 1's coin did. So both reads can come from the same copy.
]

#pagebreak()

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor application of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] (historical model; web source). Repair of set 44 Q1–Q2.]
#question(space: 3.6in, gap: 0em)[
*Core: draw the route tree · 7 minutes.* An AT fish, $e = 0.12$, so $1 - e = 0.88$ and $e\/3 = 0.04$. Both reads show A.

- Draw a tree. First split: read 1's copy (A copy or T copy). Under each, a second split: read 2's copy. You should end with 4 leaves.
- On each leaf write which copy each read came from (e.g. "A copy, A copy") and the chance of that leaf _and_ both reads showing A. A leaf's chance is (read 1's piece) × (read 2's piece), where a piece is $1/2$ × (chance that copy is reported as A).
- Add the 4 leaves.
- Separately, compute $P("one read shows A" | "AT")$ and square it. Compare with your sum.
]

#pagebreak(weak: true)
#source[Same sources as Q1. Tutor application.]
#question(space: 2.6in, gap: 0em)[
*No tree this time · 4 minutes.* An AT fish, $e = 0.06$ ($1 - e = 0.94$, $e\/3 = 0.02$). Read 1 shows *A*, read 2 shows *T*.

- Compute $P("read 1 shows A" | "AT")$, then $P("read 2 shows T" | "AT")$, then $P("read 1 is A and read 2 is T" | "AT")$.
- One line: within one read, you combined the two copies (A copy, T copy). Add or multiply, and why? Across the two reads: add or multiply, and why?
]

#pagebreak(weak: true)
#ref_box[
*One EM step.* $f$ = frequency of the T allele. In set 44 the two-fish likelihood peaked near $f approx 0.28$, a little above 0.25. EM is a way to climb toward that peak without drawing the curve. One step:
+ Start at a guess, $f = 0.25$.
+ For each fish, turn its three (L × genotype frequency) terms into posteriors: divide each term by that fish's total.
+ Expected T copies in a fish = $0 times P("AA") + 1 times P("AT") + 2 times P("TT")$, using posteriors.
+ New $f$ = (expected T copies, both fish) ÷ (4 copies in total).

#v(0.5em)
$L = P("fish's reads" | "genotype")$, the genotype likelihood. Genotype frequencies at $f$ (Hardy-Weinberg): AA $(1-f)^2$, AT $2f(1-f)$, TT $f^2$. Old sequencer from set 44 ($e = 0.03$): fish 1 $L = 0.01, 0.24, 0.01$ and fish 2 $L = 0.94, 0.24, 0.0001$ for AA, AT, TT.


#v(0.3em)
Your set 44 terms ($L$ × genotype frequency) at $f = 0.25$:
- Fish 1 (reads A, T): AA $0.005625$, AT $0.09$, TT $0.000625$. Total $0.09625$.
- Fish 2 (reads A, A): AA $0.52875$, AT $0.09$, TT $0.000006$. Total $0.61876$.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 / printed pp.28–29; §2.2.2 Expectations and covariances, Eq.2.38, PDF p.54 / printed p.34. EM in general: §15.3, starts PDF p.489 / printed p.474 (not required). Tutor toy of the EM idea in #link("https://popgen.dk/angsd/index.php/Allele_Frequencies")[ANGSD, Allele Frequencies] (Kim et al. 2011). Web source.]
#question(space: 3.6in, gap: 0em)[
*Predict, then one EM step · 9 minutes.*

- *Predict:* above, below or equal to 0.25? Hint: the reads alone show 1 T in 4. What could push the expected T count above 1?
- Compute fish 1's three posteriors and its expected T copies. Same for fish 2. (Keep 3 decimals throughout.)
- New $f$ = (fish 1 expected T + fish 2 expected T) ÷ 4.
- One sentence: did $f$ move toward the peak near 0.28?
]

#pagebreak(weak: true)
#source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, Eq.16.1 (mean) and Eq.16.3 (covariance, $1\/N$), PDF pp.511–512 / printed pp.497–498. Tutor numerical example. Repair of set 44 Q5.]
#question(space: 2.6in, gap: 0em)[
*Math refresher: covariance, multiply first · 5 minutes.* Covariance $= 1/N sum_"fish" ("SNP 1" - "mean"_1)("SNP 2" - "mean"_2)$. Multiply inside each fish first, then add over fish.

Four fish, dosage (number of T alleles): SNP 1 = 0, 0, 2, 2. SNP 2 = 2, 1, 1, 0.

- *Predict* the sign before computing. One reason.
- Compute the covariance by hand. Show each fish's product.
- *Why:* add up the SNP 1 deviations alone. What do you get, and why will that always happen? So why is (sum of SNP 1 deviations) × (sum of SNP 2 deviations) useless as a covariance?
]
]
