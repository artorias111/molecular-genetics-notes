#import "/design.typ": *
#show: sheet.with(day: 13, topic: "gradients as vectors")

#let hd(x) = text(size: 8pt, fill: accent, weight: 600, x)
#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })
#let line-row(lab, room, body: none) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
  align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
  if body == none { block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft) }
  else { block(width: 100%, inset: 6pt, radius: 4pt, fill: tint, text(size: 9.5pt, body)) })

#cover(
  day: 13,
  title: [All the slopes at once],
  subtitle: [Yesterday you worked out three slopes, one $theta_j$ at a time. Stack them and you get one vector, the gradient. Today we get that whole vector in one go.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([one slope per $theta_j$], [stack them: $nabla_theta J$], [$X^T (X theta - y)$], [$theta := theta - alpha nabla_theta J$]),
  now: 1,
)

#kicker(color: accent)[A worked model box: linear regression, as of day 12]
#v(2pt)
#text(size: 9.5pt, fill: muted)[You asked for one filled in. Watch two letters: $h$ is the model's guess, $y$ is what was measured. They are never the same symbol.]
#v(4pt)
#stack(spacing: 5pt,
  line-row([what we observe], 0in, body: [For each gene $i = 1, dots, n$: the features $x^((i))$ (motifs, CpG) *and* the measured $y^((i))$ (log#sub[2] expression).]),
  line-row([what the model outputs], 0in, body: [A guess $h_theta (x^((i))) = theta^T x^((i)) = theta_0 dot 1 + theta_1 x_1 + theta_2 x_2$. Not $y$, a guess at $y$.]),
  line-row([noise model], 0in, body: [$y^((i)) = theta^T x^((i)) + epsilon^((i))$, $epsilon^((i)) tilde "Normal"(0, sigma^2)$. Measured = guess + bell-shaped noise.]),
  line-row([the loss], 0in, body: [$J(theta) = 1/2 sum_(i=1)^n (h_theta (x^((i))) - y^((i)))^2$. Guess minus measured, squared, summed.]),
  line-row([the update], 0in, body: [$theta_j := theta_j - alpha (partial J) / (partial theta_j)$, with $(partial J) / (partial theta_j) = sum_i (h_theta (x^((i))) - y^((i))) x^((i))_j$. $J$ on top, $theta_j$ on the bottom: "how $J$ moves when $theta_j$ moves".]),
  line-row([say it], 0in, body: [Predicted expression is a weighted sum of promoter features, real values scatter around it in a bell, and training nudges each weight by how much its feature lined up with the misses.]),
)
#source[CS229 | ch 1 intro, §1.1 | PDF p. 9-12 | printed p. 8-11 | §1.3 noise model | PDF p. 16 | printed p. 15]
#pagebreak()

#define[The gradient][Stack all the slopes into one vector: $nabla_theta J = ((partial J) / (partial theta_0), (partial J) / (partial theta_1), (partial J) / (partial theta_2))$. It has one entry per $theta_j$, so it's the same length as $theta$. Day 12's slopes were $(0, 3, -2)$: that's the gradient. The update for all of $theta$ at once is then $theta := theta - alpha nabla_theta J$.]

#define[Two rules worth knowing][CS229 uses two facts to skip the one-at-a-time slopes. For a fixed vector $b$ and a symmetric matrix $A$ (one that equals its own transpose):
  - $nabla_theta (b^T theta) = b$. A weighted sum's gradient is just the weights.
  - $nabla_theta (theta^T A theta) = 2 A theta$. The matrix version of "the slope of $a theta^2$ is $2 a theta$".
  You'll check both by hand today, so you don't have to take them on faith.]

#define[The gradient of $J$ for all genes][Put the measured values in a column $y = (y^((1)), dots, y^((n)))$. Then $X theta - y$ is the column of errors, guess minus measured, and
  $ nabla_theta J = X^T (X theta - y). $
  $X^T$ is $X$ flipped, so its rows are the columns of $X$: one row of all the $x_0$'s, one of all the $x_1$'s, one of all the $x_2$'s.]
#source[CS229 | §1.2.1-1.2.2 matrix derivatives, least squares revisited | PDF p. 14-16 | printed p. 13-15]
#pagebreak()

#task(kind: "fix", minutes: 4, title: [Warm-up],
  src: [CS229 | ch 1 intro | PDF p. 9-10 | printed p. 8-9 | day 10 cross-entropy | made-up gene])[
  #ask[A model has $(theta_0, theta_1, theta_2) = (0.5, 1, 2)$. A gene has 1 motif and sits in a CpG island, and its measured log#sub[2] expression is $y = 4$. Write its $x$ with the leading 1 first, then the guess $h$, then $h - y$.]
  #work(0.55in)
  #ask[A model reads DNA two bases at a time, so there are 16 possible tokens. It gives the right token $1/16 = 2^(-4)$ at every step. What's its cross-entropy, as a multiple of $ln 2$?]
  #work(0.4in)
  #ask[In a model of log#sub[2] expression, a feature has weight 2.3. So one extra unit of that feature multiplies expression by $2^2.3$. Which two whole numbers is that between? ($2^2 = 4$, $2^2.5 approx 5.7$)]
  #work(0.35in)
  #ask[Write the slope of $J$ with respect to $theta_2$ in $partial$ notation. Which letter goes on top?]
  #work(0.35in)
]
#pagebreak()

#task(kind: "see", minutes: 5, title: [Checking the two rules],
  src: [CS229 | §1.2.2 | PDF p. 16 | printed p. 15 | made-up numbers])[
  Gene 3 from the last two days has $x = (1, 3, 0)$, leading 1 included. Its guess is $f(theta) = x^T theta = theta_0 + 3 theta_1 + 0 theta_2$.
  #ask[Write $(partial f) / (partial theta_0)$, $(partial f) / (partial theta_1)$, $(partial f) / (partial theta_2)$ and stack them into a vector. Compare it with $x$.]
  #work(0.5in)
  #ask[Now two weights and $g(theta) = theta_1^2 + theta_2^2$. That's $theta^T A theta$ with $A$ the $2 times 2$ identity. Write $nabla_theta g$ by taking each slope, and check it equals $2 A theta = 2 theta$.]
  #work(0.5in)
]
#v(6pt)

#task(kind: "do", minutes: 6, title: [The quadratic rule with a real matrix],
  src: [CS229 | §1.2.2 | PDF p. 16 | printed p. 15 | made-up matrix])[
  Take $A = mat(2, 1; 1, 3)$, symmetric since the two off-diagonal entries match, and $theta = (theta_1, theta_2)$.
  #ask[Work out $A theta$ first (a 2-long vector), then dot it with $theta$. Write $theta^T A theta$ as a polynomial in $theta_1$ and $theta_2$.]
  #work(0.8in)
  #ask[Take $(partial) / (partial theta_1)$ and $(partial) / (partial theta_2)$ of your polynomial.]
  #work(0.55in)
  #ask[Now compute $2 A theta$ directly. Same as (b)?]
  #work(0.5in)
]
#pagebreak()

#task(kind: "use", minutes: 4, title: [Day 12's step, as one multiplication],
  src: [CS229 | §1.2.2 | PDF p. 15-16 | printed p. 14-15 | day 11 genes])[
  The four genes again, with $theta = (1, 2, 1)$. The column of errors $X theta - y$ is $(-1, 0, 2, -1)$, from day 12.
  #align(center, $X = mat(1, 2, 1; 1, 0, 0; 1, 3, 0; 1, 1, 1) quad quad X^T = mat(1, 1, 1, 1; 2, 0, 3, 1; 1, 0, 0, 1)$)
  #ask[$X^T$ is $3 times 4$ and $X theta - y$ is $4 times 1$. What shape is $X^T (X theta - y)$? Why does that shape make sense for a gradient?]
  #work(0.4in)
  #ask[Compute $X^T (X theta - y)$, one row of $X^T$ at a time. Does it match day 12's slopes $(0, 3, -2)$?]
  #work(0.7in)
  #ask[Which column of $X$ (which feature) does the second row of $X^T$ hold? So in plain words, what is the second entry of the gradient adding up?]
  #work(0.45in)
]
#pagebreak()

#kicker(color: accent)[Write the model, 3 min]
#v(2pt)
#text(size: 9.5pt, fill: muted)[Same model as page 1, but now in vector form. Try it without looking back first.]
#v(4pt)
#stack(spacing: 6pt,
  line-row([what we observe (both parts)], 0.4in),
  line-row([what the model outputs, for all genes at once], 0.4in),
  line-row([noise model], 0in, body: [$y^((i)) = theta^T x^((i)) + epsilon^((i))$, with $epsilon^((i)) tilde "Normal"(0, sigma^2)$.]),
  line-row([the loss, guess minus measured (sum form is fine)], 0.45in),
  line-row([the gradient $nabla_theta J$, in $X$ and $y$], 0.45in),
  line-row([the update, for all of $theta$ at once], 0.45in),
  line-row([say it to a biologist, in different words from page 1], 0.6in),
)

#next-up(14)[Set the gradient to zero: the normal equations $X^T X theta = X^T y$, solved by hand for two weights.]
