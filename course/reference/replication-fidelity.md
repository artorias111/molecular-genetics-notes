# Replication fidelity

Source: Lewin's *Genes XII* §11.4 (pp. 1004–1007), plus §11.5 for the ε subunit (p. 1009)
and §14.7 for mismatch repair. Written up 2026-07-26 after M1 day-03.

---

## 1. The fidelity budget — rates vs. improvement factors

The single most common way to get this wrong is to multiply the wrong quantities.
Two different kinds of number are in play:

- a **rate left behind** — errors per base pair still present after a stage has acted
- an **improvement factor** — how many fold a stage reduces the rate it was handed

You multiply a rate by the *reciprocal* of the next stage's improvement factor.

| Stage | What it is | Improvement | Rate left behind |
|---|---|---|---|
| (baseline) | free energy of base pairing alone | — | ~10⁻² |
| 1. Active-site selectivity | polymerase geometry vetoes mispairs | ~10³ | ~10⁻⁵ |
| 2. Proofreading | 3′→5′ exonuclease, ε subunit | ~10² | ~10⁻⁷ |
| 3. Mismatch repair | separate system, post-replicative | ~10²–10³ | ~10⁻⁹–10⁻¹⁰ |

The 10⁻² is **not a stage.** It's the prediction you get from hydrogen bonding alone —
the number the enzyme has to beat. If you put it in the table as stage 1, the arithmetic
stops closing, which is the symptom.

Sanity check the book gives: 10⁻⁹–10⁻¹⁰ per bp works out to about **1 error per genome
per 1,000 bacterial replication cycles**, or ~10⁻⁶ per gene per generation.

**Use the budget as an algebra problem, not a recall problem.** If you know the endpoint
(10⁻⁹) and two of the three stages, solve for the third. Noticing "this doesn't multiply
out" is the right instinct; finishing the division is the payoff.

---

## 2. Why the active site can discriminate without reading sequence

The problem: the free-energy difference between a correct and an incorrect base pair in
solution buys you only ~10⁻¹–10⁻². Hydrogen bonds are nowhere near enough. Yet the
polymerase achieves ~10⁻⁵ before proofreading even starts.

The resolution is **shape, not chemistry.**

> The geometry of an A–T base pair is very similar to that of a G–C base pair.
> — *Genes XII*, p. 1006

This is the fact the whole mechanism hangs on, and it is easy to invert. A–T and G–C are
**isosteric**: same C1′–C1′ distance, same overall width, same angles where the sugars
attach. Purine-plus-pyrimidine, in both cases, one big and one small. That's what makes
the double helix a uniform cylinder rather than a lumpy one.

So a high-fidelity polymerase's active site is a **rigid caliper**. It is machined to the
dimensions of *a* Watson–Crick pair — and because all four correct pairs share those
dimensions, one gauge accepts all four. It never needs to know which base is on the
template.

Mispairs fail the gauge:

- **purine–purine** (A·A, A·G) — too wide, won't fit the pocket
- **pyrimidine–pyrimidine** (C·T) — too narrow, can't bridge it
- **wobble** (G·T, A·C) — right width, wrong geometry: the glycosidic bonds come off at
  the wrong angle, so the sugars don't land where the enzyme expects them

When the fit is wrong the fingers domain can't close properly over the nascent pair, the
catalytic metals aren't positioned, and the chemical step slows by orders of magnitude.
Discrimination is **kinetic** — the wrong nucleotide isn't forbidden, it's just slow enough
that it usually diffuses away first.

**The corollary that proves the rule:** *E. coli* Pol IV (and Pol V) have **open, roomy**
active sites. That's deliberate. An open site accommodates a damaged, distorted template
base — which is the point, since these are translesion polymerases — but the same
looseness means it also accommodates mispairs. Hence Pol IV is error-prone *by design*,
and hence its expression and activity are tightly regulated so it acts only after damage.

> Fidelity and lesion-tolerance are the same knob turned in opposite directions.
> A tight site is accurate and stalls at damage; an open site bypasses damage and
> makes mistakes. There is no polymerase that is both.

---

## 3. Proofreading — and why more of it is not better

The 3′→5′ exonuclease scrutinizes the base pair just formed. If the pair is wrong, the
duplex is locally warped; the polymerase pauses or slows; the pause is what buys time for
the primer terminus to shuttle ~30 Å into a *separate* exonuclease active site, where the
offending nucleotide is excised. Then it shuttles back.

In Pol III these are two activities on **two different polypeptides**:

| Activity | Subunit | Gene | Phenotype of loss |
|---|---|---|---|
| 5′→3′ polymerase | **α** | *dnaE* | **lethal** — no replicase |
| 3′→5′ proofreading exo | **ε** | *dnaQ* (= *mutD*) | **viable, mutator**, 10²–10³× rate |

That asymmetry is the same argument as *polA* (viable) vs *polC* (lethal): an accessory
that improves an essential process is dispensable; the essential process is not.

### Why over-proofreading is costly

Two answers, and the interesting one isn't about speed:

1. **Futile cycling.** The exonuclease is not perfectly selective either — it sometimes
   excises *correct* nucleotides. Every excision is a wasted dNTP, and pushed far enough
   the enzyme removes correct bases about as fast as it adds them. Net synthesis goes to
   zero. There is a hard ceiling here that has nothing to do with the cell's patience.

2. **Zero mutation rate means no adaptation.** Mutation is the only source of heritable
   variation. A lineage with a perfect polymerase cannot evolve — it is optimally adapted
   to the last environment it saw and can never track a new one. Mutation rate is itself a
   selected trait with an optimum **above zero**, balancing the immediate cost of
   deleterious mutations against the long-run need for variation. (Mutator strains are
   genuinely favored in novel or stressful environments, and are found at elevated
   frequency in clinical isolates and in long-term evolution experiments.)

---

## 4. Substitutions vs. frameshifts — two error classes, two determinants

| Class | What happens | Set by |
|---|---|---|
| **Substitution** | wrong (mispaired) nucleotide incorporated | efficiency of **proofreading** |
| **Frameshift** | extra nucleotide inserted or omitted | **processivity** |

**Processivity** = the tendency to stay on one template rather than dissociate and
reassociate. Every dissociation/reassociation is a chance to re-anneal in the wrong
register.

This matters most in **homopolymeric runs** — a long dT_n:dA_n stretch, say. Slip by one
base there and every base is still correctly paired; there is no local geometry error for
the active site to feel, because **register is invisible to a local sensor**. That's
**replication slippage**, and it changes the length of the run. Higher processivity → fewer
chances to slip → shorter indel spectrum.

In multi-subunit polymerases processivity is supplied by a subunit with **no catalytic
role at all** — the sliding clamp. It is a pure tether, and it is a fidelity factor.

> This is the direct link into M3. Slippage at homopolymers and short tandem repeats is
> the small-scale version of the same register problem that produces expansions,
> contractions, and unequal exchange at larger repeats.

**Mutation hotspots** are loci where errors are disproportionately frequent. The cause is
**sequence context**: some sequences make the polymerase move faster or slower, and speed
determines whether there is time to catch an error. Fidelity is not uniform across a
genome.

---

## 5. Strand discrimination in mismatch repair

The problem MMR faces: at a mismatch, **both bases are chemically normal**. An A sitting
opposite a G is a perfectly good adenine. Nothing about the lesion says which strand is
the error. A system that guesses is right half the time — and when it guesses wrong it
writes the error into the template, converting a repairable mismatch into a fixed
mutation. 50% is worse than useless.

So MMR needs a signal that is **transiently true of new DNA and not of old DNA**, readable
in the minutes after the fork passes.

**Bacteria — transient hemimethylation.** Dam methylase methylates the adenine in every
**GATC** site. Immediately behind the fork the parental strand carries its methyl group
and the daughter strand does not yet — the site is *hemimethylated* — because methylation
lags replication by a few minutes. **MutS** binds the mismatch, **MutL** couples, and
**MutH** nicks the **unmethylated** strand at the nearest GATC. The nick licenses excision
of the new strand only. Once Dam catches up the window closes, which is why MMR is
strictly post-replicative and time-limited.

**Eukaryotes — strand discontinuities.** There is no Dam and no GATC signal. The mark is
the **nicks and free 3′ ends themselves**: the lagging strand is full of Okazaki junctions
not yet ligated, and PCNA is loaded onto the DNA with a defined orientation relative to
those ends. MutSα/MutLα read that asymmetry. The new strand is identified by the fact
that it is *still under construction*.

The general principle either way: **the signal is not in the mismatch, it's in the age of
the strand.** Anything transiently asymmetric between parent and daughter will do — a
methyl group that hasn't been added yet, or a backbone that hasn't been sealed yet.

### Stages in series multiply

Proofreading and MMR are **sequential filters**, and MMR acts on exactly the errors
proofreading left behind. They are statistically independent — which is *why* their
improvement factors multiply rather than add.

So a *mutD* (ε⁻) strain that also loses MMR is **worse than additive**: losing ~10² from
one and ~10² from the other gives ~10⁴×, not ~2 × 10². This synergy is observed;
*mutD* combined with *mutS/mutL* defects is far more mutagenic than either alone.

---

## 6. Compressed recall set

- Base-pairing energetics predict **10⁻²**; real bacterial rate is **10⁻⁸–10⁻¹⁰**.
- Three stages: **selectivity (10⁻⁵) → proofreading (×10² → 10⁻⁷) → MMR (×10²–10³ → 10⁻⁹)**.
- A–T and G–C geometry is **the same**; that's what a single rigid active site exploits.
- Discrimination is **steric and kinetic**, not thermodynamic.
- Open active site = translesion capable = error-prone. Pol IV, Pol V.
- **α** = *dnaE* = polymerase = essential. **ε** = *dnaQ* = *mutD* = proofreading =
  dispensable, mutator.
- Substitutions ← proofreading. Frameshifts ← processivity. Hotspots ← sequence context.
- Slippage lives in **homopolymer runs**; a slipped product is correctly paired everywhere,
  so no local sensor can see it.
- Strand discrimination: **hemimethylated GATC / MutH** in bacteria, **strand nicks and
  PCNA orientation** in eukaryotes.
