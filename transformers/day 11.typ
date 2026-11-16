#import "/design.typ": *
#show: sheet.with(day: 11, topic: "linear regression notation")

#let hd(x) = text(size: 8pt, fill: accent, weight: 600, x)
#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })

#cover(
  day: 11,
  title: [Writing a model down],
  subtitle: [We're leaving sequences for a bit. Linear regression is the simplest model there is, and pretty much every model after it gets written in the same notation. So today is just that notation, on four genes.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([data $x^((i)), y^((i))$], [parameters $theta$], [prediction $h_theta (x)$], [all at once: $X theta$]),
  now: 2,
)

#define[The training set][Say we want to predict how strongly a gene is expressed from its promoter. Each gene is one *training example*. Its inputs are $x^((i))$ (the *features*, here a couple of promoter facts) and its answer is $y^((i))$ (the *target*, here log#sub[2] expression). The $(i)$ is just "gene number $i$", not a power. $n$ is the number of examples and $d$ the number of features, so $x^((i))$ is a list of $d$ numbers and $x^((i))_j$ is feature $j$ of example $i$.]

#define[The model][A linear model guesses $y$ by adding up the features with weights: $h_theta (x) = theta_0 + theta_1 x_1 + theta_2 x_2$. The $theta$'s are the *parameters*, the numbers training will pick. $theta_0$ is the intercept, the guess when every feature is 0. Small trick: pretend every example has an extra feature $x_0 = 1$. Then the intercept is just one more weight, and the whole thing is a dot product, $h_theta (x) = theta^T x$, with $theta$ and $x$ both $d + 1$ long.]

#define[The design matrix][Stack the examples as rows, each starting with its $x_0 = 1$. That's $X$, with $n$ rows and $d + 1$ columns. Then $X theta$ gives every prediction at once, one per row. Same dot product as above, done $n$ times.]
#source[CS229 | Part I intro, notation | PDF p. 7 | printed p. 6 | ch 1 intro, $h_theta (x) = theta^T x$ | PDF p. 9-10 | printed p. 8-9 | §1.2.2 design matrix | PDF p. 15 | printed p. 14]
#pagebreak()

#task(kind: "fix", minutes: 5, title: [Four quick ones from day 10],
  src: [CS229 | §2.3 | PDF p. 26-27 | printed p. 25-26 | Bishop & Bishop | §12.3.1 | PDF p. 399 | printed p. 383 | day 10])[
  The loss on day 10 came in four flavours, all built from the probability the model gave the right base. They go up a ladder: multiply the $p$'s (likelihood), add up the $-ln p$'s (negative log-likelihood), divide by the number of steps (cross-entropy), then raise $e$ to it (perplexity).

  #ask[A model reads two bases and gives the right one $1/2$ both times. Fill the ladder.]
  #{
    set text(size: 9.5pt)
    table(
      columns: (1.3in, 2.0in, 1fr),
      rows: (auto, 0.36in, 0.36in, 0.36in, 0.36in),
      align: (left + horizon, left + horizon, center + horizon),
      stroke: tbl-stroke,
      fill: (x, y) => if x == 2 and y > 0 { tint } else { none },
      table.header(hd[step on the ladder], hd[how you get it], hd[value here (use $ln 2$ where it shows up)]),
      [likelihood], [multiply the two $p$'s], [],
      [negative log-likelihood], [add up $-ln p$ for each step], [],
      [cross-entropy], [the line above $div$ number of steps], [],
      [perplexity], [$e^"cross-entropy"$], [],
    )
  }

  #ask[Attention lets each position pull in information from other positions. The MLP then works on each position on its own. Say you wanted every position's vector to depend only on its own base, never its neighbours. Which box would you delete?]
  #work(0.4in)

  #ask[A model gave the right base $p = 0.5$, so its loss there was $ln 2 approx 0.69$. After a training step, the loss on that base is $0.2$. Did $p$ go up or down? (Bonus: for small numbers $e^(-a) approx 1 - a$, so $p approx$ what?)]
  #work(0.45in)

  #ask[$p = 1\/1024 = 2^(-10)$ is about $0.001$. What's $-ln p$ there, as a multiple of $ln 2$? And what happens to $-ln p$ as $p$ goes all the way to 0?]
  #work(0.4in)
]
#pagebreak()

#task(kind: "see", minutes: 4, title: [Reading the notation],
  src: [CS229 | Part I intro | PDF p. 7 | printed p. 6 | made-up genes])[
  Four genes. $x_1$ is the number of known TF motifs in the promoter, $x_2$ is 1 if the promoter sits in a CpG island and 0 if not, and $y$ is log#sub[2] expression.
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (0.9in, 1.1in, 1.1in, 1.1in),
      align: center + horizon,
      stroke: tbl-stroke,
      table.header(hd[gene $i$], hd[$x_1$: motifs], hd[$x_2$: CpG island], hd[$y$: log#sub[2] expression]),
      [1], [2], [1], [7],
      [2], [0], [0], [1],
      [3], [3], [0], [5],
      [4], [1], [1], [5],
    )
  })

  #ask[What are $n$ and $d$ here?]
  #work(0.35in)
  #ask[Write out $x^((3))$ as a list (just the $d$ features), then $x^((3))_1$, then $y^((2))$.]
  #work(0.45in)
  #ask[Someone reads $x^((2))$ as "$x$ squared". What does it actually mean?]
  #work(0.35in)
]

#pagebreak()
#task(kind: "do", minutes: 6, title: [One set of weights, four guesses],
  src: [CS229 | ch 1 intro | PDF p. 9-10 | printed p. 8-9 | made-up weights])[
  Try $theta_0 = 1$, $theta_1 = 2$, $theta_2 = 1$, so $h_theta (x) = 1 + 2 x_1 + 1 x_2$.

  #ask[Fill in the table for all four genes.]
  #{
    set text(size: 9.5pt)
    table(
      columns: (0.6in, 2.1in, 1.1in, 1fr),
      rows: (auto, 0.36in, 0.36in, 0.36in, 0.36in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x > 0 and y > 0 { tint } else { none },
      table.header(hd[gene $i$], hd[prediction $h_theta (x^((i))) = 1 + 2 x_1 + x_2$], hd[real $y^((i))$ (from the table above)], hd[error: prediction $-$ real]),
      [1], [], [7], [],
      [2], [], [1], [],
      [3], [], [5], [],
      [4], [], [5], [],
    )
  }

  #ask[Now the $x_0 = 1$ trick for gene 3. Write $x^((3))$ as a 3-long vector starting with 1, write $theta$ as a vector, and take the dot product $theta^T x^((3))$. Same as the table?]
  #work(0.6in)
  #ask[In plain words, what does $theta_1 = 2$ say about motifs and expression? Remember $y$ is log#sub[2], so +1 means double.]
  #work(0.5in)
]


#pagebreak()
#task(kind: "use", minutes: 4, title: [All four at once],
  src: [CS229 | §1.2.2 design matrix | PDF p. 15 | printed p. 14 | made-up genes])[
  #ask[Fill in the design matrix $X$ for the four genes. One row per gene, starting with its $x_0 = 1$.]
  #align(center, blank-matrix(rows: 4, cols: 3, cw: 0.55in, ch: 0.34in,
    row-labels: ([gene 1], [gene 2], [gene 3], [gene 4]),
    col-labels: ([$x_0$], [$x_1$], [$x_2$])))

  #ask[$X$ is $4 times 3$ and $theta$ is $3 times 1$. What shape is $X theta$, and what's in it? (Shapes multiply as $(n times k)(k times m) -> (n times m)$: the outer numbers survive.)]
  #work(0.45in)
  #ask[Now a real dataset: 20,000 genes and 50 promoter features. What shape is $X$, and how many numbers does $theta$ have?]
  #work(0.45in)
]

#pagebreak()
#kicker(color: accent)[Write the model, 3 min]
#v(2pt)
#text(size: 9.5pt, fill: muted)[Same box as day 10. Two lines are filled in for you, because deriving them is day 15. What's worth noticing now is the pattern: the noise model says how $y$ gets drawn from the model's output, and the loss is what that noise model turns into.]
#{
  let line-row(lab, room, body: none) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
    align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
    if body == none { block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft) }
    else { block(width: 100%, inset: 6pt, radius: 4pt, fill: tint, text(size: 9.5pt, body)) })
  v(4pt)
  stack(spacing: 6pt,
    line-row([what we observe], 0.4in),
    line-row([what the model outputs], 0.4in),
    line-row([noise model: how $y$ is drawn], 0in, body: [$y^((i)) = theta^T x^((i)) + epsilon^((i))$, with $epsilon^((i)) tilde "Normal"(0, sigma^2)$. The real value is the prediction plus some bell-shaped noise.]),
    line-row([the loss it gives], 0in, body: [$J(theta) = 1/2 sum_(i=1)^n (h_theta (x^((i))) - y^((i)))^2$, squared error.]),
    line-row([day 10 vs today: what got drawn, from what], 0.55in),
    line-row([say it to a biologist, one sentence], 0.6in),
  )
}
#aside[On day 10 you wrote the loss as $(p_t - x)$. That kind of loss is right here, because the noise is a bell.]

#next-up(12)[Using that squared error: derivatives, and one gradient descent step on these same four genes.]
