// M1 · Day 06 — worked example of the Kindle Scribe format (converted from day-06.md).
// Compile from course/:  ./build.sh modules/m1-replication-fork/problems/day-06.typ
#import "../../../templates/scribe.typ": *

#show: sheet.with(
  title: "M1 · Day 06 — Priming",
  subtitle: "the two halves of an asymmetric machine",
  budget: "30 min",
  reading: [§11.8–§11.9, pp. 1019–1027],
  intro: [
    §11.8 Priming Is Required to Start DNA Synthesis + §11.9 Coordinating Synthesis of the
    Lagging and Leading Strands. §11.8 opens at the foot of p. 1019; stop when the §11.10
    heading appears partway down p. 1027. Nine pages, but p. 1021 is a full-page figure and
    three others are half figure: \~1,300 words, the same load as day 05. #emph[Range verified
    against the text.]
  ],
  // Page 1. Drawn from the deck by `drill.py --propose`; `exo-terminus-rule`,
  // `mutd-arithmetic` and `dnab-strand` were also due and are held to day 07,
  // because 0.1, 0.2 and 3.1 below ask exactly those three.
  drill: (
    [*Pol IV and Pol V* — what are they for, what are their genes, and what feature of their
     active site makes them behave that way?],
    [At #emph[oriC]: which protein *melts* the duplex, which *loads* the third onto it, and which
     *propagates* the opening?],
    [Nearly all briefly-labelled #emph[E. coli] DNA comes back as short fragments, which looks
     like both strands are discontinuous. Why isn't it — and which gene do you delete to prove
     it?],
    [A chemist hands you a system where A–T pairs are 2 Å wider than G–C. Name one thing a single
     *rigid* polymerase active site could no longer do — and the *cost of the fix*.],
    // shortest answer goes last: the final slot only gets the space left on the page.
    [In chain extension, *which phosphate* of the incoming dNTP is attacked, and *what leaves*?],
  ),
)

#timers(
  [Drill (4 min) — done cold, book closed?],
  [Part 0 (4 min) — timer fired?],
  [Part 1 (8 min) — reading finished in the window?],
  [Part 2 (10 min) — timer fired?],
  [Part 3 (7 min) — timer fired?],
  [Part 4 — attempted?],
)

#callout[
  *Day 05 was \~4.4/9, down from 6.9.* The whole drop is #emph[ends and directions] — 0.3a,
  0.3b, 3.1, and the sign in 0.2. Meanwhile 2.3 and 3.2b were as good as anything you have
  written. So this set is built around one idea: *everything you got wrong on day 05 is
  reconstructible in under ten seconds, and you recalled it instead.* The terminus falls out of
  the exonuclease's own name; the strand falls out of fork direction plus helicase polarity.
  Your recall carries a sign error. Your reasoning doesn't. So several questions below
  *explicitly ask for the rule you used*, and the rule is what's graded — not the answer it
  produced.
]

#refbox[
  *Order of the sheet.* Page 1 drill first, cold and book closed — that is the whole point of it
  being page 1. Then the two-minute pre-flight below, then Part 0. Don't turn back to page 1
  afterwards.
  #v(4pt)
  *Two-minute pre-flight, before Part 0 and outside its timer.* Open
  `reference/nucleic-acid-chemistry.md` §4 and `reference/fork-strand-separation.md` §5 and read
  the bulleted recall lists at the end of each.
  #v(4pt)
  *Format rules.* Every written part has a hard timer — when it fires, stop mid-sentence and move
  on. The reading timer is advisory. "One sentence" is a hard cap; fragments and arrows are fine,
  prose is not wanted.
  #v(4pt)
  *Consistency check before you hand in (\~40 s):* (i) for every sentence naming an enzyme, check
  the substrate you handed it; (ii) for every #emph[because / since / as / so] clause, check the
  reason is true on its own; (iii) *new* — for every claim about an *end or a direction*, write
  the one-line derivation next to it. Not a re-check, a derivation. If you can't produce one,
  mark the answer `?`. An unmarked guess and a derived answer look identical to me on the page.
]

#part[Part 0 · Reconstruction, not recall (4 min, book closed)]

#q(space: 0pt)[0.1][ *The nick, again — and this time the rule is the graded object.* A nick in
duplex DNA has two ends facing each other across the gap: a *3′-OH* on one side and a
*5′-phosphate* on the other. ]

#sub(space: 4cm)[(a)][
  You add a *3′→5′ exonuclease*. Then, separately, a *5′→3′ exonuclease*. For each: which of
  those two ends does it take hold of? Then — and this is the part being marked — state in one
  line *the rule that told you*, a rule I can apply to an enzyme you have never seen. If your
  rule is "I remember it," say that instead; it is useful information and costs you nothing here.
]

#sub(space: 3cm)[(b)][
  An *RNA primer* sits at that nick. Which of the two enzymes can attack it, and what is it
  about the other one's required end that makes the primer invisible to it? One sentence, about
  ends, not about strands.
]

#q(space: 4.5cm)[0.2][ *The budget, with the other stage removed.* Last time it was proofreading;
this time a strain has lost *mismatch repair entirely*. Active-site selectivity still leaves
\~$10^(-5)$, and proofreading still supplies its usual \~$10^2$. Three things, in this order:
(1) the multiplication *written as one line*; (2) the resulting error rate; (3) *how that
compares to wild type* — same, better, or worse, and by what factor. #emph[(Item 3 is not
decoration. It is the whole question.)] ]

#q(space: 3.5cm)[0.3][ *A guess before you read it.* Every DNA polymerase needs a preexisting free
3′-OH and cannot start a chain from nothing. RNA polymerases *can* start from nothing — that is
why an RNA primer is used at all. So why doesn't the cell just let the RNA polymerase make the
whole strand and skip DNA polymerase? One sentence. #emph[(You haven't read §11.8 yet. Guess —
you already have everything you need from day 03. The point is to find out whether you reach for
it.)] ]

#part[Part 1 · Read §11.8–§11.9 (8 min, advisory) — pp. 1019–1027]

#refbox[
  Four things to hold onto. All four are asked about below.
  - *The three ways to get a free 3′-OH.* Listed as three in the §11.8 key concepts and drawn in
    Figure 11.12. Two of them don't involve a primase at all.
  - *How many priming events each strand needs.* The text states this flatly for both strands and
    the two numbers are wildly different. Don't just note them — note #emph[why].
  - *What DnaB does besides unwind.* One sentence on p. 1025 settles an argument you had with me
    yesterday. Find it, and notice it is the #emph[reason] day-05 3.1's answer is what it is.
  - *The one thing the lagging-strand enzyme has to do that the leading-strand enzyme never does.*
    End of §11.9's first block — a physical action, not a property.
]

#part[Part 2 · Priming (10 min)]

#q(space: 4cm)[2.1][ Over one full round of replication from a single origin, the *leading*
strand needs exactly *one* priming event and the *lagging* strand needs *many* — roughly one per
kilobase or two. Derive the difference: what is it about the direction of synthesis on each
template that makes one number 1 and the other large? Two sentences maximum. #emph[(A correct
answer here is about template exposure over time, not about the enzymes involved.)] ]

#q(space: 4cm)[2.2][ #emph[E. coli] has *two* priming systems. The #emph[oriC] system is
essentially just primase joining the machinery already at the fork. The *ΦX / primosome* system
is much more elaborate — and the text says it is what's used when damage collapses a replication
fork and it has to be restarted. Why would restarting a broken fork need heavier machinery than
starting a brand-new one at the origin? Name one thing available at #emph[oriC] that simply is
not available at the site of a collapse. Two sentences. ]

#q(space: 4cm)[2.3][ The leading-strand enzyme unit engages its template once and never lets go
until the round is done. The lagging-strand unit must *disengage, move, and reattach at a fresh
primer* — a thousand or more times per replicon. Name the property that must therefore differ
between the two units, and say what would go wrong if the lagging-strand unit had the
leading-strand unit's version of it. One or two sentences. ]

#part[Part 3 · Perturbation (7 min)]

#q(space: 5cm)[3.1][ Two facts, both given so that nothing here is recall: DnaB translocates
*5′→3′* along the strand it encircles, and it rides the template that the fork traverses *5′→3′*;
and *DnaG primase physically binds DnaB* — that contact is how primase gets delivered. You
engineer a DnaB whose helicase activity is completely intact — normal speed, normal ATP use,
normal unwinding — but which can no longer bind DnaG. Take each daughter strand in turn and say
what happens to it. One is barely affected and one fails; say which is which and #emph[why], and
say what accumulates at the fork as a result. Three sentences maximum. ]

#q(space: 4.5cm)[3.2][ In #emph[E. coli], the same catalytic subunit (*DnaE*) does both strands.
In #emph[Bacillus subtilis], *two different* catalytic subunits do the two jobs — one dedicated
to each strand. Both organisms replicate their chromosomes perfectly well. What does the
existence of the #emph[B. subtilis] arrangement tell you about the two jobs? Then: name one
demand made on the lagging-strand enzyme that is not made on the leading-strand one. One sentence
each. #emph[(2.3 is not the only available answer.)] ]

#part[Part 4 · Stretch — skip freely, no penalty]

#q(space: 5cm)[4.1][ One of the three priming routes is a *protein* that primes directly, by
holding out a nucleotide for the polymerase to extend. Certain viruses do this. It looks baroque
next to just making a short RNA. But think about what happens to an RNA primer #emph[afterwards]:
it has to be found, removed, the gap filled, and the nick sealed — and all of that requires DNA on
*both sides* of it. Two sentences: on a linear genome, where is the one place that cleanup cannot
work, and what does that tell you about why a protein primer might be worth the trouble? ]

#closing[
  *Hand back.* Export this marked-up PDF from the Scribe into `solutions/`, and fill in the timer
  block on page 2 first. Page 1 comes back with it — the drill is graded off the same PDF and
  the Leitner boxes move then. Nothing to run and nothing to type.
  #v(3pt)
  *On the drill deck.* Three of the cards queued for today — `exo-terminus-rule`,
  `mutd-arithmetic`, `dnab-strand` — are what 0.1, 0.2 and 3.1 below ask, so printing them on
  page 1 would have handed you the answers. They move to day 07's page 1, where they are a
  retention test rather than a leak.
  #v(3pt)
  *Next:* day 07 · §11.10–11.11 — the holoenzyme as subcomplexes, the sliding clamp, and the clamp
  loader. The clamp is the answer to 2.3, so day 07 is where that question gets closed.
]
