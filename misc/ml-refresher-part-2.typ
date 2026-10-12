#import "../template.typ": *
#let source(body) = { set text(size: 7.5pt); ref_box(body) }
#let part(n, title) = { v(0.6em); text(size: 12pt, weight: "bold")[Part #n. #title]; v(0.2em) }
#let slip(body) = block(stroke: (left: 2pt + luma(90)), inset: (left: 8pt, y: 4pt), [*From part 1.* #body])
#let tbl(cols, rows, ..cells) = { set par(justify: false); table(columns: cols, inset: 5pt, stroke: 0.5pt, rows: rows, ..cells) }

#sheet(day: "WB2", title: "sharpening", set_label: "ML refresher part 2")[
#set text(size: 10pt)
#set par(spacing: 0.6em)

*How this works.* Built from your part 1 return. Each part opens with the slip, a short fix, then a fresh question with new numbers. Same running CNN example.

*One sitting, about 25 min.* Items marked _optional_ can be skipped. If stuck for two minutes, mark it and move on.

#source[Spine: Bishop & Bishop, _Deep Learning_. All numbers are tutor-authored. Last page: what to read this week.]

#part(1, "Reordering vs squeezing")
#slip[You wrote `squeeze(-1)` to turn `(64, 200, 4)` into `(64, 4, 200)`.]

`squeeze(d)` only deletes dimension `d` if its size is 1. It never moves data. If that dimension is not size 1, nothing happens.

`permute` reorders dimensions. `x.permute(0, 2, 1)` means: new order is old dim 0, then old dim 2, then old dim 1. `x.transpose(1, 2)` does the same swap.

#question(space: 0.3in, gap: 0.4em)[
Fill in the missing cell in each row.
#tbl((1.2fr, 1.3fr, 1.2fr), (auto, 0.35in, 0.35in, 0.35in, 0.35in),
  [*Input shape*], [*Call*], [*Output shape*],
  [`(64, 200, 4)`], [`permute(0, 2, 1)`], [],
  [`(64, 200, 4)`], [`squeeze(-1)`], [],
  [`(64, 32, 1)`], [`squeeze(-1)`], [],
  [`(8, 4, 200)`], [], [`(8, 200, 4)`],
)
]

#pagebreak()
#part(2, "Softmax only sees differences")
#slip[For logits $(12, 10)$ you pulled $e^10$ out of the top but not the bottom.]

Dividing the top and bottom of a fraction by the same number leaves it unchanged. And $e^12 \/ e^10 = e^(12-10) = e^2$. So:
$ e^12 / (e^12 + e^10) = (e^12 \/ e^10) / (e^12 \/ e^10 + e^10 \/ e^10) = e^2 / (e^2 + 1). $

#source[Bishop §6.4.3 Multiclass classification, Eq.6.37 and the note below it, PDF p.215 / printed p.197.]
#question(space: 0.9in, gap: 0.4em)[
Two classes, logits $(52, 50)$. Use $e^2 = 7.39$.
- Divide top and bottom by $e^50$ and write $P("bound") = e^52 \/ (e^52 + e^50)$ as a fraction with no big exponents.
- Its value?
- One line: what is the only thing about the logits that softmax cares about?
]

#pagebreak()
#part(3, "Picking a loss: one question, not a table")
#slip[Log-TPM and raw counts were swapped, and you asked how to internalize the table instead of copying it.]

Don't memorize the table. Ask one question: *what kind of number is the answer?* The model then gives a probability to every possible answer of that kind. The loss is $-ln$(probability it gave the true answer). Same idea as a genotype likelihood: how surprised was the model by what really happened.

#{
set text(size: 9pt)
tbl((1.9fr, 1fr, 1.3fr), auto,
  [*Kind of number*], [*Distribution*], [*PyTorch*],
  [Any real number, can be fractional or negative (2.37, $-0.8$)], [Gaussian], [`MSELoss`],
  [Yes or no], [Bernoulli], [`BCEWithLogitsLoss`],
  [One of $K$ labels], [Categorical], [`CrossEntropyLoss`],
  [Whole number 0, 1, 2, ... (a count)], [Poisson], [`PoissonNLLLoss`],
)
}
A log changes the kind of number. 37 reads is a count. $log_2(37 + 1) = 5.25$ is just a real number.

Binary targets: `BCEWithLogitsLoss` with 1 logit, or `CrossEntropyLoss` with 2 logits. Same model, both fine. The part 1 CNN used the second.

#source[Bishop §6.4 Error Functions, PDF pp.212–215 / printed pp.194–197. Poisson row is a tutor addition.]

#pagebreak()
#question(space: 0.1in, gap: 0.2em)[
Fill each row. Start with the first column: what does one answer look like?
#{
set text(size: 9pt)
tbl((1.6fr, 1.2fr, 1fr, 1.2fr), (auto, 0.45in, 0.45in, 0.45in, 0.45in, 0.45in),
  [*Target*], [*Kind of number (an example value)*], [*Distribution*], [*PyTorch loss*],
  [(a) ATAC reads in a 500 bp bin], [], [], [],
  [(b) $log_2$ fold change between treatments], [], [], [],
  [(c) cell type: neuron, glia or immune], [], [], [],
  [(d) SNP is a GWAS hit or not], [], [], [],
  [(e) the same ATAC reads after $log(x + 1)$], [], [], [],
)
}
]
#question(space: 0.9in, gap: 0.8em)[
An autoencoder reconstructs one-hot DNA, batch $N$, length $L$. At each site the answer is one of 4 bases.
- Kind of number per site? Which loss?
- Decoder output shape, including $N$?
- In part 1 you picked `MSELoss`. One line: why not?
]

#pagebreak()
#part(4, "Why MSE is bad for classification")
#slip[You said a big logit lowers the loss even when wrong. It is the opposite problem.]

With MSE on a sigmoid, the push on the logit is $(y - t) dot y(1 - y)$. When the model is confidently wrong, $y$ is near 0 (or 1), so $y(1-y)$ is tiny. The push nearly vanishes. The model barely learns from its worst mistakes. Cross-entropy keeps the clean push $y - t$.

#source[Bishop §6.4.2 Binary classification, Eqs.6.31–6.33, PDF p.214 / printed p.196.]
#question(space: 0.3in, gap: 0.4em)[
True label $t = 1$, logit $a = -3$, so $y = sigma(-3) = 0.047$.
#tbl((1fr, 1fr, 1.2fr, 1fr), (auto, 0.4in),
  [*CE push: $y - t$*], [*$y(1-y)$*], [*MSE push: $(y-t) y(1-y)$*], [*CE / MSE*],
  [], [], [], [],
)
- Fill the blanks: "When the model is confidently wrong, $y(1-y)$ is close to #box(width: 0.5in, repeat[\_]), so the MSE push is #box(width: 0.5in, repeat[\_]), and the model learns #box(width: 0.5in, repeat[\_]) from its worst mistakes."
]

#pagebreak()
#part(5, "zero_grad and the learning rate")
Toy model from part 1: $y = w x$, $L = (y - t)^2$, $partial L \/ partial w = 2(y - t)x$. Start $w = 1$, $x = 2$, $t = 3$. So $y = 2$, $L = 1$, gradient $= -4$.

#slip[After a second `backward()` you wrote $-4$. The word "again" was confusing, so here it is as a loop.]

`.grad` is a running total. Each `backward()` adds to it. Only `zero_grad()` resets it to 0.

Picture a buggy loop that skips both `zero_grad()` and `opt.step()`. The weight stays at 1, so each pass computes the same gradient, $-4$.

#source[Bishop §8.1 Evaluation of Gradients, PDF pp.251–252 / printed pp.234–235. `.grad` accumulation is PyTorch behavior, not in Bishop.]
#question(space: 0.5in, gap: 0.4em)[
#tbl((1fr, 1fr, 1fr), (auto, 0.35in),
  [*`.grad` after pass 1*], [*after pass 2*], [*after pass 3*],
  [], [], [],
)
- Now `opt.step()` with $eta = 0.1$ runs after pass 2, using that `.grad`. New $w$? (The correct step gives 1.4.)
]

#question(space: 0.4in, gap: 0.6em)[
Correct gradient, $-4$, but different learning rates. New $w = 1 - eta (-4)$. Start loss was 1.
#tbl((0.8fr, 1fr, 1fr, 1fr), (auto, 0.32in, 0.32in, 0.32in, 0.32in),
  [*$eta$*], [*New $w$*], [*New $y = 2w$*], [*New $L = (y-3)^2$*],
  [0.125], [1.5], [], [],
  [0.25], [], [], [],
  [0.5], [], [], [],
  [1], [], [], [],
)
- Best $eta$? Which ones made the loss go up?
- One line: what does a too-large learning rate do to the loss over many steps?
]

#pagebreak()
#part(6, "Steps and epochs")
#slip[Stochastic was marked 1 step and mini-batch left as $ceil(1000\/64)$. You asked what "one step per epoch" means.]

A *step* is one weight update: one `opt.step()`. Steps per epoch = number of batches. Batch gradient descent uses the whole set as one batch, so 1 step per epoch. Stochastic uses batches of 1, so one step per example.

#source[Bishop §7.2.2–7.2.4, PDF pp.231–233 / printed pp.214–216.]
#question(space: 0.5in, gap: 0.4em)[
500 training sequences, 10 epochs.
#tbl((1.3fr, 0.8fr, 1fr, 1.1fr), (auto, 0.35in, 0.35in, 0.35in),
  [*Method*], [*Batch size*], [*Steps per epoch*], [*Steps in 10 epochs*],
  [Batch GD], [500], [], [],
  [Mini-batch], [32], [], [],
  [Stochastic], [1], [], [],
)
- Size of the last mini-batch with $B = 32$?
]

#pagebreak()
#part(7, "Reading a loss curve")
#slip[Row 1 (weight decay) was fine. Rows 2 and 3 are the ones to learn.]

- *Flat at $ln K$* for $K$ classes: the model is guessing uniformly, so it is not learning at all. Check for an `lr` that is too small, a missing `opt.step()`, or wrong labels. Early stopping can't fix this, since nothing is happening.
- *Wild jumps, then `nan`:* steps too big, weights blow up. Part 5 at $eta = 1$, repeated. Lower the `lr`.
- *Train falls, validation turns up:* overfitting. Keep the best-validation epoch (early stopping), add dropout or weight decay, get more data.
- *Both high, close together, barely falling:* underfitting. Bigger model, train longer.

_Your margin question._ Dropout randomly zeroes units in training so none can lean on a single partner. At prediction you want the full, repeatable model, so `model.eval()` turns it off. PyTorch rescales during training so the average activation matches.

#source[Bishop §9.3 Learning curves, early stopping Fig.9.8, PDF p.285 / printed p.268; §9.2 Weight decay PDF p.278 / printed p.261.]
#question(space: 0.1in, gap: 0.4em)[
Use $ln 2 = 0.693$, $ln 3 = 1.099$.
#{
set text(size: 9pt)
tbl((2fr, 1.2fr, 1.2fr), (auto, 0.5in, 0.5in, 0.5in, 0.5in),
  [*What you see*], [*Most likely cause*], [*One knob to turn*],
  [(a) 2-class model, loss 0.693 from epoch 1 to 20.], [], [],
  [(b) SGD, `lr=1`. Loss 0.6, 3.1, 40, then `nan`.], [], [],
  [(c) Train 0.05 and falling. Validation lowest at epoch 6 (0.40), now 0.90.], [], [],
  [(d) _Optional._ 3-class model. Train 1.02, validation 1.04, both barely moving.], [], [],
)
}
]

#pagebreak()
#part(8, "Adam's step, demystified (optional)")
You asked "so, $g$?" Yes. $hat(s)$ is Adam's running average of the gradient. On step 1 there is no history, so the average is just $g$. Likewise $hat(r) = g^2$. So the step is
$ eta dot g / sqrt(g^2) = eta dot g / abs(g) = plus.minus eta. $
Just $eta$, with the gradient's sign.

#source[Bishop §7.3.3 RMSProp and Adam, Eqs.7.43–7.47, PDF pp.240–241 / printed pp.223–224.]
#question(space: 0.4in, gap: 0.4em)[
_Optional._ $eta = 0.001$.
#tbl((1fr, 1fr, 1.2fr, 1.2fr), (auto, 0.32in, 0.32in, 0.32in),
  [*Parameter*], [*Gradient $g$*], [*SGD step $eta g$*], [*Adam step*],
  [$w_a$], [$100$], [], [],
  [$w_b$], [$0.01$], [], [],
  [$w_c$], [$-0.01$], [], [],
)
- Fill the blanks: "With Adam, `lr` is roughly how far each weight moves per step. With SGD the move is `lr` × #box(width: 0.6in, repeat[\_]), so a good SGD `lr` depends on #box(width: 0.8in, repeat[\_])."
]

#pagebreak()
= This week: what to read in Bishop
Nothing to fill in. In priority order, each tied to a slip. About 25 pages total, so 4–5 short reading sessions. Then the next quiz.

#set par(justify: false)
+ *§6.4 Error Functions*, PDF pp.212–215 / printed pp.194–197. Loss = negative log-likelihood for each kind of output. Read this first. Parts 2, 3, 4.
  - Focus: Eq.6.25 (sum of squares from a Gaussian), Eq.6.33 (binary cross-entropy), Eq.6.36–6.37 (softmax, shift).
+ *§4.1.2 Likelihood function*, PDF pp.133–134 / printed pp.114–115. Where MSE comes from: Gaussian noise. The "why" behind part 3.
+ *§7.2.2–7.2.4* Batch GD, SGD, mini-batches, PDF pp.231–233 / printed pp.214–216. Part 6.
+ *§9.2 Weight decay and §9.3 Learning curves*, PDF p.278 and p.285 / printed p.261 and p.268. Part 7.
  - Focus: Fig.9.8, the train vs validation curve.
+ _Optional._ *§7.3.1 Momentum* and *§7.3.3 RMSProp and Adam*, PDF p.237 and pp.240–241 / printed p.220 and pp.223–224. Part 8.
+ _Optional._ *§8.1 Evaluation of Gradients*, PDF pp.251–252 / printed pp.234–235. Backprop and the chain rule. Part 5.

*Where the book is.* Archived on OneDrive, same relative path: `textbooks/` under the course archive folder.

*While reading*, try to say each one out loud in a sentence:
- What kind of number is the target, so which loss?
- Why does MSE stall on a confidently wrong classifier?
- What does a flat loss at $ln K$ mean? A `nan`?
]
