# Polymerase architecture — the hand, and what moves inside it

Source: Lewin's *Genes XII* §11.5 (pp. 1010–1013). Written up 2026-07-28 after M1 day-04.
Companion to `replication-fidelity.md`, which covers what the architecture is *for*.

---

## 1 · The hand

The first polymerase structure solved was the **Klenow fragment** of *E. coli* Pol I. Every
polymerase since has turned out to be built on the same plan: DNA lies in a large cleft made
of three domains named after a right hand.

| Domain | Job | Constraint on it |
|---|---|---|
| **Palm** | conserved sequence motifs providing the **catalytic active site** | brutal — see §5 |
| **Fingers** | **position the template** base correctly at the active site | shape only |
| **Thumb** | **binds DNA as it exits**; sets **processivity** | shape only |

The most conserved regions of all three converge to form one continuous surface at the
catalytic site. **The exonuclease is not part of the hand** — it is an independent domain
with its own catalytic site, ~30 Å away. (The N-terminal domain extends into it.)

DNA polymerases fall into **five families with essentially no sequence homology between
them**. The palm is structurally well conserved across all five; the thumb and fingers
supply *analogous* secondary-structure elements built from completely different sequences.
That split is the single most informative fact in the section — §5 unpacks it.

### Two details worth keeping

- **The DNA takes a sharp turn.** It is classic B-form up to the **last two base pairs at the
  3′ end of the primer**, which flip to the more open **A-form**. The turn is what exposes
  the template base to the incoming nucleotide.
- **The enzyme grips the backbone, not the bases.** Contacts are made principally with the
  **phosphodiester backbone** — which is precisely why a polymerase can work on DNA of any
  sequence. It never reads the sequence; it reads *shape*. Same idea as the isosteric-caliper
  argument in `replication-fidelity.md` §2, arriving from the other direction.

---

## 2 · What physically moves

Structures solved *without* an incoming nucleotide show the fingers and thumb rotated **away**
from the palm — the open state, with the O helix swung out. Then:

> **When a correct nucleotide binds: the fingers rotate 60° toward the palm, the tops of the
> fingers travelling ~30 Å. The thumb rotates toward the palm by 8°.**

These changes are **cyclical**. They reverse once the nucleotide has been incorporated; the
DNA then translocates one position through the enzyme, recreating an empty open site. Open →
nucleotide binds → close → chemistry → open → translocate → repeat.

Memorise the three numbers as a set: **60° / 30 Å / 8°**. Fingers do the large motion, thumb
the small one, palm doesn't move at all — it's the bench the work happens on.

---

## 3 · Why the *closing motion* is the selectivity step, not the base pairing

This is where §11.4 and §11.5 join, and it is the point of the whole day.

Base pairing on its own is a weak discriminator: the free-energy difference between a correct
and an incorrect pair buys about **10⁻²**. If hydrogen bonding were doing the selecting, the
error rate would be one in a hundred. The polymerase achieves **10⁻⁵** before proofreading is
even involved. So something other than pairing energy is doing the work.

That something is an **induced-fit conformational checkpoint**:

1. The chemical step **cannot happen in the open state.** Catalysis requires the closed
   conformation — the fingers rotating in is what completes the active site and positions the
   catalytic metals for attack.
2. **Closure is licensed by shape.** The fingers can only rotate home if the nascent pair has
   Watson–Crick dimensions. From the book, in as many words: *when a mismatched base pair
   occupies the catalytic site, the fingers cannot rotate toward the palm.*
3. So a mispair doesn't get rejected — it gets **stalled**. The chemistry slows by orders of
   magnitude, and the wrong nucleotide, bound only weakly, diffuses back out long before it
   can be joined.

The gain comes from converting a **small thermodynamic difference** (which pair is more
stable) into a **large kinetic one** (how fast the chemical step fires). Discrimination is
kinetic and steric. That's why a rigid site can outperform base-pairing energy by a thousandfold.

### And it's the same event that hands the substrate to the proofreader

Failure to close has a second consequence. In the open state the primer's 3′ end is **not
clamped down** — so it is free to melt back and rotate across into the exonuclease site.

> mispair → fingers can't close → 3′ end left free → DNA rotates → 3′ end enters the exo
> site → excision → back to the polymerase site

The enzyme alternates between **polymerising and editing modes**, and the book states the
mechanism plainly: the two modes are set by a **competition between the two active sites for
the 3′ primer end**. Nothing decides; the terminus partitions.

---

## 4 · Why the exonuclease site is 30 Å away instead of built in

Two independent reasons, and the second is the deeper one.

**(a) The two chemistries want incompatible pockets.** The polymerase site must hold a
*base-paired, duplex* primer terminus rigidly in register so a dNTP can be presented against
the template — it is a caliper machined to Watson–Crick dimensions, and its whole function
depends on being intolerant of anything else. The exonuclease site must accept a **frayed,
melted, single-stranded** 3′ end and position a water molecule for hydrolysis. One pocket
cannot simultaneously be shaped for paired duplex and unpaired ssDNA. A hybrid site would be
a mediocre caliper *and* a mediocre nuclease — you would lose selectivity to buy editing
speed, which is the wrong trade because selectivity is worth 10³ and editing only 10².

**(b) Distance is what makes editing a decision instead of a reflex.** The trip is expensive:
melt the last few base pairs, swing 30 Å, cut, swing back. That expense is a **threshold**.
A correctly paired terminus is clamped by the closed fingers and extended within
milliseconds — it never sits still long enough to make the trip. Only a mispair, which stalls
the polymerase, leaves the terminus loitering long enough for the exo site to win the
competition. **The slowness is the specificity.**

Put an instantaneous nuclease in the polymerase site and it fires on correct pairs too, because
the exonuclease is not perfectly selective either — you get **futile cycling**: correct bases
removed about as fast as they are added, net synthesis → 0 (see `replication-fidelity.md` §3).

> The engineer's instinct — "save the trip" — optimises the wrong variable. The trip isn't
> overhead. It's the filter.

---

## 5 · Why evolution constrains the palm and not the fingers or thumb

Five families, no sequence homology, and yet the palm is conserved in all five. The reason is
what each domain has to do:

- The **palm does chemistry.** It positions two Mg²⁺ ions, via conserved acidic residues, with
  sub-ångström precision relative to the 3′-OH, the α-phosphate, and each other. The
  two-metal-ion mechanism has essentially **one geometric solution**. Move a carboxylate by
  half an ångström and catalysis is gone. There is no room to explore.
- The **fingers and thumb only have to grip.** "Hold a duplex in a groove," "swing in over the
  nucleotide," "let DNA out the back" are topological requirements. Many different folds, built
  from unrelated sequences, satisfy them. So they converge on *shape* while diverging in
  sequence — textbook analogous structure, at the domain level.

The generalisation is worth carrying beyond this section:

> **Conservation tracks the number of available solutions, not the importance of the job.**
> Catalysis has one answer, so its sequence is frozen. Binding has thousands, so its sequence
> drifts freely while its shape stays put.

---

## 6 · The thumb, processivity, and the error spectrum

A polymerase with a **damaged thumb** but an intact palm and fingers has a normal catalytic
site and adds correct nucleotides at a normal rate. What it loses is its grip on exiting DNA —
i.e. **processivity**, the tendency to stay on one template instead of dissociating.

So the error spectrum shifts in a specific direction:

- **Substitution rate: roughly unchanged.** Base selection (palm/fingers geometry) and
  proofreading are both intact.
- **Frameshift rate: up.** Every dissociation/re-association is a chance to re-anneal in the
  **wrong register**.

**Where to look for it:** **homopolymeric runs** and short tandem repeats. Slip by one unit in
a run of dA·dT and every base is still correctly paired — there is no local geometry error for
the active site to feel, because **register is invisible to a local sensor**. Nothing in the
proofreading machinery can detect it, which is exactly why processivity rather than
proofreading sets this error class.

This is the bridge into M3: slippage at homopolymers is the small-scale version of the register
problem that produces expansions, contractions, and unequal exchange at larger repeats.

---

## 7 · Counterfactual: if A–T were 2 Å wider than G–C

Worth keeping because it is the cleanest test of whether the caliper model is actually held.

A single rigid active site is **one gauge**. It works because all four correct Watson–Crick
pairs are isosteric, so one set of dimensions accepts all four. Make A–T wider than G–C and
that stops being true: the site could no longer **accept both pair types with one geometry** —
tuned to G–C it would veto correct A–T pairs as too wide; tuned to A–T it would pass
purine–purine mispairs.

To cope it would have to acquire **flexibility, or a second site** — and here is the part that
must be said out loud, because it's the cost that makes the answer bite:

> Flexibility *is* loss of fidelity. A site loose enough to accept two different widths is
> loose enough to accept mispairs of intermediate width. You cannot buy tolerance without
> paying in accuracy.

The existence proof is already in the book: **Pol IV and Pol V have open, roomy active sites**,
which is what lets them accommodate distorted, damaged template bases — and is exactly why they
are error-prone by design.

---

## 8 · Compressed recall set

- **Palm** = conserved motifs + catalytic site. **Fingers** = position the template.
  **Thumb** = binds exiting DNA, sets **processivity**.
- **Exonuclease = its own domain, its own site, ~30 Å away.** Not part of the hand.
- **Five families, no sequence homology. Palm conserved; fingers and thumb analogous only.**
- Correct nucleotide binds → **fingers rotate 60° toward the palm, tips move 30 Å; thumb 8°.**
  Cyclical: reversed on incorporation, then the DNA translocates.
- **Mispair → fingers cannot close → no chemistry, and the free 3′ end swings to the exo site.**
- Polymerising vs. editing mode = **competition between the two sites for the 3′ primer end.**
- DNA is gripped by the **phosphodiester backbone** → sequence-independent. Last two bp of the
  primer are **A-form**; the template takes a **sharp turn** to present the base.
- Palm is conserved because **catalysis has one geometric solution**; grip has many.
- Damaged thumb → **frameshifts up, substitutions flat**, detectable in **homopolymer runs**.
