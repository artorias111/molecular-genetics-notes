#import "/design.typ": *
#show: sheet.with(day: 10, topic: "cross-entropy, negative log-likelihood, perplexity")

#let h(x) = text(size: 8pt, fill: accent, weight: 600, x)

#cover(
  day: 10,
  title: [Grading a guess],
  subtitle: [Yesterday the model put 0.25 on the right base at step 1 and 0.9 at step 6. We all know which step was worse, but training needs that as one number it can push down. That number is the loss, and today it's cross-entropy.],
  minutes: [about 18 min, stop at 25],
  pipeline: ([scores], [softmax], [p of the right base], [−ln p], [average]),
  now: 3,
)

#define[Likelihood of a sequence][The model gives a probability to the base that actually came next, at every step. Treat the steps as separate guesses and multiply them. If GATT got $1/2$ for A, then $1/4$ for T, then $1/2$ for T, the whole thing got $1/2 times 1/4 times 1/2 = 1/16$. That product is the *likelihood*. Higher is better, a perfect model gets 1.]

#define[Negative log-likelihood][Multiplying a thousand numbers below 1 gets tiny fast, so we take the log, which turns the product into a sum: $ln(1/16) = ln(1/2) + ln(1/4) + ln(1/2)$. Logs of numbers below 1 are negative, so we flip the sign to get something positive to minimize. Each step adds $-ln p$, where $p$ is what the model gave the right base. Handy here: $-ln(1/2) = ln 2$, $-ln(1/4) = 2 ln 2$, $-ln(1/8) = 3 ln 2$, with $ln 2 approx 0.69$.]

#define[Cross-entropy and perplexity][Divide the sum by the number of steps and you get the *cross-entropy*, the average loss per base. It's the negative log-likelihood of a categorical model, averaged per base, so when PyTorch says `CrossEntropyLoss` this is all it means. *Perplexity* is $e^"cross-entropy"$. It reads as "how many bases the model is choosing between, on average". A model that's sure and right gets perplexity 1.]
#source[CS229 | §2.3 Multi-class classification, NLL and cross-entropy | PDF p. 26-27 | printed p. 25-26 | Bishop & Bishop | §5.4.4 Eq. 5.80 | PDF p. 181 | printed p. 162]
#pagebreak()

#task(kind: "fix", minutes: 3, title: [The last box, one more time],
  src: [Bishop & Bishop | §12.3.1 Eq. 12.33 | PDF p. 399 | printed p. 383 | day 09])[
  Three things from day 9 that tripped you up, before the new stuff. The row at the last position is $1 times 8$, and $W_"out"$ turns it into one score per possible token. With single bases that's 4 scores, so $W_"out"$ is $8 times 4$, since $(1 times 8)(8 times 4)$ gives $(1 times 4)$. The number of columns is however many things you're scoring.

  #ask[Now tokens are 3-mers: AAA, AAC, all the way to TTT. How many different 3-mers are there? So what shape is $W_"out"$ now?]
  #work(0.6in)

  #ask[Position 6 scores position 2. Write the dot product inside that score (before dividing by $sqrt(d)$), using $q$, $k$ and the position numbers.]
  #work(0.5in)

  #ask[Which box mixes information across positions, attention or the MLP? And what does the other one do?]
  #work(0.6in)
]
#pagebreak()

#task(kind: "do", minutes: 7, title: [Loss on a short read],
  src: [CS229 | §2.3 Eq. for the loss | PDF p. 26-27 | printed p. 25-26 | made-up probabilities])[
  Model A reads GATTA and makes four next-base guesses. The table has what it gave the right answer each time.

  #ask[Fill in the last column. Then add it up.]
  #{
    set text(size: 9.5pt)
    table(
      columns: (0.45in, 0.8in, 0.75in, 1fr),
      rows: (auto, 0.31in, 0.31in, 0.31in, 0.31in, 0.31in),
      align: center + horizon,
      stroke: (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none }),
      fill: (x, y) => if x == 3 and y > 0 { tint } else { none },
      table.header(h[step], h[right base], h[p model A gave it], h[−ln p, as a multiple of ln 2 (see page 1)]),
      [1], [A], [$1/2$], [],
      [2], [T], [$1/8$], [],
      [3], [T], [$1/2$], [],
      [4], [A], [$1/8$], [],
      [], [], align(right, text(size: 8pt, fill: muted)[total]), [],
    )
  }

  #ask[Model A gave the whole read $1/2 times 1/8 times 1/2 times 1/8 = 1/256$. What's $-ln(1/256)$ as a multiple of $ln 2$? Does it match your total?]
  #work(0.45in)

  #ask[Model C is lazy and says $1/4$ for every base, every time. What's its cross-entropy (as a multiple of $ln 2$) and its perplexity?]
  #work(0.5in)

  #ask[Compare your model A average with model C. Is A any better? What's going on with A's guesses?]
  #work(0.5in)

  #ask[Model B ends up with cross-entropy exactly $ln 2$. What's its perplexity, and what does that number mean for guessing DNA?]
  #work(0.5in)
]
#pagebreak()

#task(kind: "use", minutes: 5, title: [What the loss rewards],
  src: [CS229 | §2.3 | PDF p. 27 | printed p. 26 | Bishop & Bishop | §5.4.4 | PDF p. 180-181 | printed p. 161-162])[
  #ask[Plot $-ln p$ in units of $ln 2$ at $p = 1, 1/2, 1/4, 1/8$, and join the dots. Then sketch where the curve goes as $p$ gets close to 0.]
  #{
    let u = 0.5in
    let w = 4.4in
    let hh = 1.9in
    box(width: 100%, height: hh + 0.3in, {
      place(dx: 0.35in, dy: 0in, box(width: w, height: hh, fill: dotgrid(soft)))
      place(dx: 0.35in, dy: hh, line(length: w, stroke: 0.8pt + muted))
      place(dx: 0.35in, dy: 0in, line(angle: 90deg, length: hh, stroke: 0.8pt + muted))
      for (p, lab) in ((0, [0]), (0.125, [1/8]), (0.25, [1/4]), (0.5, [1/2]), (1, [1])) {
        let x = 0.35in + p * w
        place(dx: x, dy: hh, line(angle: 90deg, length: 4pt, stroke: 0.8pt + muted))
        place(dx: x - 0.12in, dy: hh + 0.07in, box(width: 0.24in, align(center, text(size: 7.5pt, fill: muted, lab))))
      }
      for k in range(0, 4) {
        let y = hh - k * 0.45in
        place(dx: 0.35in - 4pt, dy: y, line(length: 4pt, stroke: 0.8pt + muted))
        place(dx: 0.05in, dy: y - 0.07in, text(size: 7.5pt, fill: muted)[#k])
      }
      place(dx: 0.35in + w - 0.9in, dy: hh + 0.17in, text(size: 7.5pt, fill: muted)[$p$ on the right base])
      place(dx: 0.45in, dy: -0.02in, text(size: 7.5pt, fill: muted)[$-ln p$ in $ln 2$'s])
    })
  }

  #ask[Back to day 9: step 1 got 0.25. Training pushes the loss down. Which way does that 0.25 move, and what value is it heading for?]
  #work(0.55in)

  #ask[A model is dead sure of the wrong base at one position, so the right base gets $p = 0$. What happens to its loss on that read? Why might we want a loss that punishes this so hard?]
  #work(0.7in)
]
#pagebreak()

#kicker(color: accent)[Write the model, 2 min]
#v(2pt)
#text(size: 9.5pt, fill: muted)[New from today: every sheet ends with the day's model in symbols, then once in plain words. Use $x_1, dots, x_L$ for the bases and $p_t$ for the four probabilities the model gives after reading up to position $t$ (its guess for $x_(t+1)$). The *noise model* is the assumption about how the real data gets drawn from what the model outputs, here how the next base is picked from $p_t$.]
#{
  let line-row(lab, room) = grid(columns: (1.35in, 1fr), column-gutter: 8pt,
    align(right + top, text(size: 8.5pt, fill: accent, weight: 600, lab)),
    block(width: 100%, height: room, radius: 4pt, fill: dotgrid(soft), stroke: 0.5pt + soft))
  v(4pt)
  stack(spacing: 6pt,
    line-row([what we observe], 0.4in),
    line-row([what the model outputs], 0.45in),
    line-row([noise model: how the next base is drawn], 0.45in),
    line-row([the loss it gives], 0.55in),
    line-row([say it to a biologist, one sentence], 0.75in),
  )
}
#aside[Day 15 fills these same lines for squared error. Only the noise model changes.]

#next-up(11)[Leaving sequences for a bit: linear regression, written the way every model after it gets written.]
