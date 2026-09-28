#import "../template.typ": *
#let source(body) = { set text(size: 8.5pt); ref_box(body) }
#let mini(body) = block(fill: luma(245), stroke: 0.4pt + luma(180), inset: 4pt, width: 100%)[#text(size: 7.5pt, body)]
#sheet(day: "25", title: "Finish the probability model")[
#daily_timer(review: 5, math: 20, ml: 20, biology: 10, stats: 5, buffer: 0, compact: true)
#parbreak()
#text(size: 10pt)[*1. Recall · 5 min.* Circle one choice. Start with Q1; partial work is welcome.]
#mini[Bishop & Bishop, _Deep Learning_ · §2.1.3 Bayes' theorem, PDF pp.48–49 (printed pp.28–29). Day 24 Q6 repair; tutor item.]
#question(space: 0in, gap: 0.2em)[#text(size: 10pt)[Likelihood × prior weights are 6, 3, 1 after common rescaling. The first posterior is: A. $6/10$  B. $6/3$  C. $6$.]]
#mini[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, PDF pp.511–512 (printed pp.497–498). Day 24 Q8 repair; tutor item.]
#question(space: 0in, gap: 0.2em)[#text(size: 10pt)[For $u=(1,-1)^T/sqrt(2)$, the second contribution to $u^T u$ is: A. $-1/2$  B. $1/2$  C. $-1/sqrt(2)$.]]
#mini[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, PDF p.512 (printed p.498). Day 24 Q7 review; tutor item.]
#question(space: 0in, gap: 0.2em)[#text(size: 10pt)[Holding $b$ fixed, $frac(partial,partial a)(2a^2+2a b+2b^2)$ is: \
A. $4a+2b$  B. $4a+2a$  C. $4a+2b+4b$.]]
#mini[Lewin's _Genes XII_ · §18.8 Initiation Is Followed by Promoter Clearance and Elongation, PDF pp.1852,1855–1856. Day 24 Q9 review; tutor item.]
#question(space: 0in, gap: 0.2em)[#text(size: 10pt)[A long promoter-proximal pause can give: A. high occupancy with low downstream RNA output; B. proof of high productive transcription; C. proof of no initiation.]]
#mini[Bishop & Bishop, _Deep Learning_ · §11.2 Conditional Independence, PDF p.353 (printed p.337). Day 24 Q10 review; tutor sequencing application.]
#question(space: 0in, gap: 0.2em)[#text(size: 10pt)[One sequencing record is copied four times by software. How many actual read events supply evidence? A. five  B. four  C. one.]]

#pagebreak()
#section_heading("2. Popgen math · 20 min total")
#ref_box[
*Reading · 3 min; Q6 · 17 min. Calculator allowed.*
Our target is genotype $G$ of one diploid fish at one A/T site. Data $D=(A,T)$ mean first read A, second read T. Each read's chromosome of origin is hidden. The error probability $epsilon=0.12$ is fixed.

Assume equal chromosome sampling, correct alignment and no allele bias. Correct-call probability is $1-epsilon$; each particular wrong-base probability is $epsilon/3$. Distinct molecules and errors are independent given genotype.

*Start without an origin table:* reconstruct the chance that ONE read reports T if the fish is AT. Write the two origin contributions on Q6. If attempted September 18–19 or later, this is the scheduled delayed recall inside this slot; record any hint used.

*Finish the posterior:* $L(g)=P(D|G=g)$ holds genotype fixed. With supplied prior $pi_g=P(G=g)$, compute weight $w_g=L(g)pi_g$. Add the weights to obtain $Z$, then divide *each* weight by this same total. Check the resulting posteriors sum to one; checking priors is different. Keep calculator precision until rounding posteriors to four decimals. No Hardy–Weinberg assumption is used.

*Optional hint after two minutes stuck:* add weighted alternative origins for one read; multiply independent observed read probabilities given genotype. Do not include reversed order $(T,A)$.

Stop at 20 minutes with partial work if needed.

]
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48 (printed pp.26–28); §2.1.3 Bayes' theorem, PDF pp.48–49; §11.2 Conditional Independence, Eq.11.23, PDF p.353. Tutor adaptation of #link("https://popgen.dk/angsd/index.php/Genotype_Likelihoods")[ANGSD, Genotype Likelihoods → Theory / GATK] (web source; no PDF pages).]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §2.1.2 The sum and product rules, PDF pp.46–48; §2.1.3 Bayes' theorem, pp.48–49; §11.2 Conditional Independence, p.353. Tutor popgen adaptation; Day 24 Q6 normalization repair and changed-number read recall. ANGSD source on preceding page.]
#question(space: 0in, gap: 0em)[
*One model record · 17 min.* Use $epsilon=0.12$ and $D=(A,T)$. Show the two origin contributions for $p=P(B=T|G="AT")$; symmetry gives $P(B=A|G="AT")=p$. Complete the table and checks. Circle the largest likelihood and posterior; note any hint beside your working.
]
#v(0.15in)
AT origin contributions and resulting $p$: \
#block(height: 0.65in)[]
#text(size: 9pt)[
#table(columns: (0.42in,0.90in,0.88in,0.45in,1.15in,1fr), rows: (auto,0.72in,0.72in,0.72in), inset: 4pt,
[Genotype], [One-read \
(A,T)], [$L(g)$ \
show product], [Prior \
$pi_g$], [Weight \
$w_g=L(g)pi_g$], [Posterior \
$w_g/Z$],
[AA], [(0.88,0.04)], [], [0.80], [], [],
[AT], [($p$,$p$)], [], [0.15], [], [],
[TT], [(0.04,0.88)], [], [0.05], [], [])]
#v(0.15in)
Shared total $Z=$ \
#v(0.3in)
Posterior sum check: \
#v(0.3in)

#pagebreak()
#section_heading("3. ML foundations · 20 min total")
#ref_box[
*Reading · 4 min; Q7 · 6 min; Q8 · 10 min.*
A dot product multiplies matching components, then adds. For $v=(c,d)^T$, the squared length is $v^T v=c^2+d^2$. A scalar in *each* vector appears twice in the product: $(k v)^T(k v)=k^2(v^T v)$. Keep minus signs attached to components until multiplication is complete.

*Why this matters for PCA:* a direction $u$ gives an observation $x$ the score $z=u^T x$. Compare unit directions so a larger score variance reflects direction, not simply a longer vector. For covariance matrix $S$, projected variance is $u^T S u$.

*Where S comes from.* For paired features $x_i,y_i$ on $N$ observations, compute the means $overline(x),overline(y)$, then centered values $d_(x,i)=x_i-overline(x)$ and $d_(y,i)=y_i-overline(y)$. The off-diagonal covariance is
$S_(12)=1/N sum_(i=1)^N d_(x,i)d_(y,i).$
Here use Bishop's descriptive PCA convention $1/N$, not the $1/(N-1)$ unbiased-estimator convention. The features are fully observed and use comparable scales; genotype uncertainty is not part of this tiny example.

Positive covariance means the centered features tend to have the same sign. The matrix's diagonal entries describe individual feature variances; off-diagonal entries describe how pairs vary together. Today compute only one off-diagonal entry, not a complete PCA.

*First steps:* Q7, write one component product. Q8, add the three x values. Use one hint or mark and move on after two minutes stuck. Stop this whole section at 20 minutes.
]
#source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, PDF pp.511–512 (printed pp.497–498), Eqs.16.1–16.3. Tutor numerical prerequisites to Ex.16.1, PDF pp.541–542; not the full induction exercise.]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, PDF pp.511–512 (printed pp.497–498), Eqs.16.2–16.3 and unit constraint. Tutor Day 24 Q8 repair; preparation for Ex.16.1, PDF pp.541–542.]
#question(space: 0in, gap: 0em)[
*Keep both scalar factors and both signs · 6 min.* Let $u=(1,-1)^T/sqrt(2)$ and $S=mat(2,1;1,2)$. To isolate the dot-product step, we supply $S u=(1,-1)^T/sqrt(2)$. Complete the table with explicit component products, then finish the one-line interpretation below. Keep square roots exact.
]
#v(0.2in)
#table(columns: (1.0in,1fr,0.8in), rows: (auto,1.3in,1.3in), inset: 7pt,
[Quantity], [Two component products and their sum], [Result],
[Squared length \
$u^T u$], [], [],
[Score variance \
$u^T S u$], [], [])
#v(0.2in)
This is / is not a unit direction because: \
#block(height: 0.8in)[]

#pagebreak()
#source[Bishop & Bishop, _Deep Learning_ · §16.1.1 Maximum variance formulation, PDF pp.511–512 (printed pp.497–498), Eqs.16.1 and 16.3. Tutor covariance application; preparation for Ex.16.1, PDF pp.541–542.]
#question(space: 0in, gap: 0em)[
*Build one covariance entry · 10 min.* Find the two feature means, then fill the centered values and products. Finish $S_(12)=(text("sum of products"))/3$ and interpret its sign.
]
#v(0.2in)
$overline(x)=$ #box(width: 1.0in)[#line(length: 100%)]  $overline(y)=$ #box(width: 1.0in)[#line(length: 100%)]
#v(0.25in)
#table(columns: (0.5in,0.5in,1fr,1fr,1.4in), rows: (auto,0.8in,0.8in,0.8in), inset: 6pt,
[$x$], [$y$], [$x-overline(x)$], [$y-overline(y)$], [Product of centered values],
[1],[2],[],[],[], [2],[1],[],[],[], [3],[3],[],[],[])
#v(0.2in)
$S_(12)=$ \
#v(0.3in)
Its sign says the centered features tend to: \
#block(height: 0.45in)[]

#pagebreak()
#section_heading("4. Biology · 10 min total")
#ref_box[
*One new concept · 3 min reading: transcription recruits RNA processing.*
RNA polymerase II makes RNA. Its largest subunit has a flexible carboxy-terminal domain, the *CTD*, often called its tail. This tail can provide docking sites for proteins that process newly made RNA. It helps bring those proteins near the emerging transcript while transcription is still happening: *cotranscriptional processing*.

Phosphorylation adds a phosphate group to a protein. Depending on its site and context, it can change protein interactions or activity; it is not a universal on-switch. CTD phosphorylation helps recruit processing machinery, including the enzymes involved in adding a protective cap to the RNA's 5′ end. You do not need to memorize phosphorylation sites today.

Keep the roles separate: polymerase makes the RNA chain; recruited processing enzymes modify that RNA. A defect in docking can therefore impair processing even if polymerase still synthesizes RNA. This is a model to test, not a claim that every CTD perturbation leaves synthesis intact.

*Connection to the prior pausing concept:* impaired pause release can retain polymerase near a promoter while reducing downstream synthesis. Today's hypothetical experiment holds downstream synthesis unchanged, helping isolate a different step: recruitment of a processing enzyme.

First step: draw polymerase with a tail and an emerging RNA. Caption the causal arrows; a simple labeled sketch is enough.
]
#source[Lewin's _Genes XII_ (2018) · §18.8 Initiation Is Followed by Promoter Clearance and Elongation, PDF pp.1853–1854, Fig.18.14 and CTD-processing discussion; pause-release connection pp.1855–1856. Printed pages unverified.]

#pagebreak()
#source[Lewin's _Genes XII_ · §18.8 Initiation Is Followed by Promoter Clearance and Elongation, PDF pp.1853–1854 (Fig.18.14 and processing discussion). Tutor hypothetical recruitment perturbation, not book experimental data.]
#question(space: 3.7in, gap: 0em)[
*A docking defect · 7 min.* In a controlled short experiment, a perturbation reduces binding of a capping enzyme to the Pol II CTD. Downstream newly synthesized RNA remains unchanged, but the fraction of new transcripts with a normal 5′ cap falls. Assume matched measurement normalization and unchanged cell number.

Draw one labeled polymerase–CTD–enzyme–RNA diagram and caption how impaired recruitment could explain these observations. Distinguish RNA synthesis from RNA processing, and describe the mechanism as consistent with the evidence rather than uniquely proved. The 5′ cap is a protective modification of the RNA end.
]

#pagebreak()
*5. Stats · 5 min. Stop at 60 minutes total.*
#source[Bishop & Bishop, _Deep Learning_ · §2.3.2 Maximum likelihood, PDF pp.57–58 (printed pp.37–38); §11.2 Conditional Independence, PDF p.353. Tutor popgen sampling application; Days 21 and 23 genotype-versus-population sampling review.]
#question(space: 3.7in, gap: 0em)[
*More reads or another fish?* Estimate population T-allele frequency from six randomly sampled diploid fish with one read each and uncertain genotypes.

A adds independent reads from these fish; B sequences six additional randomly sampled, unrelated fish. Assume unbiased reads, no population substructure or copy-number changes.

In two or three sentences, explain what uncertainty each reduces and why A can help infer population frequency without adding fish.
]
]
