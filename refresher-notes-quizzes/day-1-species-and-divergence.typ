#import "refresher-template.typ": *

#show: sheet.with(
  day: "1",
  title: "What \"same species\" means, and what a divergence number is",
  strap: "de Queiroz 2007 · Roux et al. 2016 · Hudson 1992 · Sukumaran & Knowles 2017",
)

#budget(read: "30 min", answer: "45 min", total: "~1 h 15")

= Reading

== 1. What a verdict has to survive

The chapter delivers a verdict: is #emph[G. ogac] the same species as
#emph[G. macrocephalus], or not. Today is not about softening that into a continuum —
it is about knowing what a verdict has to be built from, so that it survives the two
attacks it will certainly meet.

de Queiroz (2007) points out that every species concept in circulation agrees on one
thing — a species is a *separately evolving metapopulation lineage* — and differs only
in which *secondary property* it demands as proof: reciprocal monophyly, reproductive
isolation, diagnosability, ecological distinctness, fixed morphological differences.
His move is to keep the lineage criterion as the only necessary one and demote all the
others to *lines of evidence*.

The consequence is the useful part. Those secondary properties are acquired at
different times, in an order that varies between cases. So there is a *speciation
interval* during which a lineage has already acquired some of them and not others, and
during which criteria genuinely conflict. Conflict is the expected observation, not a
sign that someone measured badly.

#key[
  *Attack 1: "your evidence contradicts itself."* Carr et al. (1999) and Coulson et al.
  (2006) found mitochondrial identity; your PI's group finds an antifreeze phenotype
  difference, a body-size difference, and a habitat difference. Under de Queiroz these
  are not in contradiction — they are lines of evidence sampling different points in the
  acquisition order, and a young pair is *expected* to satisfy some criteria and not
  others. This does not stop you giving a verdict. It tells you the verdict must be
  stated as "separately evolving, on the following evidence", with the criteria it does
  not yet meet named rather than hidden.
]

One sharper point, worth having ready. Coulson's evidence is mitochondrial: a single
non-recombining maternally inherited locus with roughly one quarter the effective
population size of an autosome. Small $N_e$ means fast lineage sorting but also
maximal vulnerability to a single introgression event capturing the whole locus.
mtDNA identity is therefore close to the *weakest* available evidence for
conspecificity in a young pair with documented introgression — which is an argument
against the inference, not against the study.

== 2. Three divergence statistics, and only one of them is a clock

Let $mu$ be the per-site per-generation mutation rate, $N_A$ the diploid effective size
of the ancestral population, and $T$ the split time in generations.

#eq[$ E[pi] = 4 N_e mu = theta $]

#eq[$ E[d_(x y)] = 2 mu T + 4 N_A mu = underbrace(2 mu T, "time") + underbrace(theta_A, "ancestral polymorphism") $]

#eq[$ d_a = d_(x y) - (pi_1 + pi_2) / 2 approx 2 mu T $]

Read those three lines carefully, because they carry the whole argument. $d_(x y)$ — the
average number of differences between a sequence drawn from each population — contains
a term for elapsed time *and* a term for diversity that was already present in the common
ancestor. Only $d_a$, net divergence, strips the ancestral term and leaves a quantity
proportional to $T$.

Now Hudson's $F_(S T)$, which is the estimator you should be using (Hudson et al. 1992;
Bhatia et al. 2013 for why this one):

#eq[$ F_(S T) = 1 - pi_"within" / pi_"between" = (d_(x y) - pi_w) / d_(x y) = d_a / d_(x y) $]

#key[
  $F_(S T)$ is a *ratio* of the two other quantities. It rises when $d_a$ rises — a real
  barrier — and it rises equally well when $pi_w$ falls for reasons that have nothing to
  do with gene flow. This identity is the seed of the entire Day 4 trap, and it is worth
  being able to write from memory.
]

== 3. Put a number on it before you argue about it

The project's headline figure is *0.201% between Gmac and Gogac over syntenic bp*
(`gadus-assembly/analysis_notes.md`). Slide 4 of your background deck already states the
prior it has to be tested against: a Holocene split predicts between-taxon divergence
$approx$ within-taxon divergence.

Here is why, with numbers you can reproduce. Take $mu approx 1 times 10^(-8)$ per site
per generation, a generation time of ~6 years, and a divergence at the end of the last
glacial, ~12,000 years — so $T approx 2000$ generations. Then the time term is
$2 mu T approx 4 times 10^(-5)$, i.e. *0.004%*. For the ancestral term, a marine fish
with $N_A approx 5 times 10^4$ gives $theta_A = 4 N_A mu approx 2 times 10^(-3)$,
i.e. *0.2%*.

The two terms differ by a factor of ~50, and the second one lands almost exactly on the
observed 0.201%. Under this parameterisation essentially all of the measured divergence
is retained ancestral polymorphism, and $d_a$ — the part that is actually about the
split — is around 2% of it.

#trap[
  These are order-of-magnitude inputs, not estimates: $mu$, $N_A$, generation time and
  the split date are all uncertain, and $N_A$ was chosen to make the point legible. The
  lesson is not "the answer is 0.004%". The lesson is that a $d_(x y)$-like number cannot
  distinguish a Holocene split from a Pliocene one until you subtract $pi_w$, and that
  the panel of 54 + 58 fish exists precisely to measure the $pi_w$ you need.
]

== 4. The grey zone, and a currency mismatch

Roux et al. (2016) surveyed 61 animal pairs and found that the transition from
"populations exchanging genes" to "species that do not" occurs over a band of roughly
*0.5% to 2% net synonymous divergence*. Below the band, gene flow is essentially always
detected; above it, essentially never; inside it lies the semi-isolated grey zone.

*Attack 2: "0.201% is tiny, so they are obviously one species."* This is the argument
your verdict has to beat, and Roux is how you beat it — but only if you use the right
number. It is tempting to line 0.201% up against 0.5% and conclude the pair falls below
the band. Do not do that yet: there are two independent unit conversions in the way, and
identifying them is Q3. Note also which way this cuts. If the honest calculation puts the
pair below the grey zone, that is evidence *for* "same" — so the verdict cannot rest on
divergence magnitude alone, and §5 plus tomorrow's material is where the load actually
goes.

== 5. One guardrail

Sukumaran & Knowles (2017) showed that multispecies-coalescent delimitation programs
(BPP and relatives) delimit *structure*, not species: given enough loci they will happily
split a single lineage into multiple "species" because the MSC contains no criterion that
distinguishes a population boundary from a species boundary. If a delimitation program
appears in the chapter, it is a description of structure, and the species claim has to be
carried by the other lines of evidence.

#sources[
  de Queiroz K (2007). Species concepts and species delimitation. #emph[Syst Biol]
  56(6):879–886. doi:10.1080/10635150701701083 — *read this one in full tonight, it is 8 pages.* \
  Roux C et al. (2016). Shedding light on the grey zone of speciation. #emph[PLoS Biol]
  14(12):e2000234. doi:10.1371/journal.pbio.2000234 — read the abstract, Fig. 1, and the grey-zone section. \
  Hudson RR, Slatkin M, Maddison WP (1992). Estimation of levels of gene flow from DNA
  sequence data. #emph[Genetics] 132:583–589. — the $F_(S T)$ estimator; skim. \
  Bhatia G et al. (2013). Estimating and interpreting $F_(S T)$. #emph[Genome Res]
  23:1514–1521. doi:10.1101/gr.154831.113 — why Hudson's, not Weir–Cockerham, for unequal sample sizes. \
  Sukumaran J, Knowles LL (2017). Multispecies coalescent delimits structure, not species.
  #emph[PNAS] 114:1607–1612. doi:10.1073/pnas.1607921114 — skim; know the claim. \
  Carr SM et al. (1999). #emph[Can J Zool] 77:19–26. doi:10.1139/z98-194 and
  Coulson MW et al. (2006). #emph[Genome] 49:1115–1130. doi:10.1139/g06-083 — the
  synonymisation you are arguing with. You have read around these; today just check
  *what taxa and how many individuals* Coulson actually sampled.
]

#pagebreak()

= Questions

Answer in your own words and show working where there is any. Do not look anything up
once you start.

#question(space: 1.9in, tag: "derive")[
  Write $E[d_(x y)]$ as a sum of two terms and name each. Then explain, in two or three
  sentences, why a Holocene split predicts between-taxon divergence $approx$ within-taxon
  divergence — and state what would have to be true of the ancestral population for the
  0.201% figure to instead indicate a *deep* split.
]

#question(space: 1.7in, tag: "mechanism")[
  Two 50 kb windows both return $F_(S T) = 0.30$. In window A, $d_(x y)$ is five times
  larger than in window B. Using the identity $F_(S T) = d_a \/ d_(x y)$, work out what must
  differ between the windows, and say which one you would take to a committee as evidence
  of a barrier to gene flow. What single additional statistic would settle it?
]

#question(space: 1.8in, tag: "trap")[
  Name the *two independent* unit conversions that stand between the project's 0.201%
  figure and Roux et al.'s 0.5–2% grey-zone band. For each, say which direction it would
  move the comparison. Then state what you would actually compute from the 112-fish panel
  to place the pair on that scale honestly.
]

#question(space: 1.6in, tag: "argue")[
  An examiner says: "The mitochondrial data say one species and your physiology says two.
  You cannot have it both ways." Answer in no more than six sentences, using de Queiroz's
  framing, and include the specific reason mtDNA is weak evidence *here* rather than in
  general.
]

#question(space: 1.5in, tag: "guardrail")[
  You run BPP on the panel and it returns decisive support for two species. State
  precisely what has been demonstrated and what has not. Then name two other lines of
  evidence that, if they agreed, would let you upgrade the claim — and say why each is
  logically independent of the BPP result.
]

#question(space: 1.6in, tag: "design")[
  Under the lineage criterion, "separately evolving" is the property you must actually
  test. Describe one pattern you could observe in the 54 Gmac + 58 Gogac panel that would
  *falsify* separate evolution — not merely fail to support it. Be concrete about the
  statistic and what value of it would do the falsifying.
]

#closing[
  Stop the timer and put the sheet down. Do not check anything before returning it.
]
