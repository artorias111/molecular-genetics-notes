# Module map — Molecular Genetics via Lewin's *Genes XII*

**Status: PROPOSED — awaiting sign-off.** Nothing is taught until you approve this.

## Parameters this was built to

- **30 min/day, hard cap.** Your call, session 0. Budget per day: ~10–12 min reading,
  ~18–20 min active work. That's **~1 book section/day**, occasionally 2 short ones.
- **5 days/week assumed.** Slipping days is expected and does not break the plan; the
  spine is ordered so that pausing between modules costs nothing.
- **Front-loaded on your research.** You study genomic rearrangements in eukaryotes —
  mechanisms of gene duplication and deletion. Modules 1–3 are built to get you to
  mechanistic command of that, and everything before them was cut.
- **Coverage is eventual, not deferred forever.** You said you want all of it. Nothing
  below is deleted; the "reference" tier is *later and lighter*, not *never*.

## The honest problem with the source, stated up front

Genes XII (2018) does not use your field's vocabulary. Verified by full-text search of
the PDF:

| Term | Pages in book |
|---|---|
| unequal crossing-over | 28 |
| break-induced replication | 10 |
| "nonallelic" | 8 |
| gene duplication | 21 |
| microhomology / alt-EJ | 2 |
| **NAHR** | **0** |
| **MMBIR** | **0** |
| **FoSTeS** | **0** |
| **retrogene** | **0** |

So the book gives you *every primitive* — resection, strand invasion, D-loop, template
switching, Holliday resolution, end joining, repeat arrays — and never assembles them
into the structural-variation framework you actually read papers in. Good news: assembling
them yourself, from mechanism up, is a far better way to own the material than learning the
acronyms first. That assembly is the job of Module 3, and it's the one place I'll pull
outside papers deliberately (3–4 of them, listed below, with justification).

---

## Tier 1 — The spine

### M1 · The replication fork, and how it breaks · ~12 days
**Ch 11 (core), Ch 10.2/10.10/10.11**

Prerequisite, kept deliberately tight. Every replication-based rearrangement mechanism
(BIR, MMBIR, FoSTeS, re-replication amplification) is a *fork failure* story, and you
cannot reason about fork failure without naming the parts: which polymerase on which
strand, what the clamp loader does, why lagging-strand synthesis is discontinuous, what
a stalled fork physically looks like.

- 11.2–11.5 polymerases, their nucleases, fidelity, common architecture
- 11.6–11.9 strand asymmetry, helicase + SSB, priming, coordinating the two strands
- 11.10–11.12 holoenzyme subcomplexes, the sliding clamp, Okazaki maturation and ligase
- 11.13 eukaryotic Pol α / δ / ε division of labor
- 11.14 lesion bypass and polymerase replacement
- 10.10–10.11 licensing and ORC — *included because re-replication is a duplication mechanism*

Ends with: trace a eukaryotic fork from origin firing to Okazaki ligation, every actor named.

### M2 · Double-strand breaks and the rearrangement engine · ~18 days
**Ch 14 (core), Ch 13 (core)** — the central module for your work

This is where duplication and deletion are actually born. The book presents these as
*repair* pathways; your field reads them as *mutagenesis* pathways. Same chemistry, and
the outcome — accurate repair vs. deletion vs. duplication — depends on which pathway wins
and what sequence is nearby. That reframe is the point of the module.

- 14.1–14.2 damage types and the repair landscape (one orientation day)
- 14.5, 14.3–14.4 base and nucleotide excision repair (fast — these are the *non*-rearranging pathways, covered so you know what the alternatives are)
- 14.7 mismatch repair and strand discrimination
- 14.9 recombination as recovery from replication errors ← the hinge section
- 14.10 HR repair of DSBs in eukaryotes
- 14.11 NHEJ — *and the alt-EJ/microhomology material at p1346*
- 13.3 DSBs initiate recombination
- 13.11–13.12 resection (RecBCD/chi), strand transfer, RAD51/RecA
- 13.4 gene conversion
- 13.5 SDSA · 13.6 SSA · 13.7 BIR ← three days, one per model, because these three are
  the direct parents of the deletion/duplication mechanisms you care about
- 13.13 Holliday junction resolution — crossover vs. noncrossover, the choice that
  determines whether you get a rearrangement
- 13.14 the eukaryotic HR gene set
- 13.2, 13.8–13.10 meiotic HR and the synaptonemal complex (why meiosis is where NAHR happens)
- 14.12 repair in the context of chromatin

Ends with: given a breakpoint junction sequence, argue which pathway made it.

### M3 · Repeats as substrate: why duplications land where they do · ~12 days
**Ch 6, Ch 15 (selected)** + outside papers

M2 gives the enzymology; M3 gives the genomic architecture that channels it. A duplication
needs both a mechanism and a substrate, and the substrate is repeats.

- 6.2 unequal crossing-over — *this is NAHR before it had a name*
- 6.4 crossover fixation, concerted evolution
- 6.3 rDNA tandem arrays as the worked example
- 6.5–6.8 satellites, minisatellites (lighter; architecture, not mechanism)
- 15.4 transposons cause DNA rearrangement
- 15.17 Alu — the dominant NAHR substrate in humans
- 15.18 LINEs, endonuclease-primed retrotransposition
- 15.12 reverse transcription mechanism — *needed for retrogene/processed-duplicate formation*
- 15.14–15.15 retroviral transduction of cellular sequences, retroelement classes

**Deliberate outside sources** (the only ones in the whole plan; each justified):
1. Hastings, Ira & Lupski 2009, *PLoS Genet* — the MMBIR model. The book stops at BIR;
   this is the step from BIR to a mechanism that makes real CNVs.
2. Lee, Carvalho & Lupski 2007, *Cell* — FoSTeS. Template switching at stalled forks.
3. A NAHR/segmental-duplication review — bridges 6.2 to genomic-disorder nomenclature.
4. One current paper of *your* choosing from your reading, which we dissect figure by figure.

**Capstone:** take a real rearrangement from the literature and reconstruct its mechanistic
origin from the breakpoint evidence alone, unaided. Graded hard.

> **Milestone: ~8 weeks in, you have mechanistic command of your own research area.**
> Everything below is the general education you also asked for.

### M4 · Transcription machinery · ~20 days
**Ch 17 (trimmed to ~12 sections), Ch 18**
Bacterial RNAP and sigma cycle first — it's the system where the mechanism was actually
solved — then Pol II, the general transcription factors, initiation, elongation, termination.

### M5 · RNA processing and splicing · ~24 days
**Ch 19 (full), Ch 21 (selected), Ch 20 (selected)**
Your self-declared gap ("I can't tell you what the spliceosome contains"). Capping,
splice-site recognition, the lariat, snRNP-by-snRNP spliceosome assembly and remodeling,
the group II intron parallel, alternative splicing regulation, 3' end cleavage/polyadenylation,
NMD and decay.

### M6 · Translation and the code · ~26 days
**Ch 22 (full), Ch 23 (selected)**
The most self-contained mechanism in the book and the best place to practice tracing.
Initiation in both domains, the elongation cycle as a GTPase clock, ribosome active centers,
peptidyl transferase as ribozyme, termination, tRNA charging, wobble, recoding.

### M7 · Chromatin · ~19 days
**Ch 8 (full), Ch 7 (selected: 7.5–7.7, 7.12–7.19)**
Nucleosome structure and positioning, histone modification and variants, fiber architecture,
replication-coupled assembly, transcription through nucleosomes, DNase sensitivity, LCRs,
insulators. Plus centromere and telomere mechanism from Ch 7.

### M8 · Gene regulation · ~30 days
**Ch 24 (full), Ch 25 (trimmed ~6 sections), Ch 26 (full)**
*lac* and *trp* as the places experimental logic was invented — the richest figure-reading
material in the book. Lambda lysis/lysogeny as the canonical circuit. Then eukaryotic
activators, DNA-binding domain families, coactivators, chromatin remodeling, the GAL system.

### M9 · Epigenetics and regulatory RNA · ~20 days
**Ch 27, 28, 29, 30**
Heterochromatin propagation, DNA methylation and imprinting, Polycomb/Trithorax, X-inactivation,
prions, lncRNA, RNAi/miRNA, CRISPR as a bacterial immune system.

**Spine total: ~180 study days ≈ 9 months at 5 days/week.**

---

## Tier 2 — Reference (pulled just-in-time, not taught as modules)

- **Ch 1** classical genetics, mutation, complementation, the code — you have this.
- **Ch 2 methods** — *not a module, but used constantly.* Whenever a technique appears in a
  "read the figure" exercise, we read the relevant section that day. Footprinting, ChIP,
  gel shift, and genome editing will each get pulled this way.
- **Ch 3–5** interrupted genes, genome content, genome evolution — your day job. Ch 3.9
  (exons as protein domains) gets pulled into M3 when we discuss exon shuffling.
- **Ch 9** cell cycle and bacterial division — 9.9–9.11 (checkpoints, p53, Rb) pulled into
  M2 when DNA-damage response comes up. The FtsZ/septum material is skipped.
- **Ch 12** extrachromosomal replicons — rolling-circle replication folded into M1; the
  plasmid partition/incompatibility material skipped.

## Tier 3 — Optional add-on modules, your call, after M9

- **Ch 16 · immune-system recombination** (~168pp, the book's largest). V(D)J, class switching,
  somatic hypermutation. Superb mechanism, and it's *programmed genome rearrangement*, so it
  rhymes with your work — but it's a big detour. Offered as an optional capstone module.
- **Ch 15 remainder · transposition mechanism in full** (15.2–15.11, 15.16). If M3 leaves you
  wanting the full enzymology of cut-and-paste vs. replicative transposition.
- **Ch 13.15–13.22 · site-specific recombination.** Integrases, mating-type switching,
  trypanosome antigenic variation. Mechanistically gorgeous, and the basis of Cre/Flp.

---

## How days will be built (per your contract)

Each `day-NN.md` is: **free recall → mechanism core → perturbation → one stretch**, plus
**2–3 spaced-repetition items** weighted toward things you got wrong, plus (most days)
one **"read the figure."** Free recall always comes before you open the book.

Roughly one day in eight is a **JEE-Advanced-style typst paper** — single doc, you render,
print, solve on paper, scan back. `typst` is already on your machine.

## Sign-off

Things worth pushing back on before I start:

1. **M1 length.** 12 days of replication before you reach your own topic. I think it's the
   minimum honest prerequisite for BIR/MMBIR, but if you already know the fork cold, say so
   and I'll compress it to a 3-day diagnostic and jump to M2.
2. **Order after M3.** M4–M9 is my ordering, not gospel. Chromatin (M7) has a real argument
   for coming earlier, since repair happens in chromatin and your field cares about it.
3. **Ch 16 placement** — genuinely optional, or do you want it in the spine?
