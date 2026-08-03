# Priming, and why one strand needs a thousand starts

Source: Lewin's *Genes XII* §11.8–11.9 (pp. 1019–1027). Written up 2026-08-02 after M1 day-06.
Companion to `fork-strand-separation.md` (what opens the fork) and `nucleic-acid-chemistry.md`
(the 3′-OH chemistry this all rests on).

---

Every section below exists because day 06 showed a gap there. §2 and §4 are the two that cost
the most, and they fail the same way — the *fact* was available and the *derivation* wasn't.

## 1 · The one chemical constraint everything follows from

A DNA polymerase can only add a nucleotide to a **free 3′-OH**. It cannot start a chain. That
single restriction is the reason priming exists at all, and almost everything in this note is a
consequence of it.

There are exactly **three ways** to present a polymerase with the 3′-OH it needs, and only one
of them involves a primase:

| Route | What supplies the 3′-OH | Where you meet it |
|---|---|---|
| **RNA primer** | primase (DnaG) synthesizes a short RNA, 8–14 bases | every Okazaki fragment |
| **A nick in DNA** | the 3′ side of a pre-existing break | nick translation, repair |
| **A protein primer** | a protein holds out a nucleotide for extension | some linear viral genomes |

> RNA polymerases *can* start a chain from nothing. That is the entire reason RNA appears in
> DNA replication — not because RNA is better at anything, but because it can begin.

### Why not let RNA polymerase make the whole strand?

Because the finished product has to be a *genome*, and RNA polymerase is the wrong tool twice
over. **Fidelity is the main answer**: RNA polymerases have no proofreading exonuclease, so they
run at roughly 10⁻⁴–10⁻⁵ per base — four to five orders of magnitude worse than the ~10⁻⁹ the
replication system achieves (see `replication-fidelity.md` §1 for where each factor comes from).
A genome copied at 10⁻⁴ is not a genome.

Second, and this is the one worth having ready because it recurs in repair: **uracil**. If U were
a normal genomic base, the cell could no longer recognize a deaminated cytosine — deamination of
C produces U — as damage. The whole uracil-excision system depends on U being, by definition,
an error in DNA. (This is the same fact that makes §6 work.)

## 2 · Why the leading strand primes once and the lagging strand primes constantly

**This is the derivation, not the fact.** The fact — one versus one-per-1–2 kb — is easy and
useless on its own; what follows is what makes it re-derivable.

Both strands are synthesized 5′→3′; no polymerase does anything else. The fork moves in **one**
direction. So take the two templates in turn:

- **Leading-strand template.** Its 5′→3′ synthesis direction points *the same way the fork is
  moving*. Newly exposed template appears directly ahead of the growing 3′ end. The polymerase
  never needs a new start — it just keeps extending the 3′-OH it already has. **One prime, then
  a continuous chase.**
- **Lagging-strand template.** Its 5′→3′ synthesis direction points *backwards, away from the
  fork*. So the polymerase runs away from the fork while the fork keeps opening new template
  behind it. The newly exposed stretch is **unreachable by extending the existing 3′ end** — that
  end is at the wrong place, pointing the wrong way. The only way to copy the new stretch is to
  start again at its far end. **Every newly exposed stretch is a fresh start.**

> The number of priming events on a strand equals the number of times its template is exposed in
> a place the current 3′ end cannot reach. Leading: never. Lagging: once per fragment.

The frequency (~one per 1–2 kb) is set by how much template gets exposed before the machinery
cycles, not by anything about primase itself.

**The circular version to avoid:** "the lagging strand is made in pieces, so it needs many
primers." That restates the fact. The reason is the geometric mismatch between synthesis
direction and fork direction — everything else follows.

## 3 · The property that must differ: processivity

Processivity = how many nucleotides an enzyme adds per binding event, i.e. how long it holds on
before letting go.

| | Leading-strand core | Lagging-strand core |
|---|---|---|
| Engagement | binds once, holds for the whole replicon | binds, runs ~1–2 kb, releases |
| Required property | **high processivity** | must be able to **cycle** — release and re-load |
| Failure if swapped | — | clamps on and never recycles |

Give the lagging-strand unit the leading unit's processivity and the failure is concrete: it
finishes one Okazaki fragment, cannot release, and therefore never reaches the next primer.
Lagging-strand synthesis stops after a single fragment while the fork keeps opening template —
so the lagging template accumulates as long single-stranded gaps. Not "it would be difficult to
detach": it would not detach, and that has a visible consequence.

The mechanism that supplies processivity is the **β sliding clamp**, and how it is put on and
taken off is §11.10–11.11 — day 07. That is where this question gets properly closed.

## 4 · What accumulates when priming fails

Worth committing, because it is the observable in every perturbation question of this type.

If the helicase keeps unwinding at normal speed while the lagging strand cannot be started
(e.g. primase can no longer be delivered), then:

```
helicase unwinds normally  ->  template exposed at normal rate
lagging strand cannot start ->  nothing copies the exposed template
                            ->  single-stranded DNA accumulates at the fork,
                                coated by SSB
```

**Single-stranded DNA is the thing that piles up** — not nucleotides, not primers, not enzymes.
Free nucleotides are in vast excess in the cell and never accumulate anywhere in a way that
means something. Whenever a fork component fails, ask: *what is being exposed faster than it is
being consumed?* The answer is almost always ssDNA, and it is the signal that triggers the
damage response.

The leading strand in that scenario is barely affected — it was primed once, at the origin, and
needs nothing further.

## 5 · Which nuclease can touch a primer — the terminus rule, applied

The rule itself (from day 05, now solid): **an exonuclease's name begins at the end it begins
at.** A 3′→5′ exonuclease requires a free **3′** terminus handed to it; a 5′→3′ exonuclease
requires a free **5′** terminus. The first prime in the name *is* the substrate requirement.

Now apply it to an RNA primer sitting at a nick, with DNA extended from it:

- Its **5′ end is free** — it sits at the nick, exposed. So the **5′→3′ exonuclease** can take
  hold of it and chew it out, travelling away from the fork into already-replicated DNA. This is
  nick translation, and it is Pol I's job.
- Its **3′ end is not free** — it is covalently continuous with the DNA the polymerase extended
  from it. There is no 3′ terminus at all. So the **3′→5′ (proofreading) exonuclease** has
  nothing to bind. The primer is invisible to it.

> The proofreading exonuclease is not "confined to the leading strand" and does not "spare RNA."
> It requires a terminus that does not exist here. Always ask which *terminus* an enzyme needs
> and whether that terminus is present — never which *strand* it prefers.

## 6 · Pseudofragments: which gene to delete, and why not the obvious one

**The observation.** Label *E. coli* DNA very briefly and nearly all of it comes back in short
fragments — suggesting, wrongly, that *both* strands are made discontinuously.

**The explanation.** Some of those pieces are **pseudofragments**: they came from a chain that
was synthesized continuously and was cut *afterwards*. DNA polymerases occasionally incorporate
**uracil** (dUTP is present in the cell); uracil-excision repair then removes it, and the
resulting gap leaves a break in an otherwise continuous strand until the T is restored. A
continuous leading strand, cut after the fact, looks exactly like a strand made in pieces.

**The experiment.** Delete **ung** (uracil-DNA glycosylase) or **dut** (dUTPase — removing it
changes the dUTP supply). Half the label then appears in long, continuous chains, which is the
proof.

> **Do not delete `polA`.** Pol I does not make the break — the glycosylase and the AP
> endonuclease do. Pol I *fills the gap back in*. Deleting it makes the fragmentation **worse**,
> which is the opposite of the result you were trying to produce.

The general form of this trap is worth more than the example:

> Before deleting an enzyme to abolish an effect, ask whether it **causes** the effect or
> **cleans up after** it. Removing the cleanup crew makes the mess bigger.

## 7 · The two priming systems, and why a broken fork needs the heavy one

*E. coli* has two ways to prime:

- **The *oriC* system** — essentially just primase joining machinery already assembled at the
  fork. Used for normal replication.
- **The ΦX / primosome system** — much more elaborate, and what is used to **restart a fork that
  damage has collapsed**.

Why the difference? Because of what is available at each site. *oriC* is a **defined, conserved
sequence** with cognate binding sites, so the initiator can recognize *where it is* by reading
sequence. The site of a collapsed fork is **wherever the damage happened** — an arbitrary
position with no sequence signature at all. A machine that cannot rely on sequence must
recognize a **structure** instead, and structure recognition takes more parts.

## 8 · The asymmetry is the point

The single idea that ties §§2–4 together, and the one the next few days keep returning to:

> The two daughter strands are made by the same chemistry, in the same direction, by the same
> catalytic subunit — and yet one is a single continuous act and the other is a thousand cycles.
> Every difference between them is downstream of one geometric fact: **synthesis runs 5′→3′ and
> the fork runs one way.** Nothing else is needed to generate the whole asymmetry.

---

## Recall list — the derivations, not the facts

Read these before any set that touches priming.

- Polymerase needs a free 3′-OH → three routes to one → primer, nick, protein.
- **Leading = 1 prime because new template appears where the existing 3′ end already points.
  Lagging = many primes because new template appears where it cannot reach.**
- Processivity is the property that differs; **the lagging core must be able to let go**. Swap it
  and synthesis stops after one fragment, leaving ssDNA gaps.
- When a fork component fails, **ssDNA accumulates** (SSB-coated). Not nucleotides.
- **First prime in an exonuclease's name = the terminus it requires.** A primer at a nick has a
  free 5′ end and no free 3′ end → 5′→3′ exo removes it, 3′→5′ exo cannot see it.
- Pseudofragments = uracil excision cutting a continuous chain. Delete **ung/dut**, never
  `polA` — Pol I cleans up, it doesn't cut.
- *oriC* primes by **sequence**; a collapsed fork must be primed by **structure**, which costs
  more machinery.
