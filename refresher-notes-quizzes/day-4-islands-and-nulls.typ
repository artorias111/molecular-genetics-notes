#import "refresher-template.typ": *

#show: sheet.with(
  day: "4",
  title: "Genomic islands, demographic nulls, and the expansion that explains most of it",
  strap: "Cruickshank & Hahn 2014 · Ravinet et al. 2017 · Excoffier et al. 2009 · Tajima 1989",
)

#budget(read: "30 min", answer: "45 min", total: "~1 h 15")

#carry[
  *Carry-forward from Day 3.* From memory: the three-part fusion signature, and the
  blind diagnostic for a segregating inversion in a PCA.
]

= Reading

#key[
  *Why this day is in a pure delimitation chapter.* Nothing here is about adaptation.
  It is about the opposite: everything today describes a way to get a *convincing
  difference between Gmac and Gogac that is not a species boundary.* A Holocene range
  expansion alone produces declining diversity, rising $F_(S T)$ with distance, and
  high-frequency local alleles — with no barrier to gene flow anywhere. That is the null
  a "different species" verdict has to beat, and it is the strongest argument the other
  side has.
]

== 1. The reanalysis that should change what you plot

Cruickshank & Hahn (2014) took published "genomic islands of speciation" — regions of
elevated $F_(S T)$ interpreted as barrier loci resisting gene flow — and recomputed
absolute divergence in them. In nearly every case $d_(x y)$ inside the island was *equal to
or lower than* the genomic background, while $pi_w$ was sharply reduced.

That is the opposite of what a barrier predicts. A region resisting gene flow should have
an *older* coalescence than the homogenised background, hence elevated $d_(x y)$. Reduced
$pi_w$ with flat $d_(x y)$ is the signature of *linked selection in a low-recombination
region*, which requires no gene flow, no barrier, and no speciation.

#key[
  Operational rule, non-negotiable in your chapter: *never make a barrier claim from
  $F_(S T)$ alone.* Report $F_(S T)$, $d_(x y)$ and $pi_w$ for the same windows, plus local
  recombination rate. If $F_(S T)$ is up and $d_(x y)$ is not, you have a diversity valley,
  not an island of divergence — and Day 3 told you where those valleys are.
]

== 2. Ravinet's roadmap: read the joint pattern, not one statistic

Ravinet et al. (2017) systematise this into scenarios distinguished by the *joint*
behaviour of $F_(S T)$, $d_(x y)$, $pi_w$ and recombination rate:

- *Divergence with gene flow, true barrier locus.* $F_(S T)$ up, $d_(x y)$ up, and the
  effect need not track recombination rate.
- *Allopatric divergence, no gene flow.* $F_(S T)$ elevated broadly and fairly uniformly;
  $d_(x y)$ roughly flat across the genome.
- *Linked selection in allopatry.* $F_(S T)$ up, $d_(x y)$ *down*, $pi_w$ down, and the whole
  pattern correlates strongly with recombination rate.

#key[
  The genome-wide correlation between $F_(S T)$ and local recombination rate is itself the
  single most informative diagnostic you can compute, and it costs one scatterplot. If your
  $F_(S T)$ peaks sit in the low-recombination tail, the parsimonious reading is linked
  selection until proven otherwise.
]

== 3. The null your outliers actually have to beat

#emph[G. ogac] is a Late Pleistocene/Holocene eastward expansion out of the Pacific,
through the Canadian Arctic Archipelago, into Greenland and Labrador. Excoffier et al.
(2009) describe what range expansions do to genomes, and every item is something you will
otherwise mistake for selection:

*Serial founder effects.* Each colonisation step samples a subset of the previous deme.
Heterozygosity declines monotonically with distance along the expansion axis, and $F_(S T)$
between demes *increases* with that distance — all of it drift, none of it selection.

*Allele surfing.* A variant that happens to sit at the expanding wave front rides it and can
reach high frequency, or fixation, across a large area. The local signature — a
high-frequency derived allele over a spatially restricted region, with reduced surrounding
diversity — is close to indistinguishable from a local sweep.

*Expansion load.* Because surfing is indifferent to fitness, mildly deleterious alleles
accumulate toward the front. A "functionally interesting" allele at high frequency in
Greenland is at least as likely to be expansion load as adaptation.

#trap[
  Your sampling runs along the expansion axis: Cambridge Bay sits upstream, Nain Bay and
  West Greenland downstream. So the expansion null and the interesting hypotheses make
  predictions on *the same geographic axis*. Any claim about Greenland or Labrador has to
  be argued against this null explicitly — and note that §6.7's #emph[morhua] introgression
  predicts the *opposite sign* for diversity in exactly those populations. Q2.
]

== 4. Tajima's D, and why a genome-wide quantile is not a test

$theta_W$ is estimated from the number of segregating sites; $pi$ from mean pairwise
differences. Both estimate $theta = 4 N_e mu$ under neutrality and constant size, but they
weight the frequency spectrum differently — $theta_W$ counts a singleton and a
50%-frequency variant identically, $pi$ does not.

#eq[$ D = (pi - theta_W) / sqrt("Var") $]

Negative $D$ means an excess of rare variants: population growth, or a recent sweep.
Positive $D$ means an excess of intermediate-frequency variants: contraction, population
structure, balancing selection, or two divergent haplotypes segregating — Day 3's
inversion.

The trap is that *demography shifts the whole genome-wide distribution*. A population that
expanded has negative $D$ everywhere; a structured sample has positive $D$ everywhere. So
taking the top 1% of any scan and calling it selection is not a test — it is a definition.
It returns exactly 1% of windows whatever the truth is, has no null distribution behind it,
and its shape is set by the demographic history you have not yet modelled.

#key[
  What replaces it: fit a demographic model to the observed SFS (ANGSD $arrow$
  `moments`/`fastsimcoal`/`dadi`), simulate under that model with a recombination map
  (`msprime`, or `SLiM` if selection is in the model), and take the tail of the *simulated*
  distribution as the threshold. Where a fitted model is out of reach, the minimum
  defensible substitute is to condition on recombination rate and require $d_(x y)$ to move
  with $F_(S T)$.
]

#sources[
  Cruickshank TE, Hahn MW (2014). Reanalysis suggests that genomic islands of speciation
  are due to reduced diversity, not reduced gene flow. #emph[Mol Ecol] 23:3133–3157.
  doi:10.1111/mec.12796 — *read the abstract, the logic in the introduction, and Fig. 1.
  Non-negotiable before you interpret any scan.* \
  Ravinet M et al. (2017). Interpreting the genomic landscape of speciation: a road map for
  finding barriers to gene flow. #emph[J Evol Biol] 30(8):1450–1477. doi:10.1111/jeb.13047
  — long; read the scenario table and skim the rest. \
  Excoffier L, Foll M, Petit RJ (2009). Genetic consequences of range expansions.
  #emph[Annu Rev Ecol Evol Syst] 40:481–501. doi:10.1146/annurev.ecolsys.39.110707.173414
  — *this is the null for #emph[ogac]; read it properly.* \
  Tajima F (1989). Statistical method for testing the neutral mutation hypothesis by DNA
  polymorphism. #emph[Genetics] 123:585–595 — reference, not reading. \
  Booker TR, Yeaman S, Whitlock MC (2020). Variation in recombination rate affects detection
  of outliers in genome scans of differentiation. #emph[Mol Ecol] 29:4274–4279.
  doi:10.1111/mec.15501 — short; directly on the quantile-threshold problem. \
]

#pagebreak()

= Questions

#question(space: 2.1in, tag: "synthesise")[
  For each of Ravinet's three scenarios — divergence with gene flow, allopatric divergence,
  linked selection in allopatry — state the expected direction of $F_(S T)$, $d_(x y)$ and
  $pi_w$, and whether the pattern should correlate with local recombination rate. A small
  table is fine. Then say which single scenario you expect to dominate the Gmac/Gogac
  comparison, and why.
]

#question(space: 2.1in, tag: "conflict")[
  Suppose heterozygosity in #emph[ogac] declines Cambridge Bay $arrow$ Nain Bay $arrow$
  West Greenland. Give the expansion explanation and say why it predicts that ordering.
  Then note that §6.7's #emph[morhua] introgression hypothesis predicts the *opposite* sign
  for diversity in Nain and Greenland. Given both processes are plausibly acting, what do
  you actually expect to observe, and what statistic separates the two contributions?
]

#question(space: 2.0in, tag: "procedure")[
  A 200 kb window falls in the top 0.1% of genome-wide $F_(S T)$ between Gmac and Gogac.
  Write the ordered checklist of everything you would check before that window can be
  offered as evidence of a *species boundary*. Order matters — justify why your first
  check is first.
]

#question(space: 1.6in, tag: "stats")[
  Explain precisely why a top-1% outlier threshold "controls nothing". What is the null
  hypothesis it is implicitly testing, and what is wrong with it? Describe the replacement
  procedure and name the one input to it that your project does not yet have.
]

#question(space: 1.9in, tag: "rank")[
  You observe strongly positive Tajima's D in a 3 Mb region, in Gmac only. Give four
  distinct causes, then rank them by prior plausibility *for this specific dataset* — using
  what you know about the panel, the species, and Day 3. Justify the top-ranked one.
]

#question(space: 1.8in, tag: "argue")[
  State Cruickshank & Hahn's finding in your own words in no more than five sentences.
  Then give one concrete case in which elevated $F_(S T)$ with *no* elevation in $d_(x y)$
  would still bear on the same-or-different verdict — and say what you would call it,
  given that "island of speciation" is off the table.
]

#closing[
  Stop the timer and put the sheet down. Do not check anything before returning it.
]
