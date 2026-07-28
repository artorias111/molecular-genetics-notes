# M1 · Day 05 — Semidiscontinuity, and the two machines that make single strands

**Reading:** §11.6 The Two New DNA Strands Have Different Modes of Synthesis + §11.7
Replication Requires a Helicase and a Single-Stranded Binding Protein.
PDF pages **1013–1019** — §11.6 opens at the foot of p. 1013; stop when the §11.8 heading
appears partway down p. 1019. Six pages, but two are figures and one is half a figure:
~1,300 words, about the same load as day 04. *Range verified against the text.*

**Budget:** 30 min. Nine questions.

> **Day 04 was the best set so far (~6.9/9) and the second clean run on time.** So the format
> is fixed and I'm not touching the size. Two things changed instead:
>
> 1. **Part 0 is shorter** — three items, not four. The pure name-and-inventory drilling has
>    moved to `course/drill/`, which runs daily. What stays here is the half a string match
>    can't grade: the *reasons*.
> 2. **Day-04 2.2 came back correct** — the base-pair geometry item that had inverted twice
>    before, including once with the right sentence printed in the reading and a hint pointing
>    at it. What made the difference was asking it as a counterfactual with no label to flip.
>    **Most of this set is now built that way.** You'll notice questions asking what would go
>    wrong in a world where X is false, rather than asking whether X is true. That is
>    deliberate and it is because it works on you.

**Format rules**
- Every written part has a hard timer. When it fires, stop mid-sentence and move on.
- The reading timer is advisory: if it fires mid-section, finish the section and move on.
- "One sentence" is a hard cap. Fragments and arrows are fine; prose is not wanted.
- **Consistency check before you hand in.** Two checks now, both mechanical, ~40 seconds:
  - *(retained)* For every sentence naming an enzyme, check the substrate you handed it.
  - **(new, and this one is the priority)** For every sentence that gives a **reason** —
    any clause with *because*, *since*, *as*, *so* — check whether that reason is **true on
    its own**, separately from whether your answer is right. On day 04 you reached a correct
    conclusion about the proofreading exonuclease by way of a fact that is simply false. Every
    check you currently run looks at the conclusion, so nothing caught it. A right answer does
    not certify its own justification.

---

## Part 0 · Spaced repetition (4 min, book closed) — START HERE

**0.1 — Why a helicase needs a loader.** *E. coli* has a helicase, and a second protein whose
entire job is to put that helicase onto DNA. **Name both.** Then, in one sentence: **why can't
the helicase load itself?** *(You are being asked to guess the mechanism before you read it —
the answer is in today's §11.7 and you haven't read it yet. Guess anyway; that's the point.)*

**0.2 — The budget, with a mutant in it.** A *mutD* strain has lost the ε subunit, so
proofreading is gone. Active-site selectivity still leaves ~**10⁻⁵**, and mismatch repair
still supplies its usual ~**10²**.

**Write the multiplication out as one line, then give the answer.** Not the answer alone —
the line. *(Day 04 got the right magnitude and skipped the working when the question asked
for it. The arithmetic is the one self-check of yours that reliably fires; run it on paper.)*

**0.3 — Which terminus does each one need.** Two exonuclease activities sit at a lagging-strand
junction.

- (a) For **each** activity, name the **terminus it requires as a substrate** — not what it
  does, not where it goes. The end it must be handed in order to work at all.
- (b) An RNA primer sits at that junction. **Which of those two termini can it present?**
  One sentence, and the sentence must be about ends, not about strands.

---

## Part 1 · Read §11.6–§11.7 (8 min, advisory) — pages 1013–1019

Three things to hold onto. All three are asked about below:

- **What the antiparallel problem actually is.** State it as a collision between two facts,
  not as a description of the fork.
- **The uracil result.** Nearly all newly made DNA in *E. coli* comes off as short fragments,
  which looks like evidence that *both* strands are discontinuous. It isn't. Find out why, and
  notice that this is an experimental-artifact story, not a mechanism story.
- **Two things that cannot be done, stated flatly in the text.** One is something a helicase
  cannot do. The other is something SSB does not do, despite its name suggesting otherwise.
  Both are one sentence each in the reading and both are asked about below.

---

## Part 2 · Semidiscontinuity (10 min)

**2.1** Derive it, don't recall it. You have two facts: the parental strands are
**antiparallel**, and a polymerase can extend **only a free 3′-OH, only 5′→3′**.

**Show that these two facts alone force one daughter strand to be built in pieces.** Two
sentences maximum. *(A correct answer here never mentions the words "leading" or "lagging" —
those are names for the outcome, and the outcome is what you're deriving.)*

**2.2** In *E. coli*, a brief radioactive label goes almost entirely into short fragments —
including, apparently, on the strand that ought to be continuous. Taken at face value this says
both strands are made discontinuously. It is an artifact: some of those fragments are pieces of
a chain that really was synthesized continuously and then **broken afterwards** by a repair
process acting on a base that shouldn't be in DNA.

**You are told the cause is a repair event, not a synthesis event.** Design the experiment that
would prove it: **what would you change about the cells, and what result would settle it?**
Two sentences. *(Same move as the polA-extract logic from day 01 — if a process is confusing
your assay, take the enzyme responsible out of the picture and see what happens.)*

**2.3** SSB binds single-stranded DNA **cooperatively**: one molecule bound makes the next one
easier to bind, so coating spreads rapidly along the whole exposed stretch.

Suppose you engineered an SSB with identical affinity for ssDNA but **no cooperativity** — each
monomer binds independently. **What would go wrong at the fork?** One or two sentences.
*(What is the exposed lagging-strand template doing while it waits to be coated, and what is
the competing reaction?)*

---

## Part 3 · Perturbation (7 min)

**3.1** DnaB is a **5′→3′ helicase**: it translocates along a single strand in the 5′→3′
direction, melting the duplex ahead of it.

**Which of the two parental strands must it be riding?** Say which, and then — this is the part
that's actually graded — **give the consequence if it were on the other one instead.** Where
would it travel, and what would happen to the fork? Two sentences.

**3.2** *ssb* mutants have a **quick-stop** phenotype, and the text notes SSB is required in
**stoichiometric** amounts at the fork — not catalytic ones. They are also defective in repair
and recombination.

**Two parts, one sentence each:**
- (a) Given day 01's quick-stop/slow-stop logic, what does quick-stop tell you about *when*
  SSB acts?
- (b) SSB is a protein with no catalytic activity at all. **Why does that force the
  stoichiometric requirement** — what is it about the job that means one molecule cannot do it
  twice?

---

## Part 4 · Stretch (only if time remains — skip freely, no penalty)

Replicative helicases are typically **hexameric rings that encircle the DNA**. The text gives
this as the reason they can unwind processively for many kilobases.

A ring that surrounds a strand is **topologically trapped** — it cannot slide on from the side,
and it cannot leave except off an end.

**Two sentences: what does that structural fact require the cell to provide, and what does it
explain about the answer you gave in 0.1?**

---

## Hand back

Paste answers or point me at a file. Per part, tell me whether the timer fired — day 04's "no
timer fired, timing is perfect" is why this set is the size it is, so the report is what keeps
it calibrated.

**Also point me at `course/drill/attempts.log`** when you hand in. It records what you typed,
not just right/wrong, and that shows me *how* a card fails — wrong label, right mechanism,
hedge, or blank. It's more useful to me than the score is.

**Next:** day 06 · §11.8–11.9 — priming (the three ways to get a free 3′-OH, primase/DnaG, the
*oriC* vs. ΦX174 systems), and then the replisome proper: how one complex synthesizes both
strands at once when they run in opposite directions.
