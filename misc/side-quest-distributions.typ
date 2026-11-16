#import "/design.typ": *

#set page(
  width: 6.21in, height: 8.94in,
  margin: (top: 0.7in, bottom: 0.55in, left: 0.45in, right: 0.45in),
  header: context {
    set text(size: 7.5pt, fill: muted)
    grid(columns: (1fr, auto), [side quest · which distribution is this?], [#counter(page).display("1")])
  },
)
#set text(font: sans, size: 10.5pt, fill: ink)
#set par(justify: false, leading: 0.62em, spacing: 0.9em)
#show math.equation: set text(font: "Noto Sans Math")
#show raw: set text(font: mono, size: 9.5pt)
#show strong: set text(weight: 600)

#let hd(x) = text(size: 8pt, fill: accent, weight: 600, x)
#let story(name, body, tell) = block(width: 100%, breakable: false, inset: (left: 9pt, y: 6pt, right: 8pt),
  stroke: (left: 2pt + accent), fill: tint, radius: (right: 4pt), below: 5pt)[
  #text(font: serif, weight: 700)[#name] #h(4pt) #text(size: 9.5pt, body) \
  #text(size: 8.5pt, fill: muted)[#tell]
]

#grid(columns: (auto, 1fr), column-gutter: 12pt, align: (top, bottom),
  text(font: serif, size: 40pt, weight: 800, fill: accent)[SQ],
  text(font: serif, size: 18pt, weight: 700)[Distributions are stories],
)
#v(2pt)
#text(fill: muted)[Why do five or six distributions cover so much of biology? Because each one isn't really a shape, it's a little story about how the data got made. Lots of very different things share the same story, so they end up with the same distribution. So the trick is to ask how the data got made, and the name usually follows.]
#v(2pt)
#h(1fr) #text(size: 8.5pt, fill: muted)[side quest · about 50 min, fine to split in two]
#line(length: 100%, stroke: 0.6pt + line-c)

#story([Binomial], [$n$ separate yes/no trials, each with the same chance $p$. Count the yeses.], [mean $n p$, variance $n p(1-p)$, always smaller than the mean. One trial alone is a Bernoulli.])
#story([Poisson], [Lots of chances for something rare, each independent. Count how many happen in a fixed window.], [one number $lambda$ is both the mean and the variance. $P(k) = lambda^k e^(-lambda) slash k!$])
#story([Negative binomial], [A Poisson whose rate $lambda$ itself varies from unit to unit (replicate, cell, site).], [variance bigger than the mean. Counts that are "too spread out" for Poisson.])
#story([Geometric and exponential], [How long you wait for the first success. Geometric counts trials, exponential measures continuous time or distance.], [skewed right, lots of short waits, a few long ones. The wait so far tells you nothing about the wait left.])
#story([Normal], [Many small independent pushes added together.], [symmetric bell. This is the central limit theorem, and it's why heights and polygenic traits look like this.])
#story([Log-normal], [Many small independent factors multiplied together.], [skewed right, but its log is a bell. Expression levels and cell sizes often look like this.])
#v(2pt)
#text(size: 9.5pt)[A quick checklist when you see data: is it a count, a yes/no, or a measurement? Is it bounded? For counts, compare the mean with the variance. If it's skewed, try logging it.]
#source[Wasserman, All of Statistics | §2.3 discrete (binomial, geometric, Poisson), §2.4 continuous (normal, exponential) | PDF p. 41-45 | printed p. 25-29 | §5.4 CLT | PDF p. 93 | printed p. 77 | negative binomial and log-normal lines are tutor notes]
#pagebreak()

#task(kind: "see", minutes: 6, title: [Name that story],
  src: [Wasserman §2.3-2.4 | PDF p. 41-45 | printed p. 25-29 | made-up scenarios])[
  For each one, which distribution would you reach for, and which bit of the story gave it away?
  #{
    set text(size: 9pt)
    let lab(x) = text(weight: 700, fill: accent)[(#x)]
    table(
      columns: (0.3in, 2.35in, 0.95in, 1fr),
      rows: (auto, 0.56in, 0.5in, 0.5in, 0.5in, 0.5in, 0.56in, 0.56in),
      align: (center + horizon, left + horizon, center + horizon, center + horizon),
      stroke: (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none }),
      fill: (x, y) => if x > 1 and y > 0 { tint } else { none },
      table.header([], hd[what was measured], hd[distribution], hd[the part of the story that gave it away]),
      lab[a], [New mutations in a child that neither parent has (3 billion sites, about 60 expected)], [], [],
      lab[b], [Of 30 reads over a heterozygous site, how many carry the alt allele], [], [],
      lab[c], [Body length of adult cod in a big population], [], [],
      lab[d], [Bases you read along a random sequence until the first G], [], [],
      lab[e], [Reads on one gene across 6 mice, variance about 10 times the mean], [], [],
      lab[f], [Protein copies per cell for one gene, a long right tail that turns into a bell after you take logs], [], [],
      lab[g], [Just numbers: colonies per plate 2, 0, 1, 3, 1, 0, 2, 1 (mean 1.25, variance 0.94)], [], [],
    )
  }
]
#v(6pt)
#aside[None of these fit exactly. They're starting guesses you then check.]
#pagebreak()

#task(kind: "do", minutes: 5, title: [Poisson: coin flips with tiny odds],
  src: [Wasserman §2.3 binomial and Poisson | PDF p. 42-43 | printed p. 26-27 | made-up rates])[
  A 1 Mb region has $n$ sites, each mutates in a generation with chance $p$, independently. The count is binomial. Keep the expected count fixed at $lambda = n p$ and let $n$ get huge. You'll need $ln(1 - x) approx -x$ when $x$ is tiny.

  #ask[No mutations means every site stayed put, so $P(X = 0) = (1 - p)^n$. Write it with only $lambda$ and $n$, take the log, and show it heads to $e^(-lambda)$.]
  #work(1.0in)
  #ask[A region with $n = 2,000,000$ and $p = 1 slash 2,000,000$ gives the same answer as $n = 1,000,000$, $p = 1 slash 1,000,000$. So what's the only thing Poisson cares about, and why does it show up for so many rare-event counts?]
  #work(0.6in)
]
#pagebreak()

#task(kind: "do", minutes: 7, title: [Normal: adding up small pushes],
  src: [Wasserman §3.3 variance, Theorem 3.20 | PDF p. 66-68 | printed p. 50-52 | §5.4 CLT | PDF p. 93 | printed p. 77 | made-up trait])[
  Body length is 60 cm plus $S$, where 100 genes each push it up 1 cm or down 1 cm, like a fair coin, independently. Call one push $Y$. Two rules: for independent things variances add, $"Var"(Y_1 + Y_2) = "Var"(Y_1) + "Var"(Y_2)$, and $"Var"(a Y) = a^2 "Var"(Y)$.

  #ask[What are $E[Y]$ and $"Var"(Y)$ for one push?]
  #work(0.45in)
  #ask[What's the variance and standard deviation of the total $S = Y_1 + dots + Y_100$? The central limit theorem says $S$ is close to a bell. Within what range would most fish fall (about 2 standard deviations)?]
  #work(0.7in)
  #ask[One push is a coin flip, two values, nothing like a bell. So where did the bell come from? Would the total still look like a bell if each push were instead 0 or 2 cm, or anywhere between −1 and 1?]
  #work(0.8in)
  #ask[Now say each gene multiplies length by 1.01 or 0.99 instead of adding. What does $ln("length")$ look like, and so what does length itself look like?]
  #work(0.6in)
]
#pagebreak()

#task(kind: "do", minutes: 6, title: [Geometric: waiting for the first G],
  src: [Wasserman §2.3 geometric | PDF p. 42 | printed p. 26 | made-up sequence])[
  You read along a random sequence where each base is G with chance $p = 1 slash 4$, independently. $X$ is the position of the first G.

  #ask[Write $P(X = k)$. What has to happen at positions $1, dots, k-1$, and then at $k$?]
  #work(0.55in)
  #ask[Find $E[X]$ without summing anything. Look at the first base: with chance $p$ you're done in 1, otherwise you've used 1 base and are back where you started. That gives $E[X] = 1 + (1-p) E[X]$. Solve it, then plug in $p = 1 slash 4$.]
  #work(0.8in)
  #ask[$P(X > k) = (1-p)^k$, since the first $k$ bases all missed. Show that $P(X > a + b | X > a) = P(X > b)$. In plain words, what does that say about waiting?]
  #work(0.9in)
  #ask[Mutations along a genome, reads starting along a chromosome, crossovers along an arm: why might gaps between any of these look geometric (or exponential)?]
  #work(0.6in)
]
#pagebreak()

#task(kind: "use", minutes: 7, title: [Negative binomial: extra spread],
  src: [Wasserman §3.5 Theorem 3.27 total variance | PDF p. 71 | printed p. 55 | made-up counts])[
  Read counts at the same site in five samples, two experiments. For the variance, average the squared distances from the mean (divide by 5). A Poisson has variance equal to its mean.
  #{
    set text(size: 9.5pt)
    table(
      columns: (1.05in, 1.25in, 1fr, 1fr),
      rows: (auto, 0.4in, 0.4in),
      align: center + horizon,
      stroke: (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none }),
      fill: (x, y) => if x > 1 and y > 0 { tint } else { none },
      table.header(hd[experiment], hd[counts], hd[mean (sum / 5)], hd[variance (average of (count − mean)²)]),
      [technical repeats], [1, 3, 4, 5, 7], [], [],
      [different mice], [0, 1, 3, 4, 12], [], [],
    )
  }
  #ask[Fill in the table. Which one could be Poisson?]
  #work(0.8in)

  Now say each mouse has its own true rate $lambda$, and given that rate its count is Poisson($lambda$). The *law of total variance* splits the spread in two: $"Var"(X) = E["Var"(X | lambda)] + "Var"(E[X | lambda])$.

  #ask[Show $"Var"(X) = E[lambda] + "Var"(lambda)$. Why is that bigger than the mean, $E[X] = E[lambda]$?]
  #work(0.9in)
  #ask[From the mice numbers, about how much do the true rates vary between mice, i.e. what's $"Var"(lambda)$? (If $lambda$ follows a gamma distribution, this mixture is exactly the negative binomial.)]
  #work(0.5in)
]
#pagebreak()

#task(kind: "use", minutes: 5, title: [Binomial: the best fit],
  src: [Wasserman §9.3 maximum likelihood, Example 9.10 (Bernoulli) | PDF p. 139 | printed p. 123 | tutor adaptation to reads])[
  At a site in one fish you see $k$ alt reads out of $n$. You model it as binomial with unknown alt fraction $p$.

  #ask[Write the negative log-likelihood of $p$. Which term doesn't involve $p$ and can be dropped?]
  #work(0.8in)
  #ask[Take the derivative with respect to $p$, set it to zero, and solve. What's the best $p$, and does it match what you'd have guessed?]
  #work(1.0in)
]
#pagebreak()

#kicker(color: accent)[Wrap up, 5 min]
#takeaway(room: 1.1in)[Think of your own lcWGS data: read depth at each site across the genome. Which distribution would you guess, and what part of the story (GC bias, mappability, library prep) pushes it away from the simplest choice?]
#takeaway(room: 1.3in)[Back to the question on page 1, in your own words. Look at tasks 2 to 4: what kept happening to the details (the exact $n$ and $p$, the shape of one push, how long you'd already waited)? So why do a handful of distributions model so much of biology?]
#takeaway(room: 0.9in)[Say it to a labmate in two sentences, no equations.]
