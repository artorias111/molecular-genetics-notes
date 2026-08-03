# M1 · Day 06 — Priming, and the two halves of an asymmetric machine

## Hand back — fill this in FIRST, before you start

Copy this block to the top of your answers. It takes 20 seconds and it is what sets the size
of every future set. It has been at the *bottom* for three sets and has been missed three times,
so it now lives here.

```
Part 0  (4 min)   timer fired? Y / N     
Part 1  (8 min)   reading finished in the window? Y / N
Part 2  (10 min)  timer fired? Y / N
Part 3  (7 min)   timer fired? Y / N
Part 4            attempted? Y / N
Anything else about the day (tired, rushed, interrupted):
```

---

**Reading:** §11.8 Priming Is Required to Start DNA Synthesis + §11.9 Coordinating Synthesis
of the Lagging and Leading Strands.
PDF pages **1019–1027** — §11.8 opens at the foot of p. 1019; stop when the **§11.10** heading
appears partway down p. 1027. Nine pages, but p. 1021 is a full-page figure and three others
are half figure: ~1,300 words, the same load as day 05. *Range verified against the text.*

**Budget:** 30 min. Nine questions.

### Two-minute pre-flight (new, and it replaces nothing — it's additive)

Before Part 0, open **`course/reference/nucleic-acid-chemistry.md`, section 4** and
**`course/reference/fork-strand-separation.md`, section 5** and read the bulleted recall lists
at the end of each. Two minutes, not more, and it's outside the Part 0 timer.

Why this now exists: day-05 0.3 was answered wrongly with the correct answer already written
up in the first of those files, from day 04. Nothing in the system had ever told you to open
them, which was my omission, not yours. Every set from here names its pre-flight file.

> **Day 05 was ~4.4/9, down from 6.9.** The whole drop is *ends and directions* — 0.3a, 0.3b,
> 3.1, and the sign in 0.2. Meanwhile 2.3 and 3.2b were as good as anything you've written.
> So this set is built around one idea:
>
> **Everything you got wrong on day 05 is reconstructible in under ten seconds, and you
> recalled it instead.** The terminus falls out of the exonuclease's own name; the strand
> falls out of fork direction plus helicase polarity. Your recall carries a sign error. Your
> reasoning doesn't. So several questions below **explicitly ask for the rule you used**, and
> the rule is what's graded — not the answer it produced.

**Format rules**
- Every written part has a hard timer. When it fires, stop mid-sentence and move on.
- The reading timer is advisory: if it fires mid-section, finish the section and move on.
- "One sentence" is a hard cap. Fragments and arrows are fine; prose is not wanted.
- **Consistency check before you hand in (~40 s, three items now):**
  - *(retained)* For every sentence naming an enzyme, check the substrate you handed it.
  - *(retained)* For every *because / since / as / so* clause, check the reason is true **on
    its own**, separately from whether the conclusion is right.
  - **(new)** For every claim about an **end or a direction**, write the one-line derivation
    next to it. Not a re-check — a derivation. If you can't produce one, mark the answer with
    a `?`. An unmarked guess and a derived answer look identical to me on the page, and I'd
    rather grade the difference than guess at it.

---

## Part 0 · Reconstruction, not recall (4 min, book closed) — START HERE

**0.1 — The nick, again, and this time the rule is the graded object.**

A nick in duplex DNA has two ends facing each other across the gap: a **3′-OH** on one side
and a **5′-phosphate** on the other.

- (a) You add a **3′→5′ exonuclease**. Then, separately, a **5′→3′ exonuclease**. For each:
  **which of those two ends does it take hold of?** Then — and this is the part being marked —
  **state in one line the rule that told you.** A rule I can apply to an enzyme you've never
  seen. If your rule is "I remember it," say that instead; it's useful information and it
  costs you nothing here.
- (b) An **RNA primer** sits at that nick. **Which of the two enzymes can attack it, and what
  is it about the other one's required end that makes the primer invisible to it?** One
  sentence, about ends, not about strands.

**0.2 — The budget, with the other stage removed.** Last time it was proofreading. This time a
strain has lost **mismatch repair entirely**. Active-site selectivity still leaves ~**10⁻⁵**,
and proofreading still supplies its usual ~**10²**.

Three things, in this order:
1. the multiplication **written as one line**,
2. the resulting error rate,
3. **how that compares to wild type** — same, better, or worse, and by what factor.

*(Item 3 is not decoration. It is the whole question.)*

**0.3 — A guess before you read it.** Every DNA polymerase needs a preexisting free 3′-OH and
cannot start a chain from nothing. **RNA polymerases can** start from nothing — that's why an
RNA primer is used at all.

So: **why doesn't the cell just let the RNA polymerase make the whole strand and skip DNA
polymerase?** One sentence. *(You haven't read §11.8 yet. Guess — you already have everything
you need from day 03. The point is to find out whether you reach for it.)*

---

## Part 1 · Read §11.8–§11.9 (8 min, advisory) — pages 1019–1027

Four things to hold onto. All four are asked about below:

- **The three ways to get a free 3′-OH.** They are listed in the §11.8 key concepts as three,
  and drawn in Figure 11.12. Two of them don't involve a primase at all.
- **How many priming events each strand needs.** The text states this flatly for both strands
  and the two numbers are wildly different. Don't just note them — note *why*.
- **What DnaB does besides unwind.** One sentence on p. 1025 settles an argument you had with
  me yesterday. Find it, and notice that it is the *reason* the answer to day-05 3.1 is what
  it is, not just confirmation of it.
- **The one thing the lagging-strand enzyme has to do that the leading-strand enzyme never
  does.** Stated at the end of §11.9's first block, and it is a physical action, not a
  property.

---

## Part 2 · Priming (10 min)

**2.1** Over one full round of replication from a single origin, the **leading** strand needs
exactly **one** priming event and the **lagging** strand needs **many** — roughly one per
kilobase or two.

Derive the difference. **What is it about the direction of synthesis on each template that
makes one number 1 and the other number large?** Two sentences maximum. *(A correct answer
here is about template exposure over time, not about the enzymes involved.)*

**2.2** *E. coli* has **two** priming systems. The *oriC* system is essentially just primase
joining the machinery already at the fork. The **ΦX / primosome** system is much more
elaborate — and the text says it is what's used when **damage collapses a replication fork and
it has to be restarted**.

**Why would restarting a broken fork need heavier machinery than starting a brand-new one at
the origin?** Name one thing that is available at *oriC* and simply is not available at the
site of a collapse. Two sentences. *(This is the first question in the course that points
directly at M2 — fork collapse is where replication becomes a repair problem.)*

**2.3** The leading-strand enzyme unit engages its template once and never lets go until the
round is done. The lagging-strand unit must **disengage from the template, move to a new
location, and reattach at a fresh primer** — a thousand or more times per replicon.

**Name the property that must therefore differ between the two units, and say what would go
wrong if the lagging-strand unit had the leading-strand unit's version of it.** One or two
sentences.

---

## Part 3 · Perturbation (7 min)

**3.1** Two facts, both given to you so that nothing here is a recall question:

- DnaB translocates **5′→3′** along the strand it encircles, and it rides the template that
  the fork traverses **5′→3′**.
- **DnaG primase physically binds DnaB.** That contact is how primase gets delivered.

You engineer a DnaB whose **helicase activity is completely intact** — normal speed, normal
ATP use, normal unwinding — but which **can no longer bind DnaG**.

**Take each daughter strand in turn and say what happens to it.** One is barely affected and
one fails; say which is which and *why*, and say what accumulates at the fork as a result.
Three sentences maximum.

**3.2** In *E. coli*, the same catalytic subunit (**DnaE**) does both strands. In *Bacillus
subtilis*, **two different** catalytic subunits do the two jobs — one dedicated to each strand.
Both organisms replicate their chromosomes perfectly well.

**What does the existence of the *B. subtilis* arrangement tell you about the two jobs?** Then:
**name one demand made on the lagging-strand enzyme that is not made on the leading-strand
one.** One sentence each. *(2.3 is not the only available answer. Anything a machine that
restarts constantly needs, and a machine that never restarts doesn't, counts.)*

---

## Part 4 · Stretch (only if time remains — skip freely, no penalty)

One of the three priming routes is a **protein** that primes directly, by holding out a
nucleotide for the polymerase to extend. Certain viruses do this. It looks baroque next to
just making a short RNA.

But think about what happens to an RNA primer **afterwards**: it has to be found, removed,
the gap filled, and the nick sealed — and all of that requires DNA on **both sides** of it.

**Two sentences: on a linear genome, where is the one place that cleanup cannot work, and what
does that tell you about why a protein primer might be worth the trouble?**

---

## Hand back

Paste answers or drop them in `solutions/` as before — and **fill in the timer block at the
top of this file first**.

**Run the drill.** Five new cards went in after day 05 and they come up tomorrow:
`exo-terminus-rule` (top priority — it makes 0.1 above free), `mutd-arithmetic`, `dnab-strand`,
`helicase-cannot`, `pseudofragments`. `attempts.log` is grading input; I read it with the set.

**Next:** day 07 · §11.10–11.11 — the holoenzyme as subcomplexes, the sliding clamp, and the
clamp loader. The clamp is the answer to 2.3, so day 07 is where that question gets closed.
