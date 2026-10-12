#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#let axes() = {
  set text(size: 7pt)
  let w = 4in
  let h = 1.9in
  pad(left: 0.45in, bottom: 0.3in, box(width: w, height: h, {
    place(line(start: (0pt, 0pt), end: (0pt, h), stroke: 0.6pt))
    place(line(start: (0pt, h), end: (w, h), stroke: 0.6pt))
    for i in range(5) {
      let x = w * i / 4
      place(line(start: (x, h), end: (x, h + 3pt), stroke: 0.6pt))
      place(dx: x - 8pt, dy: h + 5pt, box(width: 16pt, align(center, str(i / 4))))
    }
    place(dx: w + 6pt, dy: h + 5pt)[$f$]
    for j in range(8) {
      let y = h - h * j / 7
      place(line(start: (-3pt, y), end: (0pt, y), stroke: 0.6pt))
      place(dx: -0.4in, dy: y - 4pt, box(width: 0.35in, align(right, str(j / 100))))
    }
    place(dx: 6pt, dy: -2pt)[likelihood]
  }))
}
#sheet(day: "44", title: "From counting to a formula, then a curve", set_label: "set 44")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 0, math: 20, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 5, compact: true, short_session: true, math_label: "Genotype likelihoods and allele frequency", closing_label: "Math refresher: covariance sign")
#parbreak()
*This week only: aim for about 25 minutes. Stop at 30, including reading.*

*Five-minute core:* the first two bullets of Q1. The core counts as complete.

#ref_box[
*Sequencer with error rate $e$.* The true base is reported with probability $1 - e$. Each of the three wrong bases is reported with probability $e\/3$. Set 43 used $e = 0.06$: $1 - e = 0.94$ and $e\/3 = 0.02$.

Each read comes from either chromosome copy, half the time each. In set 43 you counted 100 reads from an AT fish: 47 + 1 = 48 showed A.
]

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor derivation of the #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] model (historical; web source).]
#question(space: 1.7in, gap: 0em)[
*Core: turn your counting into a formula · 7 minutes.* Redo set 43's count with $e$ in place of the numbers.

- Out of 100 reads from an AT fish, what is the expected number from the A copy reported as A? From the T copy? Write both in terms of $e$, add them, divide by 100. Simplify to get $P("one read shows A" | "AT")$ as a formula in $e$.
- Check: put $e = 0.06$ into your formula. You should get set 43's 0.48.
- Write $P("both reads show A" | "AT")$ as a formula in $e$. Assume each read independently picks a copy and gets its own error.
- Sanity check: set $e = 0$ in your one-read formula. In one sentence, explain why that number makes biological sense for an AT fish.
]

#pagebreak(weak: true)
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor-written mistake, based on the set 41 and 42 errors.]
#question(space: 2.2in, gap: 0em)[
*Find the mistake · 4 minutes.* A student writes, for an AT fish with $e = 0.06$:

#align(center)[
  $P("both reads show A" | "AT") = 1/2 (0.94) times 1/2 (0.02) = 0.47 times 0.01 = 0.0047$
]

Write:
- Which part of set 43 does $1/2 (0.94)$ match, and which part does $1/2 (0.02)$ match? (Think of the 100-reads count.)
- In words: what single situation does $0.0047$ describe? Why is it only part of the answer?
- Two short rules, one line each: when do you _add_, and when do you _multiply_?
]

#pagebreak(weak: true)
#ref_box[
*Likelihood of $f$.* For a fixed set of reads, $P("all reads" | f)$ is called the _likelihood_ of $f$. Comparing two values of $f$: the one with the higher likelihood makes the observed reads more probable. "How many times more probable" is the ratio of the two likelihoods.

Same two fish as set 43, on the old sequencer: true base 0.97, each wrong base 0.01 ($e = 0.03$). $L = P("this fish's reads" | "genotype")$, rounded. Fish 1 reads A, T: $L = 0.01, 0.24, 0.01$ for AA, AT, TT. Fish 2 reads A, A: $L = 0.94, 0.24, 0.0001$.

$f$ is the frequency of the T allele in the population. Assuming Hardy-Weinberg, genotype frequencies are AA $(1-f)^2$, AT $2f(1-f)$, TT $f^2$. Each fish's chance of its reads = sum over genotypes of $L times$ genotype frequency. Fish are independent, so both fish = fish 1 × fish 2.
]

#source[Bishop & Bishop, _Deep Learning_ · §2.1.6 Independent variables, PDF p.51 / printed p.31; §4.1.2 Likelihood function, PDF pp.133–134 / printed pp.114–115. Tutor toy version of #link("https://popgen.dk/angsd/index.php/Allele_Frequencies")[ANGSD, Allele Frequencies] (`-doMaf`, Kim et al. 2011). Web source.]
#question(space: 2.3in, gap: 0em)[
*Predict, then compute · 6 minutes.*

- *Predict first.* The two fish carry 4 chromosome copies between them. Looking only at the reads (A, T and A, A), how many of those 4 copies would you guess are T? So which $f$ do you expect to have the highest likelihood?
- *Compute* the both-fish likelihood at $f = 0.25$ by hand: fish 1's sum, fish 2's sum, then multiply.
]

#pagebreak(weak: true)
#source[Same sources as Q3. Tutor toy example.]
#question(space: 0.3in, gap: 0em)[
*Sketch the likelihood curve · 3 minutes.* Both-fish likelihoods: $f = 0$: 0.0094, $f = 0.25$: your Q3 answer, $f = 0.5$: 0.0444 (set 43), $f = 0.75$: 0.0143, $f = 1$: 0.000001.

- Plot the five points on the axes and join them with a smooth curve. Mark where the peak seems to be.
- One sentence: did the peak land near your Q3 prediction? Take the highest of your 5 points: how many times more probable does it make the reads than $f = 0$ (ratio of likelihoods)?

#v(0.6in)
#axes()
]

#pagebreak(weak: true)
#source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, Eq.16.1 (mean) and Eq.16.3 (covariance, $1\/N$), PDF pp.511–512 / printed pp.497–498. Tutor numerical example. Repair of set 43 Q5.]
#question(space: 1.6in, gap: 0em)[
*Math refresher: what the sign of a covariance means · 5 minutes.* Three fish, genotype dosage (number of T alleles) at two SNPs.

#align(center)[
  Dataset X: SNP 1 = 0, 1, 2 #h(1em) SNP 2 = 0, 1, 2
  #linebreak()
  Dataset Y: SNP 1 = 0, 1, 2 #h(1em) SNP 2 = 2, 1, 0
]

Write:
Covariance between SNP 1 and SNP 2 = (1/3) × sum over fish of (SNP 1 − SNP 1 mean) × (SNP 2 − SNP 2 mean). "Centered" means value minus that SNP's mean.

- *Predict* the sign of the covariance between SNP 1 and SNP 2 (positive, negative or zero) for X and for Y, without computing. One reason each.
- *Check* Y by hand: means, centered values, products, sum ÷ 3.
- One sentence: what does a negative covariance say about these fish? Describe the fish, not a single number.
]
]
