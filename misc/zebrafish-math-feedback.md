# Zebrafish math quiz feedback — 2026-09-25

Agent: codex. Return: `misc/zebrafish-math-quiz-2026-09-25-15-03.pdf`. All seven pages visually reviewed, including annotated primer. **3/5 (60%) on the five attempted questions.** Optional Q6 blank and excluded, no penalty. This is a new-context discussion diagnostic, not a measure of general math ability. Actual time unreported. Q1 was supported by an explicit chat hint explaining A/B pattern positions; printed formulas/hints were also available. Other assistance unknown. Original files preserved.

## Evidence and partial credit

| Question | Score | Evidence |
|---|---|---|
| Q1 D and pattern interpretation | 0.5/1 | Correct D structure and P2/P3 excess after the chat hint (0.5). BABA count appears copied as 36,696 rather than 36,676, giving 0.1402 rather than 0.1405 (0/0.25 for reported value). BBAA described as “the null” with an incorrect P3/P4 explanation; rejection of the ancestry-percentage claim tentative without explanation (0/0.25 for interpretation). |
| Q2 windows and overlap | 0.75/1 | Recognizes site/split count is fixed, correctly obtains 490/500=49/50 and explains why overlapping windows are not independent (0.75). Explicit answer that equal site counts do not imply equal physical spans is missing (0/0.25). Prefer “200 ABBA/BABA-informative sites” to “number of shared alleles.” |
| Q3 binomial reference | 0.75/1 | All calculations correct: mean 250/3, SD 25/3, z=16/5. “No” correctly rejects automatic equal frequencies from six categories (0.75). No stated assumption to check before calibrating evidence (0/0.25). |
| Q4 likelihood and window frequency | 0.5/1 | Correct e³≈20.1, better-fitting A and window counts 105/100 (0.5). Correctly marks “No” to posterior question, but explanation then calls the likelihood ratio a test of the tree given data; distinction from window frequency remains unclear (0/0.5 for explanation). Also compare ratio with 1, not 0; no extra deduction. |
| Q5 ancestry mixture | 0.5/1 | Correct weight/conditional labels, sum-rule expression and 0.5×0.8+0.5×0.2 (0.5). Then evaluates the second product as 0.25 instead of 0.10 and obtains 0.65 (0/0.25). Gamma-versus-D explanation absent (0/0.25). |

## What this actually shows

The central arithmetic and modeling setup are stronger than the score alone suggests. You correctly handled overlapping windows, derived the binomial SD exactly, calculated a likelihood ratio and constructed a weighted mixture. The mixture error occurs after the right setup. The largest gap is attaching the right interpretation to a named statistic, with a few missed explanation prompts.

I introduced several unfamiliar statistical and phylogenetic terms at once. The advertised 21–25-minute quiz was too ambitious as a first encounter with all of them. In particular, the prior D hint was needed because ABBA/BABA notation was new. Future discussion preparation should separate a short worked terminology example from fewer questions. Do not treat this as evidence that your ongoing course has failed or that you need a full redo.

## Q1: decode B positions; distinguish a contrast from an ancestry fraction

With order (P1,P2,P3,O):

| Pattern | Pair sharing derived B |
|---|---|
| ABBA | P2 and P3: D. kyathit and D. nigrofasciatus |
| BABA | P1 and P3: D. rerio and D. nigrofasciatus |
| BBAA | P1 and P2: D. rerio and D. kyathit |

An A in both P3 and O means both have the ancestral state; it does not make them the pair sharing the derived character. For the assumed tree ((P1,P2),P3), BBAA supports the sister pair. D instead contrasts the two discordant sharing patterns, ABBA and BABA. The simple ILS-only null predicts equal expected ABBA/BABA counts; **BBAA itself is not “the null.”**

The paper's numbers give

D=(48,670−36,676)/(48,670+36,676)=11,994/85,346≈0.1405.

Your fraction appears to use 36,696; this is a transcription slip rather than an incorrect D formula. D=0.1405 means the ABBA-minus-BABA excess is about 14.05% of the total ABBA+BABA count. It does not count the fraction of bases with introgressed ancestry. Its denominator is a selected set of site patterns, and converting patterns into ancestry requires a model and additional information.

## Q2: correct overlap; make the unit explicit

The D windows hold the **number of ABBA/BABA-informative sites** fixed at 200. Their physical spans need not match: 0.5 Mb and 4 Mb are different. Site density varies across the genome.

Your 49/50=98% overlap and independence explanation are correct. Each consecutive split window mostly reuses the same observations; linkage can further reduce independent information. A smooth run of 20 windows is not 20 independent confirmations.

## Q3: your calculation is completely correct

E[X]=500/6=83.33; SD(X)=sqrt(500×(1/6)×(5/6))=25/3≈8.33; z=(110−83.33)/8.33=3.2.

Add one assumption check: “Are sites sufficiently independent for a binomial variance?” Or: “Is 1/6 the appropriate probability for this particular reference model?” Six possible outcomes do not guarantee equally likely outcomes, just as six faces do not guarantee a fair die. Linkage and the chosen null matter for significance. Here z is a standardized count excess, not itself a P-value or a reproduction of the paper's reported significance.

## Q4: likelihood points from a proposed tree to the observations

You calculated L_A/L_B=exp(−120−(−123))=exp(3)≈20.1 correctly. Since **20.1>1**, A gives this alignment the higher probability under the fitted models. Every positive likelihood ratio is greater than zero, so >0 does not choose between A and B.

Keep these three objects separate:

- Likelihood ratio: P(data | fitted tree A)/P(data | fitted tree B).
- Posterior: P(tree A | data), which requires a prior and normalization. With fitted nuisance parameters, maximized likelihoods are also not automatically Bayesian marginal likelihoods.
- Window fraction: number of inferred window trees showing a relationship divided by the number of windows. Here 105/250=42% and 100/250=40%.

Your sentence “likelihood ratio is testing the tree given the data” reverses the conditional. We use likelihoods to compare trees, but what we calculate is how probable the **data are given each tree**. The window fraction summarizes fitted relationships across different genomic partitions, not relative likelihoods for two fits to the same alignment.

## Q5: correct model, one multiplication slip

P(F)=0.5×0.8+0.5×0.2=0.4+0.1=0.5.

The weights 0.5/0.5 sum over the hidden lineage alternatives. The 0.8/0.2 values are feature probabilities given each lineage. Your symbolic setup and labels were right.

Gamma is an ancestry-mixture parameter in the specified model; Patterson's D is a normalized imbalance between discordant site-pattern counts. They estimate/describe different objects, so neither their values nor their percentages are interchangeable. Our simple mixture is a teaching analogy, not HyDe's estimation equation.

## Three useful statements for your discussion

1. “The excess is kyathit–nigrofasciatus sharing under this taxon order; D is a contrast of site patterns, not an admixture percentage.”
2. “Neighbouring windows share 98% of their split sites, so the spatial pattern is informative but the windows are not independent replications.”
3. “Likelihood, window-topology frequency and inferred ancestry proportion are different quantities. The paper combines them as evidence; none alone proves that hybridization caused reproductive isolation.”

The paper explicitly leaves the role of hybridization in causing reproductive isolation uncertain (Discussion, PDF p.9). Nonzero D under an appropriate null can challenge an ILS-only explanation without showing that ILS contributes nothing. The paper also notes limits on determining direction of introgression (pp.9–10). Optional Q6 was not attempted or scored; these are discussion pointers rather than a required redo.

Sources checked: provided `misc/jkae299.pdf`, Table 1 and Fig.3 p.6; methods pp.3–4; topology proportions/Fig.2 pp.4–5; HyDe interpretation p.8; limitations pp.9–10. Math explanations are tutor clarifications. Highlights were not used to select or weight quiz content.

## Teaching calibration

Retain short daily work and Chapter 3 priorities. Use explicit pattern-to-taxon examples before ABBA/BABA calculation; introduce one new inference quantity at a time. Connect likelihood-versus-posterior to GLs, and distinguish model construction from subsequent arithmetic slips. No broad mastery claims, recall-box promotion, full redo or schedule expansion. Daily set 37 remains issued/ungraded; this independent quiz does not advance the daily sequence.
