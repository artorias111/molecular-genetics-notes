# M1 · Day 02 — The two nucleases

**Reading:** §11.3 DNA Polymerases Have Various Nuclease Activities (PDF pages 1002–1004).
~3 pages.

**Budget:** 30 min. Nine questions, most of them one-liners.

> **Set is deliberately smaller than day 01b.** That one had sixteen questions and eight
> pages of reading in the same 30 minutes, which was too much. One book section per day is
> the calibration; day 01b broke it and this one doesn't. §11.4 (fidelity) is day 03.

**Format rules**
- Every part has a timer. When it fires, stop mid-sentence and move on.
- "One sentence" is a hard cap. Fragments and arrows are fine; prose is not wanted.
- **Before you hand in, reread your own answers once, in order.** You have a recurring
  habit of stating a correct premise in one answer and contradicting it two answers later
  without noticing. Thirty seconds of rereading catches it. This is now a standing rule.

---

## Part 0 · Spaced repetition (5 min, book closed) — START HERE

**0.1 — Topoisomerase.** Not "when is it needed" this time — *why*.

- (a) A fork is moving along a chromosome. What does that movement do to the DNA **ahead
  of** the fork? One sentence.
- (b) So: if a fork stalled and sat completely still, would topoisomerase still have work
  to do at that fork? One word plus half a line.
- (c) Which protein actually opens the origin? One word.

**0.2 — The backbone.** A nucleotide has two backbone connection points.

- (a) Name both, and say which carbon each sits on.
- (b) At the **growing end** of a DNA chain, which of the two is the free one?
- (c) An incoming dNTP carries three phosphates. Which one ends up in the backbone?

**0.3 — Inventory.** Five *E. coli* polymerases: **enzyme · gene · job.** List, no prose.
Write what you have and leave gaps as gaps.

---

## Part 1 · Read §11.3 (6 min, hard stop) — pages 1002–1004

Three pages. Two things to hold onto as you read:

- There are **two different exonuclease activities** with **opposite polarity**. Keep them
  apart from the first sentence — most of the difficulty in this section is people fusing
  them. Note which polymerases have which.
- **Figure 11.5 (nick translation, p. 1004).** Look at it properly; Part 3 is built on it.

---

## Part 2 · The two nucleases (10 min)

**2.1** Fill this in. Table only.

| | 3′→5′ exonuclease | 5′→3′ exonuclease |
|---|---|---|
| removes nucleotides from which end | | |
| relative to the direction of synthesis, does it run forward or backward | | |
| what is it for | | |
| which *E. coli* polymerase(s) have it | | |

**2.2** Yesterday you derived why proofreading is compatible only with 5′→3′ synthesis.
Now put the two facts side by side: the polymerase adds in the 5′→3′ direction, and the
proofreading exonuclease removes in the 3′→5′ direction.

Explain in **one sentence** why those opposite polarities are not a coincidence or a second
fact to memorize — they're the same statement said twice. *(Hint: ask which physical end of
the chain each activity touches.)*

**2.3** The 5′→3′ exonuclease is the odd one out: it isn't proofreading, and most
polymerases don't have it. Pol I does.

Consider a lagging strand that has just been synthesized but not yet processed. **What is
physically wrong with it — what is embedded in it that must not stay in the finished
chromosome?** One sentence. Then: which of the two exonucleases is the right tool for that
job, and why can't the other one do it?

---

## Part 3 · Nick translation and Klenow (7 min)

**Taught first, then tested — here's the mechanism.**

Pol I binds at a **nick** (a break in one strand's backbone, leaving a free 3′-OH on one
side and a free 5′ end on the other). It then does two things at once:

- its **5′→3′ exonuclease** chews up the strand *ahead* of the nick
- its **polymerase** fills in behind, extending from the 3′-OH

Degrade ahead, synthesize behind, and the nick doesn't get sealed — it **moves along the
DNA**. Hence "nick translation," translation in the sense of *displacement*, nothing to do
with protein synthesis. The strand ends up replaced rather than repaired.

Now the second fact. Pol I can be cut by a protease into two pieces:

- the **large (Klenow) fragment** — polymerase + 3′→5′ proofreading exonuclease
- the **small fragment** — the 5′→3′ exonuclease, and nothing else

The two activities live in physically separable domains. Klenow is a standard lab reagent
because of it.

**3.1** You want to fill in a recessed 3′ end on a restriction fragment — extend the short
strand to make a blunt end, and then **stop**. You must use Klenow, not whole Pol I. Why
would whole Pol I ruin this experiment? One sentence.

**3.2** In vivo, Pol I is called to nicks on the lagging strand. Using the mechanism above,
say what state the DNA is in when Pol I *lets go*, and name the enzyme that has to act
next. Two lines.

---

## Part 4 · Stretch (only if time remains — skip freely, no penalty)

Proofreading catches a wrong base at the growing end: the enzyme feels a mispair and backs
up. That's the entire detection mechanism — **it checks base-pairing geometry, nothing else.**

Now think about a polymerase that slips on a repeated sequence, or lets go of one template
and resumes on a similar sequence elsewhere. The result is a deletion or a duplication.

**Why is proofreading structurally incapable of catching either one?** Two sentences.
*(This is the question your research lives on, and it's the reason M2 exists — so answer it
from the mechanism, not from what you already know about rearrangements.)*

---

## Hand back

Paste answers or point me at a file. Also give me, per part, whether the timer fired before
you finished — that number sets day 03's size.

**Next:** day 03 · §11.4 — fidelity. The error-rate arithmetic, which subunit of Pol III
actually does the proofreading, and why a cell that loses proofreading survives while a
cell that loses the polymerase doesn't.
