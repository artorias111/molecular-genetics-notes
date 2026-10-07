#import "../template.typ": *
#let source(body) = { set text(size: 7.5pt); ref_box(body) }
#let part(n, title) = { v(0.6em); text(size: 12pt, weight: "bold")[Part #n. #title]; v(0.2em) }
#let sitting(body) = { align(center, block(fill: luma(225), inset: 6pt, radius: 4pt, width: 100%, text(weight: "bold", body))) }
#let fix(body) = block(stroke: (left: 2pt + luma(90)), inset: (left: 8pt, y: 4pt), [*Fix to your notes.* #body])
#let tbl(cols, rows, ..cells) = { set par(justify: false); table(columns: cols, inset: 5pt, stroke: 0.5pt, rows: rows, ..cells) }

#sheet(day: "WB", title: "from DNA to a trained model", set_label: "ML refresher workbook")[
#set text(size: 10pt)
#set par(spacing: 0.6em)

*How this works.* Read a short bit, answer a short question, repeat. One running example: a 1D CNN that says whether a 200 bp sequence is bound by a TF, like your TATA project. By the end, every line of that model has a reason.

*Three sittings, about 15 min each.* Do one per day if you like. Items marked _optional_ can be skipped. No backlog.

#source[Spine: Bishop & Bishop, _Deep Learning_. Each part names its section. All numbers and the model are tutor-authored.]

#sitting[Sitting 1 · from DNA to a score]

#part(1, "Tensors and encoding")
PyTorch's `Conv1d` wants `(N, C, L)`: batch size, channels, length. For DNA, one-hot gives 4 channels, one per base.

An `nn.Embedding(4, d)` is a lookup table: index 2 (G) returns row 2. That is exactly one-hot × a weight matrix, just cheaper (your 11-25-2025 note).

#question(space: 0.9in, gap: 0.2em)[
A batch of 64 sequences, 200 bp, one-hot, comes out of your loader as `(64, 200, 4)`.
- What shape does `Conv1d` want? Which call fixes it?
- Embedding rows: A $(0.2, -1)$, C $(0.5, 0.3)$, G $(-0.4, 0.8)$, T $(1.0, 0.1)$. Compute one-hot G $= [0,0,1,0]$ times this $4 times 2$ matrix.
]

#pagebreak()
#part(2, "A neuron, and why activations exist")
One neuron: $z = bold(w) dot bold(x) + b$, then an activation. ReLU keeps positives, zeroes negatives: $max(0, z)$.

Two linear layers in a row are still one linear layer: $2(3x) + 1 = 6x + 1$. The nonlinearity between them is what buys the extra power.

#source[Bishop §6.2 Multilayer networks (activation functions), §8.1.1 Single-layer networks, PDF p.251 / printed p.234.]
#question(space: 0.5in, gap: 0.2em)[
Weights $bold(w) = (0.5, 1)$, bias $b = 0.5$.
- Compute $z$ and ReLU$(z)$ for $bold(x) = (2, -1)$ and for $bold(x) = (-2, -1)$.
]
#question(space: 0.9in, gap: 0.2em)[
Layer 1: $y = 3x$. Layer 2: $z = 2y + 1$.
#tbl((1fr, 1.3fr, 1.6fr), (auto, 0.4in, 0.4in),
  [*$x$*], [*No activation: $z$*], [*ReLU between: $2 dot "ReLU"(3x) + 1$*],
  [$-1$], [], [],
  [$1$], [], [],
)
- One sentence: which column is still a straight line?
]

#pagebreak()
#part(3, "Convolution is a sliding PWM")
A `Conv1d` filter is a small weight matrix (4 bases × width) slid along the sequence. At each position it gives one score. Output length $= L - k + 1$ (stride 1, no padding).

Max pooling then keeps the best score. `AdaptiveMaxPool1d(1)` keeps the single best: "is the motif anywhere?" Position stops mattering.

#source[Bishop Ch.10 Convolutional Networks. Your CNN note: N-C-L rule, output size formula.]
#question(space: 0.6in, gap: 0.2em)[
Toy filter for TAT: score = number of positions that match T, A, T. Sequence: `G T A T C A T`.
#tbl((1.2fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr, 0.8fr), (auto, 0.35in),
  [*Window*], [GTA], [TAT], [ATC], [TCA], [CAT],
  [*Score*], [], [], [], [], [],
)
- Output length here? Max-pooled value?
- Real model: $L = 200$, `kernel_size=12`. Output length?
]

#pagebreak()
#part(4, "Logits and softmax")
The last `Linear` gives one raw score per class: *logits*. Softmax turns them into probabilities: $y_k = e^(a_k) \/ sum_j e^(a_j)$.

Adding the same constant to every logit changes nothing (Bishop, below Eq.6.37).

#source[Bishop §6.4.3 Multiclass classification, Eq.6.37, PDF p.215 / printed p.197. Your softmax and logit notes.]
#question(space: 0.8in, gap: 0.2em)[
Two classes (bound, unbound). Use $e^2 = 7.39$.
- Logits $(2, 0)$: compute both probabilities.
- Logits $(12, 10)$: same answer or not? Why, in one line?
]

#pagebreak()
#sitting[Sitting 2 · from score to learning]

#part(5, "A loss is a negative log-likelihood")
You already do this with genotype likelihoods. Pick a distribution for the target. Multiply over data points. Take $-ln$, so the product becomes a sum. That sum is the loss.

The network outputs the parameters of that distribution. So the distribution decides the loss:

#{
set text(size: 8.5pt)
tbl((0.9fr, 1.1fr, 1.9fr, 1.4fr), auto,
  [*Target*], [*Distribution*], [*$-ln$ likelihood, one point*], [*PyTorch*],
  [real number], [Gaussian, mean $y$], [$(t-y)^2 \/ 2 sigma^2 + "const"$], [`MSELoss`],
  [yes / no], [Bernoulli, $P(1) = y$], [$-[t ln y + (1-t) ln(1-y)]$], [`BCEWithLogitsLoss`],
  [one of $K$], [Categorical], [$-ln y_"true class"$], [`CrossEntropyLoss`],
  [count], [Poisson, mean $lambda$], [$lambda - t ln lambda + "const"$], [`PoissonNLLLoss`],
)
}
"MSE for regression" really means "I assume Gaussian noise, same variance everywhere". The $sigma$ terms do not involve the weights, so they drop out.

#fix[MLE is not an alternative to loss + gradient descent. The negative log-likelihood _is_ the loss. Gradient descent is how you maximize it when there is no closed form.]

#source[Bishop §6.4 Error Functions: §6.4.1 Eqs.6.23–6.26 PDF pp.212–213 / printed pp.194–195; §6.4.2 Eq.6.33 PDF p.214 / printed p.196; §6.4.3 Eq.6.36 PDF p.215 / printed p.197. The section you wanted, about 4 pages. Poisson row is a tutor addition.]

#pagebreak()
#question(space: 0.1in, gap: 0.2em)[
Pick the loss.
#tbl((1.7fr, 1.1fr, 1.3fr, 1.6fr), (auto, 0.45in, 0.45in, 0.45in, 0.45in),
  [*Target*], [*Distribution*], [*PyTorch loss*], [*Why (one line)*],
  [(a) log-TPM expression], [], [], [],
  [(b) TF bound or not], [], [], [],
  [(c) base at a masked site], [], [], [],
  [(d) raw read count], [], [], [],
)
]
#question(space: 0.5in, gap: 0.6em)[
Cross-entropy for one example is $-ln$(probability given to the right answer). Use $ln 0.7 = -0.357$, $ln 0.1 = -2.303$, $ln 0.25 = -1.386$.
#tbl((2.2fr, 1fr, 1.2fr), (auto, 0.35in, 0.35in, 0.35in),
  [*Model output (A, C, G, T)*], [*True base*], [*Loss*],
  [(0.7, 0.1, 0.1, 0.1)], [A], [],
  [(0.7, 0.1, 0.1, 0.1)], [G], [],
  [(0.25, 0.25, 0.25, 0.25)], [any], [],
)
- An untrained 4-class model should start near which loss? Why is that a handy sanity check?
]

#pagebreak()
#part(6, "Why the pairing matters")
Each matched pair (Gaussian + identity output, Bernoulli + sigmoid, categorical + softmax) gives the same clean output gradient: $partial E \/ partial a = y - t$ (Bishop Eq.6.31).

Put MSE on a sigmoid instead and the chain rule adds a factor $y(1-y)$:
$ E = 1/2 (y-t)^2 quad => quad partial E \/ partial a = (y - t) dot y(1-y). $
The gradient is the size of the push the weights get. Bishop cites faster training and better generalization with cross-entropy for classification (§6.4.2).

#source[Bishop §6.4.2 Binary classification, Eqs.6.31–6.33, PDF p.214 / printed p.196; chain rule §8.1.2 Eq.8.7, PDF p.252 / printed p.235.]
#question(space: 0.8in, gap: 0.2em)[
True label $t = 1$.
#tbl((1fr, 1fr, 1.3fr, 1.6fr), (auto, 0.4in, 0.4in),
  [*Logit $a$*], [*$y = sigma(a)$*], [*CE: $y - t$*], [*MSE: $(y-t) y (1-y)$*],
  [$0$], [$0.5$], [], [],
  [$-5$], [$0.0067$], [], [],
)
- At $a = -5$ the model is confidently wrong. Which loss pushes harder, roughly how many times?
- One sentence: why is MSE a poor classification loss?
]

#pagebreak()
#part(7, "Backprop and zero_grad")
`loss.backward()` applies the chain rule from the loss back to every weight and stores the result in `.grad`. Gradients *add up* in `.grad` across calls. That is why `optimizer.zero_grad()` comes first.

#source[Bishop §8.1 Evaluation of Gradients, §8.1.2 Eq.8.7, PDF p.252 / printed p.235. Your backpropagation note (the mean(2x) example).]
#question(space: 0.75in, gap: 0.2em)[
One weight. $y = w x$, loss $L = (y - t)^2$, so $partial L \/ partial w = 2(y - t) x$. Start: $w = 1$, $x = 2$, $t = 3$.
- Compute $y$, $L$ and $partial L \/ partial w$.
- You forget `zero_grad()` and call `backward()` again with the same values. What is in `.grad` now?
]

#part(8, "What an optimizer is")
The loss is a surface over all the weights. Backprop says which way is uphill, right here. The *optimizer* is the rule that turns that gradient into a step.

- *Gradient descent:* $w <- w - eta nabla L$. $eta$ is the learning rate.
- *Momentum:* keep a running sum of past steps. Smooths zig-zags.
- *Adam:* momentum plus a per-parameter scale. It tracks the running mean of each gradient, $s$, and of its square, $r$, and steps by $eta dot s \/ sqrt(r)$.

#source[Bishop §7.2.2 Batch gradient descent, Eq.7.16, PDF p.231 / printed p.214; §7.3.1 Momentum, PDF p.237 / printed p.220; §7.3.3 RMSProp and Adam, Eqs.7.43–7.47, PDF pp.240–241 / printed pp.223–224.]
#question(space: 0.75in, gap: 0.2em)[
Same example: $w = 1$, gradient $-4$.
- Take one step with $eta = 0.1$. New $w$? New $y$: closer to $t = 3$?
- Now $eta = 1$. New $w$, new $y$, new loss? One sentence on a too-large learning rate.
]

#pagebreak(weak: true)
#question(space: 0.9in, gap: 0em)[
_Optional._ On Adam's first step (bias-corrected, ignoring tiny $epsilon$), $hat(s) = g$ and $hat(r) = g^2$. Let $eta = 0.001$.
#tbl((1.2fr, 1fr, 1.3fr, 1.3fr), (auto, 0.4in, 0.4in),
  [*Parameter*], [*Gradient $g$*], [*SGD step $eta g$*], [*Adam step $eta g \/ sqrt(g^2)$*],
  [$w_a$], [$100$], [], [],
  [$w_b$], [$0.01$], [], [],
)
- One sentence: why is `lr=1e-3` a sane default for Adam but not for plain SGD?
]

#pagebreak()
#sitting[Sitting 3 · training in practice]

#part(9, "Batches and epochs")
- *Batch gradient descent:* gradient from the whole training set. One step per epoch.
- *Stochastic:* one example per step.
- *Mini-batch:* $B$ examples per step. This is what `DataLoader` + optimizer does.
- *Epoch:* one full pass through the data.

Gradient noise shrinks like $1 \/ sqrt(B)$: 100× the batch, only 10× less noise. Powers of 2 suit GPUs. `shuffle=True` so batches are not ordered by class or chromosome.

#fix[Batch GD is not "running it multiple times per epoch". That is mini-batch.]

#source[Bishop §7.2.3 Stochastic gradient descent, PDF pp.231–232; §7.2.4 Mini-batches, PDF p.233 / printed p.216.]
#question(space: 0.5in, gap: 0.2em)[
1000 training sequences.
#tbl((2fr, 1.2fr), (auto, 0.35in, 0.35in, 0.35in),
  [*Method*], [*Steps per epoch*],
  [Batch gradient descent], [],
  [Mini-batch, $B = 64$], [],
  [Stochastic, $B = 1$], [],
)
- With $B = 64$, how big is the last batch? (Your 12-05 note on picking batch sizes.)
]

#pagebreak()
#part(10, "Overfitting and regularization")
Train set: fit the weights. Validation set: pick settings and when to stop. Test set: touch once, at the end.

Overfitting: training loss keeps falling, validation loss turns up. Fixes:
- *Dropout:* in training, randomly zero a fraction of activations so no single unit is leaned on. `model.eval()` turns it off.
- *Weight decay:* add $lambda ||bold(w)||^2$ to the loss, shrinking weights. In plain `Adam` it gets mixed into the adaptive scaling. `AdamW` applies it separately, the usual choice now.
- *Early stopping:* stop when validation loss stops improving. Bishop shows it acts much like weight decay.

#fix[ReLU and GELU are not regularization. They are the nonlinearity.]

#source[Bishop §9.2 Weight decay, Fig.9.3, PDF p.278 / printed p.261; §9.3 Learning curves, early stopping Fig.9.8, PDF p.285 / printed p.268. Your data split note.]
#question(space: 0.1in, gap: 0.2em)[
Read the curve. 4-class model.
#tbl((2fr, 1.3fr, 1.5fr), (auto, 0.6in, 0.6in, 0.6in),
  [*What you see*], [*Most likely cause*], [*One knob to turn*],
  [Train loss keeps falling. Validation loss lowest at epoch 8, then rises.], [], [],
  [Loss starts at 1.39 and stays at 1.39 for 20 epochs.], [], [],
  [Loss jumps around wildly, then becomes `nan`.], [], [],
)
]

#pagebreak()
#part(11, "Autoencoders use the same machinery")
Same five-step loop. The only change: the target is the input itself. A narrow middle layer (bottleneck) forces a compressed summary.

Your liver RNA-seq autoencoder went 35k → 50 → 35k with `MSELoss`.

#source[Bishop §19.1 Deterministic autoencoders, §19.1.1 Eq.19.1, PDF p.575 / printed p.564. Your autoencoder note and Dec 1–5 project.]
#question(space: 1.0in, gap: 0.2em)[
- Under Part 5, what noise model does `MSELoss` on log-expression assume?
- You want an autoencoder that reconstructs one-hot DNA of length $L$. What should the decoder output (shape) and which loss?
- One line: why can't a 50-number bottleneck just copy the input?
]

#part(12, "Toward your goal (optional)")
Predict a masked base in one species from the aligned column. The loss for a sequence is the mean of $-ln p("true base")$ over sites. Output `(N, 4, L)` logits, targets `(N, L)`, `CrossEntropyLoss`. This is also the shape of Evo 2's objective: cross-entropy on the next base.

#question(space: 0.8in, gap: 0.2em)[
_Optional._ Use $ln 0.9 = -0.105$, $ln 0.6 = -0.511$, $ln 0.25 = -1.386$, $ln 0.05 = -2.996$.
#tbl((0.7fr, 1.2fr, 0.7fr, 1.2fr, 0.7fr, 1.2fr, 0.7fr, 1.2fr), (auto, 0.35in),
  [*Site*], [*$p$*], [*Site*], [*$p$*], [*Site*], [*$p$*], [*Site*], [*$p$*],
  [1], [0.90], [2], [0.60], [3], [0.25], [4], [0.05],
)
- Compute $-ln p$ per site and the mean.
- Site 4 is a fast-evolving third-codon position. Could even a perfect model get low loss there? One line.
]

#pagebreak()
= Reference: the whole model, every line justified
Letters point to the part that explains each line. Nothing to fill in.

#{set text(size: 7.5pt); block(fill: luma(248), stroke: 0.5pt + luma(200), inset: 7pt, radius: 4pt, width: 100%)[
```python
class MotifCNN(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv = nn.Conv1d(4, 32, kernel_size=12)   # P1, P3
        self.act  = nn.ReLU()                          # P2
        self.pool = nn.AdaptiveMaxPool1d(1)            # P3
        self.drop = nn.Dropout(0.2)                    # P10
        self.fc   = nn.Linear(32, 2)                   # P4

    def forward(self, x):                  # x: (N, 4, 200)
        x = self.act(self.conv(x))         # (N, 32, 189)
        x = self.pool(x).squeeze(-1)       # (N, 32)
        return self.fc(self.drop(x))       # (N, 2) logits, no softmax

model   = MotifCNN()
loss_fn = nn.CrossEntropyLoss()                                  # P5, P6
opt     = torch.optim.AdamW(model.parameters(), lr=1e-3,
                            weight_decay=1e-4)                   # P8, P10
loader  = DataLoader(train_ds, batch_size=64, shuffle=True)      # P9

for epoch in range(50):                    # stop early on val loss  P10
    model.train()
    for xb, yb in loader:
        loss = loss_fn(model(xb), yb)      # forward + loss          P5
        opt.zero_grad()                    #                         P7
        loss.backward()                    # chain rule              P7
        opt.step()                         # move the weights        P8
```
]}

#set par(justify: false)
#set text(size: 8.5pt)
- *32 filters:* 32 motif detectors. More = more capacity, more overfitting risk. A guess, then tuned on validation.
- *Width 12:* about the size of a TF motif.
- *No softmax in `forward`:* `CrossEntropyLoss` applies log-softmax itself, which is numerically safer.
- *Swap the target, swap two lines:* log-expression → `Linear(32, 1)` + `MSELoss`. Counts → output $ln lambda$ + `PoissonNLLLoss`.

#source[PyTorch docs for `CrossEntropyLoss` (takes raw logits) and Adam/AdamW defaults (`lr=1e-3`). Model is tutor-authored.]
]
