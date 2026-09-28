#import "refresher-template.typ": *

#show: sheet.with(
  day: "2",
  title: "Gene trees, ILS, and why " + emph("G. morhua") + " cannot be your outgroup",
  strap: "Durand et al. 2011 · Patterson et al. 2012 · Árnason & Halldórsdóttir 2019 · Eriksson & Manica 2012",
)

#budget(read: "35 min", answer: "45 min", total: "~1 h 20")

#carry[
  *Carry-forward from Day 1.* Before reading, write one line from memory: the identity
  relating $F_(S T)$, $d_a$ and $d_(x y)$, and which of the three is proportional to split
  time. If it does not come, re-read Day 1 §2 — today depends on it.
]

= Reading

== 1. Why a gene tree is not a species tree

Two lineages sampled from a diploid population of effective size $N$ coalesce at rate
$1\/(2N)$ per generation, so they wait on average $2N$ generations to find a common
ancestor. That waiting time is the whole story.

Take a species tree $((P_1, P_2), P_3)$ with an internal branch of length $T$ generations
and ancestral effective size $N$. Follow the $P_1$ and $P_2$ lineages backwards. If they
coalesce inside that internal branch, the gene tree matches the species tree. If they do
not — probability $exp(-T \/ (2 N))$ — all three lineages enter the deeper ancestral
population together, where no two of them have any privileged relationship, so each of
the three possible topologies is equally likely.

#eq[$ P("gene tree discordant") = 2/3 exp(-T \/ (2 N)) $]

That is incomplete lineage sorting. Note where it comes from: the ratio $T \/ N$. A short
internal branch or a large ancestral population — both true of a Holocene gadid split —
makes ILS the *dominant* expectation, not a rare complication.

#key[
  The load-bearing property is not the magnitude of ILS. It is that ILS is *symmetric*:
  the two discordant topologies occur with equal probability, $1/3 exp(-T\/(2N))$ each.
  Introgression is *asymmetric* — it favours the topology that unites the two lineages
  that actually exchanged genes. Every introgression statistic in use is a test of that
  asymmetry. This is the single idea to keep.
]

== 2. ABBA–BABA in one page

Take four populations in the relationship $(((P_1, P_2), P_3), O)$. At each biallelic
site, call the allele carried by $O$ ancestral (A) and the other derived (B), and write
the pattern across $(P_1, P_2, P_3, O)$. Two patterns are informative:

- *ABBA* — $P_2$ and $P_3$ share the derived allele.
- *BABA* — $P_1$ and $P_3$ share the derived allele.

Under ILS alone these are equally frequent, by §1. So (Green et al. 2010; Durand et al.
2011):

#eq[$ D = (n_"ABBA" - n_"BABA") / (n_"ABBA" + n_"BABA") $]

$D = 0$ is the no-introgression null. $D > 0$ means excess $P_2$–$P_3$ sharing; $D < 0$
means excess $P_1$–$P_3$ sharing. The same quantity unnormalised is Patterson's
$f_4 (P_1, P_2; P_3, O) = E[(p_1 - p_2)(p_3 - p_O)]$, a covariance of allele-frequency
differences that is zero on a strict tree — the formulation that generalises to admixture
graphs.

Two practical points that are not optional. First, *significance comes from a block
jackknife*, in blocks of order 1–5 Mb, never from a per-site binomial test: linked sites
are not independent observations and the naive standard error is wrong by orders of
magnitude. Second, $D$ is a test of *whether*, not *how much* or *in which direction*.

== 3. The assumptions, and how each one fails

#trap[
  *(a) The outgroup must exchange no genes with the ingroup.* This is the one your design
  currently violates. #emph[G. morhua] is topologically outside $($#emph[macrocephalus],
  #emph[ogac]$)$, which is what makes it tempting. But §6.7 of your design doc flags Nain
  Bay (Labrador) and Uummannaq/Disko (West Greenland) as high #emph[morhua]-introgression
  risk — that is 33 of your 58 #emph[ogac]. Derived alleles entering the ingroup *from the
  outgroup* break the polarisation the statistic is built on.
]

*(b) $P_1$ and $P_2$ must be symmetric with respect to $P_3$.* Unequal drift, unequal
divergence, or unequal relatedness to $P_3$ produces $D != 0$ with no gene flow at all.

*(c) No structure in the ancestral population.* Slatkin & Pollack (2008) and Eriksson &
Manica (2012) showed that subdivision in the common ancestor generates exactly the
asymmetry $D$ detects, without a single post-split migrant. This is the alternative
hypothesis that is hardest to exclude and is routinely ignored.

*(d) Symmetric error.* Different sequencing depth, error rate, or damage profile between
$P_1$ and $P_2$ biases $D$. Your Greenland fish are 26–29 years old and expected to run
lower depth than the Pacific samples (design doc §6.2) — so this is a live risk, not a
textbook caveat.

== 4. What to reach for when $D$ is not enough

#key[
  *Proportion:* the $f_4$-ratio estimates the admixture fraction $alpha$ (Patterson et al.
  2012), given a fifth population that brackets the source. \
  *Direction:* $D$ is nearly blind to it. $D_"FOIL"$ (Pease & Hahn 2015) recovers direction
  but needs a symmetric five-taxon design. \
  *Many taxa at once:* $f$-branch, computed by Dsuite (Malinsky et al. 2021), assigns
  signal to branches instead of returning a pile of correlated quartets.
]

== 5. The genus you are actually working in

Árnason & Halldórsdóttir (2019) — "Codweb" — sequenced whole genomes across Atlantic,
Arctic and Pacific gadids and found reticulation extensive enough that the genus is
better described as a network than a tree. For today, extract two things and do not worry
about the rest: *which species pairs they report exchanging genes*, and *what they used as
an outgroup and why*.

The consequence for you is uncomfortable and worth sitting with: if reticulation is
general within #emph[Gadus], then *no member of the genus is a safe outgroup*, including
#emph[G. chalcogrammus]. #emph[Boreogadus saida] sits outside the genus and is
topologically safer, but is further away, so more sites fail to align and ancestral-allele
assignment degrades. There is no free choice here — the defensible move is to run both and
report whether the conclusions agree.

== 6. Polarisation, and the cheap way out

An *unfolded* site-frequency spectrum requires knowing which allele is ancestral, which
requires an outgroup. If that outgroup has introgressed into your ingroup, ancestral
alleles are misassigned *preferentially at introgressed sites* — so Tajima's D, demographic
inference, and any unfolded-SFS statistic are most wrong precisely in the populations under
study, and wrong by different amounts in different #emph[ogac] populations. That looks like
#emph[ogac] population structure.

The *folded* SFS uses only minor-allele counts and needs no outgroup at all. Where
polarisation is not essential to the question, fold it and the entire problem class
disappears (ANGSD: `-doSaf` with `-fold 1`).

#sources[
  Durand EY, Patterson N, Reich D, Slatkin M (2011). Testing for ancient admixture between
  closely related populations. #emph[Mol Biol Evol] 28(8):2239–2252.
  doi:10.1093/molbev/msr048 — *the core read; §2 and the assumptions section.* \
  Green RE et al. (2010). A draft sequence of the Neandertal genome. #emph[Science]
  328:710–722. doi:10.1126/science.1188021 — where ABBA–BABA is introduced; read the
  supplementary logic only if you have time. \
  Patterson N et al. (2012). Ancient admixture in human history. #emph[Genetics]
  192:1065–1093. doi:10.1534/genetics.112.145037 — $f_4$, $f_4$-ratio; skim for the definitions. \
  Eriksson A, Manica A (2012). Effect of ancient population structure on the degree of
  polymorphism shared between modern human populations and ancient hominins. #emph[PNAS]
  109:13956–13960. doi:10.1073/pnas.1200567109 — short; the ancestral-structure alternative. \
  Árnason E, Halldórsdóttir K (2019). Codweb. #emph[Sci Adv] 5:eaat8788.
  doi:10.1126/sciadv.aat8788 — *open access; the one you have been putting off.* Read the
  abstract, the network figure, and the outgroup choice in the methods. \
  Malinsky M, Matschiner M, Svardal H (2021). Dsuite. #emph[Mol Ecol Resour] 21:584–595.
  doi:10.1111/1755-0998.13265 — the tool you will actually run; skim the $f$-branch section. \
  Pease JB, Hahn MW (2015). Detection and polarization of introgression. #emph[Syst Biol]
  64:651–662. doi:10.1093/sysbio/syv023 — $D_"FOIL"$; know it exists and what it costs.
]

#pagebreak()

= Questions

#question(space: 1.9in, tag: "derive")[
  Write $P("discordant")$ for a three-taxon species tree and say what each symbol is. Then
  explain why the *symmetry* of ILS, rather than its magnitude, is what $D$ actually
  exploits — and name one process other than introgression that breaks that symmetry.
]

#question(space: 2.0in, tag: "trace")[
  Suppose you set $O = $ #emph[G. morhua] and run $D$ with $P_1$ = Cambridge Bay
  #emph[ogac], $P_2$ = Nain Bay #emph[ogac], $P_3$ = #emph[G. macrocephalus]. Nain Bay
  carries ~5% #emph[morhua] ancestry; Cambridge Bay carries ~0%. Trace what happens to
  the counts of ABBA and BABA sites, and give the sign of the resulting bias in $D$.
  Why does the *asymmetry* between the two #emph[ogac] populations make this worse than
  if both carried 5%?
]

#question(space: 1.9in, tag: "design")[
  Now design it properly. Using only groups that exist in the 112-fish panel plus public
  data, write the quartet(s) you would run to test #emph[morhua] introgression into
  #emph[ogac]. State which group serves as the internal negative control and what
  geographic fact makes it one. Say what result would let you drop the §6.7 caveat.
]

#question(space: 2.0in, tag: "alternatives")[
  Your $D$ comes back significantly positive with a block-jackknife $Z = 4.1$. Give three
  distinct explanations *other than* $P_3 arrow P_2$ introgression, and for each name one
  observation or statistic that would discriminate it from introgression.
]

#question(space: 1.4in, tag: "stats")[
  Why is a per-site binomial test on $n_"ABBA"$ vs $n_"BABA"$ badly anticonservative, and
  what does the block jackknife do about it? What determines a sensible block size, and
  what goes wrong if the blocks are too small?
]

#question(space: 1.5in, tag: "recall+")[
  $D$ tells you neither the magnitude nor the direction of gene flow. Name the statistic
  you would use for each, and state what *additional* data or design requirement each one
  imposes beyond what a plain $D$ needs.
]

#question(space: 1.5in, tag: "judgement")[
  Codweb implies no member of #emph[Gadus] is a clean outgroup, and #emph[Boreogadus] is
  clean but distant. Rather than picking one, describe the analysis you would run to make
  the choice *reportable* — what you compute with each, and what pattern would tell you the
  conclusion is robust to the choice.
]

#closing[
  Stop the timer and put the sheet down. Do not check anything before returning it.
]
