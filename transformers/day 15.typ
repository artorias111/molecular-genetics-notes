#import "/design.typ": *
#show: sheet.with(day: 15, topic: "least squares as max likelihood")

#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })
#let line-row(lab, room, body: none) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
  align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
  if body == none { block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft) }
  else { block(width: 100%, inset: 6pt, radius: 4pt, fill: tint, text(size: 9.5pt, body)) })

#cover(
  day: 15,
  title: [Why squared error?],
  subtitle: [We've been minimizing $1/2 sum ("guess" - "measured")^2$ because it worked. Today we see where it comes from: assume the noise is a bell curve, ask which $theta$ makes the data most likely, and squared error falls out, $1/2$ and all.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([bell-curve noise], [likelihood], [take ln], [max $L$ = min $J$]),
  now: 1,
)

#define[The noise, as a bell curve][Our model says $y^((i)) = theta^T x^((i)) + epsilon^((i))$. The $epsilon$ is random: every measurement gets its own fresh draw, usually small, centered on 0, with spread $sigma$. A bell curve (Normal) with mean 0 gives a draw $epsilon$ the density
  $ p(epsilon) = 1 / (sqrt(2 pi) sigma) dot e^(-epsilon^2 \/ (2 sigma^2)). $
  The front part is just a constant that makes the area 1. Call it $c$. The exponent does the work. With $sigma = 1$: a miss of 0 gives $c e^0 = c$, a miss of 2 gives $c e^(-2)$, about 7 times smaller. Big misses are rare.]

#define[Likelihood: how probable is what we measured?][For a given $theta$, the miss on data point $i$ is $epsilon^((i)) = y^((i)) - theta^T x^((i))$. Plug it into the bell and you get how likely that measurement was. The data points are independent, so the likelihood of all of them is the product:
  $ L(theta) = product_(i=1)^n c dot e^(-(y^((i)) - theta^T x^((i)))^2 \/ (2 sigma^2)). $
  *Maximum likelihood*: pick the $theta$ that makes $L(theta)$ as big as possible.]

#define[Two log rules][Products are messy, so take $ln$. $ln x$ gets bigger whenever $x$ gets bigger, so the best $theta$ doesn't move. Then use
  $ ln(a b) = ln a + ln b quad quad ln(e^u) = u. $
  Example: $ln(c dot e^(-3)) = ln c - 3$.]
#source[CS229 | §1.3 probabilistic interpretation | PDF p. 16-17 | printed p. 15-16]
#pagebreak()

#task(kind: "fix", minutes: 3, title: [Warm-up],
  src: [CS229 | §1.2.2 | PDF p. 16 | printed p. 15 | day 14 | made-up numbers])[
  #ask[Three wells of cells got 0, 2 and 5 µM of a drug. The model is $h = theta_0 + theta_1 x$ with $theta = (2, 1)$. Write $X$ (a column of 1's, then the doses) and compute $X theta$. What shape is it, and what does each entry stand for?]
  #work(1.3in)
  #ask[A model of log#sub[2] expression has an intercept $theta_0$ and a weight $theta_1$ on CpG count. In your data every gene has exactly 3 CpGs. Can the data tell $theta_0$ apart from $theta_1$? What would you change about the data?]
  #work(0.85in)
]
#pagebreak()

#task(kind: "see", minutes: 5, title: [One embryo, two guesses],
  src: [CS229 | §1.3 | PDF p. 16 | printed p. 15 | made-up embryo])[
  You inject a zebrafish embryo with $x = 2$ ng of GFP mRNA and measure a glow of $y = 7$. The model has no intercept, $h = theta x$, and the noise is a bell curve with $sigma = 1$, so a miss $epsilon$ has density $c dot e^(-epsilon^2 \/ 2)$. Compare two guesses, $theta_A = 3$ and $theta_B = 2$.
  #ask[Fill in the table: the guess, the miss, and the exponent part.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (0.7in, 1.15in, 1.15in, 1.5in),
      rows: (0.5in, 0.45in, 0.45in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x > 0 and y > 0 { tint } else { none },
      [$theta$], [guess $h = theta x$], [miss $epsilon = y - h$], [exponent $-epsilon^2 \/ 2$],
      [$theta_A = 3$], [], [], [],
      [$theta_B = 2$], [], [], [],
    )
  })
  #ask[Which $theta$ makes $y = 7$ more likely? How many times more likely? (The $c$'s cancel when you divide. $e^4 approx 55$.)]
  #work(1.1in)
  #ask[The miss under $theta_B$ is 3 times the miss under $theta_A$. Why is it so much more than 3 times less likely?]
  #work(0.9in)
]
#pagebreak()

#task(kind: "do", minutes: 7, title: [Squared error falls out],
  src: [CS229 | §1.3 | PDF p. 16-17 | printed p. 15-16 | day 14 cultures])[
  Back to day 14's plasmid cultures: copies $x = (1, 1, 2)$, protein $y = (1, 3, 4)$, model $h = theta x$, bell-curve noise with $sigma = 1$.
  #ask[Write the likelihood $L(theta)$ of all three cultures as a product of three terms, each $c dot e^("something")$. Keep $theta$ as a letter.]
  #work(1.3in)
  #ask[Take $ln$ and simplify with the two log rules. You should get a constant minus some number times a sum of three squares.]
  #work(1.5in)
  #ask[Day 14's loss was $J(theta) = 1/2 sum (theta x - y)^2$. Write your $ln L(theta)$ using $J$ (the order inside a square doesn't matter: $(y - theta x)^2 = (theta x - y)^2$). So which $theta$ maximizes the likelihood (day 14 already found it)? And where did the $1/2$ in $J$ come from?]
  #work(1.4in)
]
#pagebreak()

#task(kind: "use", minutes: 4, title: [What the bell curve assumes],
  src: [CS229 | §1.3 | PDF p. 17 | printed p. 16 | made-up plants])[
  #ask[Redo the $ln$ in your head with $sigma = 2$ instead of 1. What number now sits in front of $sum (theta x - y)^2$? Does the best $theta$ change? Why or why not?]
  #work(1.0in)
  #ask[One drought plant had a botched RNA prep and reads $-6$ (almost nothing) when the line predicts 6. Under a bell curve with $sigma = 1$, that miss of 12 has exponent $-12^2 \/ 2 = -72$. What does that say about how a bell curve treats a rare huge miss? And what will least squares do to the fitted line to shrink that one miss?]
  #work(1.2in)
  #ask[CS229 writes $p(y | x; theta)$ with a semicolon because $theta$ is not random. If you redid the drought study with four new plants, which of $x$, $y$, $theta$, $epsilon$ would come out different, which would you set again yourself, and which stays the same true value? Which ones do we measure?]
  #work(1.0in)
]
#pagebreak()

#kicker(color: accent)[Write the model, 4 min]
#v(2pt)
#text(size: 9.5pt, fill: muted)[The noise model row is yours now. $h$ is the guess, $y$ is what was measured.]
#v(4pt)
#stack(spacing: 7pt,
  line-row([what we observe (both parts)], 0.6in),
  line-row([what the model outputs, for all data points at once], 0.6in),
  line-row([noise model], 0.65in),
  line-row([likelihood of one data point], 0.7in),
  line-row([the loss, and why it's that loss], 0.75in),
  line-row([the best $theta$, no stepping], 0.55in),
  line-row([say it to a biologist (mention the noise)], 0.85in),
)

#next-up(16)[Yes/no outcomes. A coin-flip (Bernoulli) noise model instead of a bell curve, the sigmoid, and logistic regression.]
