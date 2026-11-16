#import "/design.typ": *
#show: sheet.with(day: 8, topic: "shift, temperature and √d")

#let axes(w: 3.2in, h: 1.3in) = {
  let xs = (0, 1, 2, 3, 4)
  let ys = ((0.5, [0.5]), (0.75, [0.75]), (1, [1]))
  let px(x) = x / 4 * w
  let py(y) = (1 - y) / 0.5 * h
  box(width: w + 0.5in, height: h + 0.6in, inset: (left: 0.4in, top: 0.18in), {
    for (y, lab) in ys {
      place(top + left, line(start: (0pt, py(y)), end: (w, py(y)), stroke: 0.4pt + line-c))
      place(top + left, dx: -0.36in, dy: py(y) - 5pt, box(width: 0.3in, align(right, text(size: 8pt, fill: muted, lab))))
    }
    for x in xs {
      place(top + left, line(start: (px(x), 0pt), end: (px(x), h), stroke: 0.4pt + line-c))
      place(top + left, dx: px(x) - 6pt, dy: h + 3pt, box(width: 12pt, align(center, text(size: 8pt, fill: muted)[#x])))
    }
    place(top + left, line(start: (0pt, 0pt), end: (0pt, h), stroke: 0.9pt + muted))
    place(top + left, line(start: (0pt, h), end: (w, h), stroke: 0.9pt + muted))
    place(top + left, dx: w / 2 - 0.6in, dy: h + 15pt, box(width: 1.2in, align(center, text(size: 8.5pt, fill: muted)[temperature $T$])))
    place(top + left, dx: -0.4in, dy: -14pt, text(size: 8.5pt, fill: muted)[weight on A])
  })
}

#cover(
  day: 8,
  title: [Turning the knob],
  subtitle: [Yesterday exp turned a gap of 4 between two scores into a weight ratio of 55. Today: what happens if you move all the scores together, how to make the weights sharper or flatter, and why attention divides every score by $sqrt(d)$.],
  minutes: [about 20 min, stop at 25],
  pipeline: ([embed], [score q · k], [softmax], [mix values], [output]),
  now: 2,
)
#text(font: serif, size: 14pt, weight: 700)[Three things you can do to scores]
#source[Bishop & Bishop, Deep Learning | §12.1.3 Eq. 12.5, PDF p. 379, printed p. 363 | §12.1.5 Scaled self-attention, Eq. 12.14, PDF p. 382, printed p. 366]

#define[Shift][Add the same number $c$ to every score and the weights don't move. Every $e^(s_i)$ becomes $e^c e^(s_i)$, and the $e^c$ is on the top and in every term of the bottom, so it cancels. Scores $(1, 0)$ and $(11, 10)$ give the same weights.]

#define[Temperature][Divide every score by a number $T$ before the softmax. This one does change the weights. With scores $(2, 0)$ and $T = 2$ you get $(1, 0)$: the gap shrank from 2 to 1, so the weights get closer to even. $T$ below 1 makes the gap bigger instead.]

#define[Dividing by $sqrt(d)$][Real attention doesn't feed $Q K^T$ straight into the softmax. It uses
  #v(2pt)
  $ "softmax"((Q K^T) / sqrt(d)) $
  #v(2pt)
  where $d$ is how many numbers are in each query and key. Task 3 is about why.]

#v(2pt)
#aside[One log rule for today: $k ln a = ln(a^k)$. So $3 ln 2 = ln 8$.]
#pagebreak()

#task(kind: "see", minutes: 3, title: [Shift it],
  src: [Bishop & Bishop | §12.1.3 Eq. 12.5 | PDF p. 379 | printed p. 363 | day 05 and 07 numbers])[
  On day 7, query CAAT had scores $(6, 2)$ and the weights came out $55 slash 56$ and $1 slash 56$.

  #ask[Without working anything out, what are the weights for scores $(104, 100)$? And for $(0, -4)$?]
  #work(0.8in)

  #ask[A computer can't store $e^1000$, it overflows to infinity. For scores $(1000, 996)$, what number would you subtract from both before taking exp, so nothing overflows? What's the biggest exp you'd have to compute after that?]
  #work(1in)
]
#pagebreak()

#task(kind: "do", minutes: 7, title: [Sharper or flatter],
  src: [Bishop & Bishop | §12.3.2 Sampling strategies, Eq. 12.35 | PDF p. 403 | printed p. 387 | made-up scores])[
  Two keys, A and B. Their scores are $ln 4$ and $0$, so at $T = 1$ the exps are 4 and 1 and A gets $4 slash 5$.

  #ask[Fill in the table. B's score stays 0 at every $T$, so its exp is always 1.]
  #{
    set text(size: 9.5pt)
    let h(x) = text(size: 8pt, fill: accent, weight: 600, x)
    table(
      columns: (0.75in, 1fr, 1fr, 1fr),
      rows: (auto, 0.38in, 0.38in, 0.38in, 0.38in, 0.38in),
      align: center + horizon,
      stroke: (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none }),
      fill: (x, y) => if x > 0 and y > 0 { tint } else { none },
      table.header(h[$T$], h[A's score divided by $T$, written as $ln$ of a number], h[exp of that (A's exp)], h[weight on A = A's exp / (A's exp + 1)]),
      [$1 slash 2$], [], [], [],
      [$1$], [$ln 4$], [$4$], [$4 slash 5$],
      [$2$], [], [], [],
      [very big], [close to 0], [], [],
      [close to 0], [very big], [], [],
    )
  }

  #ask[Plot your weights for $T = 1 slash 2$, 1 and 2, then sketch the rest of the curve out to $T = 4$, using your last two rows to decide where it heads at each end.]
  #align(center, axes())

  #ask[A DNA language model writes one base at a time, picking it at random with softmax weights over scores for A, C, G and T. What would the sequences look like with $T$ close to 0? With very big $T$?]
  #work(0.75in)
]
#pagebreak()

#task(kind: "use", minutes: 6, title: [Why divide by $sqrt(d)$],
  src: [Bishop & Bishop | §12.1.5 Scaled self-attention, Eq. 12.14, Exercise 12.4 | PDF p. 382 | printed p. 366 | made-up vectors])[
  Say every number in a query or key is a random $+1$ or $-1$, each picked independently, like a coin flip. A score $q dot k$ is then a sum of $d$ terms, each $+1$ or $-1$.

  #ask[With $d = 4$, $q = (1, 1, -1, 1)$ and $k = (1, -1, -1, 1)$, what's $q dot k$? What's the biggest a score could possibly be with $d = 4$? With $d = 64$?]
  #work(0.6in)

  Most terms cancel, so scores rarely reach that maximum. Bishop points out that with independent random numbers like these, scores typically land within about $plus.minus sqrt(d)$ of 0 (Exercise 12.4 has you show why). With $d = 64$, that's $plus.minus 8$, so a gap of 8 between two keys is ordinary.

  #ask[Two keys score $(8, 0)$. Work out the weight on the winner, using $e^8 approx 3000$. Then divide both scores by $sqrt(64) = 8$ first and do it again, using $e^1 approx 2.7$.]
  #work(1in)

  #ask[Dividing by $sqrt(d)$ is softmax at which temperature?]
  #v(2pt)
  #align(right, slot(w: 1.2in))

  #ask[A model learns by nudging $W_Q$ and $W_K$ a little and seeing how the weights change. If the winner's weight is already $0.9997$, why might small nudges barely do anything? A guess is fine, gradients come on day 14.]
  #work(0.7in)
]
#pagebreak()

#kicker(color: accent)[Wrap up, 2 min]
#takeaway(room: 2in)[In two or three sentences: what does adding a number to every score do to the weights, what does dividing by $T$ do, and why does attention divide by $sqrt(d)$?]

#next-up(9)[Softmax weights as probabilities: the categorical distribution and predicting the next base.]
