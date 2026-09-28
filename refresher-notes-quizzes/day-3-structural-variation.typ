#import "refresher-template.typ": *

#show: sheet.with(
  day: "3",
  title: "Inversions, fusions, supergenes — and what recombination does to every statistic you own",
  strap: "Hoff et al. 2026 · Matschiner et al. 2022 · Berg et al. 2017 · Bringloe et al. 2024",
)

#budget(read: "35 min", answer: "45 min", total: "~1 h 20")

#carry[
  *Carry-forward from Day 2.* In one line each, from memory: the property of ILS that $D$
  exploits, and the assumption #emph[G. morhua] violates when placed in the outgroup slot.
]

= Reading

== 1. Recombination is the hidden variable behind every scan

Selection at a site drags linked variation with it — a sweep removes diversity around the
favoured allele, background selection removes it around deleterious ones. How far that
reaches is set by the local recombination rate. So *low-recombination regions have low
$pi_w$*, everywhere, in every species, with no reference to gene flow.

Now recall Day 1: $F_(S T) = 1 - pi_w \/ d_(x y)$. Drop $pi_w$ and $F_(S T)$ rises. A
genome scan therefore produces $F_(S T)$ peaks that are *maps of the recombination
landscape* unless you do something about it. That is the mechanism behind Day 4's central
paper, and it is why inversions matter here far beyond being interesting biology: an
inversion is a region of locally abolished recombination, sitting in your data, generating
the exact signature you would want to interpret as a barrier.

== 2. Inversions as supergenes, and how to recognise one blind

In a heterokaryotype — one standard arrangement, one inverted — crossing over inside the
inverted segment produces unbalanced gametes, so recombinants are effectively not
recovered. The two arrangements then accumulate mutations independently while continuing
to segregate in one population. The result is a *supergene*: megabases of sequence
inherited as a single non-recombining unit, with two divergent haplotype classes at
intermediate frequency.

#key[
  The blind diagnostic, in order of usefulness. \
  *(i)* Run a PCA on one chromosome at a time. An inversion produces *three discrete
  clusters* along one PC — the two homokaryotypes and the heterokaryotypes — with cluster
  sizes in Hardy–Weinberg proportions. Population structure does not do this. \
  *(ii)* Inside the region, the middle cluster shows a *heterozygote excess* at nearly every
  SNP. \
  *(iii)* Tajima's D goes *positive*, because two divergent haplotypes at intermediate
  frequency is an excess of intermediate-frequency variants. \
  *(iv)* LD stays high across the whole block and collapses at the breakpoints.
]

Atlantic cod is the type case: four megabase-scale inversions on LG1, LG2, LG7 and LG12,
associated with the migratory/stationary ecotype split and with temperature and salinity
gradients (Sodeland et al. 2016; Berg et al. 2017). Matschiner et al. (2022) dated them and
asked how they are maintained — read it for the *ages* and the *maintenance mechanism*,
which is the part that transfers to your system.

== 3. Hoff et al. 2026 — the paper you skipped

Six new chromosome-level gadid assemblies: polar cod (#emph[Boreogadus saida]), Arctic cod
(#emph[Arctogadus glacialis]), Norwegian coastal Atlantic cod, haddock, burbot and European
hake. Four results worth carrying:

*(a) Lineage-specific fusions, and they correlate with cold.* Five fusions in polar cod,
eight in Arctic cod, reducing chromosome number below the presumed ancestral teleost
karyotype. Reduced chromosome number is significantly associated with northward
distribution and colder preferred temperature — echoing the Antarctic notothenioids, so
plausibly convergent.

*(b) Fusions carry a population-genetic signature.* Citing the polar-cod and Arctic-cod
population studies: fused regions show *elevated LD, positive Tajima's D, and reduced
$d_(x y)$* relative to flanking regions. Larger chromosomes and repositioned centromeres
suppress recombination centrally, so LD is high in the middle of fused chromosomes and low
distally. This matters to you directly: it is a route to detecting candidate structural
differences between Gmac and Gogac *from lcWGS alone*, with no cytogenetics.

*(c) The AFGP arrays are built by transposable elements.* Three #emph[afgp] clusters in
polar cod, on chromosomes 1, 2 and 14, each sitting in association with a chromosomal
rearrangement. The genes are flanked by identical repeats in tandem, one curated as a MITE
(DNA/MITE-224; a second, DNA/MITE-244, on the chromosome-2 cluster) — a Class II element
with intact terminal inverted repeats. Shared TE families between clusters suggest the
chromosome-2 copies arrived from chromosome 1 by ectopic recombination.

*(d) The counterintuitive one.* Between polar cod and Arctic cod, the regions of
*overlapping inversions* show *low* $F_(S T)$ (below 0.25) and $d_(x y)$ close to zero, with
the strongest similarity at the breakpoints themselves. Shared inversions here are regions
of similarity, not divergence. Q3 asks you to reconcile that with §2.

#trap[
  Two limits to hold, both from your own reading list. Hoff is *tree-framed* throughout —
  ASTRAL-III on 1,939 BUSCO gene trees, IQ-TREE2 on mitochondrial genes — so it is not
  evidence for reticulation and must not be cited as such; that is Codweb's job.
  And #emph[G. macrocephalus] and #emph[G. ogac] *do not appear in the paper at all*. It is
  a framework and a comparator, not direct evidence about your pair.
]

== 4. The order of operations

Bringloe et al. (2024) is the closest procedural template you have: same ocean basin, same
data type. They screen for hybridisation with #emph[Arctogadus], identify three large
inversions (7.4–16.1 Mbp), and locate a ~2 Mbp sex-linked region — *all before* they
interpret population structure. That ordering is not stylistic. Each of those three things
independently generates convincing false structure, and once they are inside a genome-wide
PCA there is no way to tell what you are looking at.

#sources[
  Hoff SNK et al. (2026). Rapid genome modifications including chromosomal fusions and
  large-scale inversions are key features in Arctic codfish species. #emph[Genome Biology]
  27:100. doi:10.1186/s13059-026-03975-6 — *PDF is in the chapter repo root.* Read the
  abstract, Fig. 1, the fusion and inversion results, and the #emph[afgp]/MITE section.
  Skip the assembly-statistics tables. \
  Matschiner M et al. (2022). Supergene origin and maintenance in Atlantic cod.
  #emph[Nat Ecol Evol] 6:424–437. doi:10.1038/s41559-022-01661-x — ages and maintenance. \
  Berg PR et al. (2017). Trans-oceanic genomic divergence of Atlantic cod ecotypes is
  associated with large inversions. #emph[Heredity] 119:418–428. doi:10.1038/hdy.2017.54 — skim. \
  Sodeland M et al. (2016). "Islands of divergence" in the Atlantic cod genome represent
  polymorphic chromosomal rearrangements. #emph[GBE] 8(4):1012–1022. doi:10.1093/gbe/evw057
  — *the title is the lesson; read the abstract at minimum.* \
  Bringloe TT et al. (2024). Genomic architecture and population structure of
  #emph[Boreogadus saida] from Canadian waters. #emph[Sci Rep] 14:19331.
  doi:10.1038/s41598-024-69782-w — *read the methods twice; this is your procedural template.*
]

#pagebreak()

= Questions

#question(space: 1.8in, tag: "derive")[
  A 1 Mb region has a recombination rate one tenth the genome average. There is no
  difference in gene flow between Gmac and Gogac in that region relative to anywhere else.
  Explain mechanistically why it will nonetheless show elevated $F_(S T)$, using the Day 1
  identity explicitly. Which statistic is least affected, and why is it not entirely unaffected either?
]

#question(space: 2.0in, tag: "diagnose")[
  You run a per-chromosome PCA on the 112 samples. On one chromosome, PC1 splits them into
  three tight clusters of roughly 27, 55 and 30 individuals. State your first hypothesis,
  give two further computations that would confirm it, and say what the cluster sizes
  themselves tell you. Once confirmed, what do you do with that region for the rest of the
  chapter — and what would it be a mistake to do?
]

#question(space: 2.0in, tag: "reconcile")[
  §2 says inversions suppress recombination and let haplotypes diverge. Hoff finds that
  the shared inversions between polar cod and Arctic cod have *low* $F_(S T)$ and $d_(x y)$
  near zero, most similar at the breakpoints. Reconcile these. What must be true about the
  history of those inversions for both statements to hold at once, and what would you
  measure to test it?
]

#question(space: 1.9in, tag: "mechanism")[
  The fusion signature is *elevated LD + positive Tajima's D + reduced $d_(x y)$*. Give the
  mechanism for each of the three separately. Then answer the part people get wrong: why
  should $d_(x y)$ be *reduced* rather than elevated in a low-recombination region, when
  reduced recombination is supposed to promote divergence?
]

#question(space: 2.0in, tag: "apply")[
  Your chapter's headline locus is AFGP. Name *three logically separate* reasons an
  $F_(S T)$ peak at AFGP would be close to uninterpretable in lcWGS data — one from Hoff,
  one from the assembly, one from the statistic itself. Then describe what you would do
  instead, and what the four HiFi assemblies let you check before you commit to it.
]

#question(space: 1.4in, tag: "judgement")[
  Hoff is the wrong citation for reticulate evolution. Say why in two sentences, name what
  it *is* the right citation for in your chapter, and name the paper that should carry the
  reticulation claim instead.
]

#closing[
  Stop the timer and put the sheet down. Do not check anything before returning it.
]
