#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#let one_read_table() = table(
  columns: (1.5fr, 1.7fr, 1.7fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.42in, 0.42in, 0.42in),
  [*Where the read came from* (out of 100 reads)], [*Chance a read from this copy is reported as A* (use the sequencer box)], [*Expected number of these reads reported as A* (50 × previous column)],
  [50 reads from the A copy], [], [],
  [50 reads from the T copy], [], [],
  [All 100 reads], [(leave blank)], [Add the two cells above:],
)
#let pairs_table() = table(
  columns: (2.6fr, 1.2fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.42in, 0.42in, 0.42in, 0.42in),
  [*100 pairs of reads from the AT fish*], [*Your number*],
  [(a) Pairs where read 1 is reported as A (same count as Q1's total)], [],
  [(b) Chance read 2 is also reported as A (read 2 is a fresh read, so use your Q1 answer, the total ÷ 100)], [],
  [(c) Pairs where both reads are reported as A = (a) × (b) (expected count; decimals are fine)], [],
  [(d) $P("both reads show A" | "AT")$ = (c) ÷ 100], [],
)
#let gl_table() = table(
  columns: (0.8fr, 1.6fr, 1.6fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.5in, 0.5in, 0.5in),
  [*Genotype*], [*Chance one read shows A* (count 100 reads, as in Q1)], [*Chance both reads show A* (count 100 pairs, as in the table above)],
  [AA], [], [],
  [AT], [copy from Q1], [copy from (d)],
  [TT], [], [],
)
#let pop_table() = table(
  columns: (0.8fr, 1fr, 1.5fr, 1.6fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.45in, 0.45in, 0.45in, 0.45in),
  [*Genotype*], [*Fish out of 100* (given)], [*Chance a fish of this genotype gives A, A reads* ($L$, given)], [*Expected fish giving A, A reads* (fish × $L$)],
  [AA], [25], [0.94], [],
  [AT], [50], [0.24], [],
  [TT], [25], [0.0001], [],
  [All 100 fish], [100], [(leave blank)], [Add the three cells above:],
)
#let fish_table() = table(
  columns: (0.5fr, 1.3fr, 1.3fr, 1.4fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.45in, 0.5in, 0.5in),
  [*$f$*], [*Fish 1: chance of its A, T reads* (given)], [*Fish 2: chance of its A, A reads* (from Q3)], [*Both fish: chance of all their reads* (fish 1 × fish 2)],
  [0], [0.01], [0.94 (at $f=0$ every fish is AA)], [0.0094 (example)],
  [0.5], [0.125], [], [],
  [0.25], [0.0963], [optional], [optional],
)
#let cov_table() = table(
  columns: (0.7fr, 0.8fr, 0.8fr, 1.2fr, 1.2fr, 1.5fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.38in, 0.38in, 0.38in, 0.38in, 0.38in),
  [*Fish*], [*SNP 1 dosage*], [*SNP 2 dosage*], [*SNP 1 − SNP 1 mean*], [*SNP 2 − SNP 2 mean*], [*(SNP 1 − mean) × (SNP 2 − mean)*],
  [1], [0], [0], [], [], [],
  [2], [1], [0], [], [], [],
  [3], [1], [2], [], [], [],
  [4], [2], [2], [], [], [],
  [Mean / sum], [mean:], [mean:], [(leave blank)], [(leave blank)], [sum:],
)
#sheet(day: "43", title: "Counting reads, then counting fish", set_label: "set 43")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
#daily_timer(review: 0, math: 20, ml: 0, biology: 0, stats: 0, buffer: 0, calculus: 5, compact: true, short_session: true, math_label: "Genotype likelihoods and allele frequency", closing_label: "Math refresher: covariance")
#parbreak()
*This week only: aim for about 25 minutes. Stop at 30, including reading.*

*Five-minute core:* Q1. The core counts as complete.

#ref_box[
*New sequencer for Q1 and Q2.* The true base is reported with probability $0.94$. Each particular wrong base is reported with probability $0.02$ (three wrong bases: $0.94 + 3(0.02) = 1$). Each read comes from either chromosome copy, half the time each. *Count, don't write formulas.*
]

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor application of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods#GATK_genotype_likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] (historical model; web source). Repair of set 42 Q1.]
#question(space: 0.3in, gap: 0em)[
*Core: one read from an AT fish · 5 minutes.* An AT fish has one A copy and one T copy. We count, out of 100 reads, how many get reported as A.

#one_read_table()

Write:
- Middle column: a read from the A copy has true base A; a read from the T copy has true base T. Write the chance each is reported as A.
- Right column: multiply 50 by the middle column. Add them in the bottom row.
- Divide the bottom-row total by 100. Write it here: $P("one read shows A" | "AT") =$ #box(width: 1in, stroke: (bottom: 0.5pt))[]
]

#pagebreak(weak: true)
#source[Same sources as Q1. Tutor application.]
#question(space: 0.4in, gap: 0em)[
*Two reads, then all three genotypes · 6 minutes.* Same sequencer and same AT fish. Now the fish gives two reads.

#pairs_table()

Then fill in this table. For AA and TT, redo Q1's counting (100 reads, then 100 pairs). For AA, both copies are A, so all 100 reads come from an A copy. For TT, all 100 come from a T copy.

#gl_table()

Write:
- Fill in both tables.
- One sentence: which genotype is most likely to give two A reads?
]

#pagebreak(weak: true)
#ref_box[
*From reads to fish.* Now count fish instead of reads. In a population with T frequency $f$, genotypes occur at
$ "AA": (1-f)^2, quad "AT": 2f(1-f), quad "TT": f^2. $
At $f = 0.5$ that is 25, 50 and 25 fish out of 100.

Q3 and Q4 use the *old sequencer* from set 42 (0.97 / 0.01), not your Q2 numbers. *Fish 2* is a fish whose two reads were A, A. Its $L = 0.94, 0.24, 0.0001$ for AA, AT, TT (rounded).
]

#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 / printed pp.26–28. Tutor toy version of #link("https://popgen.dk/angsd/index.php/Allele_Frequencies")[ANGSD, Allele Frequencies] (`-doMaf`, Kim et al. 2011). Web source. Repair of set 42 Q2.]
#question(space: 0.6in, gap: 0em)[
*Fish 2 on its own, $f = 0.5$ · 6 minutes.* 100 fish are drawn from the population. Each fish gets two reads.

#pop_table()

Write:
- Right column: multiply fish by $L$ in each row. Add them in the bottom row.
- Divide the bottom-row total by 100. That is $P("A, A reads" | f = 0.5)$, fish 2's number for Q4.
- Optional: redo at $f = 0.25$ (56.25, 37.5 and 6.25 fish).
]

#pagebreak(weak: true)
#source[Bishop & Bishop, _Deep Learning_ · §2.1.6 Independent variables, PDF p.51 / printed p.31. Tutor toy version of ANGSD Allele Frequencies (web source).]
#question(space: 1.1in, gap: 0em)[
*Two fish, one $f$ · 3 minutes.* Old sequencer, as in Q3. *Fish 1* had read 1 = A, read 2 = T. Its $L = 0.01, 0.24, 0.01$ for AA, AT, TT (rounded), and its column is filled in for you. Fish 2 comes from Q3. Different fish are independent given $f$, so multiply.

#fish_table()

Write:
- Row $f = 0.5$: copy fish 2's number from Q3, then multiply fish 1 × fish 2.
- One sentence: is $f = 0$ or $f = 0.5$ better supported, and by roughly how many times?
- Optional: fill in the $f = 0.25$ row using your Q3 optional answer.
]

#pagebreak(weak: true)
#source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, Eq.16.1 (mean) and Eq.16.3 (covariance, $1\/N$), PDF pp.511–512 / printed pp.497–498. Tutor numerical preparation for PCA. Repair of set 38 Q3.]
#question(space: 1.3in, gap: 0em)[
*Math refresher: covariance · 5 minutes.* Four fish, genotype dosage (number of T alleles) at two SNPs.

#cov_table()

Write:
- Bottom row: the mean of each SNP column.
- Columns 4 and 5: subtract that SNP's mean from each fish. Use the same mean for all four fish; don't center again afterwards.
- Column 6: multiply columns 4 and 5 in each row. Add them at the bottom.
- Covariance = that sum ÷ 4. Write it down.
- One sentence: what does the sign mean for these fish?
]
]
