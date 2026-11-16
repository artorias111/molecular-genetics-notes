#import "/design.typ": *
#show: sheet.with(day: 20, topic: "exponential family, noise model to loss")

#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })
#let line-row(lab, room) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
  align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
  block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft))

#cover(
  day: 20,
  title: [Same family, same gradient],
  subtitle: [Least squares, logistic regression and softmax all ended with a gradient of (predicted − real) × $x$. That's not luck. The Gaussian, the coin flip and the categorical are cousins, written in one shared form, and the gradient falls out of that form. Today is mostly about the recipe that takes you from "what kind of thing is $y$" to the loss.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([what is $y$], [noise model], [$-ln p$], [loss]),
  now: 1,
)

#define[The recipe][
  + What kind of thing is $y$? Peak or no peak is yes/no, a read count is a count, an expression level is a number with bell-shaped noise.
  + Pick the distribution that makes that kind of $y$, the *noise model*. Yes/no is a coin flip (Bernoulli), a number with bell noise is a Gaussian, one of several classes is a categorical.
  + The loss is $-ln$ of the probability that distribution gives the real $y$. Coin flip gives binary cross-entropy, Gaussian gives least squares (day 15), categorical gives cross-entropy (day 18).]

#define[The exponential family][A distribution is in this family if you can write it as
  $ p(y) = b(y) exp(eta y - a(eta)). $
  - $eta$ ("eta") is the *natural parameter*, the knob. In a GLM, $eta = theta^T x$.
  - $b(y)$ only has $y$ in it, and $a(eta)$ only has $eta$. $a$ is there to make the probabilities add to 1.
  - Tiny example, the Gaussian with $sigma = 1$: $eta = mu$, $a(eta) = eta^2 \/ 2$.]
#source[CS229 | §3.1 The exponential family | PDF p. 30-32 (printed 29-31) | recipe §3.2 PDF p. 32-33]
#pagebreak()

#task(kind: "fix", minutes: 4, title: [Three small things from day 19],
  src: [CS229 | §2.1, §2.3 | PDF p. 22-27 | day 19 | made-up numbers])[
  Use $ln 2 approx 0.69$, $ln 3 approx 1.10$, $ln 5 approx 1.61$.
  #ask[Is $ln(2 + 3)$ the same as $ln 2 + ln 3$? Work out both. (Which one is $ln(2 times 3)$?)]
  #work(0.85in)
  #ask[The sigmoid is $g(z) = 1 \/ (1 + e^(-z))$, and its slope is $g(z)(1 - g(z))$. At $z = 0$, what's the value of $g$, and what's its slope?]
  #work(0.85in)
  #ask[Weights $theta = (theta_0, theta_1) = (-1, 0.5)$, and a site with motif score $x_1 = 4$. What is $z = theta_0 + theta_1 x_1$ for this site? It's one number. Is the chance of a peak above or below ½?]
  #work(0.85in)
]
#pagebreak()

#task(kind: "see", minutes: 3, title: [Kind of y, noise model, loss],
  src: [CS229 | §3.1-3.2 | PDF p. 30-33 | days 15, 16, 18 | made-up examples])[
  #ask[Fill in the table. Pick from: Bernoulli, Gaussian, categorical for the noise model, and least squares, binary cross-entropy, cross-entropy (softmax) for the loss.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (2.0in, 1.25in, 1.25in),
      rows: (0.45in, 0.55in, 0.55in, 0.55in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x >= 1 and y > 0 { tint } else { none },
      [what $y$ is], [noise model, from the list], [loss, from the list],
      [peak or no peak at a TF site], [], [],
      [promoter, enhancer or background], [], [],
      [log expression of a gene, bell-shaped noise around the model's guess], [], [],
    )
  })
  #ask[The loss is $-ln$(chance the model gave the real $y$). What's the loss if the model gave the real $y$ a chance of 1? Of 0.01? (Use $ln 0.01 approx -4.6$.)]
  #work(0.85in)
]
#pagebreak()

#task(kind: "do", minutes: 6, title: [Where the sigmoid comes from],
  src: [CS229 | §3.1 | PDF p. 31 | printed p. 30 | made-up site])[
  Switching from TF sites for a bit. A read at a CpG is methylated or not, a coin flip with chance $phi$ of methylated, $p(y) = phi^y (1 - phi)^(1 - y)$, can be rewritten (CS229 does the algebra) as
  $ p(y) = exp(y ln(phi / (1 - phi)) + ln(1 - phi)). $
  Match it to $b(y) exp(eta y - a(eta))$ and you get $eta = ln(phi \/ (1 - phi))$, the *log-odds*.
  #ask[With numbers first. A CpG has $phi = 0.8$. What is $eta$? (Use $ln 4 approx 1.39$.) Then go back the other way, put $eta$ into the sigmoid, $1 \/ (1 + e^(-eta))$, with $e^(-1.39) approx 0.25$. Do you get 0.8 back?]
  #work(1.1in)
  #ask[Same thing with letters, solve $eta = ln(phi \/ (1 - phi))$ for $phi$. Steps: (1) take $e$ of both sides; (2) multiply out the $(1 - phi)$; (3) get all the $phi$ terms on one side and pull $phi$ out; (4) divide, then divide top and bottom by $e^eta$.]
  #work(1.5in)
  #ask[If you fit logistic regression on CpGs, $eta = theta^T x$. So in plain words, what does $theta^T x$ measure about a CpG?]
  #work(0.7in)
]
#pagebreak()

#task(kind: "use", minutes: 5, title: [Why it's always predicted minus real],
  src: [CS229 | §3.1-3.2 | PDF p. 31-33 | tutor derivation | no data])[
  Take $-ln$ of $b(y) exp(eta y - a(eta))$ and you get the loss for one data point,
  $ ell = -eta y + a(eta) - ln b(y). $
  #ask[What is the slope of $ell$ with respect to $eta$? Write it with $a'(eta)$ and $y$. ($b(y)$ doesn't move with $eta$.)]
  #work(0.6in)
  #ask[Your slope should be $a'(eta) - y$. Gaussian, $a(eta) = eta^2 \/ 2$ and $eta = mu$. What is $a'(eta)$, and what does your slope become?]
  #work(0.7in)
  #ask[Coin flip, $a(eta) = ln(1 + e^eta)$. Find $a'(eta)$ with the $ln u$ rule (slope is $1 \/ u$ times the slope of $u$). Which function from day 16 is it? So what does your slope become? (Since $eta = theta^T x$, the chain rule then multiplies by $x$, which is the (predicted − real) × $x$ you've seen since day 12.)]
  #work(1.1in)
]
#v(4pt)
#kicker(color: accent)[Write the model, one line today, 2 min]
#v(2pt)
#line-row([UMI counts of one gene per cell: what kind of $y$, and which noise model would you guess? (None of today's three fits counts, so a guess or "not sure, a count one" is fine.)], 0.8in)

#next-up(21)[A GLM for counts, a new noise model, $eta = theta^T x$, and the gradient is (predicted − real) × $x$ one more time.]
