#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#let trans = $T=mat(0.8,0.2;0.3,0.7)$
#sheet(title: "Markov chains + HMM preview", set_label: "Markov side quest")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
*About 22 minutes; 26 with optional Q5. Stop at 30.*

Reading 6 min · Q1 2 min · Q2 4 min · Q3 6 min · Q4 4 min · optional Q5 4 min. Reading time includes the HMM page.

*A model for neighbouring genomic windows · read for 3 minutes*

Let $S_t$ be the state of window $t$: $N$ = normal copy number, $D$ = deletion. For Q1–Q4, imagine the states are known without error. These are invented teaching probabilities, not fitted biological values.

A *first-order Markov assumption* says that, given the current state, earlier states add no information about the next one:
$ P(S_(t+1) | S_t, S_(t-1), dots)=P(S_(t+1) | S_t). $
This is conditional independence, not independence of neighbouring states. We also assume *time-homogeneity*: the same transition probabilities apply at each equally spaced window.

#table(columns: (1.5fr,1fr,1fr), inset: 6pt, stroke: 0.5pt,
  [*From ↓ / to →*], [*$N$*], [*$D$*],
  [*$N$*], [0.8], [0.2],
  [*$D$*], [0.3], [0.7])

The table is a transition matrix $T$: entry $T_(i j)=P(S_(t+1)=j | S_t=i)$. Each row sums to 1. Multiply conditional probabilities along a specified path; add probabilities of mutually exclusive alternative paths. This uses Bishop's familiar product and sum rules.

#source[Durbin et al., _Biological Sequence Analysis_ · §3.1 Markov chains, PDF p.58 / printed p.48. Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor copy-number adaptation; no numbered book exercise.]
#question(space: 0.65in, gap: 0em)[
*Read the model · 2 minutes.* You know $S_4=D$ and all earlier states were $N$. What is $P(S_5=N | S_4=D,S_3=N,S_2=N,S_1=N)$? Give the probability and one sentence explaining which history matters under this model.
]

#pagebreak()
#source[Durbin et al., _Biological Sequence Analysis_ · §3.1 Markov chains, Eqs.3.1–3.2, PDF p.58 / printed p.48; starting probabilities, PDF p.59 / printed p.49. Tutor application of Bishop §2.1.2, PDF pp.46–48.]
#question(space: 3.5in, gap: 0em)[
*One complete path · 4 minutes.* States are ordered $(N,D)$ and the transition matrix (rows = from, columns = to) is #trans. At the first window, $P(S_1=N)=0.6$ and $P(S_1=D)=0.4$.

Calculate the probability of the complete three-window event
$ S_1=N, quad S_2=D, quad S_3=D. $
Show and label every factor. Then calculate the probability of the final two states being $D,D$ *given* that $S_1=N$. Explain why the two probabilities differ.

*Optional hint:* an unconditional path includes its starting-state probability. A start that is already given does not need to be sampled again.
]

#pagebreak()
#source[Durbin et al., _Biological Sequence Analysis_ · §3.1 Markov chains, Eq.3.2, PDF p.58 / printed p.48. Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor two-step marginalization.]
#question(space: 3.5in, gap: 0em)[
*One endpoint, two routes · 6 minutes.* Now the start is fixed: $S_1=N$. Use #trans, with state order $(N,D)$, rows = from and columns = to.

Find $P(S_3=D | S_1=N)$. The middle state $S_2$ is unspecified. Draw or write the two possible routes, label their probabilities, and combine them.

A colleague reports only $0.8 times 0.2$. Explain in one sentence which event that expression counts and why it does not answer the whole question.

*Optional hint:* the routes are $N arrow.r N arrow.r D$ and $N arrow.r D arrow.r D$. They cannot both occur in the same three-window path.
]

#pagebreak()
#source[Durbin et al., _Biological Sequence Analysis_ · §3.1, “Using Markov chains for discrimination,” transition-count estimate Eq.3.3, PDF p.60 / printed p.50. Tutor copy-number application with invented counts.]
#question(space: 3.5in, gap: 0em)[
*Build a model from observations · 4 minutes.* A separate training dataset has known states. Among adjacent pairs, the counts are: $N arrow.r N$: 18; $N arrow.r D$: 2; $D arrow.r N$: 3; $D arrow.r D$: 7.

Estimate each transition probability as its count divided by *all departures from the same starting state*. Fill the blank matrix; check both row sums. Explain why dividing all four counts by 30 would estimate a different quantity.

#table(columns: (1.5fr,1fr,1fr), inset: 7pt, stroke: 0.5pt,
  [*From ↓ / to →*], [*$N$*], [*$D$*],
  [*$N$*], [], [], [*$D$*], [], [])

*Model assumption:* the same transition rule applies across the training windows. Treat the state labels as accurate for this exercise.
]

#pagebreak()
= When the states are hidden
*Reading · 3 minutes, already included in the session budget*

#source[Durbin et al., _Biological Sequence Analysis_ · §3.2 Hidden Markov models, “Formal definition of an HMM,” PDF p.63 / printed p.53; generative example and joint probability, PDF p.64 / printed p.54.]

*A short excerpt from your book:*

#block(inset: (left: 12pt), stroke: (left: 1pt + luma(150)))[
“The path itself follows a simple Markov chain, so the probability of a state depends only on the previous state.”
]

*Tutor explanation and genomics adaptation.* In the earlier questions, you could see whether each window was $N$ or $D$. In a real coverage-segmentation problem, you see noisy read depth. The underlying copy-number state is *hidden*. A low-depth window can come from a deletion, but normal regions can also have low depth.

An HMM separates two processes:

- *Transitions:* $P(S_(t+1) | S_t)$ describes how the hidden state changes between windows.
- *Emissions:* $P(Y_t | S_t)$ describes the observed measurement $Y_t$ at a window with state $S_t$.

To generate data, first sample the initial state, emit a measurement from that state's distribution, move to the next state, and emit again. In the standard HMM, observations are independent *conditional on the hidden state sequence*, and each emission depends only on its own state. The observed measurements need not be independent when the states are unknown.

For a *specified* two-window path and two observations, the joint probability is
$ P(s_1,s_2,y_1,y_2)=P(s_1)P(y_1 | s_1)P(s_2 | s_1)P(y_2 | s_2). $
Lower-case letters here mean particular state or observation values. If only the observations are known, add this quantity over the four possible hidden paths: $N N$, $N D$, $D N$, and $D D$. The forward algorithm organizes such sums efficiently for long sequences. Finding the single most probable complete path is a different task, handled by Viterbi.

This connects to your genotype-likelihood work: an observation can have several hidden explanations, so weight each explanation before adding. Here, transitions also connect the hidden explanations at neighbouring windows. Transition and emission probabilities are model parameters; the realised hidden state sequence is a latent variable.

*You can stop here.* Q5 is an optional first-window HMM calculation, not an algorithms exercise.

#pagebreak()
#source[Durbin et al., _Biological Sequence Analysis_ · §3.2 Hidden Markov models, emission definition Eq.3.5, PDF p.63 / printed p.53. Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 / printed pp.28–29. Tutor first-window HMM application, not a book exercise.]
#question(space: 3.5in, gap: 0em)[
*Optional HMM bridge · 4 minutes.* At the first window, $P(S_1=N)=0.8$ and $P(S_1=D)=0.2$. Record depth only as “low” or “not low.” Suppose
$ P(Y_1="low" | S_1=N)=0.1, quad P(Y_1="low" | S_1=D)=0.6. $
You observe low depth. Calculate $P(S_1=D | Y_1="low")$. Show the two prior-weighted contributions and their shared normalizing total. Does one low-depth observation establish a deletion with certainty? Explain briefly.

*Optional hint:* divide the deletion contribution by the sum of the normal and deletion contributions. At the first window there is no preceding transition to include. This is Bayes' rule applied to the first emission of an HMM.
]
]
