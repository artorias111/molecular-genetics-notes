#import "ch1-refresher-template.typ": *

#show: sheet.with(
  day: "2",
  title: "Transposon scars, AFGP gene anatomy, and what makes a pseudogene",
  strap: "Zhou et al. 2004 · Engels et al. 1990 · Chen et al. 1997 · Nicodemus-Johnson et al. 2011 · Bista et al. 2023",
)

#budget(read: "20 min", answer: "45 min", total: "~1 h 05")

#carry[
  *Carry-forward from Day 1.* Before reading, write from memory the junction signature of NHEJ, of NAHR or SSA, and of BIR with template switching, one line each. If one does not come, re-read Day 1 §§2–6.
]

= Reading

== 1. DNA transposons and the hAT superfamily

Cut-and-paste DNA transposons move as DNA. The element ends in short terminal inverted repeats (TIRs): the same sequence read inward from each end, on opposite strands. The element-encoded transposase binds the ends, cuts the element out and joins its 3′ ends into a new target. The target is cut with staggered nicks, and filling the single-stranded overhangs duplicates a few target bases on each side: the target-site duplication (TSD). hAT elements (hobo, Ac, Tam3, Hermes) make 8 bp TSDs. In the AFGP locus, a hAT-Charlie element sits in the terminal copy with TIRs CAGTGGTTCTCAAC … GTTGAGAACCACTG inside the TSD CAGTAGAG.

hAT excision is unusual. Hermes cuts the donor site so that the flanking chromosome ends are sealed into hairpins, as in V(D)J recombination. The host has to open those hairpins (an Artemis-like nuclease) and join the ends, usually by end joining. Repeat libraries are built by clustering high-copy sequence, so the units of a tandem gene array can be mistaken for a TE family and named after the nearest known one.

== 2. What excision leaves behind

An empty site that never had an insertion carries one copy of the 8 bp target. An occupied site reads TSD–TIR…element…TIR–TSD. After excision, two outcomes are typical. If the broken ends are opened and joined directly, both TSD copies stay, with some added or lost bases: a footprint. If instead the gap is repaired by copying a homologous template that lacks the element, the element and one TSD copy vanish and the original empty sequence is restored exactly. The best-studied case is the P element of #emph[Drosophila] (not a hAT, but also a cut-and-paste element with an 8 bp TSD). Its precise loss reached 13% per generation, but only when the homologue was empty at that site. An ectopic copy elsewhere also served as template, less efficiently. Without an empty homologue, losses were mostly imprecise: they left 30–40 bp of element ends (16 bp from each end in the one sequenced) and both TSD copies. An element that has lost one of its TIRs cannot be excised by its transposase.

A practical trap: the right-hand TSD of an occupied site is followed by the same sequence as an empty site. A motif search for "empty site" therefore also counts the right edge of every occupied site unless you check what precedes it.

== 3. AFGP gene anatomy

The AFGP gene was built from a trypsinogen-like protease (TLP) gene. In #emph[D. mawsoni], exon 1 holds a 27 nt 5′ UTR and 40 coding nucleotides (13 amino acids of the signal peptide), ending at a GT splice donor. Intron 1 is the trypsinogen intron 1 plus about 1.7 kb of extra sequence, with a (gt)#sub[n] run at its 3′ end before the AG acceptor. A 9 nt element, ACAGCGGCA (Thr-Ala-Ala), straddles the trypsinogen intron 1/exon 2 boundary; its amplification is thought to have built the AFGP coding region. Exon 2 encodes a polyprotein: dozens of AFGP molecules made of (Thr-Ala-Ala)#sub[n], separated by three-residue spacers, mostly Leu-Ile-Phe or Leu-Asn-Phe, that are cleaved after translation. The 3′ end, from the penultimate codon (Gly, GGG) through the 3′ UTR, is about 96% identical to trypsinogen exon 6, and the TGA stop falls at the start of that recruited exon. In the repeats, Thr is mostly ACA and the second Ala GCA; the first Ala is often GCT rather than GCG. Chimeric AFGP/TLP genes carry an AFGP-type exon 1 and AFGP coding sequence, followed by TLP exons 2–6. The two #emph[D. mawsoni] BAC haplotypes carry three each.

Two RNA signals matter here. The splice donor starts GT and the acceptor ends AG. A polyadenylation signal, AATAAA on the transcribed strand, usually 10–30 nt upstream of the cleavage site, marks where the transcript ends. ATTAAA is the most common variant and is usually weaker.

== 4. Reading frames by eye

An open reading frame (ORF) is a run of codons without a stop. A sequence has three frames on each strand, so six in all. A frameshift (a 1 or 2 nt indel) moves downstream codons into another frame. In a repetitive protein like AFGP, a frameshift is easy to see in a 3-frame translation: the Thr-Ala-Ala pattern stops in one frame and continues in another a few bases later. A nonsense change (for example AGA to TGA) ends the frame without moving the repeat.

== 5. What makes a pseudogene

There are two common working definitions. By mutation: a gene copy with a disabling lesion, such as a premature stop or a frameshift. By structure: a copy that lacks parts its family needs to make the normal product, even if its reading frame is open. The #emph[Pseudochaenichthys] chimeric gene is a pseudogene by both: no exon 1 signal peptide, a premature stop, and 722 Thr-Ala-Ala repeats with no cleavable spacers.

Terminal-type AFGP genes are the AFGP case in point. They have an intact exon 1, splice sites and a long open frame, but no spacers, no TLP exon 6-derived 3′ end, and a frame that runs on into the adjacent non-coding block (block A) until it hits a stop there. The lab annotates these as pseudogenes by structure. "The reading frame is open" and "it is a pseudogene" are both true. Mixing up the two definitions is how a label gets overturned without new evidence.

#key[
  Hold on to: one TSD and no footprint means the site was restored from a template, not end-joined. A frameshift moves the repeat into a new frame; a nonsense change stops it in place. "Pseudogene" needs a stated definition; an open frame does not settle it.
]

#sources[
  Zhou, Mitra, Atkinson, Hickman, Dyda & Craig 2004 _Nature_ 432:995: Figs 2 and 4; "Hermes transposition compared to other elements". \
  Engels, Johnson-Schlitz, Eggleston & Sved 1990 _Cell_ 62:515: Summary, Fig. 1, "Reversion of w#super[hd] restores the exact wild-type sequence", "Imprecise loss". \
  Chen, DeVries & Cheng 1997 _PNAS_ 94:3811: Results, Figs 1, 2 and 4. \
  Nicodemus-Johnson et al. 2011 _Genomics_ 98:194: §§2.3–2.7 (haplotypes, chimeric genes). \
  Bista et al. 2023 _Nat Commun_ 14:3412: "Evolution of the antifreeze glycoprotein gene family" only.
]

= Questions

#question(space: 1.8in, tag: "mechanism")[
  An occupied site reads #raw("CAGTAGAG-[TIR…hAT…TIR]-CAGTAGAG") then the C block. Write the site after (a) excision and direct end joining, and (b) excision and repair from an empty homologous C copy. The deletion allele in #emph[D. eleginoides] has one CAGTAGAG and matches an empty C base for base. Which outcome does that fit? Name two alternatives that a single TSD with no footprint does not exclude.
  #readmore[Zhou et al. 2004, last section before "Unanticipated structure"; Engels et al. 1990, Summary and "Imprecise loss".]
]

#question(space: 1.7in, tag: "trap")[
  A motif search for AGTAGAGGGTTT reports 14 "empty sites". The motif starts at the second base of the 8 bp TSD and runs into the start of C. The same region has one occupied site with an intact right end. Explain why the 14 is wrong and by how much, and what sequence you would look for in the 15 bases before each hit to fix it.
  #readmore[Zhou et al. 2004, "Transposition by Hermes is accurate" (TSD length); Engels et al. 1990 for the site structure.]
]

#question(space: 2.2in, tag: "derive")[
  Translate, by hand, frames 1 and 2 of this 43 nt exon 2 fragment (frame 1 starts at base 1): \
  #raw("ACAGCTGCAACAGGCTGCACTTAACTTCACAGCTGCAACAGCT") \
  In frame 1, where does the Thr-Ala-Ala pattern first break, and where does the frame reach a stop? In frame 2, where does the next complete Thr-Ala-Ala appear? What single change to the sequence best explains this? Name the spacer you meet.
  #readmore[Chen et al. 1997, Fig. 1A and the codon-usage paragraph of the Discussion.]
]

#question(space: 2.0in, tag: "judgement")[
  An #emph[L. squamifrons] AFGP gene has an intact exon 1 with a GT donor, an acceptor, and a 223-codon open frame that ends inside block A. It has no spacers and no TLP exon 6-derived 3′ end. Is it a pseudogene? Answer under both definitions (under the mutation definition, count only frameshifts and stops before the normal end of the coding region). Say which features carry the structural call, and name one transcript-level and one protein-level assay that would show whether it matters to the fish.
  #readmore[Chen et al. 1997 (what a normal AFGP gene has); Bista et al. 2023, chimeric #emph[P. georgianus] gene paragraph.]
]

#question(space: 1.8in, tag: "apply")[
  In #emph[D. mawsoni] the cblc polyadenylation signal (AATAAA) lies inside the hAT, about 260 bp past the stop. #emph[D. eleginoides] has no hAT. In one Dele fish, one haplotype has an AATAAA about 440 bp past the stop, created by a single substitution; the other haplotype has ATTAAA at that position. Predict what could differ between the two alleles at the RNA level in that heterozygous fish, and name the assay and tissue you would use to test it.
  #readmore[No paper in the set covers polyA signals; any molecular biology text (mRNA 3′-end processing). Chen et al. 1997 for the AFGP 3′ UTR primers.]
]

#question(space: 1.8in, tag: "trap")[
  A repeat-annotation tool labels an AFGP gene "DNA/hAT-Ac" and the #emph[L. larseni] repeat unit "LINE/L2". Why do repeat libraries make this kind of call on tandem gene arrays? List the three features you would require before accepting a call as a real hAT element.
  #readmore[Bista et al. 2023, "Transposon expansion" and the AFGP locus paragraphs; Zhou et al. 2004 for what a hAT element has.]
]

#closing[
  Stop the timer and put the sheet down. Do not check anything before returning it.
]
