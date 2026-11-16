#import "ch1-refresher-template.typ": *

#show: sheet.with(
  day: "1",
  title: "How a tandem array loses copies, and how a junction tells you which way",
  strap: "Hastings et al. 2009 · Sasaki et al. 2010 · Bhargava et al. 2016 · Chen et al. 2007 · Smith et al. 2007 · Lee et al. 2007",
)

#budget(read: "20 min", answer: "50 min", total: "~1 h 10")

= Reading

== 1. Repeats turn ordinary repair into rearrangement

A double-strand break is usually repaired by copying the matching sequence on the sister chromatid or the homologue, and nothing changes. Trouble starts when the break sits inside a repeat. The repair machinery searches for homology, and a repeat offers several matches at the wrong place. Using one of those is called non-allelic homologous recombination (NAHR). The repeats in the AFGP locus are the repeat units themselves: every unit ends in a copy of the same block (C), and units share kilobases of TLP and #emph[tryp3a2] sequence.

Homologous recombination has entry requirements. It needs a stretch of uninterrupted identity: about 50 bp in #emph[E. coli] and up to about 300 bp in mammalian cells. The minimal efficient processing segment is over 200 bp in mouse and 337–456 bp in human. Partners are usually more than 95% identical, and almost never below 92%. Mismatch repair proteins pull apart heteroduplex (one strand from each partner) when it carries too many mismatches; this is called heteroduplex rejection.

== 2. NAHR between direct repeats: one deletion, sometimes a twin

Picture two directly oriented repeats, R1 and R2, with sequence X between them. If R1 on one chromatid pairs with R2 and a crossover forms, the products depend on who the partner is. Between two chromatids (sister or homologue), one product loses X and the other gains a second copy: a reciprocal deletion and duplication. Within one chromatid, the loop between R1 and R2 is cut out as a circle and lost. Either way the deleted product carries one repeat that is R1 on its left and R2 on its right: a chimeric repeat.

The crossover point is not a clean line. Strand exchange makes heteroduplex, and mismatch repair converts mismatched sites to one partner or the other. Deletion junctions in human patients (HNPP) show interspersed patches of the two repeats. Note what this can and cannot do: patches come only from the two repeats that recombined.

== 3. Single-strand annealing: resect, find, anneal

In single-strand annealing (SSA) there is no strand invasion. The 5′ ends at a break are chewed back, exposing long single-stranded 3′ tails. If resection uncovers complementary sequence on both sides (two copies of a repeat), RAD52 anneals them. The non-homologous flaps are clipped, gaps are filled, and the result is the same as an intrachromatid crossover: one chimeric repeat, everything between deleted, no reciprocal product.

SSA depends on how far resection runs. In yeast it is limited in most situations to deletions of a few tens of kilobases (Hastings 2009); deletions over 25 kb are readily detected and the true upper limit is not known (Bhargava 2016). Divergent repeats anneal poorly.

== 4. Gene conversion: copy without exchange

Gene conversion is a one-way transfer: part of an acceptor sequence is overwritten by a donor, and the donor is unchanged. Most of it comes from mismatch repair of heteroduplex during recombination, whether or not a crossover forms. Two numbers matter. In mammals, conversion tracts are usually 0.2–1 kb (up to about 2.3 kb at the human globin genes). An apparent tract longer than about 3 kb is conventionally called a double crossover instead. Because you only see the discriminating sites, a tract has two lengths. The minimal tract spans the converted sites. The maximal tract runs between the nearest unconverted sites on either side.

== 5. Break-induced replication and template switching

A collapsed replication fork leaves one broken end with no partner. Break-induced replication (BIR) rescues it: the end invades a homologous duplex (making a D-loop) and primes synthesis. Early synthesis has low processivity. The new strand dissociates, reinvades, extends, and may switch templates. In yeast, up to a fifth of BIR events switched templates, some more than once, and switches fell in the first few kilobases after invasion. When the end dissociated inside a dispersed repeat, it could reinvade an ectopic copy of that repeat on another chromosome after about 5 kb of copying. Once synthesis turns processive, one template is copied to the end. BIR makes no reciprocal product.

Template switching also happens at microhomology. Fork stalling and template switching (FoSTeS) and microhomology-mediated BIR (MMBIR) leave junctions with 2–15 bp of microhomology and often short pieces copied from nearby sequence. They are typical of complex, non-recurrent human rearrangements.

== 6. End joining

Non-homologous end joining (NHEJ) rejoins ends directly. It is accurate or leaves 1–4 bp deletions, sometimes with inserted DNA. Microhomology-mediated end joining (MMEJ) anneals 5–25 bp microhomologies and deletes between them. Neither needs, or keeps, long homology across the join.

== 7. Reading a junction

A deletion junction is read from diagnostic sites: positions where the candidate source copies differ. Each site is polarized with an outgroup, so you know which state is ancestral and which derived. Only shared derived states group sequences; shared ancestral states say nothing about relationship. A switch window lies between the last site of one source type and the first site of the next. Its length is the uncertainty in where the switch happened, not a structure. Two warnings: a site with the same derived state in unrelated copies (homoplasy) can mislead, and overall distance does not assign donors. Copies of a family can all be similarly distant from the query.

#key[
  Hold on to the signatures. NHEJ: 1–4 bp indels or inserts. MMEJ: 5–25 bp microhomology. FoSTeS/MMBIR: 2–15 bp microhomology, complex, copied inserts. NAHR or SSA: one chimeric repeat inside long homology, in register; patches only from the two partners. Conversion: a tract (usually 0.2–1 kb) copied from a third copy. BIR: switches early, then one template.
]

#sources[
  Hastings, Lupski, Rosenberg & Ira 2009 _Nat Rev Genet_ 10:551: §§ on HR mechanisms, SSA, NHEJ, replicative mechanisms; Figs 2, 3, 5. \
  Sasaki, Lange & Keeney 2010 _Nat Rev Mol Cell Biol_ 11:182: NAHR in the human genome; Fig. 2 (outcomes by repeat orientation and partner). \
  Bhargava, Onyango & Stark 2016 _Trends Genet_ 32:566: Fig. 1; "Contrasting SSA with other DSB repair pathways"; resection extent. \
  Chen, Cooper, Chuzhanova, Férec & Patrinos 2007 _Nat Rev Genet_ 8:762: "Characteristics of gene conversion"; Box 2; Fig. 2d. \
  Smith, Llorente & Symington 2007 _Nature_ 447:102: Figs 2–3. \
  Lee, Carvalho & Lupski 2007 _Cell_ 131:1235 and Hastings, Ira & Lupski 2009 _PLoS Genet_ 5:e1000327: FoSTeS and MMBIR; skip the array-CGH methods.
]

= Questions

#question(space: 1.9in, tag: "mechanism")[
  Two directly oriented repeats, the C of unit u2 and the terminal C, flank 310 kb of one chromosome. Sketch the products of a u2 × terminal crossover (a) between sister chromatids and (b) within one chromatid. Which outcome leaves a second allele you could look for in a population? Four sampled chromosomes all carry only the deletion: give two reasons why that does not rule out either kind.
  #readmore[Sasaki et al. 2010, Fig. 2; Hastings et al. 2009 NRG, Fig. 3A.]
]

#question(space: 2.0in, tag: "trace")[
  States at five junction sites, in order 173,088, 173,116, 173,150, 174,033, 174,088. #emph[D. mawsoni] pre-AFGP units: 173,088 G, 173,116 A, 173,150 T, 174,033 T, 174,088 C (outgroup #emph[E. maclovinus]: G, C, C, T, G). a456 copies: T, C, C, C, C. Terminal copies: no homologous sequence left of 173,611; T at 174,033 and T at 174,088. The deletion allele: G, C, C, T, T. For each site, say whether the allele's state links it positively to a source (a shared derived state), only excludes a source, or is uninformative. Then give both switch windows as coordinate intervals, taking the terminal copies' homology to start at 173,611.
  #readmore[Chen et al. 2007, Fig. 2d (minimal and maximal tracts) for how bounds are set.]
]

#question(space: 1.9in, tag: "judgement")[
  One history removes the array in two steps that span about 270 kb and 39 kb of present-day sequence. Using what the two reviews say about SSA size, which step could have been SSA, and how confident can you be? How would your answer change if the array was only a quarter of its present length when the first step happened?
  #readmore[Hastings et al. 2009 NRG, SSA paragraph; Bhargava et al. 2016, "Cellular contexts that may favor SSA".]
]

#question(space: 2.0in, tag: "trap")[
  A junction tract matches copy class X at eight diagnostic sites. At every one of them, the tract and X carry the outgroup state, and the other candidate classes carry derived states. A colleague writes "the tract is derived from X". What has actually been shown, and what kind of site would show it positively? Name one other way the same pattern could arise.
  #readmore[§7 of the reading (standard cladistics: shared derived versus shared ancestral states). Sasaki et al. 2010 on gene conversion homogenizing repeats is the relevant caution.]
]

#question(space: 1.8in, tag: "apply")[
  Two foreign tracts sit in the surviving Dele unit. The u3-type tract has a minimal length of 1.4 kb and a maximal length of 2.0 kb. The a456-class tract is at least 455 bp, with no maximal bound. By the mammalian conventions in §4, classify each as a conversion or a double crossover, and say what extra observation would make you change the call for the u3-type tract.
  #readmore[Chen et al. 2007, "Characteristics of gene conversion" (tract lengths) and Box 2.]
]

#question(space: 2.0in, tag: "design")[
  Two histories fit the Dele junction: two separate exchanges (u2 × a456-class unit, later hybrid C × terminal C), or one BIR event that switched templates twice. Name one allele that one history predicts could exist in present-day populations and the other does not, and the junction PCR that would detect it. How many chromosomes would you need to sample for a 95% chance of seeing it at least once if its frequency were 5%? What would a negative result then mean, and not mean?
  #readmore[Smith et al. 2007, Fig. 2 and discussion; Hastings et al. 2009 NRG, Fig. 2C.]
]

#closing[
  Stop the timer and put the sheet down. Do not check anything before returning it.
]
