#import "/design.typ": *
#show: sheet.with(day: 3, topic: "matrix times matrix")

#let hi(x) = text(fill: pop, weight: 700, x)

#cover(
  day: 3,
  title: [Matrix times matrix],
  subtitle: [Yesterday was one query against every key. Today it's every query against every key, which is just yesterday's product done a few times side by side.],
  minutes: [about 19 min, stop at 25],
  pipeline: ([embed], [score q · k], [softmax], [mix values], [output]),
  now: 1,
)
#text(font: serif, size: 14pt, weight: 700)[Yesterday's product, a few times over]
#source[Bishop & Bishop, Deep Learning | App. A, §A.1 Matrix identities (notation) | PDF p. 618 | printed p. 609]

#define[Column by column][To get $A B$, take each column of $B$ and multiply $A$ by it, the way we did yesterday. Each one gives you one column of the answer. Here's a small one:
  #v(2pt)
  $ A = mat(1, 2; 0, -1) quad B = mat(3, 1; 1, 0) quad A B = mat(5, 1; -1, 0) $
  #v(2pt)
  Column 1 of $A B$ is $A$ times $(3, 1)$, which is $(5, -1)$. That's yesterday's example, same numbers. If you only want one entry, row $i$ of $A$ dotted with column $j$ of $B$ gives the entry in row $i$, column $j$.]

#define[Shapes][An $m times n$ matrix times an $n times p$ matrix gives an $m times p$ matrix:
  #v(2pt)
  $ (m times #hi[$n$]) (#hi[$n$] times p) = m times p $
  #v(2pt)
  The two inside numbers have to match, since a row of $A$ has $n$ numbers and a column of $B$ has to have $n$ too, or there's nothing to pair them with. The outside numbers tell you the shape you get back. There's one dot product per entry of the answer, so $m p$ of them.]

#define[Order matters][Flip it and you usually get something else. With the same $A$ and $B$:
  $ B A = mat(3, 5; 1, 2) $
  which isn't $A B$. Sometimes the flipped version doesn't even have shapes that fit.]

#pagebreak()

#task(kind: "see", minutes: 5, title: [Shapes before numbers],
  src: [Bishop & Bishop | §12.1.4 Network parameters, Eqs. 12.10-12.11 | PDF p. 380 | printed p. 364])[
  Barely any arithmetic here, mostly shapes.

  #ask[Can you fill in the table? If a product doesn't work, just write no in the first empty column and skip the rest of the row.]
  #{
    set text(size: 9.5pt)
    let h(x) = text(size: 8pt, fill: accent, weight: 600, x)
    table(
      columns: (0.8in, 0.8in, 1fr, 1fr, 1.1fr),
      rows: (auto, 0.4in, 0.4in, 0.4in, 0.4in),
      align: center + horizon,
      stroke: (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none }),
      fill: (x, y) => if x > 1 and y > 0 { tint } else { none },
      table.header(h[$A$ is], h[$B$ is], h[works? (yes or no)], h[shape of $A B$ (rows × columns)], h[number of dot products (rows × columns of $A B$)]),
      [$2 times 3$], [$3 times 4$], [], [], [],
      [$3 times 2$], [$3 times 2$], [], [], [],
      [$1 times 4$], [$4 times 1$], [], [], [],
      [$4 times 1$], [$1 times 4$], [], [], [],
    )
  }

  #ask[Rows 3 and 4 use the same two shapes, just swapped. Why does one give a single number and the other a whole $4 times 4$ grid?]
  #work(0.75in)

  #ask[Say a DNA model reads $N = 1000$ tokens, and each token's embedding has 64 numbers, so $X$ is $1000 times 64$. $W$ is $64 times 16$. What shape is $X W$, and how many dot products does it take?]
  #work(0.75in)
]
#pagebreak()

#task(kind: "do", minutes: 6, title: [Three tokens through one matrix],
  src: [Bishop & Bishop | §12.1.4 Network parameters, Eq. 12.10 | PDF p. 380 | printed p. 364 | made-up embeddings])[
  Three tokens, two numbers each, stacked as rows of $X$. $W$ is a made-up $2 times 2$ matrix. A real model would learn it.
  #v(2pt)
  #align(center, grid(columns: 3, column-gutter: 18pt, align: horizon,
    grid(columns: 2, column-gutter: 6pt, align: horizon, $display(X = mat(1, 1; 2, 0; 0, 3))$, text(size: 9pt, fill: muted)[token 1 \ token 2 \ token 3]),
    $display(W = mat(1, 2; 1, -1))$,
    text(size: 9pt, fill: muted)[$X$ is $3 times 2$ \ $W$ is $2 times 2$],
  ))

  #ask[Work out $X W$, one entry at a time (row of $X$ · column of $W$).]
  #grid(columns: (auto, 1fr), column-gutter: 12pt, align: horizon,
    blank-matrix(rows: 3, cols: 2, cw: 0.6in, ch: 0.38in, row-labels: ([token 1], [token 2], [token 3])),
    work(1.3in, label: [working]))

  #ask[Column 2 of $X W$ is $X$ times one vector. Which vector? Work it out that way and check it against your column 2.]
  #work(0.8in)

  #ask[Token 2's embedding changes to $(5, 5)$. Which rows of $X W$ change? What's the new row?]
  #work(0.7in)

  #ask[Could you compute $W X$ instead? Answer from the shapes.]
  #work(0.45in)
  #v(4pt)
  #aside[In attention, $Q = X W$ is this same product. Every token's embedding goes through the same $W$ at once.]
]
#pagebreak()

#task(kind: "use", minutes: 6, title: [Two queries, three keys, one product],
  src: [Bishop & Bishop | §12.1.4 Eq. 12.13 and Fig. 12.4 | PDF pp. 380-381 | printed pp. 364-365 | made-up vectors])[
  Two queries go in as rows of $Q$. The keys A, B, C would be the rows of $K$, like yesterday. Here I've written them as columns instead, which is the $K^T$ from day 1 (we'll look at the T properly tomorrow).
  #v(2pt)
  #align(center, grid(columns: 2, column-gutter: 22pt, align: horizon,
    grid(columns: 2, column-gutter: 6pt, align: horizon, $display(Q = mat(2, 1; 0, 1))$, text(size: 9pt, fill: muted)[$q_1$ \ $q_2$]),
    grid(rows: 2, row-gutter: 5pt, align: center,
      $display(K^T = mat(2, 3, -1; 1, 3, 2))$,
      text(size: 9pt, fill: muted)[columns are keys A, B, C]),
  ))
  #v(2pt)
  Row 1 of $S$ is $q_1$ against every key, the same thing as yesterday's $K q$ with $q = q_1$. Row 2 is the same for $q_2$.

  #ask[Work out $S = Q K^T$.]
  #grid(columns: (auto, 1fr), column-gutter: 12pt, align: horizon,
    blank-matrix(rows: 2, cols: 3, cw: 0.5in, ch: 0.38in, row-labels: ([$q_1$], [$q_2$]), col-labels: ([A], [B], [C])),
    work(1.1in, label: [working]))

  #ask[Key A is $(2, 1)$, pointing exactly the way $q_1$ does, and it still loses to B. Say I doubled A to $(4, 2)$, same direction. What's its score against $q_1$ now, and does it beat B?]
  #work(0.7in)

  #ask[So besides direction, what else makes a score big? Your answer to (b) is the evidence.]
  #work(0.5in)

  #ask[Say key C changes to something else. Which entries of $S$ change, and which stay put?]
  #work(0.5in)
]
#pagebreak()

#kicker(color: accent)[Wrap up, 2 min]
#takeaway(room: 2in)[In a sentence or two: how can you tell from the shapes alone whether $A B$ works, and what shape comes out?]

#next-up(4)[Transpose, and why $Q K^T$ needs the T to turn into a score table.]
