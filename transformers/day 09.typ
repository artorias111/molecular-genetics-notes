#import "/design.typ": *
#show: sheet.with(day: 9, topic: "the whole model, next-base probabilities")

#let node(body, hot: false) = box(width: 1.6in, inset: (x: 6pt, y: 5pt), radius: 4pt,
  fill: if hot { accent } else { white }, stroke: 0.8pt + accent,
  align(center, text(size: 9pt, weight: 600, fill: if hot { white } else { ink }, body)))
#let addnode = box(width: 1.6in, align(center, box(inset: (x: 6pt, y: 2pt), radius: 8pt, stroke: 0.8pt + pop,
  text(size: 8.5pt, weight: 600, fill: pop)[\+ add the input back])))
#let note(body) = text(size: 8.5pt, fill: muted, body)
#let down = box(width: 1.6in, align(center, text(size: 9pt, fill: muted)[↓]))
#let row-grid(..cells) = grid(columns: (1.6in, 1fr), column-gutter: 12pt, row-gutter: 3pt,
  align: (center + horizon, left + horizon), ..cells)

#cover(
  day: 9,
  title: [The whole machine],
  subtitle: [You've been doing pieces of a transformer for a week without seeing the whole thing. So today, the map: what each box does and why it's there. Then the last box, where the model turns numbers into a guess for the next base.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([embed], [score q · k], [softmax], [mix values], [output]),
  now: 4,
)

#text(font: serif, size: 14pt, weight: 700)[The map, for a model reading DNA]
#source[Bishop & Bishop | §12.1.7 Transformer layers, Fig. 12.9, PDF p. 386, printed p. 370 | §12.3.1 Decoder transformers, Eq. 12.33, Fig. 12.15, PDF p. 399-400, printed p. 383-384]

#row-grid(
  node[G A T T A C], note[six bases in, one token each],
  down, [],
  node[embed: one-hot times $E$], note[each base becomes a row of $d$ numbers. $X$ is $6 times d$, one row per position (day 6)],
  down, [],
)
#block(width: 100%, inset: (x: 0pt, y: 6pt), radius: 6pt, fill: tint, stroke: 0.6pt + soft)[
  #pad(left: 6pt, text(size: 8.5pt, weight: 600, fill: accent)[one transformer layer, stacked 12 times in a model the size of DNABERT])
  #v(-2pt)
  #row-grid(
    node[attention], note[each position looks at every earlier position and pulls in what it needs (no peeking ahead, the mask is day 18). The only step where positions talk],
    addnode, note[the layer adds an edit on top, it doesn't overwrite],
    node[MLP], note[a small neural net run on each row on its own],
    addnode, note[out comes $6 times d$ again, so the next layer fits],
  )
]
#row-grid(
  down, [],
  node(hot: true)[last row times $W_"out"$], note[$d$ numbers become 4 scores, one per base. In training every row gets this, one guess per position],
  down, [],
  node(hot: true)[softmax], note[$p(A), p(C), p(G), p(T)$, the guess for base 7],
)
#v(2pt)
#aside[Two things left out for now: layer norm (day 15) and how the model knows positions (day 20).]
#pagebreak()

#text(font: serif, size: 14pt, weight: 700)[Why the boxes look like that]

#define[Q, K and V][Inside attention, each row $x$ of $X$ gets multiplied by three matrices. $q = x W_Q$ is what this position is looking for. $k = x W_K$ is what it advertises to others. $v = x W_V$ is what it hands over if someone picks it. Position $i$ scores every position $j$ with $q_i dot k_j$, divides by $sqrt(d)$ (here $q$ and $k$ have $d$ numbers too), softmaxes, and its output is the weighted average of the $v_j$. So why three and not just $x$ for everything? Days 4 and 5: with $x$ alone the score table is symmetric, $i$ against $j$ is always the same as $j$ against $i$. And what you match on shouldn't have to be the same as what you pass along.]

#define[MLP][Attention only ever makes weighted averages of value vectors, so it can mix things but not do much to them. The MLP (multilayer perceptron) is a little two-layer network with a nonlinearity, applied to each position separately. So attention moves information between positions, and the MLP is where each position does something with what it got.]

#define[Adding the input back][Each sublayer computes $X + "attention"(X)$, not just $"attention"(X)$. This is a *residual connection*. So the original base is still in there after every layer (and it turns out deep stacks train much better like this).]

#define[Categorical distribution][A probability for each of $K$ outcomes, all $>= 0$, adding up to 1. For DNA, $K = 4$. Say the model says $p = (0.4, 0.1, 0.1, 0.4)$ for A, C, G, T. Draw 10 bases from it and you'd expect about 4 A's. Bishop calls it the multinomial with one draw, Eq. 3.14 (§3.1.3, PDF p. 87, printed p. 68).]
#pagebreak()

#task(kind: "see", minutes: 4, title: [Reading the map],
  src: [Bishop & Bishop | §12.1.7 Transformer layers, Fig. 12.9 | PDF p. 386 | printed p. 370 | day 05 and 06])[
  Same sequence as the map, GATTAC, with $d = 8$ and 12 layers.

  #ask[What's the shape of $X$ going into layer 1? And coming out of layer 12?]
  #work(0.8in)

  #ask[Position 6 (the C) wants to pull information from position 2 (the A). Which of position 6's three vectors goes into the score? Which of position 2's? And which vector of position 2 actually gets handed over?]
  #work(1.1in)

  #ask[If you deleted the MLP boxes, what could the model still do, and what would it lose? A rough guess is fine.]
  #work(1.2in)
]
#pagebreak()

#task(kind: "do", minutes: 7, title: [The last box],
  src: [Bishop & Bishop | §12.3.1 Eq. 12.33 | PDF p. 399 | printed p. 383 | §3.1.3 Eq. 3.14 | PDF p. 87 | printed p. 68 | made-up scores])[
  The vector at the last position is a $1 times 8$ row. It gets multiplied by $W_"out"$ to give one score per base.

  #ask[What shape is $W_"out"$, how many numbers are stored in it, and how many scores come out?]
  #work(0.6in)

  #ask[Say the scores come out like the table. Fill in the last two columns.]
  #{
    set text(size: 9.5pt)
    let h(x) = text(size: 8pt, fill: accent, weight: 600, x)
    table(
      columns: (0.6in, 0.9in, 1fr, 1fr),
      rows: (auto, 0.38in, 0.38in, 0.38in, 0.38in, 0.38in),
      align: center + horizon,
      stroke: (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none }),
      fill: (x, y) => if x > 1 and y > 0 { tint } else { none },
      inset: (x, y) => if y == 5 { 4pt } else { 5pt },
      table.header(h[next base], h[score], h[exp of the score], h[probability = this exp / sum of all four exps]),
      [A], [$ln 4$], [], [],
      [C], [$ln 2$], [], [],
      [G], [$0$], [], [],
      [T], [$ln 2$], [], [],
      [], align(right, text(size: 8pt, fill: muted)[sums]), align(left + top, text(size: 7.5pt, fill: muted)[sum of the four exps]), align(left + top, text(size: 7.5pt, fill: muted)[all four probabilities added up]),
    )
  }

  #ask[The model samples base 7 from these probabilities, 900 separate times. About how many of the 900 come out G?]
  #v(2pt)
  #align(right, slot(w: 1.2in))

  #ask[Now crank A's score way up while C, G and T stay put. Where does $p(A)$ head? Where do the other three go?]
  #work(0.7in)
]
#pagebreak()

#task(kind: "use", minutes: 6, title: [Training on a sequence],
  src: [Bishop & Bishop | §12.3.1 Decoder transformers | PDF p. 399 | printed p. 383 | made-up probabilities])[
  So where do the weights in $E$, $W_Q$, $W_K$, $W_V$, the MLPs and $W_"out"$ come from? The model reads real DNA and, at every position, guesses the next base. The real next base is the answer it gets checked against. Take the sequence GATTACA.

  #ask[Fill in what the model has seen at each step and the base it should predict.]
  #{
    set text(size: 9.5pt)
    let h(x) = text(size: 8pt, fill: accent, weight: 600, x)
    table(
      columns: (0.5in, 1fr, 1fr),
      rows: (auto, 0.32in, 0.32in, 0.32in, 0.32in, 0.32in, 0.32in),
      align: center + horizon,
      stroke: (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none }),
      fill: (x, y) => if x > 0 and y > 1 { tint } else { none },
      table.header(h[step], h[bases the model has seen so far], h[base it should predict next]),
      [1], [G], [A],
      [2], [], [],
      [3], [], [],
      [4], [], [],
      [5], [], [],
      [6], [], [],
    )
  }

  #ask[From one sequence 1,000 bases long, how many next-base guesses can you check?]
  #v(2pt)
  #align(right, slot(w: 1.2in))

  #ask[The model's probability on the right answer was 0.25 at step 1, 0.5 at step 4 and 0.9 at step 6. Which step is it doing worst on, and which way should training push that number? (Tomorrow this becomes a loss.)]
  #work(0.7in)

  #ask[If tokens were 3-mers (AAA, AAC, ... TTT) instead of single bases, how many probabilities would come out at each position, and how many numbers would $W_"out"$ hold with $d = 8$?]
  #work(0.6in)
]
#pagebreak()

#kicker(color: accent)[Wrap up, 2 min]
#takeaway(room: 2in)[In two or three sentences: follow GATTAC from letters to a probability for the next base. What does attention do on the way, and what does the MLP do?]

#next-up(10)[Turning "the right answer only got 0.25" into a number to minimize: cross-entropy, negative log-likelihood and perplexity.]
