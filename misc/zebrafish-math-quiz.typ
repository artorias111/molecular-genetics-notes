#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }
#sheet(title: "Paper discussion · mathematical terms", set_label: "Zebrafish math quiz")[
#set text(size: 10pt)
#set par(spacing: 0.55em)
*The hybrid history of zebrafish* · McCluskey, Batzel & Postlethwait, _G3_ (2025), jkae299.

*21–25 minutes including reading; hard stop at 30.*
Primer 3 min · Q1 4 · Q2 3 · Q3 4 · Q4 4 · Q5 3 · optional Q6 4.

Calculator allowed. Short answers suffice. Independent quiz; highlights ignored. PDF and printed page numbers match. Toy numbers are labelled.

= Read first: terms you will use
*SDC / pairwise split.* A shared derived character is a derived allele shared by taxa. A pairwise split here has the derived state in exactly two focal species. In ABBA, A means ancestral and B derived, *not literal nucleotide identities*. Fix the taxon order.

*ILS.* Incomplete lineage sorting can produce a gene history different from the species tree. Under the simple tree-only ABBA–BABA null, the two discordant patterns have equal expected frequency; this does not make all species pairs equally related.

*Patterson's D.* A normalized contrast of two discordant-pattern counts:
$ D=(n_("ABBA")-n_("BABA"))/(n_("ABBA")+n_("BABA")). $
Its sign depends on taxon order. Effect size, statistical significance and ancestry proportion are different quantities.

*Likelihood / topology support.* Likelihood is $P("alignment" | "tree, parameters")$. Maximum likelihood chooses the tree/parameters giving the data the largest probability. A fraction of windows supporting a topology describes those windows; it is not automatically a posterior probability that the tree is true.

*Two meanings of gamma.* In GTR + I + $Gamma$, GTR is a reversible nucleotide-substitution model, I permits invariant sites, and $Gamma$ models rate variation among sites. In HyDe, $gamma$ is an ancestry parameter. This paper orients HyDe's $gamma$ toward the _D. kyathit_ lineage.

*HAS / HHS.* Hybridization-associated speciation is broader than homoploid hybrid speciation (hybrid speciation without a ploidy increase). Evidence of admixture alone does not demonstrate that hybridization caused reproductive isolation.

#source[Paper: Introduction / Fig.1, PDF p.2; Methods, “Maximum likelihood phylogenetic analyses and hybridization detection,” p.3; Table 1 / Fig.3, p.6; Discussion, p.9. Definitions paraphrased; equations and practice prompts are tutor scaffolds.]

#pagebreak()
#source[Paper: Table 1, first row, and Fig.3a, PDF p.6; ancestral-state assignment in “Genomic structure analyses,” pp.3–4. Counts below are the paper's actual values.]
#question(space: 3.5in, gap: 0em)[
*From site patterns to D · 4 minutes.* Order taxa as $(P_1,P_2,P_3,O)$, with $P_1=$ _D. rerio_, $P_2=$ _D. kyathit_, $P_3=$ _D. nigrofasciatus_; $O$ denotes the ancestral reference state established from basal taxa. A = ancestral; B = derived.

Table 1 reports 48,670 ABBA sites, 36,676 BABA sites and 63,343 BBAA sites. Calculate
$ D=(n_("ABBA")-n_("BABA"))/(n_("ABBA")+n_("BABA")) $
to four decimal places. Name the species pair whose derived sharing is in excess, and explain why BBAA is not part of this denominator.

A participant says “that D value is the percentage of the genome introgressed.” Is that interpretation justified by this calculation? Give one reason.

*Optional hint:* identify which two taxa have B in each discordant pattern before interpreting the sign.
]

#pagebreak()
#source[Paper: “Genomic structure analyses,” PDF pp.3–4, and Fig.3, p.6. Methods specify 200 ABBA/BABA sites for D and 500 pairwise splits with a 10-site jump for the split scan. Tutor arithmetic/application.]
#question(space: 3.5in, gap: 0em)[
*What is a window an equal amount of? · 3 minutes.* The paper's D windows contain 200 ABBA/BABA sites. In a toy example, one such window spans 0.5 Mb of genome and another spans 4 Mb. Which quantity is held fixed, and does this make their physical spans equal?

For the separate split scan, successive windows contain 500 consecutive split sites and move forward by 10 sites. Calculate the fraction of sites shared by neighbouring windows. Explain why a run of 20 neighbouring enriched windows cannot automatically be counted as 20 independent replications.

*Optional hint:* count the sites retained after shifting a 500-site window by 10. Genomic linkage can introduce further dependence even without overlap.
]

#pagebreak()
#source[Paper: “Genomic structure analyses,” PDF p.4; six-pair equal-frequency reference model described on p.6. Tutor binomial calculation with an invented observed count; not a reconstruction of a reported P-value.]
#question(space: 3.5in, gap: 0em)[
*A binomial enrichment model · 4 minutes.* Four focal species have $binom(4,2)=6$ possible pairs. The paper uses an equal-pair reference frequency $p_0=1/6$ in 500-split windows.

For one chosen pair, suppose the observed count is 110 (toy value). Under an independent-trial binomial model, $X tilde "Binomial"(500,1/6)$, use
$ E[X]=n p_0, quad "SD"(X)=sqrt(n p_0(1-p_0)). $
Calculate the expected count and standard deviation, then the standardized excess
$ z=(110-E[X])/("SD"(X)). $
Round sensibly; you do not need a tail probability. Name one assumption to check before interpreting that excess as calibrated statistical evidence. Does “six possible pairs” by itself prove that every evolutionary tree predicts equal pair frequencies?

*Optional hint:* the number of possible categories and their probabilities are separate modeling choices. The calculation also assumes independent trials with the specified probability.
]

#pagebreak()
#source[Paper: maximum-likelihood methods, PDF p.3; “Widespread genealogical incongruence,” pp.4–5 and Fig.2. Log-likelihood values below are invented; 42% and 40% of 250 windows are the reported rounded support fractions.]
#question(space: 3.5in, gap: 0em)[
*Likelihood is not a vote or posterior · 4 minutes.* Two candidate trees fitted to the same alignment under the same substitution-model family have maximized natural log-likelihoods
$ ell_A=-120, quad ell_B=-123. $
Which fits these data better? Calculate the likelihood ratio $L_A/L_B=exp(ell_A-ell_B)$; you may use $e^3 approx 20.1$. Does that ratio alone give $P("tree A" | "data")$? Explain briefly.

Separately, the paper reports approximately 42% of 250 windows placing _D. rerio_ with _D. kyathit_, and 40% placing it with _D. aesculapii_. Convert those percentages to approximate window counts. Explain why “42% of windows” is a different kind of quantity from your likelihood ratio.

*Terminology note:* the paper calls these genomic partitions “jackknife windows.” Here you are counting trees inferred from partitions, not computing a delete-one-block jackknife standard error.
]

#pagebreak()
#source[Paper: HyDe parameter orientation, Methods PDF p.3; ancestry results, p.8 / Fig.4f on p.7. Mixture below is a tutor analogy for an ancestry weight, NOT HyDe's estimator or a formula fitted in the paper.]
#question(space: 3.5in, gap: 0em)[
*What does an ancestry weight do? · 3 minutes.* In a toy mixture, a hidden lineage label $Z$ is K with probability $gamma$ and A with probability $1-gamma$. Let K represent the _D. kyathit_ lineage and A the _D. aesculapii_ lineage; these labels are not nucleotide states.

An observed feature $F$ has $P(F | Z="K")=0.8$ and $P(F | Z="A")=0.2$. If $gamma=0.5$, calculate $P(F)$ by summing the two weighted routes. Label which numbers are mixture weights and which are conditional feature probabilities.

Explain in one sentence why a fitted ancestry parameter $gamma$ and Patterson's D should not be treated as interchangeable, even though both are numbers derived from sequence data.

*Optional hint:* the hidden alternatives are mutually exclusive. This is the same sum-rule structure as summing over an uncertain chromosome origin.
]

#pagebreak()
#source[Paper: Fig.3 / D-statistic interpretation, PDF p.6; HyDe results, p.8; Discussion, HHS criteria and remaining uncertainty, p.9. Tutor discussion synthesis; no new calculation.]
#question(space: 3.5in, gap: 0em)[
*Optional: make a defensible discussion statement · 4 minutes.* The paper finds one sharing signal concentrated near chromosome ends and another spread much more broadly; it also estimates ancestry with HyDe. A participant concludes:

“The D values are nonzero, so ILS is absent, the direction and fraction of gene flow are known, and hybridization definitely caused speciation.”

Replace that with two or three careful sentences. Distinguish rejecting an *ILS-only null* from excluding ILS entirely; say what D alone cannot identify; and name the causal link the Discussion says remains uncertain.

*Optional hint:* evidence of admixture and evidence that admixture caused reproductive isolation are different claims. Use the paper's actual limitations, not just “more research is needed.”
]
]
