#import "/design.typ": *
#show: sheet.with(day: 16, topic: "yes/no outcomes, logistic regression")

#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })
#let line-row(lab, room) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
  align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
  block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft))

#let sig-plot = {
  let w = 2.3in
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
    place(curve(stroke: 1.4pt + accent, curve.move(pts.at(0)), ..pts.slice(1).map(p => curve.line(p))))
    place(dx: px(0) - 3pt, dy: py(0.5) - 3pt, circle(radius: 3pt, fill: pop))
    place(dx: w + 4pt, dy: py(1) - 5pt, text(size: 8pt, fill: muted)[1])
    place(dx: w + 4pt, dy: py(0.5) - 5pt, text(size: 8pt, fill: muted)[½])
    place(dx: w + 4pt, dy: py(0) - 5pt, text(size: 8pt, fill: muted)[0])
    place(dx: px(-6), dy: ht + 4pt, text(size: 8pt, fill: muted)[$z = -6$])
    place(dx: px(0) - 8pt, dy: ht + 4pt, text(size: 8pt, fill: muted)[$z = 0$])
    place(dx: px(6) - 22pt, dy: ht + 4pt, text(size: 8pt, fill: muted)[$z = 6$])
  })
}

#cover(
  day: 16,
  title: [Yes or no],
  subtitle: [Not everything we measure is a number on a line. Is there a ChIP peak at this site, yes or no? A straight line can't answer that, it happily predicts 1.4 or $-0.3$. Today we squash the line into a probability, swap the bell curve for a coin flip, and see which loss comes out.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([squash with sigmoid], [coin-flip noise], [take ln], [loss]),
  now: 0,
)

#define[The sigmoid][
  #grid(columns: (1fr, auto), column-gutter: 10pt, align: (top, horizon),
    [Takes any number $z$ and squashes it between 0 and 1:
      $ g(z) = 1 / (1 + e^(-z)). $
      Big positive $z$ gives almost 1, big negative $z$ gives almost 0, and $g(0) = 1/2$ (the dot). Logistic regression puts the old line inside it: $h = g(theta^T x)$, and reads $h$ as the probability that $y = 1$.],
    sig-plot)]

#define[Coin-flip noise (Bernoulli)][Day 15's noise was a bell curve around the line. Here the outcome is 1 or 0, so the noise is a biased coin: $y = 1$ with probability $h$, and $y = 0$ with probability $1 - h$. Both cases fit in one line:
  $ p(y) = h^y (1 - h)^(1 - y). $
  Check: with $y = 1$ the second factor is $(1-h)^0 = 1$, so $p = h$. With $y = 0$ you get $1 - h$.]

#define[Log rules, one new][$ln(a b) = ln a + ln b$ and $ln(e^u) = u$ from day 15, and the new one: a power comes down in front, $ln(a^k) = k ln a$. Example: $ln(0.5^3) = 3 ln 0.5$.]
#source[CS229 | §2.1 logistic regression | PDF p. 21-23 | printed p. 20-22]
#pagebreak()

#task(kind: "fix", minutes: 3, title: [Where the ½ lives],
  src: [CS229 | §1.3 | PDF p. 16-17 | day 15 | made-up numbers])[
  On day 15 a $1/2$ ended up in front of the whole likelihood instead of inside each exponent. Two quick ones to see why the spot matters.
  #ask[Work out $ln(e^(-9\/2))$ and $ln(1/2 dot e^(-9))$. They look alike. Are they the same number? ($ln 2 approx 0.69$.)]
  #work(1.5in)
  #ask[Day 15's bell curve with $sigma = 1$ gave each data point $c dot e^(-epsilon^2 \/ 2)$. Ignoring $c$, which of your two expressions has that shape (with $epsilon = 3$)? After taking $ln$, does the $1/2$ multiply the squared miss, or does it turn into a separate $-ln 2$?]
  #work(1.4in)
]
#pagebreak()

#task(kind: "see", minutes: 4, title: [Motif score to binding],
  src: [CS229 | §2.1 | PDF p. 21-22 | printed p. 20-21 | made-up TF sites])[
  A transcription factor binds some sites and not others. For each site you have its motif match score $x$, and $y = 1$ if ChIP-seq shows a peak there. A fitted model has $theta_0 = -4$ and $theta_1 = 2$, so $z = -4 + 2x$ and $h = g(z)$. Use $e^4 approx 55$, $e^(-4) approx 1/55$ and $e^0 = 1$.
  #ask[Fill in the table. Fractions are fine.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (1.0in, 1.3in, 1.9in),
      rows: (0.45in, 0.55in, 0.55in, 0.55in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x > 0 and y > 0 { tint } else { none },
      [motif score $x$], [$z = -4 + 2x$], [$h = 1 \/ (1 + e^(-z))$],
      [0], [], [],
      [2], [], [],
      [4], [], [],
    )
  })
  #ask[If you skipped the sigmoid and used the plain line $h = z$, what would it predict at $x = 4$? Why is that no good as a probability?]
  #work(1.3in)
]
#pagebreak()

#task(kind: "do", minutes: 7, title: [The loss falls out, again],
  src: [CS229 | §2.1, eq. 2.1 | PDF p. 23 | printed p. 22 | made-up sites])[
  Three sites. The model gives each one a probability of binding $h$, and ChIP gives the real answer $y$.
  #ask[First with numbers. Fill in $p(y) = h^y (1 - h)^(1 - y)$ for each site.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (0.7in, 0.9in, 0.9in, 2.2in),
      rows: (0.42in, 0.36in, 0.36in, 0.36in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x == 3 and y > 0 { tint } else { none },
      [site], [model's $h$], [peak? $y$], [$p(y)$, the probability the model gave the real answer],
      [1], [0.9], [1], [],
      [2], [0.2], [0], [],
      [3], [0.6], [1], [],
    )
  })
  #ask[The sites are independent, so $L$ is the product of your three $p(y)$'s. Write $ln L$ as a sum of three logs. Then add them up, using $ln 0.9 approx -0.11$, $ln 0.8 approx -0.22$, $ln 0.6 approx -0.51$.]
  #work(1.1in)
  #ask[Now the same steps with letters. Take $ln$ of $h^y (1 - h)^(1 - y)$ using both log rules. Plug in $y = 1$, $h = 0.9$ to check you get $ln 0.9$.]
  #work(1.0in)
  #ask[Summed over all $n$ sites, that gives $ln L(theta)$. We push $ln L$ up. The loss is $-ln L$, so which way do we push the loss? And which day 10 loss is it?]
  #work(0.8in)
]
#pagebreak()

#task(kind: "use", minutes: 4, title: [A label you can't trust],
  src: [CS229 | §2.1 | PDF p. 22-23 | printed p. 21-22 | made-up sites])[
  #ask[Site 4 was recorded as no peak ($y = 0$), but its motif is near perfect and the model says $h = 0.99$. Your labmate thinks the ChIP failed there. What is this site's loss, $-ln(1 - h)$? Compare it with a site the model gets right just as confidently, loss $-ln 0.99 approx 0.01$. ($ln 0.01 approx -4.6$.)]
  #work(0.95in)
  #ask[If the model got even surer, $h = 0.9999$, what happens to that loss? Is there a ceiling on it as $h$ gets closer to 1? Day 15's bell curve scored a huge miss of 12 as 72. Which loss panics more about one bad label?]
  #work(0.95in)
  Your motif scores $x$ come from the sequence and the peaks $y$ come from the lab. $theta$ comes from fitting. Your fitted $theta$ wobbles a little with new data, but there is one true $theta$ behind it.
  #ask[Your labmate reruns ChIP on the same sites. Which of $x$ and $y$ could come out different? Does the true $theta$ change?]
  #work(0.95in)
]
#pagebreak()

#kicker(color: accent)[Write the model, 4 min]
#v(2pt)
#text(size: 9.5pt, fill: muted)[Logistic regression for the TF sites. $h$ is the model's probability of a peak, $y$ is what ChIP showed.]
#v(4pt)
#stack(spacing: 7pt,
  line-row([what we observe (both parts)], 0.6in),
  line-row([what the model outputs for one site], 0.6in),
  line-row([noise model], 0.65in),
  line-row([likelihood of one site], 0.7in),
  line-row([the loss, and why it's that loss], 0.75in),
  line-row([what we fit, and which way we push the loss], 0.6in),
  line-row([say it to a biologist (mention the coin flip)], 0.85in),
)

#next-up(17)[No formula for the best $theta$ this time, so we step downhill. The gradient of this loss turns out to be (miss) × $x$, the same shape as least squares.]
