#import "/design.typ": *
#show: sheet.with(day: 5, topic: "where queries and keys come from")

#let shape-box(r, c, name, u: 0.13in, fill: tint) = align(center + bottom, stack(dir: ttb, spacing: 4pt,
  rect(width: c * u, height: r * u, fill: fill, stroke: 0.8pt + accent, radius: 1.5pt),
  text(size: 9pt)[#name]))

#cover(
  day: 5,
  title: [Queries and keys],
  subtitle: [So far I've just handed you queries and keys. In a real model each token only has one embedding, and the query and the key are both made from it.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([embed], [score q · k], [softmax], [mix values], [output]),
  now: 1,
)
#text(font: serif, size: 14pt, weight: 700)[One embedding, two matrices]
#source[Bishop & Bishop, Deep Learning | §12.1.4 Network parameters, Eqs. 12.8-12.11 | PDF p. 380 | printed p. 364]

#define[Making a query and a key][Each token has an embedding $x$, written as a row. Multiply it by one learned matrix and you get its query, by another and you get its key:
  #v(2pt)
  $ q = x W_Q quad quad k = x W_K $
  #v(2pt)
  Since $x$ is a row, it goes on the left, and each number in $q$ is $x$ dotted with one column of $W_Q$. A tiny one, with $x = (1, 2)$:
  #v(2pt)
  $ x W_Q = (1, 2) mat(1, 1; 0, 1) = (1, 3) quad quad x W_K = (1, 2) mat(1, 0; 1, 0) = (3, 0) $
  #v(2pt)
  So the same token gives two different vectors. Stack every token's embedding as rows of $X$ and you get all of them at once, $Q = X W_Q$ and $K = X W_K$. The same two matrices get used for every token in every sequence.]

#define[Why two matrices and not one][If $W_Q = W_K$, every token's query is the same as its key, and the table comes out symmetric again, like day 4's $X X^T$: the score of $i$ against $j$ always equals $j$ against $i$. With two different matrices, a token's query can go looking for something in another token's key without the reverse being true.]

#v(4pt)
#aside[Bishop's example: every chisel is a tool, but most tools aren't chisels.]
#pagebreak()

#task(kind: "see", minutes: 3, title: [Follow the shapes],
  src: [Bishop & Bishop | §12.1.4, text after Eq. 12.12 | PDF p. 380 | printed p. 364])[
  A sequence with 6 tokens, each embedding 4 numbers long. The query and key matrices each turn 4 numbers into 2. Here they are drawn to scale, one square per number:
  #v(4pt)
  #align(center, grid(columns: 3, column-gutter: 16pt, align: bottom,
    shape-box(6, 4, [$X$, $6 times 4$]),
    shape-box(4, 2, [$W_Q$, $4 times 2$]),
    shape-box(4, 2, [$W_K$, $4 times 2$]),
  ))
  #v(4pt)

  #ask(answer: slot(w: 0.9in))[What shape are $Q = X W_Q$ and $K = X W_K$?]
  #v(2pt)
  #ask[Day 4's 1(b) again, now with these shapes. What shape is $Q^T K$? Write out the two shapes being multiplied first.]
  #work(0.6in)
]
#pagebreak()

#task(kind: "do", minutes: 7, title: [Same tokens, lopsided scores],
  src: [Bishop & Bishop | §12.1.4 Eqs. 12.10, 12.11, 12.13 | PDF p. 380 | printed p. 364 | made-up embeddings and weights])[
  Two tokens from a promoter, a CAAT box and a GC box, with made-up embeddings. The weights are made up too, a real model would learn them.
  #v(2pt)
  #align(center, grid(columns: 3, column-gutter: 22pt, align: horizon,
    grid(columns: 2, column-gutter: 6pt, align: horizon, $display(X = mat(1, 2; 1, 0))$, text(size: 9pt, fill: muted)[CAAT \ GC]),
    $display(W_Q = mat(2, 0; 0, 1))$,
    $display(W_K = mat(0, 1; 1, 0))$,
  ))

  #ask[Work out $Q = X W_Q$ and $K = X W_K$.]
  #grid(columns: (auto, auto, 1fr), column-gutter: 14pt, align: horizon,
    [#text(size: 9pt, fill: muted)[$Q$] #blank-matrix(rows: 2, cols: 2, cw: 0.45in, ch: 0.34in, row-labels: ([CAAT], [GC]))],
    [#text(size: 9pt, fill: muted)[$K$] #blank-matrix(rows: 2, cols: 2, cw: 0.45in, ch: 0.34in)],
    work(0.95in, label: [working]))

  #ask[Now the score table $S = Q K^T$. Rows are queries, columns are keys.]
  #grid(columns: (auto, 1fr), column-gutter: 12pt, align: horizon,
    blank-matrix(rows: 2, cols: 2, cw: 0.5in, ch: 0.36in, row-labels: ([query CAAT], [query GC]), col-labels: ([key CAAT], [key GC])),
    work(0.95in, label: [working]))

  #ask[Which token pays more attention to the other, going by $S$?]
  #work(0.45in)

  #ask[Say the model had used $W_Q$ for both, so $K = Q$. Work out just the two off-diagonal entries of $Q Q^T$. What happened to the lopsidedness?]
  #work(0.8in)
]
#pagebreak()

#task(kind: "use", minutes: 5, title: [Why not just learn the scores?],
  src: [Bishop & Bishop | §12.1.4, PDF p. 380, printed p. 364 | Evo 2: Brixi et al. 2026, Nature (1M token context)])[
  The model never learns the score table itself. It only learns $W_Q$ and $W_K$, and the table gets rebuilt for every new sequence.

  #ask[Say embeddings have 64 numbers and queries and keys have 16, so $W_Q$ and $W_K$ are each $64 times 16$. How many numbers is that, for the two together?]
  #work(0.55in)

  #ask[Evo 2 can read about a million bases in one go, one token per base. If every layer were plain attention over all of it, how many entries would one score table have? (Spoiler for day 25: this is part of why Evo 2 isn't all attention.)]
  #work(0.55in)

  #ask[So why learn $W_Q$ and $W_K$ instead of learning the scores directly? There's more than one reason, one is enough.]
  #work(0.8in)
]
#pagebreak()

#kicker(color: accent)[Wrap up, 2 min]
#takeaway(room: 2in)[In two or three sentences: where do $Q$ and $K$ come from (include the shapes), and why does it matter that $W_Q$ and $W_K$ are different matrices?]

#next-up(6)[Embeddings: a one-hot vector times a matrix just picks out a row, plus length and cosine.]
