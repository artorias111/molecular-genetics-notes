#import "/design.typ": *
#show: sheet.with(day: 6, topic: "embeddings, length and cosine")

#cover(
  day: 6,
  title: [Embeddings],
  subtitle: [Every sheet so far started with token vectors already in hand. So where do they come from? For DNA it starts with four letters and a lookup table.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([embed], [score q · k], [softmax], [mix values], [output]),
  now: 0,
)
#text(font: serif, size: 14pt, weight: 700)[From letters to vectors]
#source[Bishop & Bishop, Deep Learning | §12.2 Natural language, §12.2.1 Word embedding, Eq. 12.26 | PDF p. 391 | printed p. 375]

#define[One-hot][Put the bases in a fixed order, (A, C, G, T). A base becomes a vector of four numbers with a 1 in its own spot and 0 everywhere else, so C is $(0, 1, 0, 0)$. It's honest but dumb: every base is equally far from every other, and nothing about it is learned.]

#define[The embedding table][So instead, a model keeps a table $E$ with one row per base, and those rows get learned. Multiply a one-hot row by $E$ and the 1 picks out that base's row, every other row gets multiplied by 0:
  #v(2pt)
  $ (0, 1, 0, 0) mat(5, 1; 2, 3; 0, 4; 1, 1) = (2, 3) $
  #v(2pt)
  Stack a whole sequence's one-hots as rows and one product gives you $X$, one row per position. That's the $X$ that went into $Q = X W_Q$ on day 5.

  How many numbers does $E$ hold? Rows times columns, here $4 times 2 = 8$. That's a different thing from how many numbers come out when you multiply by it (2 here).]

#pagebreak()

#task(kind: "see", minutes: 3, title: [A lookup is a product],
  src: [Bishop & Bishop | §12.2.1 Eq. 12.26 | PDF p. 391 | printed p. 375 | made-up table])[
  Here's a made-up embedding table, two numbers per base. The plot shows the rows as arrows.
  #v(2pt)
  #align(center, grid(columns: 2, column-gutter: 0.4in, align: horizon,
    grid(columns: 2, column-gutter: 6pt, align: horizon, $display(E = mat(3, 4; -2, 0; 0, 2; 4, 3))$, text(size: 9pt, fill: muted)[A \ C \ G \ T]),
    vec-plot(x0: -3, x1: 5, y0: -1, y1: 5, u: 0.21in, vecs: ((3, 4, [A], accent), (-2, 0, [C], accent), (0, 2, [G], pop), (4, 3, [T], accent))),
  ))

  #ask[What's the one-hot vector for G?]
  #v(2pt)
  #align(right, slot(w: 1.4in))

  #ask[Work out (one-hot for G) times $E$. Which part of $E$ did you get back?]
  #work(0.6in)

  #ask[Bishop writes this as $v = E x$, with $E$ having one *column* per word, and $x$ as a column. How is his $E$ related to ours?]
  #work(0.45in)
]
#pagebreak()

#task(kind: "do", minutes: 6, title: [Embed a sequence, count the table],
  src: [Bishop & Bishop | §12.2.1, PDF p. 391, printed p. 375 | DNABERT: Ji et al. 2021, BERT-base, 768 hidden units | same made-up $E$])[
  Take the three bases #raw("GAT"), with the same $E$ as the last page.

  #ask[Fill in the one-hot rows for #raw("GAT"), one row per position.]
  #align(center, blank-matrix(rows: 3, cols: 4, cw: 0.42in, ch: 0.32in, row-labels: ([G], [A], [T]), col-labels: ([A], [C], [G], [T])))

  #ask[Now $X$ = (that one-hot matrix) times $E$. You shouldn't need to multiply anything.]
  #grid(columns: (auto, 1fr), column-gutter: 12pt, align: horizon,
    blank-matrix(rows: 3, cols: 2, cw: 0.5in, ch: 0.34in, row-labels: ([G], [A], [T])),
    work(0.9in, label: [working]))

  #ask[A real single-base DNA model might use 768 numbers per embedding. Its $E$ has a row for each of A, C, G, T (ignore special tokens). How many numbers does $E$ hold?]
  #work(0.5in)

  #ask[DNABERT-6 uses 6-mers as tokens instead, so there's a row for every possible 6-mer (how many 6-letter strings can you make from 4 letters?). With the same 768 per row and again ignoring special tokens, how many numbers does its $E$ hold? You can leave it as a product.]
  #work(0.6in)
]
#pagebreak()

#task(kind: "use", minutes: 6, title: [Length versus direction],
  src: [Bishop & Bishop | §12.1.3, Eq. 12.5, PDF p. 379, printed p. 363 | tutor example, same made-up $E$])[
#define[Cosine][Way back on day 1 a dot product got big for two reasons, direction and length. Divide out the lengths $|a|$ and $|b|$ and only direction is left:
  #v(2pt)
  $ cos(a, b) = (a dot b) / (|a| |b|) $
  #v(2pt)
  It's 1 when they point the same way and 0 at a right angle ($-1$ if they're opposite), and the lengths don't matter.]

  Back to the arrows in task 1. A and T are both length 5, and G is length 2.

  #ask[Just from the plot, which two bases point most alike? Which two are at a right angle?]
  #work(0.5in)

  #ask[Work out $cos(A, T)$ and $cos(A, G)$.]
  #work(0.9in)

  #ask[A new key shows up, $L = (10, 0)$. Against A, does L beat T by dot product? Does it beat T by cosine?]
  #work(0.9in)

  #ask[Attention scores use dot products, so attention would go with L. When could that be useful to a model, and when could it be a problem?]
  #work(0.6in)
]
#pagebreak()

#kicker(color: accent)[Wrap up, 2 min]
#takeaway(room: 2in)[In two or three sentences: what does a one-hot vector times $E$ do, and what does cosine ignore that a dot product doesn't?]

#next-up(7)[New block: probability. exp, log and softmax, turning scores into weights that add to 1.]
