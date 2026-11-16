#import "/design.typ": *
#show: sheet.with(day: 4, topic: "transpose and the score table")

#cover(
  day: 4,
  title: [Transpose],
  subtitle: [We've been writing $Q K^T$ since day 1 without saying what the T is doing. Today it gets explained, and it turns out the score table doesn't fit together without it.],
  minutes: [about 21 min, stop at 25],
  pipeline: ([embed], [score q · k], [softmax], [mix values], [output]),
  now: 1,
)
#text(font: serif, size: 14pt, weight: 700)[Rows into columns]
#source[Bishop & Bishop, Deep Learning | App. A, §A.1 Matrix identities, Eq. A.1 | PDF p. 618 | printed p. 609]

#define[Transpose][$A^T$ is $A$ with its rows turned into columns. Row 1 of $A$ becomes column 1 of $A^T$, row 2 becomes column 2, and so on:
  #v(2pt)
  $ A = mat(1, 2, 3; 4, 5, 6) quad quad A^T = mat(1, 4; 2, 5; 3, 6) $
  #v(2pt)
  So an $m times n$ matrix becomes $n times m$. The entry in row $i$, column $j$ of $A^T$ is the entry in row $j$, column $i$ of $A$.]

#define[Why the score table needs it][$Q$ and $K$ both keep one token per row. With $N$ tokens and $d$ numbers per vector, both are $N times d$. Try $Q K$ and the shapes are $(N times d)(N times d)$. The inside numbers are $d$ and $N$, so it doesn't fit (unless they happen to be equal, and even then it means something else).

  Flip $K$ and it's $d times N$, with each key now a column. Then
  #v(2pt)
  $ Q K^T: quad (N times d)(d times N) = N times N $
  #v(2pt)
  Row $i$, column $j$ is query $i$ dotted with key $j$. One row per query, one column per key, which is the score table from day 1.]

#v(4pt)
#aside[Flip a product and the order flips too: $(Q K^T)^T = K Q^T$.]
#pagebreak()

#task(kind: "see", minutes: 4, title: [Flip it, then check the shapes],
  src: [Bishop & Bishop | §A.1, PDF p. 618, printed p. 609 | §12.1.4 Eqs. 12.10-12.11, PDF p. 380, printed p. 364])[
  #grid(columns: (auto, 1fr), column-gutter: 16pt, align: horizon,
    $display(A = mat(1, 4, 0; 2, -1, 3))$,
    [#ask[Write out $A^T$.]],
  )
  #align(center, blank-matrix(rows: 3, cols: 2, cw: 0.55in, ch: 0.36in))
  #v(4pt)

  Now say a sequence has 5 tokens and each query and key has 8 numbers, so $Q$ and $K$ are both $5 times 8$.

  #ask[$Q K$ doesn't fit. $Q^T K$ does. What shape is $Q^T K$, and why can't it be a score between tokens? (Look at what its rows and columns count.)]
  #work(0.75in)

  #ask[$K Q^T$ is also $5 times 5$. What do its rows stand for, and how is it related to $Q K^T$?]
  #work(0.75in)
]
#pagebreak()

#task(kind: "do", minutes: 7, title: [Build the score table],
  src: [Bishop & Bishop | §12.1.4 Eq. 12.13 and Fig. 12.4 | PDF pp. 380-381 | printed pp. 364-365 | made-up vectors])[
  Three tokens, two numbers per vector. This time each token's query and key are different vectors, and both matrices have one token per row, the way a real model stores them.
  #v(2pt)
  #align(center, grid(columns: 2, column-gutter: 26pt, align: horizon,
    grid(columns: 2, column-gutter: 6pt, align: horizon, $display(Q = mat(1, 2; 3, -1; 0, 1))$, text(size: 9pt, fill: muted)[$q_1$ \ $q_2$ \ $q_3$]),
    grid(columns: 2, column-gutter: 6pt, align: horizon, $display(K = mat(2, 0; -1, 3; 1, 1))$, text(size: 9pt, fill: muted)[$k_1$ \ $k_2$ \ $k_3$]),
  ))

  #ask[Write out $K^T$.]
  #align(center, blank-matrix(rows: 2, cols: 3, cw: 0.5in, ch: 0.36in, col-labels: ([$k_1$], [$k_2$], [$k_3$])))

  #ask[Work out $S = Q K^T$.]
  #grid(columns: (auto, 1fr), column-gutter: 12pt, align: horizon,
    blank-matrix(rows: 3, cols: 3, cw: 0.48in, ch: 0.38in, row-labels: ([$q_1$], [$q_2$], [$q_3$]), col-labels: ([$k_1$], [$k_2$], [$k_3$])),
    work(1.5in, label: [working]))

  #ask[The $q_2$, $k_2$ entry has two minus signs in it. Can you write it as two products before adding, like $(a)(b) + (c)(d)$?]
  #work(0.55in)

  #ask[Column 2 of $S$ is $Q$ times one vector. Which vector? Work out $Q$ times it the column way and check it against your column 2.]
  #work(0.7in)
]
#pagebreak()

#task(kind: "use", minutes: 6, title: [Symmetric or not],
  src: [Bishop & Bishop | §12.1.3 Eq. 12.6, PDF p. 379, printed p. 363 | §12.1.4 Eq. 12.9, PDF p. 380, printed p. 364])[
  On day 1 each token used one vector as both its query and its key. Stack those vectors as rows of $X$ and the score table is just $X X^T$. Here's a two-token version:
  #v(2pt)
  #align(center, grid(columns: 2, column-gutter: 6pt, align: horizon, $display(X = mat(1, 2; 3, 0))$, text(size: 9pt, fill: muted)[token 1 \ token 2]))

  #ask[Work out $X X^T$.]
  #grid(columns: (auto, 1fr), column-gutter: 12pt, align: horizon,
    blank-matrix(rows: 2, cols: 2, cw: 0.5in, ch: 0.38in),
    work(0.85in, label: [working]))

  #ask[The top-right and bottom-left entries match. Why would that happen for any $X$, not just this one? Think about which two vectors get dotted for each.]
  #work(0.6in)

  Now a made-up score table for two tokens from a promoter:
  #v(2pt)
  #align(center, blank-matrix(rows: 2, cols: 2, cw: 0.5in, ch: 0.34in,
    row-labels: ([query TATA], [query ATG]), col-labels: ([key TATA], [key ATG]),
    filled: ("0,0": [4], "0,1": [5], "1,0": [1], "1,1": [3])))

  #ask[In words, what is the 5 saying, and what is the 1 saying?]
  #work(0.6in)

  #ask[An $X X^T$ table could never look like this one. So where does the lopsidedness have to come from? A guess is fine, it's tomorrow's topic.]
  #work(0.5in)
]
#pagebreak()

#kicker(color: accent)[Wrap up, 2 min]
#takeaway(room: 2in)[In a sentence or two: why does the score table need $K^T$ and not $K$?]

#next-up(5)[Where queries and keys come from: one embedding, two different matrices, and why that breaks the symmetry.]
