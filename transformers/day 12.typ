#import "/design.typ": *
#show: sheet.with(day: 12, topic: "squared loss, one gradient descent step")

#let hd(x) = text(size: 8pt, fill: accent, weight: 600, x)
#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })

#cover(
  day: 12,
  title: [Walking downhill],
  subtitle: [Yesterday we guessed $theta = (1, 2, 1)$ for the four genes and it was off by a bit. Today the loss tells us which way to nudge each $theta$, and we take one step by hand.],
  minutes: [about 22 min, stop at 25],
  pipeline: ([errors $h - y$], [slope of $J$], [step $theta - alpha dot "slope"$], [smaller $J$]),
  now: 1,
)

#define[Partial derivative][When the loss depends on several $theta$'s, $(partial J) / (partial theta_1)$ asks: if I wiggle only $theta_1$ and hold the rest still, how fast does $J$ change? Tiny example: for $f = 3a + 5b$, $(partial f) / (partial a) = 3$ and $(partial f) / (partial b) = 5$. Positive slope means $J$ goes up as $theta_1$ goes up.]

#define[The slope of a squared miss][For one gene the loss is $1/2 (h - y)^2$, where $h = theta_0 x_0 + theta_1 x_1 + theta_2 x_2$. Chain rule: the outside $1/2 (dot)^2$ gives $(h - y)$, the inside gives $(partial h) / (partial theta_j) = x_j$ (every other term has no $theta_j$ in it). So
$ (partial) / (partial theta_j) 1/2 (h - y)^2 = (h - y) x_j. $
The loss over all genes is $J(theta) = 1/2 sum_i (h(x^((i))) - y^((i)))^2$ (day 11), so add these up: $(partial J) / (partial theta_j) = sum_i (h(x^((i))) - y^((i))) x^((i))_j$. Error times feature, summed.]

#define[Gradient descent][Take a small step against the slope, for every $j$ at once, using the old $theta$ for all of them:
$ theta_j := theta_j - alpha (partial J) / (partial theta_j). $
$alpha$ is the *learning rate*, how big a step. Downhill is the opposite way to the slope, hence the minus.]
#source[CS229 | §1.1 LMS algorithm | PDF p. 10-12 | printed p. 9-11]
#pagebreak()

#task(kind: "fix", minutes: 5, title: [Warm-up from day 11],
  src: [CS229 | Part I intro | PDF p. 7 | printed p. 6 | §2.3 | PDF p. 26-27 | printed p. 25-26 | made-up strains])[
  Three yeast strains. The features are how many copies of a transporter gene the strain carries, and whether it sits behind a strong promoter (1) or not (0). We want to predict growth rate.
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (0.8in, 1.1in, 1.2in, 1.1in),
      align: center + horizon,
      stroke: tbl-stroke,
      table.header(hd[strain $i$], hd[copies], hd[strong promoter], hd[growth rate]),
      [1], [2], [0], [0.4],
      [2], [1], [1], [0.7],
      [3], [3], [1], [0.9],
    )
  })
  #ask[What is $d$? Write $x^((2))$ and $y^((2))$.]
  #work(0.35in)
  #ask[A bigger screen: 500 strains, 10 features. With the $x_0 = 1$ column added, what shape is $X$, and how many numbers are in $theta$?]
  #work(0.35in)
  #ask[Say $(theta_0, theta_1, theta_2) = (0.2, 0.1, 0.3)$. What does the model predict for a strain with 0 copies and no strong promoter?]
  #work(0.3in)
  #ask[The loss on a base is $-ln p$, where $p$ is the probability the model gave the right base. $-ln 0.9 approx 0.1$ and $-ln 0.3 approx 1.2$. Training took the loss on some base from 1.2 to 0.1. Is the model now more sure or less sure of the right base?]
  #work(0.3in)
  #ask[A model gives the right base $1/2$ at each of 3 steps. What's its cross-entropy (the average loss per step) and its perplexity? A model that's always 50/50 is "choosing between" how many bases?]
  #work(0.4in)
]
#pagebreak()

#task(kind: "see", minutes: 4, title: [One knob first],
  src: [CS229 | §1.1 | PDF p. 10-11 | printed p. 9-10 | made-up gene])[
  Strip it down to one gene and one weight, no intercept: $x = 2$, $y = 6$, $h = theta x$. The loss is $J(theta) = 1/2 (2 theta - 6)^2$.
  #ask[Fill in $J$ for each $theta$.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (1.3in, 0.5in, 0.5in, 0.5in, 0.5in, 0.5in),
      rows: (0.3in, 0.36in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x > 0 and y == 1 { tint } else { none },
      [$theta$], [1], [2], [3], [4], [5],
      [$J(theta) = 1/2 (2 theta - 6)^2$], [], [], [], [], [],
    )
  })
  #ask[Which $theta$ is best? Standing at $theta = 1$, is $J$ going up or down as $theta$ grows, so is the slope there positive or negative?]
  #work(0.45in)
  #ask[The slope rule from page 1 with one weight is $(h - y) x$. Work it out at $theta = 1$. Then take one step with $alpha = 0.1$: $theta := theta - alpha dot "slope"$. Where do you land? Closer to the best $theta$?]
  #work(0.7in)
  #ask[Now stand at $theta = 5$, past the best. Is the slope there positive or negative, and which way does $theta - alpha dot "slope"$ move $theta$? So what does the minus sign do for you?]
  #work(0.45in)
]
#pagebreak()

#task(kind: "do", minutes: 6, title: [One step on the four genes],
  src: [CS229 | §1.1 Eq. 1.1 | PDF p. 11-12 | printed p. 10-11 | day 11 genes])[
  Back to day 11's genes with $theta = (1, 2, 1)$. The errors $h - y$ are already worked out (predictions 6, 1, 7, 4 against real 7, 1, 5, 5). Each column below is one $theta_j$'s slope, error times that feature, added down the column.
  #ask[Fill in the table, then the sums.]
  #{
    set text(size: 9.5pt)
    table(
      columns: (0.45in, 0.75in, 0.75in, 1fr, 1fr, 1fr),
      rows: (auto, 0.34in, 0.34in, 0.34in, 0.34in, 0.36in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x > 2 and y > 0 { tint } else { none },
      table.header(hd[gene], hd[$(x_1, x_2)$: motifs, CpG], hd[error $h - y$], hd[error $times x_0$ (always 1)], hd[error $times x_1$], hd[error $times x_2$]),
      [1], [(2, 1)], [$-1$], [], [], [],
      [2], [(0, 0)], [$0$], [], [], [],
      [3], [(3, 0)], [$+2$], [], [], [],
      [4], [(1, 1)], [$-1$], [], [], [],
      [], [], align(right, text(size: 8pt, fill: muted)[sum = slope]), [], [], [],
    )
  }
  #ask[Take the step with $alpha = 0.1$. Write the new $theta_0$, $theta_1$, $theta_2$.]
  #work(0.6in)
  #ask[Gene 2 has error 0. How much did it add to any of the slopes? Why does that make sense?]
  #work(0.4in)
]
#pagebreak()

#task(kind: "use", minutes: 4, title: [Reading the step],
  src: [CS229 | §1.1 | PDF p. 11-12 | printed p. 10-11 | made-up genes])[
  With $alpha = 0.1$ the loss $J$ goes from 3 to about 2.2 after your step. Look back at your new $theta$.
  #ask[$theta_1$ went down. Which gene pushed it down, and what was wrong with the prediction for that gene?]
  #work(0.45in)
  #ask[$theta_0$ didn't move at all. Look at the error column. Why?]
  #work(0.4in)
  #ask[The new $theta_1$ is 1.7. One extra motif now adds 1.7 to log#sub[2] expression, so expression gets multiplied by $2^1.7$. Which two whole numbers is that between? ($2^1.5 approx 2.8$)]
  #work(0.4in)
  #ask[Now try $alpha = 1$ instead. Write the new $theta$, then predict gene 3 with it. Its real $y$ is 5. Did the bigger step help?]
  #work(0.95in)
]
#pagebreak()

#kicker(color: accent)[Write the model, 3 min]
#v(2pt)
#text(size: 9.5pt, fill: muted)[Same box. The noise model stays filled in until day 15. New row: how training changes $theta$.]
#{
  let line-row(lab, room, body: none) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
    align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
    if body == none { block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft) }
    else { block(width: 100%, inset: 6pt, radius: 4pt, fill: tint, text(size: 9.5pt, body)) })
  v(4pt)
  stack(spacing: 6pt,
    line-row([what we observe (both parts)], 0.4in),
    line-row([what the model outputs], 0.4in),
    line-row([noise model: how $y$ is drawn], 0in, body: [$y^((i)) = theta^T x^((i)) + epsilon^((i))$, with $epsilon^((i)) tilde "Normal"(0, sigma^2)$.]),
    line-row([the loss it gives, in symbols], 0.45in),
    line-row([the update rule for $theta_j$], 0.5in),
    line-row([say it to a biologist, one sentence], 0.6in),
  )
}

#next-up(13)[The same slope for all of $theta$ at once, as one vector: gradients of $theta^T x$.]
