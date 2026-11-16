#import "/design.typ": *

#set page(
  width: 6.21in, height: 8.94in,
  margin: (top: 0.7in, bottom: 0.55in, left: 0.45in, right: 0.45in),
  header: context {
    set text(size: 7.5pt, fill: muted)
    grid(columns: (1fr, auto), [side quest · single-cell counts], [#counter(page).display("1")])
  },
)
#set text(font: sans, size: 10.5pt, fill: ink)
#set par(justify: false, leading: 0.62em, spacing: 0.9em)
#show math.equation: set text(font: "Noto Sans Math")
#show raw: set text(font: mono, size: 9.5pt)
#show strong: set text(weight: 600)

#let tbl-stroke = (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none })
#let src-sc = [Single-cell Best Practices (Heumos et al. 2023), sc-best-practices.org | Preprocessing and visualization › Normalization]

#grid(columns: (auto, 1fr), column-gutter: 12pt, align: (top, bottom),
  text(font: serif, size: 40pt, weight: 800, fill: accent)[SQ],
  text(font: serif, size: 18pt, weight: 700)[Why single-cell counts get transformed],
)
#v(2pt)
#text(fill: muted)[Optional, for the train. About 15 min, stop whenever. Before anyone runs PCA or clusters cells, the count matrix gets normalized and logged. Here's why, with the noise-model lens from days 15 and 16. It sets up days 21-23.]
#v(4pt)
#line(length: 100%, stroke: 0.6pt + line-c)
#v(4pt)

#define[The data][scRNA-seq gives a table of UMI counts: one row per cell, one column per gene. Each number is how many mRNA molecules of that gene were caught in that cell. Most are small, lots are 0.]

#define[Cells are sampled unevenly][Some cells get sequenced deeper than others. A cell's *count depth* is its total UMIs over all genes. Twice the depth means roughly twice the counts for every gene, with no change in biology. The fix is a *size factor* per cell, $s = "count depth" \/ L$, where $L$ is a target the same for every cell (scanpy's default is the median depth). Divide each count by its cell's $s$.]

#define[Spread grows with the mean][Counts are noisy, and the noise depends on how high the gene is. A Poisson count with mean $mu$ has variance $mu$. Real UMI data are noisier than that (*overdispersed*). The book uses a Gamma-Poisson model, also called negative binomial:
  $ "Var" = mu + alpha mu^2. $
  $alpha = 0$ gives back Poisson. The $alpha mu^2$ part is the extra spread, and it takes over for high genes.]

#define[Shifted log][The common fix is $f(y) = log(y \/ s + y_0)$, usually with pseudo-count $y_0 = 1$, called log1p. It squeezes big counts much more than small ones, which roughly evens out the spread. The book uses natural log. This sheet uses $log_2$ so the numbers come out clean; the shape is the same.]
#source[#src-sc | sections Motivation, Shifted logarithm]
#pagebreak()

#task(kind: "see", minutes: 4, title: [Two cells, same biology],
  src: [#src-sc | Motivation, Shifted logarithm | made-up cells])[
  Two T cells express gene _IL7R_ at the same true level. Cell A was sequenced to a depth of 2,000 UMIs and caught 5 _IL7R_ molecules. Cell B got 8,000 UMIs and caught 20. Use $L = 4000$.
  #ask[Looking at raw counts only, how many times more _IL7R_ does cell B seem to have?]
  #work(1.2in)
  #ask[Work out each cell's size factor $s = "depth" \/ L$, then each normalized count $y \/ s$. What do you notice?]
  #work(1.6in)
  #ask[If you skipped this step and clustered cells, what might end up driving the clusters?]
  #work(1.4in)
]
#pagebreak()

#task(kind: "do", minutes: 5, title: [Spread vs mean],
  src: [#src-sc | Shifted logarithm (variance of the Gamma-Poisson) | made-up genes])[
  Two genes. A low one with mean $mu = 10$ UMIs per cell and a high one with $mu = 100$. Take $alpha = 0.1$.
  #ask[Fill in the variance under each noise model.]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (1.0in, 1.6in, 2.1in),
      rows: (0.5in, 0.5in, 0.5in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x > 0 and y > 0 { tint } else { none },
      [gene mean $mu$], [Poisson variance ($= mu$)], [negative binomial variance ($mu + 0.1 mu^2$)],
      [10], [], [],
      [100], [], [],
    )
  })
  #ask[For which gene does the extra $alpha mu^2$ term matter more? By roughly how much does it inflate the variance over Poisson for each gene?]
  #work(1.4in)
  #ask[Day 15: squared error assumes one bell curve with the same $sigma$ for every data point. If you fit raw counts with squared error, whose misses would dominate the loss, the low gene's or the high gene's? Why is that a problem?]
  #work(1.5in)
]
#pagebreak()

#task(kind: "use", minutes: 5, title: [What the log does],
  src: [#src-sc | Shifted logarithm, Analytic Pearson residuals | made-up counts])[
  #ask[Fill in $log_2(y + 1)$. Take these counts as already normalized ($s = 1$).]
  #align(center, {
    set text(size: 9.5pt)
    table(
      columns: (0.9in, 0.6in, 0.6in, 0.6in, 0.6in, 0.7in),
      rows: (0.45in, 0.5in),
      align: center + horizon,
      stroke: tbl-stroke,
      fill: (x, y) => if x > 0 and y > 0 { tint } else { none },
      [count $y$], [0], [1], [3], [7], [1023],
      [$log_2(y + 1)$], [], [], [], [], [],
    )
  })
  #ask[Why the $+1$? What would plain $log_2 y$ do to all the zeros in the matrix?]
  #work(0.8in)
  #ask[Gene A goes from 1 to 3 counts. Gene B goes from 1021 to 1023. Both moved by 2. About how far does each move after the log? (1022 is almost 1024.) What does the log do to differences at high counts?]
  #work(1.0in)
  #ask[Optional. The book's other option, Pearson residuals, divides by the spread instead of logging: $r = (y - mu) \/ sqrt("Var")$. A gene has $mu = 10$, $alpha = 0.15$. Work out Var, then $r$ for a cell with $y = 20$. What does a negative $r$ mean for a cell?]
  #work(1.1in)
]

#takeaway[In one sentence: why do we log-transform single-cell counts before PCA?]
