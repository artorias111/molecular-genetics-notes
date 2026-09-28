#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#let dna_table() = table(
  columns: (1.5fr,1fr,1fr,1fr,1fr), inset: 4pt, stroke: 0.5pt,
  [*From ↓ / to →*], [*$A$*], [*$C$*], [*$G$*], [*$T$*],
  [*$A$*], [0.25], [0.25], [0.25], [0.25],
  [*$C$*], [0.20], [0.30], [0.40], [0.10],
  [*$G$*], [0.20], [0.20], [0.30], [0.30],
  [*$T$*], [0.25], [0.25], [0.25], [0.25],
)
#sheet(day: "36", title: "A probability model for DNA", set_label: "set 36")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 1, math: 10, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 4, compact: true, short_session: true, math_label: "DNA modeling")
#parbreak()
*Aim: about 12 minutes. Stop at 15, including reading.*

*Five-minute core:* this primer, Q1 and Q2. Q3 is optional; Q4 is the calculus finish if time remains. The core counts as complete.

#ref_box[
*From a DNA string to its probability.* Let $X_i$ be the observed base at position $i$, reading 5′ to 3′ without errors. A first-order Markov model predicts each next base from the preceding base, using the same rule at every position.

Write $pi_a=P(X_1=a)$ for the initial-base probability and $T_(a b)=P(X_(i+1)=b | X_i=a)$ for a transition. For a three-base string:
$ P(X_1=a,X_2=b,X_3=c)=pi_a T_(a b) T_(b c). $
Each multiplied term is a *factor*. This uses the conditional product rule, not independence of adjacent bases. If the first base is given, omit the initial factor.

This *toy* model starts each base with probability $1/4$. Rows are current bases; columns are next bases.
#dna_table()
Transitions run *along the sequence*, not through evolutionary time. The states are observed bases, not hidden variables.
]

#source[Durbin et al., _Biological Sequence Analysis_ · §3.1 Markov chains, Eqs.3.1–3.2, PDF p.58 / printed p.48. Markov side-quest Q2–Q3 conditioning repair; tutor nucleotide application.]
#question(space: 0.55in, gap: 0em)[
*Recall · 1 minute.* If $X_1=C$ and $X_2=G$, which table row determines the distribution of $X_3$: $C$ or $G$? Give one short reason.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Durbin et al., _Biological Sequence Analysis_ · §3.1 Markov chains, PDF pp.58–59 / printed pp.48–49. Tutor nucleotide application, not a numbered exercise.]
#question(space: 3.5in, gap: 0em)[
*Core: give a DNA string a probability · 3 minutes.* Use initial probability $P(X_1=C)=1/4$ and transitions $T_(C G)=0.40$, $T_(G C)=0.20$. Here $T_(a b)=P("next base"=b | "current base"=a)$.

Find the joint probability $P(X_1=C,X_2=G,X_3=C)$ of the string *CGC*. Show the three multiplied factors, labelling each with its probability expression.

Then find $P(X_2=G,X_3=C | X_1=C)$. In one sentence, explain why the initial-base factor appears in only one of these answers.

*Optional hint:* the final transition is from position 2 to position 3. Its conditioning base is the base at position 2.
]

#pagebreak()
#source[Durbin et al., _Biological Sequence Analysis_ · §3.1 Markov chains, Eq.3.2, PDF p.58 / printed p.48; sequence models, PDF pp.60–61 / printed pp.50–51. Bishop & Bishop, _Deep Learning_ · §2.1.2, PDF pp.46–48. Tutor base-order comparison, not a fitted CpG classifier.]
#question(space: 3.5in, gap: 0em)[
*Optional: same base counts, different order · 4 minutes.* Compare *CGC* and *GCC*. Both have two C bases and one G base. Use initial probabilities $P(X_1=C)=P(X_1=G)=1/4$ and
$ T_(C G)=0.40, quad T_(G C)=0.20, quad T_(C C)=0.30. $
Calculate the probability of *GCC*, and compare it with your probability of *CGC* from Q2. If you skipped Q2, calculate both here. Explain what this shows about the claim “base counts alone determine a string's probability.”

For contrast, a model that draws each base *independently* with probability $1/4$ gives either string probability $(1/4)^3$. Explain briefly what information the Markov model uses that this independent-base model omits.

*Optional hint:* write the two adjacent pairs in each string before choosing factors. Keep the initial-base probability in both calculations.
]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.2 Probability Densities, Eqs.2.23–2.25, PDF p.52 / printed p.32. Tutor logarithmic density-area refresher; set 35 density/prediction clarification and set 32 logarithmic-integration recall. Not a numbered Bishop exercise.]
#question(space: 3.5in, gap: 0em)[
*Calculus finish: density weights an interval · 2–4 minutes.* A continuous quantity $U$ has the normalized density
$ p_U(u)=1/((1+u) ln 2), quad 0 <= u <= 1, $
and density zero outside that interval. This is a probability density, not a model's predicted value. There is no predictor in this question.

Calculate the probability $P(0 <= U <= 1/2)$ by integrating the density over that interval. Give an exact expression using natural logarithms, show the bounds, and check that your answer is between 0 and 1.

*Optional hint:* an antiderivative of $1/(1+u)$ is $ln(1+u)$. The factor $1/ln 2$ is constant.
]
]
