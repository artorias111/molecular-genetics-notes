#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#let bh_table() = table(
  columns: (0.7fr, 1.1fr, 1.6fr, 1.4fr), inset: 6pt, stroke: 0.5pt, rows: (auto, 0.36in, 0.36in, 0.36in, 0.36in, 0.36in),
  [*Rank $i$* (smallest p first)], [*p-value* (given)], [*BH cutoff $= i\/m times q$* (fill in, $m = 5$, $q = 0.05$)], [*Is p ≤ cutoff?* (yes / no)],
  [1], [0.001], [], [],
  [2], [0.012], [], [],
  [3], [0.025], [], [],
  [4], [0.038], [], [],
  [5], [0.200], [], [],
)
#sheet(day: "SQ", title: "Statistics side quest: the CV line", set_label: "stats side quest")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
*Optional side quest. About 20 minutes, stop at 25. Not graded against the Chapter 3 route.*

One question per statistics skill listed on your CV: population genetic inference, selection scans, GL(M)Ms, multiple testing, permutation/bootstrap, PCA. Short answers are fine. A sentence beats a paragraph.

#source[Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 / printed pp.28–29. Tutor example; #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods")[ANGSD, Genotype Likelihoods] (web source).]
#question(space: 2.4in, gap: 0.3em)[
*Population genetic inference: likelihood or posterior? · 3 minutes.* A fish's genotype likelihoods are $L = P("reads" | "genotype") = 0.01, 0.24, 0.01$ for AA, AT, TT. The T allele frequency is $f = 0.5$, so Hardy-Weinberg genotype frequencies are $0.25, 0.5, 0.25$.

- Compute $P("AT" | "reads")$.
- One line: which of the two quantities, $L$ or $P("AT" | "reads")$, needs $f$, and why?
]

#pagebreak(weak: true)
#source[Cruickshank & Hahn 2014, _Mol. Ecol._ 23:3133–3157 (relative vs absolute divergence in "islands"). Tutor example.]
#question(space: 3in, gap: 0.3em)[
*Selection scans: is an outlier evidence? · 3 minutes.* In a genome scan between two cod populations, one 50-kb window has $F_"ST" = 0.6$. The genome-wide mean is $0.1$. It is in the top 1% of windows.

- Give two reasons, other than positive selection acting on this window, that it could have high $F_"ST"$.
- One line: "top 1%" is a rank, not a p-value. Why?
]

#pagebreak(weak: true)
#source[McCullagh & Nelder 1989, _Generalized Linear Models_, 2nd ed. (families and link functions). Bishop §6.4 Error Functions, PDF pp.212–215 / printed pp.194–197. Tutor example.]
#question(space: 2.2in, gap: 0.3em)[
*GLM: pick the family · 3 minutes.* For each response, name a GLM family and its usual link.
- (a) Number of RNA-seq reads on a gene in each fish (ignore library size).
- (b) Whether each fish has a trait: yes or no.
- (c) log body length, a continuous number.

Then: in a logistic regression (family for yes/no, logit link), the coefficient for "number of T alleles at a SNP" is $beta = 0.7$. Use $e^(0.7) approx 2.0$. One sentence: what happens to the _odds_ of having the trait for each extra T allele?
]

#pagebreak(weak: true)
#source[Hurlbert 1984, _Ecol. Monogr._ 54:187–211 (pseudoreplication). Tutor example.]
#question(space: 3in, gap: 0.3em)[
*Mixed model: why a random effect? · 3 minutes.* You measure one gene's expression in 10 fish from each of 6 populations (60 fish). Each population lives at one water temperature. You ask whether temperature affects expression.

- If you fit an ordinary regression on all 60 fish as independent, what goes wrong with the standard error and p-value? Why?
- What does adding "population" as a random effect fix? One sentence.
]

#pagebreak(weak: true)
#source[Benjamini & Hochberg 1995, _J. R. Stat. Soc. B_ 57:289–300 (FDR procedure). Tutor example.]
#question(space: 1.6in, gap: 0.3em)[
*Multiple testing · 4 minutes.*

- You test 10,000 SNPs. Suppose none is truly associated. At $alpha = 0.05$ each, how many SNPs do you expect to pass by chance? What is the Bonferroni per-test threshold?
- Five tests, sorted. Fill in the table (Benjamini–Hochberg at $q = 0.05$). BH rejects every test up to the _largest_ rank $i$ whose answer is yes.

#bh_table()

- How many does BH reject? How many does Bonferroni reject (threshold $0.05\/5 = 0.01$)?
- One line each: what does FDR $= 0.05$ control? What does FWER $= 0.05$ control?
]

#pagebreak(weak: true)
#source[Efron 1979, _Ann. Stat._ 7:1–26 (bootstrap). Phipson & Smyth 2010, _Stat. Appl. Genet. Mol. Biol._ 9:39 (permutation p-values). Künsch 1989, _Ann. Stat._ 17:1217–1241 (block resampling). Tutor example.]
#question(space: 2.6in, gap: 0.3em)[
*Permutation vs bootstrap · 3 minutes.* You compare mean $F_"ST"$ in 40 windows inside an inversion against 960 windows outside it. Observed difference (inside minus outside): $0.15$. Test it one-sided: is inside higher?

- *Permutation:* what do you shuffle, and what question does it answer? In 1,000 shuffles, 3 give an inside-minus-outside difference $>= 0.15$. Estimate the p-value as $("count" + 1)\/("shuffles" + 1)$.
- *Bootstrap:* what do you resample, and what do you get out of it?
- One line: why resample whole genomic blocks rather than single windows or SNPs?
- One line: windows inside an inversion sit next to each other and are correlated. Does that make your shuffled p-value too small, too large, or fine?
]

#pagebreak(weak: true)
#source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, PDF pp.511–512 / printed pp.497–498. Tutor example.]
#question(space: 3in, gap: 0.3em)[
*PCA · 3 minutes.* PC1's direction (unit vector) over two SNPs is $u = (0.6, 0.8)$. One fish's centered dosages (dosage = number of T alleles; centered = dosage minus that SNP's mean dosage) are $(1.0, -0.5)$.

- Compute this fish's PC1 score: $0.6 times 1.0 + 0.8 times (-0.5)$.
- One line: what does a fish's PC1 score tell you, in words?
- In a lcWGS PCA, PC1 cleanly separates fish sequenced in batch 1 from batch 2. Give one non-biological reason this could happen.
]
]
