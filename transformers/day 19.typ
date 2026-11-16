#import "/design.typ": *
#show: sheet.with(day: 19, topic: "second derivatives, Hessian, one Newton step")

#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })
#let line-row(lab, room) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
  align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
  block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft))

#let bowl-plot = {
  let w = 2.6in
  let ht = 1.0in
  let px(t) = (t + 1) / 8 * w
  let py(l) = ht - l / 16 * ht
  let pts = range(0, 41).map(i => {
    let t = -1 + i * 0.2
    (px(t), py(calc.pow(t - 3, 2)))
  })
  box(width: w + 0.3in, height: ht + 0.3in, {
    place(line(start: (0pt, py(0)), end: (w, py(0)), stroke: 0.5pt + line-c))
    place(curve(stroke: 1.4pt + accent, curve.move(pts.at(0)), ..pts.slice(1).map(p => curve.line(p))))
    place(dx: px(0) - 3pt, dy: py(9) - 3pt, circle(radius: 3pt, fill: pop))
    place(dx: px(0) + 6pt, dy: py(9) - 4pt, text(size: 8pt, fill: muted)[start, $theta = 0$])
    place(dx: px(3) - 2pt, dy: ht + 4pt, text(size: 8pt, fill: muted)[3])
    place(dx: px(0) - 2pt, dy: ht + 4pt, text(size: 8pt, fill: muted)[0])
    place(dx: px(5.2), dy: 0pt, text(size: 8pt, fill: muted)[$ell = (theta - 3)^2$])
  })
}

#cover(
  day: 19,
  title: [The slope of the slope],
  subtitle: [Gradient descent only knows which way is downhill, so it takes small careful steps. If you also know how fast the slope is changing, you can guess where it hits zero and jump there. That's Newton's method, and the "how fast" part is the second derivative.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([slope], [slope of slope], [jump], [Hessian]),
  now: 2,
)

#define[Second derivative][$ell''(theta)$ is the slope of the slope. For $ell = theta^2$: $ell' = 2 theta$, and the slope of that is $ell'' = 2$. A big positive $ell''$ means a steep, narrow bowl, a small one means a wide, shallow bowl.]

#define[Newton's method][The best $theta$ sits where the slope is zero. Newton pretends the slope is a straight line near where you are, and jumps to where that line hits zero:
  $ theta := theta - (ell'(theta)) / (ell''(theta)). $
  No step size $alpha$ to pick. CS229 uses it to maximize $ln L$, and the formula is the same for a min, since both sit where the slope is zero.]

#define[The Hessian][With two weights $theta_0, theta_1$, there are four "slopes of slopes", one for each pair. They go in a 2 × 2 matrix $H$ with $H_(i j) = partial^2 ell \/ (partial theta_i partial theta_j)$. Newton becomes
  $ theta := theta - H^(-1) nabla ell. $
  $H^(-1)$ plays the part of dividing by $ell''$.]
#source[CS229 | §2.4 Another algorithm for maximizing ℓ(θ) | Newton PDF p. 28 (printed 27), Hessian PDF p. 29 (printed 28)]
#pagebreak()

#task(kind: "fix", minutes: 4, title: [Three small things from day 18],
  src: [CS229 | §2.1, §2.3 | PDF p. 22-27 | day 18 | made-up numbers])[
  Two classes, logits $(t_1, t_2) = (1, 0)$, so $S = e^1 + e^0 approx 2.7 + 1 = 3.7$. The slope of $e^t$ is $e^t$ itself, nothing in front. And the slope of $ln u$ is $1 \/ u$ times the slope of $u$.
  #ask[What is the slope of $ln S$ with respect to $t_1$? Only the $e^(t_1)$ part of $S$ moves. Is the number you get one of the softmax probabilities?]
  #work(1.0in)
  Forget the $e_y$ from day 18 (bad choice of letter, sorry). The real answer is just a list with a 1 in its class and 0s elsewhere. Classes are (promoter, enhancer, background).
  #ask[A region is really background, and the model says $p = (0.2, 0.3, 0.5)$. Write the real answer as a list of three numbers, then $p$ minus that list.]
  #work(0.9in)
  #ask[Back to one peak label, $y$ is 0 or 1. Work out $h - y$ for $(h, y) = (0.99, 0)$, $(0.01, 1)$ and $(0.5, 1)$. Can any of them get past 1 in size? (A least-squares miss could be 12.)]
  #work(0.8in)
]
#pagebreak()

#task(kind: "see", minutes: 3, title: [One jump to the bottom],
  src: [CS229 | §2.4 | PDF p. 28 | printed p. 27 | made-up bowl])[
  #align(center, bowl-plot)
  A loss shaped like a bowl, $ell = (theta - 3)^2$, so $ell' = 2(theta - 3)$. You start at $theta = 0$.
  #ask[What are $ell'(0)$ and $ell''$? (Is $ell''$ the same everywhere on this curve?)]
  #work(0.85in)
  #ask[Take one Newton step from $theta = 0$. Where do you land? Then take one gradient step instead, $theta := theta - 0.1 ell'(0)$. Which one got closer to the bottom?]
  #work(1.0in)
]
#pagebreak()

#task(kind: "do", minutes: 6, title: [Newton on one TF site],
  src: [CS229 | §2.1 eq. 2.2, §2.4 | PDF p. 23, 28 | tutor derivation | made-up site])[
  One weight, no intercept, to keep it small. A site with a peak, $y = 1$, motif score $x = 2$, start at $theta = 0$. From day 17, $ell' = (h - y) x$.
  #ask[With numbers first. Fill in the table, then take one Newton step, $theta := theta - ell' \/ ell''$.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (1.3in, 1.9in, 1.2in),
      rows: (0.38in, 0.4in, 0.4in, 0.4in, 0.4in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x == 2 and y > 0 { tint } else { none },
      [piece], [how to get it], [number here],
      [$z$], [$theta x$], [],
      [$h$], [$g(z)$, sigmoid], [],
      [$ell'$], [$(h - y) x$], [],
      [$ell''$], [$h (1 - h) x^2$], [],
    )
  })
  #work(0.55in)
  #ask[Same thing with letters, where does $h(1 - h) x^2$ come from? Take the slope of $ell' = (h - y) x$ with respect to $theta$. $y$ and $x$ don't move when $theta$ does, and from day 17 the slope of $h$ is $h(1 - h)$ times the slope of $z$.]
  #work(1.15in)
  #ask[Can $h(1 - h) x^2$ ever be negative? What does that say about the shape of this loss?]
  #work(0.7in)
]
#pagebreak()

#task(kind: "use", minutes: 5, title: [Two weights, one Newton step],
  src: [CS229 | §2.4 | PDF p. 29 | printed p. 28 | made-up sites])[
  Now intercept and motif weight, $theta = (theta_0, theta_1)$, starting at $(0, 0)$. Two sites: A has no motif and no peak, B has motif score 2 and a peak. At the start, the gradient and the Hessian, each summed over both sites (I've done the sums for you), are
  $ nabla ell = vec(0, -1), quad H = mat(0.5, 0.5; 0.5, 1), quad H^(-1) = mat(4, -2; -2, 2). $
  #ask[Work out $H^(-1) nabla ell$, then the new $theta = theta - H^(-1) nabla ell$.]
  #work(1.0in)
  #ask[With the new $theta$, what is $z = theta_0 + theta_1 x_1$ for site A ($x_1 = 0$) and site B ($x_1 = 2$)? Do the two sites now look the way their labels say?]
  #work(0.9in)
  #ask[The gradient for $theta_0$ was 0, yet Newton still moved $theta_0$. Which number in $H^(-1)$ did that?]
  #work(0.75in)
]
#v(4pt)
#kicker(color: accent)[Write the model, one line today, 2 min]
#v(2pt)
#line-row([peak or no peak at a site: which noise model, and which loss does it give?], 0.8in)

#next-up(20)[The exponential family. Bernoulli and Gaussian rewritten in one shared form, which is why the gradient keeps coming out as (predicted − real) × $x$.]
