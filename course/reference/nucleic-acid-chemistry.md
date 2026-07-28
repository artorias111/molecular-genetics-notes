# Reference · The chemistry underneath everything

Not a problem set. This is the layer that every mechanism in M1–M3 is built on, written
once so it never has to be re-explained. If a later day asks "which end," "which polarity,"
or "which carbon," the answer is here.

---

## 1 · Why the numbers have primes

A nucleotide is three parts: **base + sugar + phosphate**. The base has its own ring atoms,
numbered 1, 2, 3… The sugar has its own ring atoms, which would also be numbered 1, 2, 3…
and you'd never know which molecule was meant.

So the sugar's carbons get **primes**: 1′, 2′, 3′, 4′, 5′. That is the whole reason. "5′
carbon" means *the fifth carbon of the deoxyribose*, and the prime is only there to say
*sugar, not base*.

Walking the deoxyribose ring:

| Carbon | What is attached |
|---|---|
| **1′** | the **base** (glycosidic bond to N9 of a purine, N1 of a pyrimidine) |
| **2′** | **H** in DNA, **OH** in RNA — the single atom that names the whole molecule |
| **3′** | **OH** — one of the two backbone connection points |
| **4′** | ring closure, and carries the 5′ carbon as a branch |
| **5′** | **CH₂–O–phosphate** — the other backbone connection point |

Two things worth banking from that table:

- **Deoxy- means "missing the 2′ oxygen."** DNA is not a different polymer family from RNA;
  it is RNA with one oxygen removed at one position. That missing oxygen is why DNA is the
  chemically stable archive and RNA is the disposable copy — a 2′-OH sitting next to the
  backbone phosphate can attack it and cut the chain. RNA hydrolyses itself; DNA can't.
- **The backbone never touches the base.** Bases hang off 1′ into the helix interior and do
  the information work; the sugar and phosphate do the structural work on the outside.
  Sequence changes nothing about the backbone chemistry, which is why one polymerase copies
  any sequence.

---

## 2 · The phosphodiester bond, and why a strand has direction

The backbone is one repeated linkage: a phosphate esterified to **two** sugars at once —
hence *di*ester.

```
       5′ end
        |
   (P)—O—5′ CH₂        \
              \sugar—base|  residue 1
             3′—OH       /
              |
             (P)                  ← 3′–5′ phosphodiester bond
              |
   (P)—O—5′ CH₂        \
              \sugar—base|  residue 2
             3′—OH       /
              |
             ...
       3′ end
```

Each phosphate bridges the **3′ carbon of one sugar to the 5′ carbon of the next**. That
bridge is asymmetric — 3′ on one side, 5′ on the other — and because every linkage in the
chain points the same way, the asymmetry doesn't cancel. It accumulates into a property of
the whole polymer.

So a strand has two chemically distinct ends:

- **5′ end** — the 5′ carbon has no downstream partner. Free phosphate (or triphosphate,
  or just OH if a phosphatase has been at it).
- **3′ end** — the 3′ carbon has no downstream partner. Free **3′-OH**.

**This is the origin of "polarity."** Not a convention, not a drawing habit: the two ends
of a DNA strand are different molecules, and enzymes can tell them apart by touch. Every
directional statement in molecular biology — synthesis direction, exonuclease polarity,
which end gets resected, which end a ligase seals — reduces to this one asymmetry.

Sequence is always written **5′→3′** unless explicitly labelled otherwise. `GATC` means
5′-GATC-3′.

**Antiparallel** falls straight out: to base-pair, the two strands must run in opposite
directions, so one strand's 5′ end sits over the other's 3′ end. "The 5′ end of the duplex"
is a meaningless phrase; ends belong to strands.

---

## 3 · Chain extension: the one reaction

Every DNA polymerase, every RNA polymerase, every reverse transcriptase, in every organism,
catalyses the same reaction. Learn it once.

> The **3′-OH at the growing end of the chain** attacks the **α-phosphate of the incoming
> dNTP** — the phosphorus nearest the sugar. **Pyrophosphate (PPi)** leaves. A new
> phosphodiester bond exists. The chain is one residue longer, and its new free 3′-OH is
> the one contributed by the nucleotide that just arrived.

Four claims worth stating separately, because each one gets tested:

**(a) The triphosphate is on the incoming nucleotide, never on the chain.**
The chain's growing end offers only a hydroxyl. The energy for the bond arrives *with each
new subunit*, freshly, from the free dNTP pool. This is why the substrate is dNTP and not
dNMP, and why the chain doesn't need to be re-energised after every addition.

**(b) The chain end is the nucleophile; the nucleotide is the electrophile.**
An -OH oxygen has lone pairs and attacks. The α-phosphorus is electron-poor and gets
attacked. Direction of attack is fixed by which molecule holds which group — so *the
chemistry decides which end grows*, and the enzyme just enforces it.

**(c) Growth is therefore obligatorily 5′→3′.**
The new bond forms at the chain's 3′ end, so that's the end that advances. The 5′ end of a
DNA strand is laid down first and never touched again.

**(d) Irreversibility is a second reaction, not this one.**
Written alone, chain extension is near-equilibrium — PPi could attack back and reverse it
(pyrophosphorolysis). What makes synthesis one-way is **inorganic pyrophosphatase**, which
hydrolyses PPi → 2 Pi and destroys the reverse substrate. Two high-energy bonds get spent
per nucleotide: one to make the linkage, one to make it permanent. "It's thermodynamically
favourable" is not the answer; *the product of the leaving group is removed* is.

---

## 4 · Consequences you should re-derive, not memorise

### Why no polymerase runs 3′→5′

Imagine one. It would hold a chain carrying a **5′-triphosphate**, and add nucleotides onto
that 5′ end — meaning the *chain* supplies the energy, and each new residue donates its 3′-OH.

Now proofread it. Excise the last (mis-paired) residue, and you remove the triphosphate
along with it. The chain end is now a bare 5′-OH: dead, unextendable, and the whole strand
is lost. Every proofreading event would be terminal.

In the real 5′→3′ enzyme, excision removes a residue and exposes the **previous residue's
3′-OH** — an end chemically identical to the one that was there before. Proofreading is
free. You can do it a thousand times.

**So: 5′→3′ synthesis and the existence of proofreading are the same fact.** High-fidelity
replication is only possible in the direction where the activated group rides on the
incoming subunit. That, in turn, is what forces the lagging strand to be discontinuous —
the whole Okazaki apparatus exists to pay for proofreading.

### Why exonuclease polarities are named the way they are

- **3′→5′ exonuclease** — chews *backwards* along the chain, from the 3′ end. Same end the
  polymerase is building at. This is **proofreading**: back up one, try again.
- **5′→3′ exonuclease** — chews *forwards*, from a 5′ end. Cannot proofread, because it's
  nowhere near the growing end. It's for removing something **in front of you** — an RNA
  primer, a damaged patch. (Pol I in nick translation; see `day-02.md` Part 3.)

Naming rule: an exonuclease's polarity is the direction it *travels along the strand*,
which is the same convention as synthesis. Once you see that both are "which end am I
standing on," you stop confusing them.

### The anatomy of a nick

A **nick** is one missing phosphodiester bond in one strand of an intact duplex. It leaves:

- a free **3′-OH** on one side — extendable by a polymerase, sealable by a ligase
- a free **5′-phosphate** on the other side — the ligase's other substrate

**DNA ligase joins a 3′-OH to a 5′-phosphate.** Same bond as chain extension, different
energy source (ATP or NAD⁺ instead of a dNTP). If the 5′ side carries an OH rather than a
phosphate, ligase cannot act — which is why "gap" versus "nick" versus "end chemistry"
matters in every repair pathway in M2.

### Where each nuclease physically stands at an Okazaki junction

Draw the junction once and both answers fall out. Fork moving **right**. The lagging strand
is built in fragments that each start near the fork and extend *backwards*, away from it:

```
                                                  ← fork travels this way is RIGHT
    older fragment            newer fragment
5'──────RNA──────3' OH   p5'──RNA──────────3'──── (still growing, near the fork)
        ▲             ╲ ╱                  ▲
        │              nick                │
   5'→3' exo stands here            3'→5' exo stands here
   (on the 5' end of the             (on the nascent 3'-OH,
    downstream primer)                the end the polymerase is building)
```

**The 5′→3′ exonuclease** stands on the **5′ end of the RNA primer**, right at the nick, and
hydrolyses *forwards* (5′→3′) into that primer. Because every fragment's 5′ end is its
fork-proximal end, travelling 5′→3′ carries the enzyme **away from the fork**, into
already-replicated DNA. Pol I's polymerase site follows in lock-step from the 3′-OH on the
other side of the nick — the nick moves without ever becoming a gap. That is
**nick translation**.

**The 3′→5′ proofreading exonuclease** stands on the **nascent 3′-OH** — the same end the
polymerase builds at — and backs up 3′→5′, i.e. **toward the fork** on a lagging fragment
(it is retracing the path synthesis just took).

**Why the primer never presents itself to the proofreading exo.** Not because proofreading
is confined to the leading strand — *it isn't.* Every Pol III core carries an ε subunit, and
lagging-strand fragments are proofread exactly like leading-strand DNA. The real reason is
end chemistry:

> A 3′→5′ exonuclease attacks a free **3′ end**. An RNA primer is at a **5′ end**. The
> primer's own 3′ end is not free — it is covalently continuous with the DNA the polymerase
> extended from it. There is no 3′ terminus on a primer for the enzyme to grab.

And the primer that the 5′→3′ exo does attack sits on the *far side of the nick* from the
3′-OH the proofreader occupies. Two enzymes, two ends, two substrates, no overlap. This is
the general shape of the answer whenever you're asked "why can't enzyme X do job Y" in
replication: check which **terminus** each one requires, then check whether that terminus
exists.

---

## 5 · One-line recall set

- Primes distinguish **sugar** carbons from base atoms.
- **2′-H** = DNA, **2′-OH** = RNA, and that oxygen is why RNA self-cleaves.
- The base hangs off **1′**; the backbone uses **3′ and 5′**.
- A phosphodiester bridges **3′ of one sugar to 5′ of the next** → the strand has direction.
- **3′ end = free OH. 5′ end = free phosphate.**
- **The incoming nucleotide carries the triphosphate.** Always.
- Attacking group = **3′-OH of the chain**; target = **α-phosphate**; leaving group = **PPi**.
- Irreversibility comes from **pyrophosphatase**, a separate enzyme.
- Synthesis is 5′→3′ **because** proofreading has to be survivable.
- Ligase seals **3′-OH + 5′-phosphate**.
- **5′→3′ exo** stands on a primer's **5′ end** at the nick, runs **away from the fork**.
- **3′→5′ exo** stands on the **nascent 3′-OH**, backs up **toward the fork**.
- The primer is invisible to the proofreader because **a primer has no free 3′ end** — not
  because proofreading skips the lagging strand. It doesn't.
