# M1 · Day 03 — Fidelity: how a polymerase gets to one error in 10¹⁰

**Reading:** §11.4 DNA Polymerases Control the Fidelity of Replication (PDF pages 1004–1007).
~3 pages.

**Budget:** 30 min. Nine questions.

> **Two timing changes, both from your day-02 report.**
> 1. **Reading gets 8 minutes, and its timer is now advisory.** If it fires mid-section,
>    finish the section and move on. Re-reading a sentence is comprehension working, not
>    you being slow — the timer was only ever there to stop you annotating.
> 2. **The written timers stay hard.** Those are the ones producing the calibration.
>    One question was cut to pay for the extra reading time.

**Format rules**
- Every written part has a timer. When it fires, stop mid-sentence and move on.
- "One sentence" is a hard cap. Fragments and arrows are fine; prose is not wanted.
- **Consistency check before you hand in — the concrete version.** Day 02's abstract
  "reread your answers" didn't catch 3.2, where you named ligase and then handed it
  single-stranded DNA. So: **for every sentence where you name an enzyme, look at the
  substrate you gave it and ask whether that enzyme can actually bind it.** Mechanical,
  ~20 seconds, and it catches the exact shape your contradictions take.

---

## Part 0 · Spaced repetition (5 min, book closed) — START HERE

**0.1 — Ahead of the fork.** Not "what does topo do" — you have that.

- (a) A fork advances 1000 bp. Describe the **physical state** of the duplex immediately
  ahead of it, compared to before. One sentence, and say whether the helix is more or less
  tightly wound.
- (b) A cell has no topoisomerase at all. The fork moves a little and then stops. Why
  can't it continue — what has physically become impossible? One sentence.

**0.2 — Opening an origin.** Three proteins act in sequence at *oriC* before the fork moves.
Name them in order, one phrase each for what they do. *(One melts, one installs, one
propagates.)*

**0.3 — The lagging strand, again.** Straight recall, no reasoning needed.

- (a) A lagging strand has just been synthesized. **What is embedded in it that is not
  DNA**, and where did it come from?
- (b) Which nuclease removes it, and why is the other one physically incapable — what end
  is each standing on?

---

## Part 1 · Read §11.4 (8 min, advisory) — pages 1004–1007

Three pages. Two things to hold onto:

- **The error-rate numbers.** There are several, at different stages. Don't memorize them —
  notice that they **multiply**, and notice how many stages there are.
- **Which *subunit* of Pol III carries the proofreading exonuclease.** The section names it.
  Pol III is a multi-subunit machine and the activities are on different polypeptides.

---

## Part 2 · The fidelity budget (10 min)

DNA replication in *E. coli* ends up around **one error per 10⁹–10¹⁰ base pairs**. No single
mechanism achieves that. It's built in stages, and the stages multiply.

**2.1** Three stages contribute, in this order:

1. **Base-pairing selectivity** — the polymerase preferring the correct dNTP as it binds
2. **Proofreading** — the 3′→5′ exonuclease
3. **Mismatch repair** — a separate system, after the fact

For each, give the approximate error rate it *leaves behind*. Numbers from the reading, one
line each. Then multiply them and check you land near 10⁻¹⁰.

**2.2** Here's the part that's reasoning, not recall. Base-pairing selectivity alone gives
roughly 10⁻⁵, but the **free-energy difference** between a correct and an incorrect base
pair in solution only predicts about 10⁻¹ to 10⁻². Hydrogen bonds alone are nowhere near
enough.

So the enzyme must be adding selectivity beyond what the base pair itself provides. **Name
one physical thing a polymerase active site could do to discriminate a correct pair from an
incorrect one, given that it can't read sequence.** One sentence.

*(Hint: think about what all four correct base pairs have in common that no mispair does.
It isn't chemistry.)*

**2.3** Proofreading costs the cell something. It's slow — the enzyme has to stall, shuttle
the primer terminus ~30 Å to a different active site, excise, and shuttle back — and it
sometimes removes correct nucleotides by mistake.

**Why is a polymerase that proofreads more accurately than the optimum still bad for the
cell?** One sentence. *(There's an answer that isn't about speed.)*

---

## Part 3 · ε, *mutD*, and what "essential" means (7 min)

Pol III's proofreading exonuclease lives on the **ε subunit**, encoded by *dnaQ* — also
known as *mutD*. The polymerase activity is on **α** (*dnaE*). Two subunits, two activities,
one holoenzyme.

**3.1** *mutD* mutants are **viable**, and are **mutators** — they accumulate mutations at
10²–10³× the wild-type rate. *dnaE* nulls are **dead**.

Explain the asymmetry in **one sentence**. *(You made this argument correctly on day-01b
for polA vs polC. Same shape, new molecules — I'm testing whether it transfers.)*

**3.2** A *mutD* strain is viable but its mutation rate is high enough that it accumulates
damage over generations. Now consider a **second** mutation, in the mismatch repair system,
in the same cell.

Predict what happens to the mutation rate — is it additive, or worse than additive? One
sentence, with the reason. *(Look at how you multiplied the stages in 2.1.)*

---

## Part 4 · Stretch (only if time remains — skip freely, no penalty)

Mismatch repair operates **after** the polymerase has moved on. It finds a mispaired base
in a duplex and excises one of the two strands to fix it.

Here's the problem: at a mismatch, **both bases are chemically normal.** There's an A where
there should be a G, but the A is a perfectly good adenine. Nothing about the mispair itself
says which strand is wrong.

If the system guesses, it's right half the time — and when it guesses wrong it **writes the
error permanently into the template**, converting a repairable mismatch into a fixed mutation.
A 50% system is worse than useless.

**So: what physical feature could distinguish the newly synthesized strand from the parental
one, in the minutes after a fork has passed?** Two sentences. You don't have the answer from
the reading — reason about what is transiently true of a brand-new strand and not of one
that's been sitting in the genome for an hour.

*(This is §14.7, in M2. Answer it now from first principles and you'll own it when we
get there.)*

---

## Hand back

Paste answers or point me at a file. Also give me, per part, whether the timer fired before
you finished — and this time, tell me separately whether the **8-minute advisory** reading
window felt like enough, since that's the change being tested.

**Next:** day 04 · §11.5 — the common structural architecture of polymerases. Why enzymes
that share no sequence homology all look like a right hand, and what the fingers actually
do during the selectivity step you'll have reasoned out in 2.2.
