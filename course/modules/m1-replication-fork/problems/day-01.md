# M1 · Day 01 — What makes DNA, and how we found out

**Reading:** §11.1 Introduction, §11.2 DNA Polymerases Are the Enzymes That Make DNA
(PDF pages 994–1001). ~6 pages, ~10 min.

**Budget:** 30 min. Suggested split — 5 recall · 5 prediction · 10 reading · 10 writing.

> **Order matters today.** Do Parts 1 and 2 with the book *closed*. Part 2 is a prediction
> exercise and it only works if you haven't read the answer. Open the PDF at Part 3.

---

## Part 1 · Free recall (5 min, book closed)

Write everything you can about **how a cell copies its DNA**. Don't organize it, don't
stop to check anything, don't look up a single term. Bullet fragments are fine. Include
the things you're unsure about and mark them with `?`.

Prompts if you stall — but push past these, they're a floor not a ceiling:
- What enzymes are involved, and how many distinct ones?
- What's the chemical reaction that adds one nucleotide? What bond forms, what leaves?
- Where does the energy come from?
- How accurate is it, and what makes it that accurate?

Then, still closed-book, answer one calibration question:

> **1.1** You've written a list. Which three items on it could you *defend* — meaning you
> could say what evidence supports them — and which three are things you believe because
> you've read them many times?

That second list is the real curriculum. Be honest; nobody's grading this part.

---

## Part 2 · Predict the experiment (5 min, still closed-book)

Here is the problem faced in the 1960s–70s. You want to identify every protein required to
replicate the *E. coli* chromosome. The obstacle: replication is essential, so a knockout of
any component is dead, and you can't study a dead cell.

The solution was a collection of **temperature-sensitive conditional-lethal mutants** — they
grow normally at 30°C, and fail at 42°C. Each mutant carries a lesion in some gene needed for
replication. The genes found this way were named *dna* genes (*dnaA*, *dnaB*, *dnaE*, …).

Now the experiment. You take each mutant, shift it from 30°C to 42°C, and measure DNA
synthesis over the next hour. You observe that the mutants sort cleanly into **two classes**
by the *shape of the shutoff curve*:

```
            DNA synthesis after shift to 42C

  class A          |                    class B          |
   ^               |                     ^               |
   |  ___          |                     |     _______   |
   |     \         |                     |    /       \  |
   |      \        |                     |   /         \ |
   |       \___    |                     |__/           \|
   +------------>  |                     +--------------->
   0   shift       |                     0   shift
```

**2.1** Class A stops essentially immediately. Class B keeps synthesizing DNA for a while —
completing something — then stops and never restarts. What functional distinction between the
two sets of gene products does this separation reveal? State it in one sentence.

**2.2** Which class would you expect to be the larger one, and why?

**2.3** This assay has a blind spot. Name one category of replication protein that is genuinely
essential but that this screen would systematically **fail** to place in either class — and say
what about the assay's design causes the miss.

**2.4** Design the follow-up. You now have a mutant that quick-stops at 42°C, and you want to
purify the actual protein that's broken — in an era with no genome sequence and no antibody
against it. You have: extracts from your mutant, extracts from wild-type cells, and the
ability to fractionate a extract by chromatography and assay DNA synthesis in a tube.
Sketch the scheme in 3–4 lines. What is the readout that tells you which fraction holds
your protein?

---

## Part 3 · Read (10 min)

Now read §11.1 and §11.2. As you go, check your Part 2 answers against the text — mark each
one ✓ / ✗ / *partially*. Don't rewrite them; leave the wrong versions visible.

---

## Part 4 · Mechanism core and perturbation (10 min, write these out)

**4.1 — Trace the bond.** Write the chain-extension reaction as a mechanism, not a slogan.
Name the attacking group, the atom it attacks, the leaving group, and the fate of the leaving
group afterward. Then answer: this reaction is drawn as an equilibrium in the textbook figure,
but in the cell it runs essentially irreversibly in one direction. **What makes it
irreversible?** (The answer is not "it's favourable." Name the second reaction and the enzyme.)

**4.2 — Directionality, from first principles.** Every known DNA polymerase extends 5′→3′ and
none extends 3′→5′. Suppose a hypothetical 3′→5′ polymerase existed: it would hold a growing
chain with a 5′-triphosphate end and add nucleotides to it. Now recall that polymerases
proofread by excising a misincorporated base and re-extending. **Why would proofreading be
catastrophic for the hypothetical 3′→5′ enzyme but harmless for the real 5′→3′ one?** Think
about what is left behind at the growing end after the excision step.

*(This is a real argument, not a puzzle — it's the standard explanation for why the
5′→3′ constraint is universal. If you get it, you'll never need to memorize the direction again.)*

**4.3 — The inventory.** Reproduce the *E. coli* polymerase table from memory — five enzymes,
their genes, their jobs. Then, for the eukaryotic set, state what α, δ, ε, and γ each do.
Flag which of these eight assignments you'd have gotten wrong an hour ago.

**4.4 — Perturbation.** *polA* (Pol I) null mutants of *E. coli* are **viable**. *polC*
(Pol III) mutants are **dead**. Yet when you assay a crude wild-type *E. coli* extract for
DNA-synthesizing activity, the overwhelming majority of what you measure is Pol I, and
Pol III is nearly undetectable.

- (a) Reconcile these three facts. Why is the enzyme that dominates the assay the one you can
  delete without killing the cell?
- (b) What does this imply about the relationship between *abundance/activity in vitro* and
  *essentiality in vivo*? State it as a general warning.
- (c) The book notes that in vitro replication systems are built from *polA*-mutant extracts.
  Explain why, in one sentence.

**4.5 — Connect to your work.** Pol IV (*dinB*) and Pol V (*umuD′C*) are described as
"error-prone." A cell that has enzymes whose job is to make mistakes seems like a design
flaw. Propose, in 2–3 sentences, why selection would maintain them. You'll be graded on the
*shape* of the argument, not on knowing the answer — we hit this properly in §11.14 and again
in M2.

---

## Part 5 · Stretch (do only if you have time left; otherwise skip, no penalty)

Semiconservative replication and repair synthesis (Figures 11.2 and 11.3) both make DNA, use
the same chemistry, and produce the same product — a new stretch of strand base-paired to a
template. Yet the cell devotes largely **different** enzymes to them.

Name three constraints that a *replicase* faces but a *repair polymerase* does not, or vice
versa, that would push selection toward specializing them rather than using one enzyme for
both. Think about: how much DNA each has to make, how fast, how accurately, whether the
template is double- or single-stranded going in, and whether the enzyme can afford to fall off.

---

## Spaced repetition

None today — day 1 has nothing behind it. From day 2 onward every set opens with 2–3 items
pulled from previous days, weighted toward whatever you got wrong. Your Part 1 `?` marks and
your Part 4.3 flags are the first entries in that pool, so mark them honestly.

---

## Hand back

Paste your answers, or drop them in a file and point me at it. Parts 1 and 2 are the ones I
most want to see *unedited* — including whatever was wrong, since the wrongness is the
diagnostic. I'll grade, tell you which kind of wrong each error was, and calibrate day 2's
size from how this went.
