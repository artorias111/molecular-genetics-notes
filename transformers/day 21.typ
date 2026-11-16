#import "/design.typ": *
#show: sheet.with(day: 21, topic: "Poisson GLM, UMI counts")

#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })
#let line-row(lab, room) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
  align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
  block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft))

#cover(
  day: 21,
  title: [A GLM for counts],
  subtitle: [Your guess on day 20 was Poisson, so let's build it. UMI counts for one gene across cells are whole numbers, never negative, and mostly small. None of the three noise models so far makes a count with no upper limit. The Poisson does, and it's in the same family, so the recipe and the gradient carry straight over.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([what is $y$], [noise model], [$-ln p$], [loss]),
  now: 1,
)

#define[The Poisson][A count $y = 0, 1, 2, dots$ with average $lambda$ ("lambda") has
  $ p(y) = (lambda^y e^(-lambda)) / (y!) . $
  - $lambda$ is the average count, the thing the model predicts. $y!$ is $1 times 2 times dots times y$, and $0! = 1$.
  - Tiny example, $lambda = 1$: $p(0) = e^(-1) approx 0.37$, $p(1) = 1 times e^(-1) \/ 1 approx 0.37$, and $p(2) = e^(-1) \/ 2$, about 0.18.
  - It assumes the spread of the counts matches their average (variance $= lambda$). Real UMI counts are often more spread out than that, which is why your negative binomial guess was a good one. That's day 23.]

#define[Response function][In a GLM the model gives you $eta = theta^T x$. The *response function* turns $eta$ into the mean of $y$, which is what the model predicts. It's a function, not a distribution.
  - Gaussian (a distribution): response function is "do nothing", $mu = eta$.
  - Bernoulli (a distribution): response function is the sigmoid, $phi = 1 \/ (1 + e^(-eta))$.]
#source[CS229 | §3.1 (Poisson named, PDF p. 32), §3.2 Constructing GLMs, §3.2.2 response function | PDF p. 32-34 (printed 31-33)]
#pagebreak()

#task(kind: "fix", minutes: 4, title: [Finishing the slope from day 20],
  src: [CS229 | §3.1-3.2 | PDF p. 31-34 | day 20 task 4 | made-up numbers])[
  On day 20 you found the slope of the loss with respect to $eta$, $a'(eta) - y$. Today we take it all the way to a number.
  #ask[A CpG read, coin flip noise model, where $a'(eta)$ is the sigmoid, $1 \/ (1 + e^(-eta))$. The model has $eta approx 1.10$ for this CpG (use $e^(-1.10) approx 1\/3$). The read came back unmethylated, $y = 0$. What is $a'(eta)$, and what is $a'(eta) - y$?]
  #work(0.85in)
  #ask[Gradient descent moves $eta$ the opposite way to the slope. So does $eta$ go up or down here, and does the predicted chance of methylation go up or down? Does that make sense for a read that came back unmethylated?]
  #work(0.85in)
  #ask[In (a), which one is the Bernoulli and which one is the sigmoid: the coin flip that makes $y$, or the function $1 \/ (1 + e^(-eta))$?]
  #work(0.85in)
]
#pagebreak()

#task(kind: "see", minutes: 4, title: [What Poisson counts look like],
  src: [CS229 | §3.1 | PDF p. 32 | tutor application, UMI counts | made-up gene])[
  A monocyte gene, with an average of $lambda = 2$ UMIs per cell. Use $e^(-2) approx 0.135$.
  #ask[What are $p(0)$, $p(1)$ and $p(2)$? Fill in the table.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (1.5in, 1.0in, 1.0in, 1.0in),
      rows: (0.5in, 0.6in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x >= 1 and y > 0 { tint } else { none },
      [UMI count $y$], [0], [1], [2],
      [chance $p(y)$, from $(2^y times 0.135) \/ y!$], [], [], [],
    )
  })
  #v(6pt)
  #ask[Now a low gene, $lambda = 0.3$. A Gaussian with mean 0.3 and variance 0.3 (the same spread as this Poisson) gives a fair chance to $y = -0.5$. Name two things wrong with that for UMI counts.]
  #work(1.5in)
]
#pagebreak()

#task(kind: "do", minutes: 6, title: [Putting the Poisson in the family],
  src: [CS229 | §3.1 | PDF p. 30-32 | tutor derivation, CS229 leaves it to the problem set | made-up numbers])[
  Day 20's form was $p(y) = b(y) exp(eta y - a(eta))$. Taking $ln$ of both sides, that's $ln p(y) = ln b(y) + eta y - a(eta)$.
  #ask[With numbers first, $lambda = 2$ and $y = 3$. Work out $p(3) = (2^3 times 0.135) \/ 3!$. Then work out $3 ln 2 - 2 - ln 6$ (use $ln 2 approx 0.69$, $ln 6 approx 1.79$), and check it against $ln$ of your $p(3)$, using $e^(-1.72) approx 0.18$.]
  #work(1.1in)
  #ask[Same thing with letters. Take $ln$ of $(lambda^y e^(-lambda)) \/ y!$. Steps: (1) $ln$ of a product is a sum of $ln$'s, $ln$ of a division is a minus; (2) $ln lambda^y = y ln lambda$ and $ln e^(-lambda) = -lambda$; (3) match your answer to $ln b(y) + eta y - a(eta)$. What are $eta$, $a(eta)$ (write it with $eta$) and $b(y)$?]
  #work(1.5in)
  #ask[Solve your $eta$ for $lambda$. That's the Poisson's response function. Why is it a good shape for predicting a count, whatever $theta^T x$ comes out to?]
  #work(0.8in)
]
#pagebreak()

#task(kind: "use", minutes: 5, title: [One cell, one gradient step],
  src: [CS229 | §3.2 | PDF p. 32-34 | tutor application, UMI counts | made-up cell])[
  The model is $lambda = e^eta$ with $eta = theta_0 + theta_1 x_1$, where $x_1 = 1$ if the cell is a monocyte and 0 if not. Weights $theta = (theta_0, theta_1) = (0, 0.69)$. One monocyte shows $y = 5$ UMIs.
  #ask[With the Poisson's $a(eta) = e^eta$ from task 3, what is $a'(eta)$, and what does the slope $a'(eta) - y$ become in words?]
  #work(0.7in)
  #ask[For this monocyte, what are $eta$ and the predicted count $lambda$? (Use $e^(0.69) approx 2$.) What's your slope from (a) for this cell?]
  #work(0.85in)
  #ask[The gradient for $(theta_0, theta_1)$ is $(lambda - y) times (1, x_1)$. Take one step with step size 0.1, new $theta$ = old $theta$ $-$ $0.1 times$ gradient. Does the predicted count for monocytes go up or down?]
  #work(1.0in)
]
#v(4pt)
#kicker(color: accent)[Write the model, one line today, 2 min]
#v(2pt)
#line-row([Loss and why: what is the loss for one cell here, written with $lambda$ and $y$, and why that loss and not least squares?], 0.85in)

#next-up(22)[Choosing a loss on purpose. Normalizing and log1p on scRNA counts, read as a choice of noise model.]
