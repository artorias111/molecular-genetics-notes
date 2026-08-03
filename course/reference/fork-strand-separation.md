# Semidiscontinuity, helicase, and SSB

Source: Lewin's *Genes XII* §11.6–11.7, pp. 1013–1019. Written up after M1 day-05.
Companion to `nucleic-acid-chemistry.md` (ends and termini) and
`polymerase-architecture.md` (the enzyme itself).

---

## 1 · The antiparallel problem, stated as a collision

It is not "the fork is complicated." It is two facts that cannot both be satisfied:

1. The parental strands are **antiparallel**. As the fork advances, it travels along one
   template in the 3′→5′ direction and along the other in the 5′→3′ direction.
2. A polymerase can do exactly one thing: add to a **free 3′-OH**, extending **5′→3′**,
   which requires reading a template **3′→5′**.

Fact 2 is satisfiable on one template and unsatisfiable on the other. On the template the
fork traverses 5′→3′, a polymerase that tried to keep up would have to run backwards
through its own chemistry.

**The resolution is the only one available:** on that template, synthesis runs in the
*opposite* direction to fork movement, still 5′–3′, in short pieces. Each piece is started
once enough new template has been exposed, extends backwards away from the fork, and stops
when it reaches the previous piece. The pieces are joined afterwards.

The names come *after* this derivation, not before it:

| | leading (forward) strand | lagging strand |
|---|---|---|
| direction of synthesis | same as fork | opposite to fork |
| continuity | continuous | fragments (~1,000–2,000 b) |
| template traversed | 3′→5′ | 5′→3′ |

**Discontinuity is not a property of the strand. It is what "5′→3′ only" costs you on the
template that runs the wrong way.**

---

## 2 · The uracil artifact — how we know the leading strand is continuous

Give *E. coli* a very brief radioactive pulse and **nearly all** the label comes back in
short fragments — apparently including on the strand that ought to be continuous. Taken at
face value, replication is discontinuous on *both* strands.

It isn't. Some of those short pieces are **pseudofragments**: parts of a chain that really
was made in one continuous run and was **cut afterwards**.

The cause is not a synthesis event. It is a repair event:

```
dUTP in the pool  →  uracil incorporated in place of thymine
                  →  uracil-excision repair removes the base
                  →  strand is left broken until the T is put back
                  →  a continuous chain is recovered as short pieces
```

**Why this matters as a lesson, separately from the fact:** the assay was not measuring
what it appeared to measure. A perfectly real experimental result described a process that
happens *after* the process being studied.

### The experiment that settles it

The move is the day-01 *polA*-extract logic: **if a process is corrupting your assay,
delete the enzyme responsible and re-run it.** The whole question is *which* enzyme.

- **Delete the uracil-excision glycosylase (*ung*)** — and/or knock out *dut* so dUTP stops
  entering the pool in the first place. No excision → no nick → no breakage.
- **The result that settles it:** the label now partitions in **two** populations. Roughly
  half appears in **long, continuous chains** (the leading strand, never really broken) and
  half stays in short fragments (the lagging strand, genuinely discontinuous). If both
  strands were truly discontinuous, removing the glycosylase would change nothing.

**The one enzyme you must not delete is Pol I.** Pol I does not create the break — the
glycosylase and AP endonuclease do. Pol I is what **fills it back in**. Removing *polA*
makes the nicks persist, so the fragmentation gets *worse*, and the artifact you were
trying to abolish is amplified. Correct method, wrong enzyme, and the prediction inverts.

> The general check: before you delete an enzyme to remove an effect, ask whether it
> **causes** the effect or **cleans up after** it. Both sit in the same pathway, and both
> sound plausible.

---

## 3 · Helicase

### Two things it does

- Separates (melts) the strands, **1 ATP hydrolysed per bp unwound**.
- Translocates along one strand with a **defined polarity** — a 5′→3′ helicase moves 5′→3′
  along the strand it is riding; a 3′→5′ helicase, the other way. DnaB is **5′→3′**.

### The thing it cannot do, stated flatly in the text

> "It cannot unwind a segment of duplex DNA; it can only continue to unwind a sequence that
> has been started."

A helicase **initiates at a single-stranded region adjacent to a duplex.** It is an
extender, not an opener. Something else has to make the first opening — at *oriC* that is
**DnaA**.

This is one of two independent reasons DnaB cannot get itself started, and it is the reason
that generalises: *no helicase opens closed duplex DNA.*

### The second reason: rings are topologically trapped

Replicative helicases are **hexameric rings that encircle the DNA**. That is what buys
processivity — a ring cannot fall off sideways, so it can unwind for many kilobases.

The same property is the problem:

> A closed ring can only get onto a strand **over a free end**, or by being **opened and
> reclosed** around it. At an internal origin in a circular chromosome there is no free end.

So the cell must supply a device that cracks the ring open, places it around the exposed
single strand, and shuts it. That device is **DnaC**, and it exists for no other purpose.

**This is why the loader question has a structural answer, not an affinity answer.** DnaB
doesn't fail to load because it "binds DNA weakly" or "can't attach to intact DNA" — it
fails because a closed circle cannot be threaded onto a thread with no ends.

Sequence at the origin, and the whole of it:

```
DnaA    melts       opens the duplex at the 13-mers → creates ssDNA
DnaC    loads       opens the DnaB ring, sets it around that ssDNA, closes it
DnaB    propagates  translocates 5'→3', unwinding processively
```

### Which parental strand DnaB rides — derive it, don't memorise it

Set the fork moving to the right.

```
        lagging-strand template
  5' ----------------------------→ 3'      traversed 5'→3' as the fork advances
  3' ←---------------------------- 5'      traversed 3'→5' as the fork advances
        leading-strand template
```

A **5′→3′** helicase moving *with* the fork must be on the strand the fork traverses
**5′→3′**. That is the **lagging-strand template**. DnaB rides the lagging-strand template.

**And the objection that it would get in the way of the Okazaki machinery is exactly
backwards.** DnaG (primase) binds **DnaB**. The helicase sitting on the lagging-strand
template is what delivers primase to the strand that needs a new primer every 1–2 kb. The
contact isn't a collision to be avoided; it is the mechanism.

**If DnaB were on the leading-strand template instead:** it would be a 5′→3′ motor on a
strand that runs 5′→3′ *backwards* relative to fork motion, so it would translocate **away
from the fork**, into the duplex region already replicated behind it. It would not unwind
anything ahead. The fork would not advance.

(Eukaryotes solve the same problem with the opposite convention: the MCM/CMG helicase is a
**3′→5′** helicase and therefore rides the **leading**-strand template. Polarity and strand
choice are one decision, not two.)

---

## 4 · SSB

### What it is not

> "This protein is **not** a DNA-unwinding protein; its function is to stabilize DNA that is
> already in the single-stranded condition."

The name invites the error. SSB does not melt, does not open, does not help the helicase
pull. It arrives after the fact and holds the result.

### Cooperativity, and what fails without it

*E. coli* SSB is a **tetramer**; the eukaryotic equivalent is **RPA**, a trimer. Binding is
**cooperative**: one bound molecule makes the next one easier to bind, so once binding
nucleates on a stretch it **spreads rapidly until the whole exposed region is covered**.

Take cooperativity away, keeping affinity identical, and the failure is a **race**. Exposed
single-stranded template is not inert while it waits — the competing reaction is sitting
right there:

- the two parental strands **re-anneal** behind the helicase, undoing the unwinding;
- the exposed strand folds back on **itself** into hairpins, which stall the polymerase;
- naked ssDNA is a substrate for nucleases.

Cooperativity is what makes coating **faster than reannealing**. Independent binding gives
you the same equilibrium and loses the race — the region is coated eventually, but
"eventually" is after the duplex has zipped back up.

### Why the requirement is stoichiometric, not catalytic

SSB has **no catalytic activity at all**. Its function *is* its occupancy — the job is
"this stretch is covered," and the only way to do that is to be sitting on it.

An enzyme is **regenerated** at the end of each cycle, so a few molecules can process an
unlimited amount of substrate; that is what makes catalytic amounts sufficient. A protein
whose product is its own bound state is never released, cannot turn over, and **cannot be
in two places at once**. So the requirement scales with the amount of single-stranded DNA:
one molecule, one stretch, held for as long as it must stay open.

> Generalises: **ask whether the protein's product is a molecule or a state.** If it's a
> state, the requirement is stoichiometric.

### Quick-stop

*ssb* mutants are **quick-stop** — replication halts almost immediately on shift to
restrictive temperature, rather than finishing the round in progress.

Read it with the day-01 dichotomy:

| phenotype | when the protein is needed | example |
|---|---|---|
| **slow-stop** | only to **initiate** a new cycle; forks already running finish | DnaA |
| **quick-stop** | **continuously, at the fork, during elongation** | SSB, DnaB, Pol III |

So quick-stop is not "SSB is very important." It is a statement about **when**: SSB is
consumed by the ongoing fork, and an existing fork cannot complete without it. *ssb* mutants
are also defective in **repair and recombination** — the same job (holding ssDNA open)
wherever single strands are generated.

---

## 5 · Compressed recall set

- Antiparallel + "extend a free 3′-OH, 5′→3′ only" ⇒ one daughter strand **must** be built
  in pieces running opposite to the fork. The names are the outcome, not the reason.
- Okazaki fragments: **1,000–2,000 bases**, both prokaryotes and eukaryotes.
- Nearly all pulse label is short **because of uracil excision**, not because both strands
  are discontinuous. Those are **pseudofragments**. Replication is **semidiscontinuous**.
- To prove it: delete **ung** (or *dut*), and watch half the label move into long chains.
  Deleting **polA** makes it worse — Pol I repairs the nick, it doesn't cause it.
- A helicase **cannot open duplex DNA**; it can only continue an opening already made.
- A hexameric ring is **topologically trapped** → it needs a loader (**DnaC**) → this is a
  structural necessity, not a binding-affinity story.
- **DnaB is 5′→3′ and rides the lagging-strand template**; primase docks on it, which is a
  feature. On the other template it would travel away from the fork.
- **SSB is not an unwinding protein.** Tetramer in *E. coli*, RPA in eukaryotes.
- Cooperativity wins a **race against reannealing** and hairpin formation.
- SSB is needed in **stoichiometric** amounts because its product is a **state**, not a
  molecule — no turnover, no acting twice.
- **quick-stop = needed at the fork during elongation. slow-stop = needed only to initiate.**
