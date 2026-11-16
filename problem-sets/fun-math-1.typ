#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#let work(label) = { pagebreak(); text(size: 9pt, fill: luma(120))[#label working space.] }

#sheet(day: "fun 1", title: "Fun math", set_label: "fun math 1")[
#set text(size: 10.5pt)
#set par(spacing: 0.6em)
#set enum(numbering: "(a)")
#text(size: 9pt)[Not graded unless you want it to be. About 30 minutes: Q1 8, Q2 12, Q3 8. Stop whenever.]
#parbreak()
Three independent puzzles, all short. Each has a small reading box, then lettered questions, then a blank page.

#ref_box[
*Convolution on DNA.* One-hot a sequence: one column per position, one row per base (A, C, G, T), a 1 where that base is. A filter of width $k$ is a $4 times k$ table of weights. Place it on positions $i$ to $i + k - 1$, multiply each weight by the one-hot entry under it, and add everything up. That sum is the score at start position $i$. Then slide one step and repeat.

*Tiny example.* Width-1 filter with weight +1 for G, 0 for the rest. On "AGG" it scores 0, 1, 1. It is a G detector.

*ReLU* is $max(0, z)$: negative scores become 0, positive scores pass through. A *bias* is a number added to every score before the ReLU.

Reading: Bishop & Bishop, _Deep Learning_, §10.2 Convolutional filters, PDF p.306 / printed p.290. Same operation as `nn.Conv1d` in ML notebook 02.
]

#pagebreak()
#source[Tutor toy. Filter weights below. Connects to ML notebook 02, section 5.]
#question(space: 0in, gap: 0em)[
*Convolution by hand · 8 minutes.* Sequence ACGCGT, one-hot. Filter of width 2: weight +1 for C at filter position 1, weight +1 for G at filter position 2, all other weights 0. Bias 0, no ReLU.

#align(center, table(columns: 3, stroke: none, column-gutter: 2em,
  table(columns: 7, inset: 4pt, stroke: 0.5pt + luma(160), align: center,
    [], [A], [C], [G], [C], [G], [T],
    [A], [1], [0], [0], [0], [0], [0],
    [C], [0], [1], [0], [1], [0], [0],
    [G], [0], [0], [1], [0], [1], [0],
    [T], [0], [0], [0], [0], [0], [1]),
  table(columns: 3, inset: 4pt, stroke: 0.5pt + luma(160), align: center,
    [*Filter*], [pos 1], [pos 2],
    [A], [0], [0], [C], [+1], [0], [G], [0], [+1], [T], [0], [0]),
))

+ How many start positions does the filter fit on a sequence of 6 bases?
+ What is the score at each start position? Write them in order.
+ Fill in the table below for a width-4 filter that scores highest on TATA. Each cell is the weight for that base (row) at that filter position (column); use +1 for the wanted base and 0 for the others. What is that highest score?
#align(center, table(columns: (auto, 0.6in, 0.6in, 0.6in, 0.6in), inset: 6pt, stroke: 0.5pt + luma(160), align: center,
  [*Weight*], [pos 1], [pos 2], [pos 3], [pos 4],
  [A], [], [], [], [],
  [C], [], [], [], [],
  [G], [], [], [], [],
  [T], [], [], [], []))
#enum(start: 4)[Using your TATA filter, what is the score of the window TATT? Now add bias $-3.5$ and apply ReLU. What comes out for TATA, and what for TATT? In one sentence, what did the bias do?]
]

#work("Q1")

#pagebreak()
#ref_box[
*First-step analysis.* To find the expected waiting time for something, name a few "states" (what you have seen so far that still matters), and write one equation per state. Each equation says: take one step (that costs 1), then average over where that step sends you.

*Tiny example.* Flip a fair coin until the first heads. Let $E$ be the expected number of flips. One flip: with probability 1/2 it is heads and you are done (0 more flips), with probability 1/2 it is tails and you are back where you started ($E$ more). So
$ E = 1 + 1/2 dot 0 + 1/2 dot E, $
which gives $E = 2$.

Reading: Durbin et al., _Biological Sequence Analysis_, §3.1 Markov chains, PDF p.58 / printed p.48.
]

#source[Classic waiting-time puzzle (Penney's game family), tutor adaptation to DNA.]
#question(space: 0in, gap: 0em)[
*Waiting for a dinucleotide · 12 minutes.* Read a random DNA sequence one base at a time. Each base is A, C, G or T with probability 1/4, independent of the others. How many bases, on average, until you first see AC? Until you first see AA?

+ Guess before computing: same, AC longer, or AA longer?
+ For AC, use two states. $E_0$: expected bases still to read when the last base read is not A (or nothing read yet). $E_1$: expected bases still to read when the last base read is A. Write one equation for $E_0$ and one for $E_1$. Then solve. The answer to the question is $E_0$.
+ Do the same for AA, with the same two state definitions. Only one equation changes. Which one, and why?
+ In one sentence, why do the two answers differ even though both pairs have probability 1/16 at any given position?
]

#work("Q2")

#pagebreak()
#ref_box[
*Birthday problem.* Put $n$ items into $N$ equally likely boxes at random. The chance that no two land in the same box is about
$ P("no collision") approx e^(-n(n-1) \/ (2N)) $
when $n$ is much smaller than $N$. Why: there are $n(n-1)\/2$ pairs, each pair collides with chance $1\/N$, and $e^(-x)$ is the chance of zero events when $x$ are expected.

*Tiny example.* 23 people, 365 birthdays: $23 dot 22 \/ 2 = 253$ pairs, $253 \/ 365 approx 0.69$, $e^(-0.69) approx 0.50$. So about a 50% chance two people share a birthday.

Useful values: $e^(-1) approx 0.37$, $e^(-1.1) approx 0.33$. Powers of 4: $4^6$ = 4,096, $4^8$ = 65,536, $4^9$ = 262,144, $4^10$ = 1,048,576.
]

#source[Tutor application. Barcode numbers are a toy; real barcode sets are designed, not random.]
#question(space: 0in, gap: 0em)[
*Random barcodes · 8 minutes.* You pool 96 samples. Each gets a barcode of 6 random bases, so $N = 4^6 = 4096$ possible barcodes.

+ Gut feeling first: is the chance that two samples get the same barcode closer to 2%, 20% or 70%?
+ Compute it with the formula.
+ How many bases long must the random barcodes be for the collision chance to fall below 1%? (For small $x$, $1 - e^(-x) approx x$.)
]

#work("Q3")
]
