#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(day: "37", title: "Two reads, one genotype", set_label: "set 37")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 10, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true)
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* Q1, the primer and Q2. Q3 is optional; Q4 is the calculus finish if time remains. The core counts as complete.

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, Eq.2.9, PDF p.48 / printed p.28. Set 36 joint/conditional repair; tutor changed-context item.]
#question(space: 0.65in, gap: 0em)[
*Recall: what is already given? · 1 minute.* In a separate toy example, $G$ is genotype and $B$ is one reported base. Suppose
$ P(G="AT",B=A)=0.12, quad P(G="AT")=0.30. $
Find $P(B=A | G="AT")$. Explain in a few words why you divide by $0.30$. These numbers apply only to Q1.
]

#ref_box[
*Chapter 3 question:* how much support do two reads give a candidate genotype?

At one site in a diploid fish, $G$ is the candidate genotype and $B_1,B_2$ are the bases reported by two distinct reads. We observe $B_1=A$ and $B_2=T$. Read labels are fixed: this is the ordered observation $(A,T)$, not a count of either order.

*Toy assumptions for Q2–Q3:* reads are correctly aligned and come from distinct fragments. Each read independently samples either chromosome copy with probability $1/2$; both reads may sample the same copy. Each base is reported correctly with probability $0.94$, and as each particular wrong base with probability $0.02$. Reporting errors are independent across reads.

For *one read*, add the weighted probabilities of its alternative chromosome origins. For *two reads*, multiply their one-read probabilities, assuming independence *conditional on the candidate genotype*:
$ L(g)=P(B_1=A,B_2=T | G=g) $
$ =P(B_1=A | G=g) P(B_2=T | G=g). $
Here $g$ is a candidate such as AT or AA. $L(g)$ is the probability of these data given that candidate, not the probability that the candidate is true.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28; §2.1.6 Independent variables, PDF p.51 / printed p.31. Tutor conditional-read application of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] (historical model; web source).]
#question(space: 3.5in, gap: 0em)[
*Core: construct the two-read likelihood · 3 minutes.* Candidate $G="AT"$ has one A copy and one T copy. Each read independently chooses a copy equally, then reports it correctly with probability $0.94$ or as a particular wrong base with probability $0.02$.

The observed reads are $B_1=A$, $B_2=T$. Construct and calculate
$ L("AT")=P(B_1=A,B_2=T | G="AT"). $
Show each one-read probability as a sum over its two possible origins, then combine the two read probabilities. In one sentence, name the assumption that lets you multiply across reads.

*Optional hint:* two origins are alternatives for the *same* read; two actual reads are two observed events. The genotype is held fixed throughout.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28; §2.1.5 Prior and posterior probabilities, PDF p.51 / printed p.31. Tutor likelihood comparison using #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods")[ANGSD, Genotype Likelihoods → Theory and Beagle output note] (web source); not a numbered book exercise.]
#question(space: 3.5in, gap: 0em)[
*Optional: compare another candidate · 4 minutes.* Keep the same ordered reads, $B_1=A$, $B_2=T$, but now consider $G="AA"$. Both chromosome copies carry A. Each read reports the true base with probability $0.94$ and a particular wrong base with probability $0.02$. Reads are independent conditional on the genotype.

Calculate $L("AA")=P(B_1=A,B_2=T | G="AA")$ and compare it with your $L("AT")$ from Q2. Which candidate gives these observations the higher probability?

Does the larger likelihood alone establish that this genotype is certainly correct? Give one sentence explaining your answer. No genotype prior probabilities have been specified for Q2–Q3.

*Optional hint:* changing the candidate genotype changes the possible true bases, not the observed reads. The probability of a particular wrong report is still nonzero.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2 Probability Densities, Eq.2.23, PDF p.52 / printed p.32; §2.2.1 Example distributions, exponential Eq.2.34, PDF p.54 / printed p.34. Tutor exponential interval-probability refresher; set 36 range-check follow-up.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish: an exponential interval · 2–4 minutes.* A nonnegative continuous quantity $U$ has density $p_U(u)=e^(-u)$ for $u>=0$, and zero otherwise.

Find $P(1<=U<=2)$ by integrating the density over $[1,2]$. Show an antiderivative and both bounds; give the exact result using exponentials. Finish with a short check that the result lies between 0 and 1.

*Optional hint:* differentiate your proposed antiderivative to check it. For the range check, compare $e^(-2)$, $e^(-1)$ and 1.
]
]
