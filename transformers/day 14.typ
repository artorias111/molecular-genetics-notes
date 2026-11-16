#import "/design.typ": *
#show: sheet.with(day: 14, topic: "normal equations")

#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })
#let line-row(lab, room, body: none) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
  align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
  if body == none { block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft) }
  else { block(width: 100%, inset: 6pt, radius: 4pt, fill: tint, text(size: 9.5pt, body)) })

#cover(
  day: 14,
  title: [Where the slope is zero],
  subtitle: [Gradient descent creeps down the bowl one step at a time. But at the very bottom every slope is zero, so for linear regression we can skip the walk and solve for that spot directly.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([$nabla_theta J = X^T (X theta - y)$], [set it to 0], [$X^T X theta = X^T y$], [solve for $theta$]),
  now: 2,
)

#define[The bottom of the bowl][$J(theta)$ is a bowl. At its lowest point, nudging any $theta_j$ a tiny bit doesn't change $J$, so every slope is zero: $nabla_theta J = 0$. Set yesterday's gradient to zero and move the $y$ part to the other side:
  $ X^T (X theta - y) = 0 quad arrow.r quad X^T X theta = X^T y. $
  These are the *normal equations*. There's one equation per weight, so two weights means two equations in two unknowns.]

#define[What $X^T X$ looks like with two weights][With an intercept and one feature, $X$ has a column of 1's and a column of $x$'s. Every entry of $X^T X$ and $X^T y$ is a row of $X^T$ dotted with a column, so they come out as plain sums over the $n$ data points:
  $ X^T X = mat(n, sum x; sum x, sum x^2) quad quad X^T y = mat(sum y; sum x y) $]

#define[Two equations by hand][Say $2a + b = 5$ and $a + 3b = 5$. Double the second to get $2a + 6b = 10$, subtract the first, and $a$ drops out: $5b = 5$, so $b = 1$. Plug back in: $2a + 1 = 5$, so $a = 2$. (Check it in the other equation: $2 + 3 = 5$. Good.)]
#source[CS229 | §1.2.2 least squares revisited, normal equations | PDF p. 16 | printed p. 15]
#aside[CS229 writes it as $theta = (X^T X)^(-1) X^T y$. Same thing, we just solve by hand.]
#pagebreak()

#task(kind: "fix", minutes: 3, title: [Warm-up],
  src: [CS229 | §1.2.1-1.2.2 | PDF p. 14-16 | printed p. 13-15 | day 13 | made-up numbers])[
  #ask[On day 13, with 4 genes and three weights $(theta_0, theta_1, theta_2)$, the gradient $X^T (X theta - y)$ came out $3 times 1$. Now train the same three-weight model on 500 genes. How many numbers are in $nabla_theta J$, and how many genes does each of those numbers add up over?]
  #work(0.85in)
  #ask[Take $A = mat(3, 0; 0, 1)$ and the point $theta = (1, 2)$. The rule $nabla_theta (theta^T A theta) = 2 A theta$ wants $theta$ itself on the right. Work out $2 A theta$ as a 2-long vector of plain numbers.]
  #work(1.3in)
  #ask[A log#sub[2] expression model has $(theta_0, theta_1) = (2, 3)$. A gene has $x_1 = 0$ and its measured $y$ is 1. What's the guess $h$, and what's $h - y$?]
  #work(0.85in)
]
#pagebreak()

#task(kind: "see", minutes: 5, title: [One weight, solved in one line],
  src: [CS229 | §1.2.2 | PDF p. 16 | printed p. 15 | made-up cultures])[
  Say you put a reporter gene on a plasmid and grow three cultures with different copy numbers $x$. No copies, no protein, so there's no intercept: $h = theta x$. The protein readout is $y$. With one weight, the slope of $J(theta) = 1/2 sum (theta x - y)^2$ is
  $ (d J) / (d theta) = sum (theta x - y) x = theta sum x^2 - sum x y. $
  #ask[Fill in the last two columns and the totals row.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (0.8in, 0.75in, 0.75in, 1.1in, 1.1in),
      rows: (0.42in, 0.4in, 0.4in, 0.4in, 0.4in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x > 2 and y > 0 { tint } else { none },
      [culture], [copies $x$], [protein $y$], [$x^2$ ($x$ times $x$)], [$x y$ ($x$ times $y$)],
      [1], [1], [1], [], [],
      [2], [1], [3], [], [],
      [3], [2], [4], [], [],
      [*total*], [], [], [$sum x^2 =$], [$sum x y =$],
    )
  })
  #ask[Set the slope to zero, $theta sum x^2 - sum x y = 0$, and solve for $theta$.]
  #work(0.9in)
  #ask[Before working it out: at this best $theta$, what should $sum (theta x - y) x$ add up to? Now check it, culture by culture.]
  #work(1.2in)
]
#pagebreak()

#task(kind: "do", minutes: 7, title: [Two weights: the drought gene],
  src: [CS229 | §1.2.2 | PDF p. 16 | printed p. 15 | made-up plants])[
  Four tomato plants went 0, 1, 2 and 3 days without water. $y$ is the log#sub[2] expression of a drought-response gene. The model is $h = theta_0 + theta_1 x$, so $X$ has a column of 1's and a column of days.
  #align(center, $X = mat(1, 0; 1, 1; 1, 2; 1, 3) quad quad y = mat(2; 2; 4; 8)$)
  #ask[Fill in $X^T X$. Each entry is one column of $X$ dotted with another. The top-left is the 1's column with itself.]
  #grid(columns: (1fr, auto), column-gutter: 10pt, work(1.1in), align(horizon, blank-matrix(rows: 2, cols: 2, cw: 0.75in, ch: 0.5in)))
  #ask[Fill in $X^T y$.]
  #grid(columns: (1fr, auto), column-gutter: 10pt, work(1.1in), align(horizon, blank-matrix(rows: 2, cols: 1, cw: 0.75in, ch: 0.5in)))
  #ask[Write out the two normal equations and solve them for $theta_0$ and $theta_1$, like the $a$, $b$ example on page 1. (Hint: halve the first equation, then times 3, and its $theta_0$ matches the second one. Check: $theta_0 + theta_1 = 3$.)]
  #work(1.7in)
]
#pagebreak()

#task(kind: "use", minutes: 4, title: [Reading the answer],
  src: [CS229 | §1.2.2 and footnote 3 | PDF p. 16 | printed p. 15 | made-up plants])[
  Task 3 should give $theta = (1, 2)$. Same four plants.
  #ask[$theta_1 = 2$ on a log#sub[2] scale. In plain words, what does one extra dry day do to this gene's expression?]
  #work(0.65in)
  #ask[Fill in the guesses and errors.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (0.75in, 0.6in, 1.4in, 1.4in),
      rows: (0.42in, 0.38in, 0.38in, 0.38in, 0.38in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x > 1 and y > 0 { tint } else { none },
      [days $x$], [$y$], [guess $h = 1 + 2x$], [error $h - y$],
      [0], [2], [], [],
      [1], [2], [], [],
      [2], [4], [], [],
      [3], [8], [], [],
    )
  })
  #ask[Now say all four plants were measured after 2 dry days, so every $x = 2$. Then $X^T X = mat(4, 8; 8, 16)$. Just looking at the left side, how does its second row compare to the first? So when you try to eliminate $theta_0$, what happens to $theta_1$, and why can't these data tell $theta_0$ apart from $theta_1$?]
  #work(1.4in)
  #aside[When this happens there's no single best $theta$, a whole line of them fits equally well.]
]
#pagebreak()

#kicker(color: accent)[Write the model, 4 min]
#v(2pt)
#text(size: 9.5pt, fill: muted)[Same linear regression, in vector form, now with a last row for the best $theta$. Remember, $h$ is the guess and $y$ is what was measured.]
#v(4pt)
#stack(spacing: 7pt,
  line-row([what we observe (both parts)], 0.6in),
  line-row([what the model outputs, for all data points at once], 0.6in),
  line-row([noise model], 0in, body: [$y^((i)) = theta^T x^((i)) + epsilon^((i))$, with $epsilon^((i)) tilde "Normal"(0, sigma^2)$.]),
  line-row([the loss, guess minus measured (sum form is fine)], 0.65in),
  line-row([the gradient $nabla_theta J$, in $X$ and $y$], 0.6in),
  line-row([the best $theta$, no stepping], 0.6in),
  line-row([say it to a biologist], 0.85in),
)

#next-up(15)[Why squared error at all? If the noise is a bell curve, least squares is exactly the maximum likelihood answer. And a $1/2$ shows up there naturally.]
