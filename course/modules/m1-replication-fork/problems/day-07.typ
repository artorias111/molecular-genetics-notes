// M1 · Day 07 — the holoenzyme, the sliding clamp, the clamp loader.
// Compile from course/:  ./build.sh modules/m1-replication-fork/problems/day-07.typ
#import "../../../templates/scribe.typ": *

#show: sheet.with(
  title: "M1 · Day 07 — The clamp",
  subtitle: "what holds a polymerase on, and what lets it go",
  budget: "30 min",
  reading: [§11.10–§11.11, pp. 1027–1039],
  intro: [
    §11.10 DNA Polymerase Holoenzyme Consists of Subcomplexes + §11.11 The Clamp Controls
    Association of Core Enzyme with DNA. §11.10 opens partway down p. 1027; stop when the §11.12
    heading (#emph[Okazaki Fragments Are Linked by Ligase]) appears on p. 1040. Thirteen pages,
    but four of them are figures: \~1,700 words, a shade heavier than day 06 — so the reading
    window is 9 min today, still advisory. #emph[Range verified against the text.]
  ],
  // Page 1. `exo-terminus-rule` and `dnab-strand` were due and are held again:
  // 0.1 and 0.2 below are built on exactly those two.
  drill: (
    [What happens inside the enzyme when a *mispair* occupies the catalytic site — and why is
     that the selectivity step, rather than the base pairing itself?],
    [Nearly all briefly-labelled #emph[E. coli] DNA comes back as short fragments. Why isn't
     both strands discontinuous — and *which gene do you delete* to prove it?],
    [*Pol IV and Pol V* — what are they for, what are their genes, and what feature of their
     active site makes them behave that way?],
    [A #emph[mutD] strain has lost proofreading; selectivity leaves \~$10^(-5)$ and MMR still
     gives \~$10^2$. Write the line of arithmetic, give the rate, compare to wild type.],
    // one-line answer last: the final slot only gets the space left on the page.
    [What physically happens to the DNA *ahead* of a moving replication fork, and whose problem
     is it?],
  ),
)

#timers(
  [Drill (4 min) — done cold, book closed?],
  [Part 0 (4 min) — timer fired?],
  [Part 1 (9 min) — reading finished in the window?],
  [Part 2 (10 min) — timer fired?],
  [Part 3 (7 min) — timer fired?],
  [Part 4 — attempted?],
)

#callout[
  *Day 06 was \~5.0/9, drill 3/5 — and the composition changed completely.* Both of day 05's
  failure modes closed: you derived the exonuclease terminus rule yourself (#emph[“x′→y′ starts
  from the x′ side”]) and the fidelity arithmetic came out signed correctly. Ends and directions
  are no longer where you lose points.
  #v(4pt)
  What replaced them is *circular answers*: 2.1 said the lagging strand needs many primers
  because it is made in pieces, and 2.3 said the lagging unit must be flexible because otherwise
  it could not flex. Both restate the question as its own reason. So every item below asks for
  *an outcome, a count, or a thing that runs out* — none of them can be answered by rephrasing
  the premise, and any answer that reuses only the words already on the page will score nothing.
]

#refbox[
  *Order of the sheet.* Page 1 drill first, cold and book closed. Then the pre-flight, then
  Part 0. Don't turn back to page 1 afterwards.
  #v(4pt)
  *Two-minute pre-flight, before Part 0 and outside its timer.* Open the new note —
  #emph[molecular genetics ref - priming and lagging strand] — and read *§2* (why one strand
  primes once and the other constantly) and *§3* (processivity). Both are on the device. They
  are the two things day 06 got circular, written out as derivations.
  #v(4pt)
  *Format rules.* Hard timer on every written part; when it fires, stop mid-sentence. Reading
  timer advisory. "One sentence" is a hard cap; fragments and arrows wanted, prose not.
  #v(4pt)
  *Consistency check before you hand in (\~40 s):* (i) for every sentence naming an enzyme,
  check the substrate you handed it; (ii) *new* — for every answer to a #emph[why] question,
  check that it contains at least one noun that is #emph[not] in the question. If it doesn't,
  you have renamed the fact rather than explained it; (iii) for every claim about an end or a
  direction, write the one-line derivation beside it.
]

#part[Part 0 · Reconstruction, not recall (4 min, book closed)]

#q(space: 0pt)[0.1][ *Same nick, different framing.* An RNA primer sits at a nick, with DNA
extended from it on one side. I will describe two nucleases only by what they need, and not name
them: *nuclease A requires a free 3′ terminus* handed to it; *nuclease B requires a free 5′
terminus*. ]

#sub(space: 4cm)[(a)][
  Which of A and B removes the primer, and what exactly does the other one go looking for and
  fail to find? Two sentences, about termini. #emph[(You derived the rule that settles this on
  day 06. This is the same rule pointed at a different question.)]
]

#sub(space: 2.8cm)[(b)][
  Now give A and B their conventional 3′→5′ / 5′→3′ names, and say which one Pol I uses when it
  performs nick translation.
]

#q(space: 5.5cm)[0.2][ *A polymerase that runs the other way.* Imagine an enzyme identical to Pol
III in every respect except one: it synthesizes *3′→5′*, adding nucleotides to a free 5′ end.
Put one of these on the *lagging-strand template* of an ordinary fork, moving in the ordinary
direction. *How many priming events does that strand now need over a full round — one, or many?*
Give the number and the reason it changes. Two sentences. #emph[(Nothing about the enzymes, the
primase or the fragment length has changed. Only the direction has.)] ]

#q(space: 5cm)[0.3][ *Primase, switched off mid-round.* A drug enters the cell and inhibits
primase completely and instantly, while a fork is halfway through a replicon. The helicase is
untouched and keeps unwinding at full speed. Three things: (1) what happens to the *leading*
strand; (2) *name the molecular species that accumulates at the fork*, and what coats it;
(3) does the fork keep moving? #emph[(Item 2 is a specific molecule, not a category.)] ]

#part[Part 1 · Read §11.10–§11.11 (9 min, advisory) — pp. 1027–1039]

#refbox[
  Four things to hold onto. All four are asked about below.
  - *The four kinds of subcomplex*, and what each is #emph[for]. Ten proteins, 900 kD. Two of
    the four do no chemistry to DNA at all — note which two, and resist the urge to treat them
    as accessories.
  - *The β ring's numbers.* External diameter, internal cavity, and the diameter of the DNA
    inside it. The gap between protein and DNA is not empty — note what fills it, and what the
    text says the ring therefore #emph[does not do] to the DNA.
  - *What the clamp loader does besides load.* One clause on p. 1031, and it is the reason the
    two cores behave differently at all.
  - *What happens at the end of an Okazaki fragment.* p. 1038–1039 lists what dissociates and
    what does not. The exception list is short and one of its entries will surprise you.
]

#part[Part 2 · The clamp (10 min)]

#q(space: 5.5cm)[2.1][ *A protein that touches nothing.* The β ring's internal cavity is 35 Å;
the DNA inside it is 20 Å; the gap is filled with water, and the text is explicit that the
protein makes *no direct contact* with the DNA. So it cannot be holding on by binding affinity —
there is nothing for it to bind to. *What, physically, keeps the core polymerase on its
template?* Then: name one thing this arrangement buys that a very-high-affinity DNA-binding
protein could not buy. Two sentences. ]

#q(space: 5.5cm)[2.2][ *The end of a fragment — who lets go.* When an Okazaki fragment is
finished, almost every component of the replication apparatus stays associated with the DNA;
the text names the short list of things that do not. Give that list. Then answer the question it
settles: between finishing one fragment and starting the next, *does the lagging-strand catalytic
core leave the replisome, or stay in it?* #emph[(Day 06's 2.3 was answered “it must be flexible
enough to detach and reattach.” This is the mechanism that was actually being asked for, and the
answer is more specific than “flexible”.)] ]

#q(space: 5.5cm)[2.3][ *A loader that only loads.* You engineer a γ complex that can open a β ring
and place it on DNA, but has lost the ability to take one off again. Everything else is normal.
Take each strand in turn — leading, then lagging — and say what happens to it over a few hundred
fragments. Then name *the thing the cell runs out of*, and say roughly how fast. Three sentences
maximum. ]

#part[Part 3 · Perturbation (7 min)]

#q(space: 5.5cm)[3.1][ *Cutting the helicase loose from the polymerase.* Two facts from the text,
given so nothing here is recall: DnaB contacts the *τ subunit* of the clamp loader, and that link
does two things — it raises the rate of polymerase movement *about tenfold*, and it stops the
leading-strand polymerase falling off. You engineer a τ that cannot bind DnaB; both proteins are
otherwise intact and both work alone. Say what you would *measure* at the fork afterwards — rate
first, then which strand degrades in quality and why. Then: with the link gone, what sets the
fork's speed? Three sentences. ]

#q(space: 5.5cm)[3.2][ *A primase that fires too often.* The lagging template is pulled through
its clamp as a single-stranded loop, and that loop must extend for at least the length of one
Okazaki fragment. Now let primase fire *four times as often*, so a primer is laid every \~300
bases instead of every \~1,200. Nothing else changes. Say what happens to (1) the size of the
loop, (2) the number of clamp-loading events per kilobase, and (3) the ATP cost per kilobase
replicated. Then say which of these three is the reason fragment length is not simply as short
as possible. ]

#part[Part 4 · Stretch — skip freely, no penalty]

#q(space: 5.5cm)[4.1][ *Two rings, two openers.* You have now met the same design twice. DnaB is
a hexameric ring around DNA and cannot get on by itself — DnaC cracks it open. β is a ring around
DNA and cannot get on by itself — the γ complex cracks it open. Neither loader is optional and
both burn ATP. *What property of a closed ring makes an opener structurally unavoidable* — and
what does the cell get in exchange that a protein which simply grips DNA tightly could never
give it? Two sentences. ]

#closing[
  *Hand back.* Export the marked-up PDF into `solutions/`, and fill in the timer block on page 2
  first — day 05 and day 06 both came back with no timings, so set sizing is still resting on
  day 03/04 data that is two weeks old.
  #v(3pt)
  *Sending it over:* tick *Add to Library* this time, and the Share → email export will exist on
  the device.
  #v(3pt)
  *Next:* day 08 · §11.12–11.13 — ligase, and where the eukaryotic polymerases divide the same
  labour differently. Your Pol α/δ/ε gap from the map sign-off gets closed there.
]
