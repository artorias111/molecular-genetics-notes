#import "/design.typ": *
#show: sheet.with(day: 18, topic: "softmax regression, gradient p - y")

#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })
#let line-row(lab, room) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
  align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
  block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft))

#cover(
  day: 18,
  title: [Three answers instead of two],
  subtitle: [Logistic regression says peak or no peak. But a lot of genome questions have more than two answers, like is this region a promoter, an enhancer, or neither. So we swap the sigmoid for softmax (you met it back in the attention days), and the gradient comes out as (predicted − real) × $x$ again.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([logits], [softmax], [$-ln p_y$], [$p - e_y$]),
  now: 3,
)

#define[Softmax regression][Each class $i$ gets its own weights $theta_i$ and its own score, a *logit*, $t_i = theta_i^T x$. Softmax turns the scores into probabilities that add to 1:
  $ p_i = e^(t_i) / S, quad S = e^(t_1) + e^(t_2) + e^(t_3). $
  Tiny example: logits $(0, 0, 0)$ give $S = 3$ and $p = (1/3, 1/3, 1/3)$. With two classes this is logistic regression in disguise (task 2 shows it).]

#define[The loss, and the real answer as a vector][The real class is $y$, one of $1, 2, 3$. The loss is the same idea as day 16, minus the log of the chance the model gave the real answer: $ell = -ln p_y$. This is *cross-entropy* for many classes.
  - Write the real answer as a *one-hot* vector $e_y$: 1 in slot $y$, 0 elsewhere. Enhancer ($y = 2$) is $e_y = (0, 1, 0)$.
  - $1{i = y}$ means 1 if $i$ is the real class and 0 if not. It's just slot $i$ of $e_y$.]

#define[Downhill, one class at a time][Since $t_i = theta_i^T x$, nudging $theta_i$ moves $t_i$ by $x$, the same chain rule as day 17. So once we have $partial ell \/ partial t_i$, the step is $theta_i := theta_i - alpha (partial ell \/ partial t_i) x$.]
#source[CS229 | §2.3 Multi-class classification | PDF p. 25-27 (printed 24-26) | softmax eq. 2.9 PDF p. 26, gradient eq. 2.16-2.18 PDF p. 27]
#pagebreak()

#task(kind: "fix", minutes: 4, title: [Where h and y live],
  src: [CS229 | §2.1 | PDF p. 22-23 | day 17 | made-up site])[
  Quick reset from day 17, back to two classes. $h = g(theta^T x)$ is the model's chance of a peak, and $y$ is the label from the ChIP.
  #ask[What's the smallest and largest $h$ can be? What values can $y$ take? So how big can $h - y$ get, in either direction?]
  #work(1.1in)
  Same site, same motif score, ChIP'd twice. Peak the first time ($y = 1$), no peak the second ($y = 0$).
  #ask[Which of $x$, $y$ and the true $theta_1$ changed between the two runs, and where did that change come from?]
  #work(1.3in)
]
#pagebreak()

#task(kind: "see", minutes: 4, title: [Softmax, and the sigmoid hiding in it],
  src: [CS229 | §2.3, eq. 2.9 | PDF p. 26 | printed p. 25 | made-up logits])[
  A region's logits for (promoter, enhancer, background) are $t = (2, 1, 0)$. Use $e^2 approx 7.4$ and $e^1 approx 2.7$.
  #ask[Fill in the table. Fractions or two decimals are both fine.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (1.2in, 0.8in, 1.0in, 1.5in),
      rows: (0.45in, 0.45in, 0.45in, 0.45in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x >= 2 and y > 0 { tint } else { none },
      [class], [logit $t_i$], [$e^(t_i)$], [$p_i = e^(t_i) \/ S$, with $S$ the sum of the $e^(t_i)$ column],
      [promoter], [2], [], [],
      [enhancer], [1], [], [],
      [background], [0], [], [],
    )
  })
  #ask[Now add 3 to every logit, $(5, 4, 3)$. Do the probabilities change? (Hint: $e^(t + 3) = e^3 e^t$, what happens to $e^3$ in the fraction?)]
  #work(0.95in)
  #ask[Two classes, logits $(z, 0)$. Write $p_1$ with softmax, then put in $z = 2$. Compare with $g(2) = 1 \/ (1 + e^(-2)) approx 0.88$ from day 17.]
  #work(1.1in)
]
#pagebreak()

#task(kind: "do", minutes: 7, title: [The gradient is p minus the answer],
  src: [CS229 | §2.3, eq. 2.14-2.17 | PDF p. 27 | printed p. 26 | made-up region])[
  Same region, logits $t = (2, 1, 0)$, so the model says $p = (0.67, 0.24, 0.09)$ and $S approx 11.1$. It really is an enhancer, $y = 2$.
  #ask[With numbers first. Since $ln(e^(t_y) \/ S) = t_y - ln S$, the loss is $ell = -t_y + ln S$. Using $ln 11.1 approx 2.41$, what is $ell$? (About 1.4, give or take rounding.) Is it big or small next to $-ln 0.67 approx 0.40$, the loss if it had been a promoter?]
  #work(0.95in)
  #ask[Write $e_y$, then $p - e_y$, slot by slot.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (1.2in, 0.9in, 0.9in, 1.4in),
      rows: (0.42in, 0.45in, 0.45in, 0.45in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x >= 2 and y > 0 { tint } else { none },
      [class], [model's $p_i$], [$e_y$, slot $i$], [$p_i -$ ($e_y$ slot $i$)],
      [promoter], [0.67], [], [],
      [enhancer], [0.24], [], [],
      [background], [0.09], [], [],
    )
  })
  #ask[Same thing with letters. Find the slope of $ell = -t_y + ln S$ with respect to $t_i$ in three steps: (1) the slope of $-t_y$ is $-1$ when $i = y$ and 0 otherwise, so write it with $1{i = y}$; (2) the slope of $ln S$ is $(1 \/ S)$ times the slope of $S$, and only $e^(t_i)$ in $S$ moves with $t_i$; (3) add them and spot $p_i$.]
  #work(1.6in)
]
#pagebreak()

#task(kind: "use", minutes: 4, title: [When the model is already right],
  src: [CS229 | §2.3, eq. 2.18 | PDF p. 27 | printed p. 26 | made-up regions])[
  A different enhancer ($y = 2$), and this time the model is pretty sure: $p = (0.05, 0.9, 0.05)$. A downhill step moves each logit against its slope $p_i - 1{i = y}$, so a bigger slope means a bigger nudge.
  #ask[What is $p - e_y$ for this region?]
  #work(0.75in)
  #ask[Next to task 3's region, which one moves the weights more in one step? Does that seem like a sensible way to learn?]
  #work(0.85in)
  #ask[Say this same region had been labelled background ($y = 3$) by mistake. Which class's logit would the step push up, and would the model be learning the biology or the mistake?]
  #work(0.85in)
]
#v(4pt)
#kicker(color: accent)[Write the model, one line today, 2 min]
#v(2pt)
#line-row([in plain words, what does $theta_i := theta_i - alpha (p_i - 1{i = y}) x$ do for an enhancer region?], 0.85in)

#next-up(19)[Second derivatives. How fast the slope itself changes, and one Newton step that uses it.]
