#import "/design.typ": *
#show: sheet.with(day: 17, topic: "the logistic gradient, (h - y) x")

#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })
#let line-row(lab, room) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
  align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
  block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft))

#let sig-plot = {
  let w = 2.6in
  let ht = 1.0in
  let px(z) = (z + 6) / 12 * w
  let py(g) = ht - g * ht
  let pts = range(0, 61).map(i => {
    let z = -6 + i * 0.2
    (px(z), py(1 / (1 + calc.exp(-z))))
  })
  box(width: w + 0.3in, height: ht + 0.3in, {
    place(line(start: (0pt, py(0)), end: (w, py(0)), stroke: 0.5pt + line-c))
    place(line(start: (0pt, py(1)), end: (w, py(1)), stroke: (paint: line-c, thickness: 0.5pt, dash: "dashed")))
    place(line(start: (0pt, py(0.5)), end: (w, py(0.5)), stroke: (paint: line-c, thickness: 0.5pt, dash: "dotted")))
    place(line(start: (px(0), 0pt), end: (px(0), ht), stroke: 0.5pt + line-c))
    place(dx: w + 4pt, dy: py(0.5) - 5pt, text(size: 8pt, fill: muted)[½])
    place(dx: 2pt, dy: 0pt, text(size: 8pt, fill: muted)[$h = g(z)$])
    place(curve(stroke: 1.4pt + accent, curve.move(pts.at(0)), ..pts.slice(1).map(p => curve.line(p))))
    place(dx: w + 4pt, dy: py(1) - 5pt, text(size: 8pt, fill: muted)[1])
    place(dx: w + 4pt, dy: py(0) - 5pt, text(size: 8pt, fill: muted)[0])
    place(dx: px(-6), dy: ht + 4pt, text(size: 8pt, fill: muted)[$z = -6$])
    place(dx: px(0) - 8pt, dy: ht + 4pt, text(size: 8pt, fill: muted)[$z = 0$])
    place(dx: px(6) - 22pt, dy: ht + 4pt, text(size: 8pt, fill: muted)[$z = 6$])
  })
}

#cover(
  day: 17,
  title: [Downhill without a formula],
  subtitle: [For least squares we had a formula for the best $theta$. For logistic regression there isn't one, so we walk downhill instead, which means we need the slope of the loss. It comes out as (miss) × $x$, same shape as day 12, and today we see why.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([loss], [chain rule], [$(h - y) x$], [one step]),
  now: 2,
)

#define[The loss for one site][From day 16, with $h = g(z)$ and $z = theta^T x$:
  $ ell = -[y ln h + (1 - y) ln(1 - h)]. $
  To see how $ell$ changes when we nudge $theta_j$, the chain rule splits it into three pieces: how $ell$ changes with $h$, how $h$ changes with $z$, and how $z$ changes with $theta_j$.
  $ (partial ell) / (partial theta_j) = (partial ell) / (partial h) dot (partial h) / (partial z) dot (partial z) / (partial theta_j). $]

#define[Three slopes you need][
  - $ln$: the slope of $ln h$ is $1 / h$, and the slope of $ln(1 - h)$ is $-1 / (1 - h)$ (the minus comes from the inside, $1 - h$).
  - Sigmoid: its slope has a neat form, $g'(z) = g(z)(1 - g(z))$, so $partial h \/ partial z = h(1 - h)$. At $z = 0$, $h = 1/2$ and the slope is $1/4$.
  - The line: $z = theta_0 x_0 + theta_1 x_1$, so nudging $theta_1$ moves $z$ by $x_1$. We keep $x_0 = 1$ for the intercept.]

#define[Downhill][Gradient descent on the loss: $theta := theta - alpha nabla ell$, with step size $alpha$. CS229 climbs $ln L$ instead, $theta := theta + alpha nabla ln L$, which is the same move.]
#source[CS229 | §2.1 | sigmoid slope PDF p. 22 (printed 21), eq. 2.2 PDF p. 23 (printed 22), update PDF p. 24 (printed 23)]
#pagebreak()

#task(kind: "fix", minutes: 4, title: [Two old snags],
  src: [CS229 | §2.1 | PDF p. 22 | day 16 | made-up numbers])[
  On day 16 the minus in $e^(-z)$ got lost when $z$ was negative. Take it slow here. Use $e^2 approx 7.4$ and $e^(-2) approx 0.14$.
  #ask[At $z = -2$, what is $-z$? Use it to get $e^(-z)$, then $g(-2) = 1 \/ (1 + e^(-z))$. A fraction is fine.]
  #work(1.2in)
  #ask[Now $g(2)$. Which of your two answers is closer to 0? Does that fit "negative $z$ gives a small $h$"?]
  #work(1.2in)
  You fit the motif model on two ChIP replicates of the same sites. Replicate 1 gives $theta_1 = 1.9$, replicate 2 gives $theta_1 = 2.1$. The motif scores are the same, only the peaks differed a bit.
  #ask[Can either replicate tell you the true $theta_1$ exactly? Why not?]
  #work(0.9in)
]
#pagebreak()

#task(kind: "see", minutes: 3, title: [Where the sigmoid is steep],
  src: [CS229 | §2.1 | PDF p. 22 | printed p. 21 | made-up numbers])[
  #align(center, sig-plot)
  #ask[Just by looking at the curve, where is it steepest, and where is it nearly flat?]
  #work(0.85in)
  #ask[Fill in the slope $h(1 - h)$ for each $h$.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (1.1in, 1.1in, 2.1in),
      rows: (0.45in, 0.5in, 0.5in, 0.5in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x == 2 and y > 0 { tint } else { none },
      [model's $h$], [$1 - h$], [slope $partial h \/ partial z$, $h$ times $1 - h$],
      [0.5], [0.5], [],
      [0.9], [0.1], [],
      [0.1], [0.9], [],
    )
  })
  #ask[Does your table agree with what you said in (a)? Where on the curve is $h = 0.5$?]
  #work(0.85in)
]
#pagebreak()

#task(kind: "do", minutes: 7, title: [The gradient falls out],
  src: [CS229 | §2.1, eq. 2.2 | PDF p. 23 | printed p. 22 | made-up site])[
  One TF site with a peak, $y = 1$. Its features are $x = (x_0, x_1) = (1, 2)$, intercept and motif score. The model currently says $h = 0.9$.
  #ask[First with numbers. Fill in each piece of the chain rule for $theta_1$, then multiply them. Keep $-1 \/ 0.9$ as $-10 \/ 9$, it cancels nicely.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (1.25in, 2.0in, 1.25in),
      rows: (0.45in, 0.5in, 0.5in, 0.5in, 0.5in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x == 2 and y > 0 { tint } else { none },
      [piece], [what it is, from the primer], [number for this site],
      [$partial ell \/ partial h$], [$-y \/ h + (1 - y) \/ (1 - h)$], [],
      [$partial h \/ partial z$], [$h(1 - h)$], [],
      [$partial z \/ partial theta_1$], [$x_1$], [],
      [product], [the three numbers multiplied], [],
    )
  })
  #ask[Now work out the miss times the feature, $(h - y) x_1$. Does it match your product?]
  #work(0.8in)
  #ask[Same steps with letters. Multiply $-y \/ h + (1 - y) \/ (1 - h)$ by $h(1 - h)$. Each fraction loses its bottom. Expand and tidy until you get $h - y$.]
  #work(1.5in)
]
#pagebreak()

#task(kind: "use", minutes: 4, title: [The bad label, one step later],
  src: [CS229 | §2.1 | PDF p. 23-24 | printed p. 22-23 | made-up sites])[
  A suspicious site like day 16's: near-perfect motif, labelled no peak, $y = 0$. Use day 16's fitted model, $theta = (-4, 2)$, and motif score 4, so $x = (1, 4)$, $z = 4$ and $h = 55 \/ 56$ (from day 16's table). Call $h - y$ just 1. The gradient of this site's loss is $(h - y) x$, and the step size is $alpha = 0.1$.
  #ask[Take one downhill step, $theta := theta - alpha (h - y) x$. What is the new $theta = (theta_0, theta_1)$?]
  #work(0.9in)
  #ask[$theta_1$ is the weight on motif score. Which way did it move, and what does that do to the link between motif and binding? If the ChIP really failed at this site, is that what you want?]
  #work(0.9in)
  #ask[Day 16 said this loss has no ceiling. But how big can $h - y$ ever be? Least squares pushes with miss × $x$, and a miss of 12 pushes 12 times as hard as a miss of 1. Which one lets a single bad site shove $theta$ harder in one step?]
  #work(0.85in)
]
#v(4pt)
#kicker(color: accent)[Write the model, one line today, 2 min]
#v(2pt)
#line-row([say $theta := theta - alpha (h - y) x$ to a biologist, with a TF site], 0.8in)

#next-up(18)[More than two outcomes. Softmax regression, where the gradient turns out to be $p - y$, same pattern again.]
