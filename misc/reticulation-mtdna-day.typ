#import "../refresher-notes-quizzes/refresher-template.typ": *

#let sheet(title: "", strap: "", body) = {
  set page(
    width: 6.2in,
    height: 8.27in,
    margin: (top: 0.75in, bottom: 0.6in, left: 0.5in, right: 0.5in),
    header: context {
      let total = question_counter.final().first()
      align(right, text(size: 8.5pt, fill: luma(110), weight: "bold")[
        Paper prep, reticulation and mtDNA, #total questions
      ])
    },
    footer: context align(center, text(size: 8.5pt, fill: luma(130))[
      #counter(page).display("1")
    ])
  )
  set text(font: "Libertinus Serif", size: 10pt)
  set par(justify: true, leading: 0.62em)
  show heading.where(level: 1): it => {
    v(0.4em)
    text(size: 12.5pt, weight: "bold", it.body)
    v(0.25em)
  }
  show heading.where(level: 2): it => {
    v(0.5em)
    text(size: 10.5pt, weight: "bold", style: "italic", it.body)
    v(0.1em)
  }

  align(center)[
    #text(size: 16pt, weight: "bold")[Reading day, 29 Sep 2026]
    #v(-0.4em)
    #text(size: 12.5pt, weight: "bold")[#title]
    #v(-0.3em)
    #text(size: 9.5pt, style: "italic", fill: luma(90))[#strap]
  ]
  v(0.6em)
  line(length: 100%, stroke: 0.5pt + luma(160))
  v(0.4em)

  body
}

#let ogac = emph("G. ogac")
#let mac = emph("G. macrocephalus")
#let morhua = emph("G. morhua")

#show: sheet.with(
  title: "How the mtDNA synonymy was made, and what a reticulate history does to it",
  strap: "Carr 1999 · Coulson 2006 · Árnason & Halldórsdóttir 2019 · Matschiner 2022 · Toews & Brelsford 2012 · Currat 2008",
)

= The plan for the day

Goal: be able to write the Introduction and the mtDNA/reticulation part of the Discussion without reopening a paper. Six blocks. Do the primer first, closed book. Then the papers. Then the questions for that block, closed book, before moving on.

#set par(justify: false)
#table(
  columns: (0.35in, 1fr, 0.6in),
  align: (center, left, center),
  stroke: 0.4pt + luma(170),
  inset: 5pt,
  text(size: 9pt)[*\#*], text(size: 9pt)[*Block*], text(size: 9pt)[*Time*],
  text(size: 9pt)[1], text(size: 9pt)[Primer below (§1 to §6), no papers open], text(size: 9pt)[45 min],
  text(size: 9pt)[2], text(size: 9pt)[The synonymy: Coulson 2006 close, Carr 1999 skim. Then Q1 to Q4], text(size: 9pt)[1 h 30],
  text(size: 9pt)[3], text(size: 9pt)[mtDNA theory: Funk & Omland 2003, Toews & Brelsford 2012, Hudson & Turelli 2003. Then Q5 to Q7], text(size: 9pt)[1 h 15],
  text(size: 9pt)[4], text(size: 9pt)[Nuclear reticulation: Codweb close, Matschiner Suppl. Note 1 + Ext. Data Fig. 2. Then Q8 to Q11], text(size: 9pt)[1 h 45],
  text(size: 9pt)[5], text(size: 9pt)[Invasion and capture: Currat 2008. Then Q12 and Q13], text(size: 9pt)[45 min],
  text(size: 9pt)[6], text(size: 9pt)[Your own record: `stats/mtdna_public_09-24-2026/SUMMARY.md`, `analysis_notes.md` 09-21 (b) to (d). Then Q14 and Q15], text(size: 9pt)[45 min],
  text(size: 9pt, weight: "bold")[], text(size: 9pt, weight: "bold")[Total], text(size: 9pt, weight: "bold")[~6 h 45],
)

#set par(justify: true)

== Reading list, in order

*Core. Everything in bold is in `gadus-assembly/papers/`.*

+ *Coulson et al. 2006* _Genome_ 49:1115–1130. The paper the synonymy rests on. Read: Methods (sampling), Table 2, Discussion "Vicariance biogeography II". Skip the ND5 proteome section.
+ Carr et al. 1999 _Can J Zool_ 77:19–26. Skim. Where "indistinguishable" and the subspecies call start. Not in `papers/`; get from the library.
+ Funk & Omland 2003 _Annu Rev Ecol Evol Syst_ 34:397–423. Species-level paraphyly and polyphyly. Read the causes table and the frequency estimate.
+ Toews & Brelsford 2012 _Mol Ecol_ 21:3907–3930. Mito-nuclear discordance. Read the list of causes and how each is distinguished.
+ Hudson & Turelli 2003 _Evolution_ 57:182–190. The "three-times rule" and why it is stochastic. Short.
+ *Árnason & Halldórsdóttir 2019* _Sci Adv_ 5:eaat8788 ("Codweb"). Read closely: Sampling, Fig. 3, the Greenland cod paragraph of the Discussion, the mtDNA dating paragraph.
+ *Matschiner et al. 2022* _Nat Ecol Evol_ 6:469–481. Read only: the introgression paragraph of Results, Ext. Data Fig. 2, Supplementary Note 1 (their critique of Codweb).
+ Currat et al. 2008 _Evolution_ 62:1908–1920. "The hidden side of invasions". Abstract, the main figure, Discussion.

*Optional, if time.* Mallet, Besansky & Hahn 2016 _BioEssays_ 38:140 (how reticulated are species). Hibbins & Hahn 2022 _Genetics_ 220:iyab173 (introgression methods review). Solís-Lemus & Ané 2016 _PLoS Genet_ 12:e1005896 (SNaQ, the Codweb network method). Sloan, Havird & Sharbrough 2017 _Mol Ecol_ 26:2212 (mtDNA and species boundaries). Hoff et al. 2026 (in `papers/`), for the rearrangement side, which is a separate literature.

#trap[
  *Citation check.* Items 1, 6 and 7 were verified against the PDFs today. The rest are from memory: confirm volume and pages before they go in the bib. Note that the Ch3 `references.bib` has Matschiner at 6:424–437. The PDF says *6:469–481*. The bib is wrong.
]

#pagebreak()

= Primer

== 1. The claim you are writing against

The field has already answered "one species". #ogac is listed as a junior synonym of #mac by the major databases. The chain that produced that is short.

- *Carr et al. 1999.* About 0.9 kb of two mitochondrial genes across 14 gadids. Greenland cod came out "genetically indistinguishable" from Pacific cod. They proposed #mac subsp. #ogac.
- *Coulson et al. 2006.* 14,036 bp mitogenomes, no control region, 13 genomes from 10 taxa. Two #ogac, both from the Newfoundland shelf, 1991 to 1993. Two #mac from British Columbia. The two #ogac differ by 16 sites. #ogac to #mac: 45 to 62. The two #morhua, one from each side of the Atlantic: 51.

Read Coulson's actual words: Greenland cod "are a *genomically distinguishable subspecies* within pan-Pacific #mac". That is not "indistinguishable". The two #ogac were sister to each other in every analysis. The paper that did the synonymising found #ogac to be a recognisable mitochondrial group. The database entry flattened that.

#key[
  The whole case rests on one locus, four individuals of the focal pair, and a *yardstick*: the #ogac–#mac distance is about the same as the distance between two #morhua from opposite sides of the Atlantic. Every question below is some version of "is that yardstick fair?".
]

== 2. What one mitochondrial genome can and cannot say

The mitogenome is one non-recombining, maternally inherited locus. Its effective size is about a quarter of an autosome's (haploid, and only females transmit it). Two consequences, and they pull in opposite directions.

- *It sorts fast.* Lineages coalesce about four times faster than at a nuclear locus. So after a split, mtDNA is the first marker expected to become reciprocally monophyletic. This is why mtDNA was the default species marker.
- *It is one draw.* Whatever it shows is a single realisation of the coalescent. And because its $N_e$ is small, one hybridisation event can move a whole mitogenome into another species, where it can drift to fixation quickly.

So mtDNA identity is weak evidence of conspecificity. And mtDNA paraphyly is weak evidence of anything in particular. Funk & Omland (2003) found species-level para- or polyphyly in about a quarter of the animal species they surveyed. Paraphyly is common.

Palumbi et al.'s (2001) "three-times rule" uses the coalescence ratio $"CR" = l\/d$. Here $l$ is the mtDNA branch from a species' sequences back to the ancestor it shares with its sister, and $d$ is the mean pairwise mtDNA difference within the species. It is defined only if that species is mitochondrially monophyletic. If $"CR" > 3$, most nuclear loci should be monophyletic too. Hudson & Turelli (2003) showed the confidence intervals are huge: $"CR" approx 10$ is needed before the lower bound reaches what $"CR" approx 3$ promises. They also showed a bottleneck in the focal species biases it. You will compute it for #ogac in Q6.

== 3. The yardstick, rewritten in the Day 1 notation

Recall from Day 1:

#eq[$ d_(x y) = 2 mu T + theta_A, quad d_a = d_(x y) - (pi_1 + pi_2)/2 approx 2 mu T $]

Coulson's comparison sets a between-taxon $d_(x y)$ (#ogac vs #mac) against a within-species distance in another species (#morhua east vs west). That within-species number is itself a $pi$-like quantity. A young split from a large ancestral population will always pass this test, because $d_(x y)$ is then mostly $theta_A$. The test cannot tell "no split" from "recent split". The right comparison is $d_a$ against zero, with its uncertainty.

Your own numbers (four mitogenomes, 09-21): $d_(x y) = 53$ sites, $pi_"mac" = 63$, $pi_"ogac" = 5$. So

#eq[$ d_a = 53 - (63 + 5)/2 = 19 "sites" approx 0.115% $]

with a 95% CI of 11 to 28 sites. Small, but not zero.

== 4. Dating: what the published numbers assumed

Codweb dates the #mac–#ogac split from Coulson's 45 to 60 differences at 5,703 years per substitution (a whole-mitogenome cod rate from Carr & Marshall 2008). That gives 256 to 342 ka. They add that under a multiple-merger coalescent (appropriate for high-fecundity fish), time scales with $N^(alpha - 1)$, and with $alpha = 1.5$ that is $sqrt(N)$ instead of $N$, so the true date is likely much younger.

Note what went into the 256 to 342 ka: raw $d_(x y)$, not $d_a$. It includes ancestral polymorphism. You will redo it in Q3.

#trap[
  *"Holocene" is not in the sources.* Your notes and the Ch3 lit review say the #ogac lineage is "Late Pleistocene or Holocene". Neither Coulson nor Codweb says Holocene. Codweb says 256 to 342 ka by $d_(x y)$, possibly younger. Coulson gives no date for #ogac at all, only ~4 Ma for the #mac lineage. The karyotype argument ("a Holocene-recent Arctic colonizer that has not fused") needs this. Find a real source for the timing or soften it to "Pleistocene".
]

== 5. The nuclear reticulation record

Two papers, and you need to know exactly how thin their #ogac sampling is.

*Codweb (Árnason & Halldórsdóttir 2019).* Whole genomes of one Pacific cod, one Greenland cod ("uvak", *from Western Greenland*), walleye pollock, Arctic and polar cod, and several #morhua. Reads mapped to the #morhua reference. D statistics on transversions only, block jackknife. Then SNaQ phylogenetic networks per linkage group. On #ogac they report:

- Pacific and Greenland cod show "great similarity and largest D". They say this is "understandable if Greenland cod ... is but a subspecies of Pacific cod".
- "A clear, albeit small, signal that Greenland cod shares more derived alleles with Atlantic cod than Pacific cod shares with Atlantic cod." They read it as #morhua to #ogac introgression "in the formation of Greenland cod", at Western Greenland, via a Northwest passage.

*Matschiner et al. 2022.* Reused *Codweb's own Illumina reads* for Pacific and Greenland cod. Found #ogac–#morhua introgression again: $D_"BBAA" = D_"fix" = 0.249$, $P < 10^(-10)$, similar across all #morhua populations and across all linkage groups. So it did not create the #morhua supergenes. In Supplementary Note 1 they say Codweb's introgression results were affected by "an incorrectly labelled specimen, susceptibility to reference bias and possibly incorrect outgroup choice".

#key[
  Every published nuclear statement about #ogac rests on *one Greenland cod from Western Greenland* and one Pacific cod. Two papers, one pair of fish. The signal (#morhua–#ogac introgression) replicated in method, not in sampling.
]

#trap[
  *The contact-zone sentence.* The MBE outline and AGENTS.md say "Nun sits in the documented #morhua↔#ogac contact zone and Godhavn does not", citing Codweb. Codweb's only Greenland cod is from Western Greenland, the Godhavn side. It names no Canadian Arctic transition zone. Your own Ch3 design doc lists Uummannaq/Disko as a high-#morhua;-risk site. As written, that sentence is unsupported and may be backwards. It needs the Nun locality and a real source for where #morhua and #ogac overlap before it goes in the paper.
]

#trap[
  *Common names swap between your two key papers.* Codweb (following AFS): Arctic cod = _Boreogadus saida_, polar cod = _Arctogadus glacialis_. Matschiner: Arctic cod = _A. glacialis_, polar cod = _B. saida_. Coulson calls _Boreogadus_ "Polar cod". Use Latin names only in the paper.
]

== 6. Three processes, and what separates them

A shared allele between #ogac and #morhua, or a paraphyletic mitogenome, can come from three places.

- *ILS.* Ancestral polymorphism sorted at random. Symmetric: both discordant topologies equally frequent.
- *Introgression.* Gene flow after the split. Asymmetric: favours the pair that exchanged genes. Leaves long shared tracts if recent.
- *Ancestral structure.* The common ancestor was subdivided. Also asymmetric, with no post-split gene flow. The hardest to exclude.

For the mtDNA result, ILS and capture both fit. Currat et al. (2008) add a directional prediction. When a species expands into a range already held by a relative, introgression goes mostly from the resident into the invader. It is strongest at markers with low intraspecific gene flow, often mtDNA. #ogac is the invader in #morhua's ocean. So if hybridisation were common, #morhua mitogenomes in #ogac are the expected footprint. Both your #ogac carry #mac;-type mtDNA, about 4.2% from #morhua. Q13 asks what that does and does not rule out.

Keep one distinction from the Ch3 reading list: *reticulation* (Codweb, Matschiner) is gene flow. *Rearrangement* (Hoff 2026) is chromosome architecture, and Hoff is tree-framed. Do not cite one as evidence for the other.

#sources[
  *Verified today from PDFs:* Coulson MW, Marshall HD, Pepin P, Carr SM (2006) _Genome_ 49:1115–1130, doi:10.1139/G06-083. Árnason E, Halldórsdóttir K (2019) _Sci Adv_ 5:eaat8788, doi:10.1126/sciadv.aat8788. Matschiner M et al. (2022) _Nat Ecol Evol_ 6:469–481, doi:10.1038/s41559-022-01661-x. \
  *From memory, check before citing:* Carr SM et al. (1999) _Can J Zool_ 77:19–26. Funk DJ, Omland KE (2003) _Annu Rev Ecol Evol Syst_ 34:397–423. Palumbi SR, Cipriano F, Hare MP (2001) _Evolution_ 55:859–868. Hudson RR, Turelli M (2003) _Evolution_ 57:182–190 (verified 09-29). Toews DPL, Brelsford A (2012) _Mol Ecol_ 21:3907–3930. Currat M et al. (2008) _Evolution_ 62:1908–1920. Carr SM, Marshall HD (2008) _Genetics_ 180:381–389 (ref. 35 in Codweb). \
  *Your data:* `stats/mtdna_public_09-24-2026/SUMMARY.md`; `analysis_notes.md` 09-21 (b) to (d).
]

#pagebreak()

= Questions

Closed book. Do each group right after its reading block. Skipping a question is a data point.

== After block 2: the synonymy

#question(space: 1.5in, tag: "recall+")[
  For Coulson 2006: how many #ogac and #mac individuals, from where, and how many base pairs? Write their conclusion in their own words. Then write the one-sentence version of it that belongs in your Introduction, and say why "indistinguishable" would be the wrong word.
]

#question(space: 1.8in, tag: "mechanism")[
  Coulson compares 45 to 62 #ogac–#mac differences with 51 differences between two #morhua. Rewrite this as a comparison of two named statistics. Explain why a split that is real but recent, from a large ancestral population, passes this test anyway. What comparison should have been made instead?
]

#question(space: 0.2in, tag: "compute")[
  Using 5,703 years per substitution:
  #subpart(space: 0.5in)[(a) Reproduce Codweb's 256 to 342 ka from 45 and 60 differences.]
  #subpart(space: 0.5in)[(b) Redo it with your $d_a$ of 19 sites (CI 11 to 28). Give the point estimate and range.]
  #subpart(space: 0.5in)[(c) Which of (a) and (b) is closer to a split time, and why? Name two reasons even (b) is uncertain.]
]

#question(space: 1.3in, tag: "judgement")[
  Coulson's two #mac are described as British Columbia in Methods but as "one from either side of the Pacific" in Results. Why does it matter which is true for the yardstick in Q2?
]


== After block 3: what mtDNA can bear

#question(space: 1.7in, tag: "derive")[
  mtDNA $N_e$ is about $N_e"(autosome)"\/4$. Explain why that single fact is both the argument *for* mtDNA as an early species marker and the argument *against* reading mtDNA identity as conspecificity.
]

#question(space: 1.7in, tag: "compute")[
  Three-times rule for #ogac. From the $n = 13$ tree, the branch from the two #ogac back to their shared ancestor with the ST155 group is $l approx 21$ sites. Within #ogac, $d = 5$. Compute CR. What would Palumbi et al. predict for #ogac nuclear loci? Give two reasons from Hudson & Turelli not to trust that prediction here, one of them specific to #ogac being a recent invader. Why can you not compute CR for #mac at all?
]

#question(space: 1.6in, tag: "framing")[
  Funk & Omland found mtDNA para- or polyphyly in roughly a quarter of animal species. Your #mac paraphyly has 0.0% bootstrap support for monophyly at $n = 13$. Write the claim you can make, and the claim you cannot. How does the base rate change how you present it in the Discussion?
]

== After block 4: the nuclear record

#question(space: 1.6in, tag: "read the design")[
  How many #ogac individuals underlie Codweb's #ogac result, and where from? What did Matschiner use for #ogac? So how many independent #ogac fish support "#morhua–#ogac introgression" in the literature? Write the one-line caveat you would attach when citing it.
]


#question(space: 2.0in, tag: "trace")[
  Codweb quartet: $(((P_1 = #mac, P_2 = #ogac), P_3 = #morhua), O = "Arctic cod")$. They find #ogac shares more derived alleles with #morhua than #mac does. Which pattern is in excess, ABBA or BABA, and what is the sign of $D$? Reads were mapped to the #morhua reference. Explain how reference bias alone could push $D$ the same way, and what would make it worse for one of $P_1$, $P_2$.
]

#question(space: 1.6in, tag: "alternatives")[
  Matschiner finds $D = 0.249$, similar across *all* #morhua populations and all linkage groups. Give two readings of "similar across all #morhua populations". Which one is ancestral structure, and why can a four-taxon $D$ not separate it from introgression?
]

#question(space: 1.6in, tag: "trap")[
  Your outline says Nun is in the documented contact zone and Godhavn is not. Using where Codweb's fish came from, evaluate that sentence. List what you would need to write a defensible version of it.
]

== After block 5: invasions

#question(space: 1.7in, tag: "predict")[
  State Currat's prediction in one line. #ogac entered an ocean held by #morhua. What does Currat predict you would find in #ogac mitogenomes if hybridisation had been common? What do you actually find in Nun and Godhavn?
]

#question(space: 1.7in, tag: "limits")[
  Give three reasons the absence of #morhua mtDNA in your two #ogac does *not* rule out #morhua–#ogac hybridisation. For each, say whether more #ogac mitogenomes would fix it.
]


== After block 6: your own result, in context

#question(space: 2.0in, tag: "design")[
  ST155 groups with #ogac in mtDNA. EBS74 does not. Using only your four HiFi genomes plus #morhua, describe the nuclear comparison that could separate ILS from mitochondrial capture for this. State the result you would expect under each. Keep it inside the paper's scope (no allele frequencies, no delimitation). Say what #morhua introgression into #ogac does to your polarisation.
]

#question(space: 2.6in, tag: "synthesis")[
  Bullets only, not prose. (a) The three sentences of the Introduction paragraph on the taxonomic problem: what the field concluded, what it rested on, what was never tested. (b) The one sentence of the Discussion on what your mtDNA result means for the synonymy. (c) The one sentence on reticulation, with its sampling caveat.
]

#closing[
  Stop the timer. Do not check anything before sending it back.
]
