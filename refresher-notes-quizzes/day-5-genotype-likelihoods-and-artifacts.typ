#import "refresher-template.typ": *

#show: sheet.with(
  day: "5",
  title: "Measuring all of it at 10×: genotype likelihoods and the artifact layer",
  strap: "Lou et al. 2021 · Korneliussen et al. 2014 · Meisner & Albrechtsen 2018 · Günther & Nettelblad 2019",
)

#budget(read: "30 min", answer: "50 min", total: "~1 h 20")

#carry[
  *Carry-forward from Day 4.* From memory: the operational rule that replaces "high
  $F_(S T)$ means barrier", and the one input your project lacks for a proper outlier null.
]

= Reading

== 1. Why genotype likelihoods, stated as a mechanism

At depth $d$ over a truly heterozygous site, the probability that every read samples the
same allele is

#eq[$ P("dropout") = 2 times (1/2)^d = 2^(1 - d) $]

— 12.5% at 4×, 0.8% at 8×, ~0.2% at your ~10–11× over the assembled reference. Small, but
notice the direction: *dropout turns heterozygotes into homozygotes and never the reverse.*
The error is not noise, it is a bias with a sign.

Follow it through. Excess homozygosity depresses observed heterozygosity and $pi_w$, and by
Day 1's identity a depressed $pi_w$ *inflates* $F_(S T)$. Now let depth differ between
groups — as it will, since your Greenland DNA is 26–29 years old and worst on A260/230 —
and every one of those biases becomes a *group-level* effect aligned with the taxon axis
you are trying to measure.

#key[
  A genotype likelihood keeps $P("reads" | "genotype")$ for all three genotypes instead of
  committing to one, and every downstream estimator integrates over that uncertainty. It
  does not make the depth difference disappear. It stops the depth difference from being
  silently converted into a *biological* claim.
]

== 2. The SFS is the hub, and everything hangs off it

The ANGSD path: genotype likelihoods $arrow$ `-doSaf` (per-site allele-frequency
likelihoods) $arrow$ `realSFS` (ML estimate of the SFS by EM) $arrow$ $theta_W$, $pi$,
Tajima's D. The 2D SFS between two populations gives $F_(S T)$ and $d_(x y)$. A fitted
demographic model — Day 4's missing input — is also estimated from that same SFS.

So a single object feeds nearly every number in the chapter, which means a single mistake
propagates to all of them. The mistake with the widest blast radius is *polarisation*:
an unfolded SFS needs an ancestral allele, and Day 2 showed what an admixed outgroup does
to that. Fold it wherever the question permits.

PCAngsd (Meisner & Albrechtsen 2018) does the structure half: it iteratively estimates
individual allele frequencies from a low-rank decomposition of the genotype posteriors, so
it degrades gracefully with uneven depth. *Gracefully is not immunity* — a systematic depth
difference aligned with a group is still recoverable as a PC.

== 3. Reference bias, and the control that makes it reportable

A read carrying the non-reference allele has more mismatches, so it maps with lower
quality, and is more often unplaced or filtered. Alternative alleles are therefore lost
*preferentially*, and lost most in whichever taxon is further from the reference.

Map all 112 to a #emph[G. macrocephalus] assembly and the loss falls harder on
#emph[G. ogac]: deflated heterozygosity, deflated diversity, inflated $F_(S T)$ — a
manufactured taxon difference pointing in exactly the direction the chapter would like to
claim. It concentrates at indels, in high-divergence windows, and in non-syntenic regions,
which is to say precisely where an adaptive claim would be made.

#key[
  The design's answer (§8.2) is a two-arm swap on 24 samples. The *between-taxon* arm
  (Gmac $arrow$ Gogac reference) measures candidate bias. The *within-taxon* arm
  (Gmac-EBS $arrow$ Gmac-GOA) measures how much the statistics move for reasons that have
  nothing to do with taxon — the assembly-to-assembly noise floor. The second arm is what
  makes the first interpretable, and it is the step almost everyone skips.
]

== 4. The nuisance axes, and why they are diagnosable but not removable

*Depth, duplication rate, insert size, GC.* Batch effects are diffuse and genome-wide and
correlate with these; real population structure is localised. That difference is your only
handle.

*Post-mortem damage.* Long warm ethanol storage deaminates cytosine, giving an excess of
C$arrow$T and G$arrow$A transitions. It is directional, it is worst in the oldest material
(Disko Bay, 1997/2000), and it inflates apparent diversity in exactly the smallest group.
Check Ts/Tv and the substitution spectrum against collection year.

*Index hopping.* Patterned flow cells with ExAmp chemistry hop at ~0.1–2%. With 112
libraries on one lane, a slice of every sample's reads is assigned to every other sample.
The effect is *homogenising*: populations look more alike, and false low-frequency variants
appear to be shared across groups. In a chapter where introgression is the hypothesis, the
artifact and the signal have the same shape. Unique dual indexes suppress it, and indexing
was handled at prep here — so this is no longer a decision, it is a residual to *bound and
report* from the returned data. The residual is not zero.

#trap[
  None of these is removable after the fact — there are no cross-method replicates in the
  panel (§4c). They are *diagnosable*: correlate every PC against mean depth, missingness,
  duplication rate, collection year and isolation batch *before* interpreting any PC as
  biology. Reporting the diagnostic is not the same as fixing the problem, and the methods
  must not imply otherwise.
]

== 5. Relatedness first, because gadids are sweepstakes spawners

High variance in reproductive success means a single haul can contain many sibs. Sibs
break the assumption of independent sampling in three separate ways: they pull apparent
population structure toward family structure, they bias allele-frequency estimates toward
the family's genotypes, and they distort the SFS. Your Aleutian fish come from 7 hauls,
mostly two per haul; Nain Bay is a single ~1 km locality. NgsRelate estimates relatedness
directly from genotype likelihoods, so it runs before anything else and without hard calls.

#sources[
  Lou RN, Jacobs A, Wilder AP, Therkildsen NO (2021). A beginner's guide to low-coverage
  whole genome sequencing for population genomics. #emph[Mol Ecol] 30:5966–5993.
  doi:10.1111/mec.16077 — *the single most useful methods paper for this chapter; read it
  cover to cover, today or over the weekend.* \
  Korneliussen TS, Albrechtsen A, Nielsen R (2014). ANGSD. #emph[BMC Bioinformatics]
  15:356. doi:10.1186/s12859-014-0356-4 — reference. \
  Meisner J, Albrechtsen A (2018). Inferring population structure and admixture proportions
  in low-depth NGS data. #emph[Genetics] 210(2):719–731. doi:10.1534/genetics.118.301336 — PCAngsd. \
  Nielsen R, Korneliussen T, Albrechtsen A, Li Y, Wang J (2012). SNP calling, genotype
  calling, and sample allele frequency estimation from new-generation sequencing data.
  #emph[PLoS ONE] 7(7):e37558. doi:10.1371/journal.pone.0037558 — why not to hard-call. \
  Günther T, Nettelblad C (2019). The presence and impact of reference bias on population
  genomic studies of prehistoric human populations. #emph[PLoS Genet] 15(7):e1008302.
  doi:10.1371/journal.pgen.1008302 — *the clearest quantification of reference bias; short.* \
  Korneliussen TS, Moltke I (2015). NgsRelate. #emph[Bioinformatics] 31:4009–4011.
  doi:10.1093/bioinformatics/btv509 — the tool. \
  Costello M et al. (2018). Characterization and remediation of sample index swaps.
  #emph[BMC Genomics] 19:332. doi:10.1186/s12864-018-4703-0 — index hopping; skim.
]

#pagebreak()

= Questions

#question(space: 2.1in, tag: "trace")[
  Gmac libraries average 12× and Gogac libraries average 6×. Trace, mechanistically and
  separately, what that does to (a) per-individual heterozygosity, (b) $F_(S T)$ between
  the taxa, (c) PC1 of a PCAngsd run. Give the *direction* of each effect. Which of the
  three is most dangerous for this chapter specifically, and why that one?
]

#question(space: 1.8in, tag: "mechanism")[
  Explain why hard-calling genotypes damages *this* design more than it would damage a 30×
  design. Your answer must name the asymmetry — say what is lost, in which direction, and
  why the loss is not equal across the panel.
]

#question(space: 2.0in, tag: "design")[
  A committee member says the reference-bias control is a waste of compute because
  "everyone maps to one reference." Explain what the within-taxon arm measures that the
  between-taxon arm cannot, and state the specific result that would let you drop the
  concern entirely — and the specific result that would force you to mask windows.
]

#question(space: 1.9in, tag: "artifact")[
  Index hopping runs at 1% across the lane. State its effect on (a) $F_(S T)$ between any
  two groups, (b) a $D$-statistic testing #emph[morhua] introgression into #emph[ogac],
  (c) counts of private alleles per population. Then say why this particular artifact is
  more dangerous in this chapter than it would be in a standard stock-structure study.
]

#question(space: 1.9in, tag: "distinguish")[
  Two Aleutian fish from the same haul turn out to be full sibs and you leave them in.
  Give *different* answers for what breaks in (a) a PCAngsd structure analysis and (b) the
  folded SFS used to estimate $pi$ and Tajima's D for that population. Why is the SFS
  damage harder to notice than the PCA damage?
]

#question(space: 2.4in, tag: "capstone")[
  Write the order of operations from raw BAMs to a defensible windowed $F_(S T)$ scan
  between Gmac and Gogac. For each step, give one sentence saying why it must come *before*
  the step that follows it. Aim for six to nine steps. This is the question the other four
  days were for — take the time.
]

#closing[
  Stop the timer. When all five days are done, send the sheets back together with any
  running commentary — including the questions you think are badly posed.
]
