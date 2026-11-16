#import "/design.typ": *
#show: sheet.with(day: 2, topic: "matrix times vector")

#cover(
  day: 2,
  title: [Matrix times vector],
  subtitle: [Yesterday we scored keys one at a time. A matrix lets you do all of them at once, and it turns out there are two ways to read what it's doing.],
  minutes: [about 18 min, stop at 25],
  pipeline: ([embed], [score q · k], [softmax], [mix values], [output]),
  now: 1,
)
#text(font: serif, size: 14pt, weight: 700)[Lots of dot products, stacked]
#source[Bishop & Bishop, Deep Learning | §A.1 Matrix identities (notation) | PDF p. 618 | printed p. 609]

#define[Rows: a stack of dot products][A matrix with $m$ rows and $n$ columns is $m times n$. To multiply it by a vector $x$ with $n$ numbers, dot each row with $x$. You get $m$ numbers back, one per row. \
  #v(2pt)
  $ mat(1, 2; 0, -1) vec(3, 1) = vec(1 dot 3 + 2 dot 1, 0 dot 3 + (-1) dot 1) = vec(5, -1) $
  #v(2pt)
  The rows need as many numbers as $x$ has. A $2 times 3$ matrix can't multiply a vector of 2, there's nothing to pair the third column with.]

#define[Columns: a recipe][Same product, read the other way. $x$ tells you how much of each column to take, and you add them up:
  #v(2pt)
  $ 3 dot vec(1, 0) + 1 dot vec(2, -1) = vec(5, -1) $
  #v(2pt)
  Same answer, it has to be. The row view is easier to compute. The column view tells you what happens when one entry of $x$ goes up by 1: the output moves by that column.]

#define[Where attention comes in][Put every key in as a row of a matrix $K$. Then $K q$ is every key's score against the query $q$, in one go. One product instead of a pile of separate dot products.]

#v(6pt)
#aside[Pretty much every layer in a neural network is a matrix times a vector, plus a little extra.]
#pagebreak()

#task(kind: "see", minutes: 5, title: [Both views, same answer],
  src: [Bishop & Bishop | §12.1.3 Self-attention, Eq. 12.5 | PDF p. 379 | printed p. 363 | tutor example])[
  Here are three keys and a query $q = (2, -1)$. Stack the keys as rows and you get $K$.

  #v(2pt)
  #align(center, grid(columns: 2, column-gutter: 0.35in, align: horizon,
    vec-plot(x0: -2, x1: 4, y0: -1, y1: 3, u: 0.25in, vecs: ((1, 2, [A], accent), (3, 0, [B], accent), (-1, 1, [C], accent), (2, -1, [q], pop))),
    grid(columns: 2, column-gutter: 6pt, align: horizon, $display(K = mat(1, 2; 3, 0; -1, 1))$, text(size: 9pt, fill: muted)[A \ B \ C]),
  ))

  #ask(answer: slot())[$K$ is $3 times 2$. How many numbers come out of $K q$?]

  #ask[Work out $K q$ the row way.]
  #grid(columns: (auto, 1fr), column-gutter: 12pt, align: horizon,
    blank-matrix(rows: 3, cols: 1, cw: 0.62in, ch: 0.36in, row-labels: ([A], [B], [C])),
    work(1.2in, label: [working]))

  #ask[Now the column way. Write $K q$ as (2 × column 1 of $K$) + (−1 × column 2 of $K$) and check you land on the same three numbers.]
  #work(0.75in)

  #ask[Which of these products work? If one does, how many numbers come out?]
  #{
    set text(size: 9.5pt)
    let h(x) = text(size: 8pt, fill: accent, weight: 600, x)
    table(
      columns: (1.1in, 1.15in, 1fr),
      rows: (auto, 0.32in, 0.32in, 0.32in),
      align: (center + horizon, center + horizon, left + horizon),
      stroke: (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none }),
      fill: (x, y) => if x == 2 and y > 0 { tint } else { none },
      table.header(h[matrix shape], h[vector length], h[works? if yes, how many numbers come out]),
      [$4 times 3$], [3], [],
      [$3 times 2$], [3], [],
      [$1 times 5$], [5], [],
    )
  }
]
#pagebreak()

#task(kind: "do", minutes: 6, title: [A tiny layer that reads DNA],
  src: [Bishop & Bishop | §12.1.4 Network parameters, Eq. 12.7 | PDF p. 380 | printed p. 364 | made-up detectors])[
  Say you slide a 10 bp window along a sequence and count the bases. Window 1 is #raw("GAGCTAGTAG") and window 2 is #raw("CGCAGTCGCG"). As vectors, counts are written in the order (A, C, G, T):
  #v(2pt)
  #align(center)[window 1: $x_1 = (3, 1, 4, 2)$ #h(14pt) window 2: $x_2 = (1, 4, 4, 1)$]

  I made up a matrix $W$ with two rows. Each row is a little detector:
  #v(2pt)
  #align(center, grid(columns: 2, column-gutter: 12pt, align: horizon,
    $display(W = mat(0, 1, 1, 0; 1, -1, 1, -1))$,
    text(size: 9pt)[row 1 counts G + C \ row 2 is purines minus pyrimidines \ (A + G) − (C + T)]))
  #v(2pt)
  A real network learns rows like these instead of me picking them.

  #ask[Fill in $W x$ for both windows.]
  #{
    set text(size: 9.5pt)
    let h(x) = text(size: 8pt, fill: accent, weight: 600, x)
    table(
      columns: (0.75in, 1fr, 1fr),
      rows: (auto, 0.4in, 0.4in),
      align: (left + horizon, center + horizon, center + horizon),
      stroke: (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none }),
      fill: (x, y) => if x > 0 and y > 0 { tint } else { none },
      table.header(h[window], h[first output = row 1 of $W$ · counts], h[second output = row 2 of $W$ · counts]),
      [window 1], [], [],
      [window 2], [], [],
    )
  }
  #work(0.6in, label: [working])

  #ask[I want a third output that counts A + T. What row would you add to $W$? Write the four numbers, and its output for each window.]
  #work(0.8in)

  #ask[Say one T in window 1 was a sequencing error and it's really a G, so the counts become $(3, 1, 5, 1)$. Using the column view and the original two-row $W$, how does $W x_1$ change? You shouldn't need to redo any dot products.]
  #work(0.8in)
]
#pagebreak()

#task(kind: "use", minutes: 6, title: [One query against every key],
  src: [Bishop & Bishop | §12.1.3 Eq. 12.6, PDF p. 379 / printed p. 363 | §12.1.4 Eq. 12.13, PDF p. 380 / printed p. 364 | toy embeddings, made up])[
  New sentence, new made-up embeddings, three numbers per token. The keys go in as rows of $K$:
  #v(2pt)
  #align(center, grid(columns: 2, column-gutter: 14pt, align: horizon,
    $display(K = mat(2, 1, 0; 0, 0, 2; 1, 2, 0; 2, 2, 2))$,
    text(size: 9pt, fill: muted)[ribosome \ reads \ codon \ and]))
  #v(2pt)
  The query is *codon*, with the same vector it has as a key: $q = (1, 2, 0)$.

  #ask[In words, what does each number in $K q$ stand for?]
  #work(0.5in)

  #ask[Work out $K q$.]
  #grid(columns: (auto, 1fr), column-gutter: 12pt, align: horizon,
    blank-matrix(rows: 4, cols: 1, cw: 0.62in, ch: 0.34in, row-labels: ([ribosome], [reads], [codon], [and])),
    work(1.5in, label: [working]))

  #ask[Which key wins? It isn't codon, even though codon's key is identical to the query. Why? Use numbers.]
  #work(0.7in)

  #ask[On day 1, $S = Q K^T$ had one row per query. If codon were one of the queries in $Q$, which part of $S$ is the $K q$ you just worked out?]
  #work(0.55in)
]
#pagebreak()

#kicker(color: accent)[Wrap up, 2 min]
#takeaway(room: 2in)[In a sentence or two: what are the two ways to read a matrix times a vector, and what does each one make easy to see?]

#next-up(3)[Matrix times matrix, and how to tell from the shapes alone whether a product works.]
