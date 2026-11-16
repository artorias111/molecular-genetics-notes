#import "/design.typ": *
#show: sheet.with(day: 1, topic: "dot products")

#cover(
  day: 1,
  title: [Dot products as similarity scores],
  subtitle: [Before softmax, before anything fancy, attention needs a number for how well two tokens match. That number is a dot product.],
  minutes: [about 18 min, stop at 25],
  pipeline: ([embed], [score q · k], [softmax], [mix values], [output]),
  now: 1,
)
#text(font: serif, size: 14pt, weight: 700)[How much do these two match?]
#source[Bishop & Bishop, Deep Learning | §12.1.3 Self-attention, Eqs. 12.5–12.6 | PDF pp. 378–379 | printed pp. 362–363]

#define[Vectors and dot products][Each token gets a list of numbers, its *embedding* (2 or 3 numbers here, hundreds to thousands in real models). For a dot product, multiply the matching entries and add them up. You get one number back. \
  For $a = (1, 3)$ and $b = (2, -1)$: #h(3pt) $a dot b = 1 dot 2 + 3 dot (-1) = -1$. \
  A vector's *length* is $|a| = sqrt(a dot a)$, so for $a = (1, 3)$ that's $sqrt(10) approx 3.16$.]

#define[The picture][Geometrically, $a dot b = |a| |b| cos theta$, with $theta$ the angle between them. Pointing the same way gives a big positive number, at right angles it's zero, and past 90° it goes negative.]

#v(2pt)
#align(center, grid(columns: 3, column-gutter: 0.35in, row-gutter: 4pt, align: center,
  vec-plot(x0: 0, x1: 3, y0: 0, y1: 2, u: 0.18in, show-grid: false, vecs: ((3, 1, [], pop), (2, 1.5, [], accent))),
  vec-plot(x0: -1, x1: 3, y0: 0, y1: 2, u: 0.18in, show-grid: false, vecs: ((3, 0, [], pop), (0, 2, [], accent))),
  vec-plot(x0: -3, x1: 3, y0: -1, y1: 1, u: 0.18in, show-grid: false, vecs: ((3, 0.5, [], pop), (-2.5, -0.4, [], accent))),
  text(size: 8pt, fill: muted)[big, positive],
  text(size: 8pt, fill: muted)[zero],
  text(size: 8pt, fill: muted)[negative],
))
#v(2pt)

#define[Where attention comes in][Attention's first guess at "how relevant is token $m$ to token $n$" is a dot product between them (of the raw embeddings, for now, this changes on day 5). We call it the *score*. The token doing the asking is the *query* $q$, and the ones it checks against are the *keys* $k$.]

#define[All of them at once][Doing this one pair at a time gets old fast. Stack the queries as rows of $Q$ and the keys as rows of $K$, and $S = Q K^T$ gives you every score in one go. Row $i$, column $j$ of $S$ is just (row $i$ of $Q$) $dot$ (row $j$ of $K$).]

#place(bottom + right, dy: 0.32in, rotate(-1.5deg, text(font: hand, size: 13pt, fill: accent)[Honestly, most of attention is this plus some bookkeeping.]))
#pagebreak()

#task(kind: "see", minutes: 5, title: [Direction isn't everything],
  src: [Bishop & Bishop | §12.1.3 Self-attention, Eq. 12.5 | PDF p. 379 | printed p. 363 | tutor example])[
  Here's a query $q = (2, 1)$ and four keys. Each grid square is 1 unit.

  #v(4pt)
  #align(center, grid(columns: 2, column-gutter: 0.3in, align: bottom,
    vec-plot(x0: -1, x1: 3, y0: -2, y1: 3, u: 0.27in, vecs: ((2, 1, [q], pop),)),
    vec-plot(x0: -3, x1: 5, y0: -2, y1: 3, u: 0.27in, vecs: ((4, -1, [A], accent), (2, 1, [B], accent), (-1, 2, [C], accent), (-2, -1, [D], accent))),
  ))
  #align(center, text(size: 8.5pt, fill: muted)[A = (4, −1) #h(8pt) B = (2, 1) #h(8pt) C = (−1, 2) #h(8pt) D = (−2, −1)])

  #ask(answer: slot(w: 0.55in))[Just by looking, which key points the exact same way as $q$?]

  #ask(answer: slot(w: 0.55in))[Still just looking, which one do you think gets the biggest $q dot k$?]

  #ask[Now actually compute all four.]
  #v(2pt)
  #align(center, grid(columns: 4, column-gutter: 14pt, align: center,
    [$q dot A =$ #slot()], [$q dot B =$ #slot()], [$q dot C =$ #slot()], [$q dot D =$ #slot()]))
  #work(0.95in, label: [working])

  #ask[B points exactly along $q$, but it doesn't win. Work out $|A|$ and $|B|$. What else, besides direction, decides how big a dot product gets?]
  #work(1.1in)
]
#pagebreak()

#task(kind: "do", minutes: 5, title: [Score a sentence],
  src: [Bishop & Bishop | §12.1.3 Self-attention, Eq. 12.5 | PDF p. 379 | printed p. 363 | toy embeddings, made up])[
  Take the sentence *the enzyme cut DNA*. I made up a 3-number embedding for each token: how much it's a protein, how much it's a nucleic acid, and how much it's an action.

  The query is *cut* $= (1, 0, 2)$. Let's score every token against it.

  #v(4pt)
  #{
    set text(size: 9.5pt)
    let h(x) = text(size: 8pt, fill: accent, weight: 600, x)
    table(
      columns: (0.8in, 0.62in, 0.62in, 0.62in, 1fr),
      rows: (auto, 0.36in, 0.36in, 0.36in, 0.36in),
      align: (left + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
      stroke: (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none }),
      fill: (x, y) => if x == 4 and y > 0 { tint } else { none },
      table.header(h[key token], h[protein], h[nucleic acid], h[action], h[score with cut = protein×1 + nucleic×0 + action×2]),
      [enzyme], [2], [0], [1], [],
      [cut], [1], [0], [2], [],
      [DNA], [0], [2], [1], [],
      [the], [0], [0], [0], [],
    )
  }

  #ask[Fill in the shaded score column.]
  #work(0.75in, label: [working])

  #ask[Make up a new token (any word, any 3 numbers) that scores *negative* against cut. What's its embedding, and what's its score?]
  #work(0.75in)

  #ask[*the* is $(0, 0, 0)$. Why does it score 0 against every possible query? One sentence is enough.]
  #work(0.8in)
]
#pagebreak()

#task(kind: "use", minutes: 6, title: [Every score in one matrix],
  src: [Bishop & Bishop | §12.1.3 Eq. 12.6, PDF p. 379 / printed p. 363 | §12.1.4 Network parameters, PDF p. 380 / printed p. 364])[
  Same embeddings as before, with enzyme back to $(2, 0, 1)$. Now we have two queries and four keys:
  #v(2pt)
  #align(center, text(size: 9pt)[
    queries $Q$: #h(4pt) cut (1, 0, 2) #h(6pt) DNA (0, 2, 1) \
    keys $K$: #h(4pt) enzyme (2, 0, 1) #h(6pt) cut (1, 0, 2) #h(6pt) DNA (0, 2, 1) #h(6pt) the (0, 0, 0)
  ])

  #ask[Each query is a row of $Q$ and each key is a row of $K$. What are the shapes (rows × columns) of $Q$, $K^T$ and $S = Q K^T$?]
  #align(center, grid(columns: 3, column-gutter: 14pt, [$Q$: #slot(w: 0.72in)], [$K^T$: #slot(w: 0.72in)], [$S$: #slot(w: 0.72in)]))

  #ask[Fill in $S$. Each cell is (the row's query) $dot$ (the column's key). You already have the cut row from task 2.]
  #v(2pt)
  #align(center, blank-matrix(rows: 2, cols: 4, cw: 0.62in, ch: 0.4in,
    row-labels: ([query cut], [query DNA]), col-labels: ([enzyme], [cut], [DNA], [the])))
  #work(0.75in, label: [working])

  #ask(answer: slot())[Look up $S$[query cut, key DNA] and $S$[query DNA, key cut]. Same number?]

  #ask[Bishop has a nice example for this. *chisel* should pay a lot of attention to *tool* (every chisel is a tool), but *tool* shouldn't care much about *chisel*. Why can't raw dot products between embeddings ever do that? One sentence.]
  #work(0.9in)
]

#aside[Keep 3(d) in mind, we fix it on day 5.]
#pagebreak()

#kicker(color: accent)[Wrap up, 2 min]
#takeaway(room: 2.2in)[In a sentence: what does a big positive score between a query and a key tell you, and what two things make it big?]

#next-up(2)[Multiplying a matrix by a vector, which turns out to be a bunch of dot products at once.]
