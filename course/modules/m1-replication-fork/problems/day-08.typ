// M1 · Day 08 — Okazaki maturation, ligase, and the eukaryotic fork.
// Compile from course/:  ./build.sh modules/m1-replication-fork/problems/day-08.typ
#import "../../../templates/scribe.typ": *

#show: sheet.with(
  title: "M1 · Day 08 — Sealing it up",
  subtitle: "how a fragment becomes a strand",
  budget: "34 min",
  reading: [§11.12–§11.13, pp. 1040–1051],
  intro: [
    §11.12 #emph[Okazaki Fragments Are Linked by Ligase] + §11.13 #emph[Separate Eukaryotic DNA
    Polymerases Undertake Initiation and Elongation]. §11.12 opens at the top of p. 1040; §11.13
    opens partway down p. 1046; stop when #emph[§11.14 Lesion Bypass] appears on p. 1052.
    #emph[Range verified against the text.] \~1,600 words. #strong[The reading window is 16 min,
    not 9] — see the note below; that is the one real change to this sheet.
  ],
  // Page 1. Held from day 07 and now free: `exo-terminus-rule`, `dnab-strand`.
  // Checked against the set (adjustment 24): `exo-5to3-stance`, `exo-3to5-stance` and
  // `primer-provenance` all answer 0.2 / 2.2 / 3.2 outright and are held again.
  drill: (
    [*Pol III* — which subunit is the polymerase and which the proofreader? Subunit letter,
     gene name, and what happens to the cell when each is lost.],
    [An exonuclease is named for a direction (3′→5′ or 5′→3′). *Which terminus does each one
     require* handed to it as a substrate — and what is the rule that gets you there every time?],
    [Name the one thing the text says a *helicase cannot do*, and the two independent reasons
     DnaB needs a loader.],
    [DnaB is a 5′→3′ helicase and moves with the fork. *Which parental strand does it ride*, and
     where would it end up if it were on the other one?],
    // one-line answer last: the final slot only gets the space left on the page.
    [Three proteins act in sequence at #emph[oriC]. Name them, *in the order they act*.],
  ),
)

#timers(
  [Drill (4 min) — done cold, book closed?],
  [Part 0 (4 min) — timer fired?],
  [Part 1 (16 min) — how long did the reading actually take?],
  [Part 2 (8 min) — timer fired?],
  [Part 3 (6 min) — timer fired?],
  [Part 4 — attempted?],
)

#callout[
  *Day 07 was \~5.5/9, drill 2/5 — and 3.2 and 4.1 were the two best answers you have written.*
  Both were full marks. What they have in common is that *neither offered you a choice*: 3.2 gave
  you three quantities and asked which way each moves, 4.1 asked what property makes an opener
  unavoidable.
  #v(4pt)
  Every point you dropped went the other way. 2.2 offered #emph[“leave, or stay”] — you cited the
  alternating-core model correctly and then concluded the opposite of what it implies. 2.3 said
  #emph[“take each strand in turn”] — you named β rings correctly and put them on the wrong
  strand. 0.3 asked #emph[“does the fork keep moving?”] — you said no, one clause after the
  question said the helicase was untouched.
  #v(4pt)
  *That is a fault in how I wrote the questions, not in what you know.* Your retrieval on that
  sheet was good throughout — the dissociation list, β rings, the alternating cores, the tenfold
  rate. The marks went on converting a correct fact into a direction. So on this sheet *no item
  offers you two options anywhere*. Where a strand matters, I name it in the premise and ask only
  what follows.
]

#refbox[
  *The reading window was wrong, and your timing is what showed it.* You wrote
  #emph["Nope — almost 30 mins!"] against a 9-minute window on a 30-minute budget, which means
  day 07 actually ran close to fifty minutes and you hit the written parts tired. The 9 minutes
  came from a calibration taken on day 03's much shorter sections, which I then kept stretching
  as the sections grew without ever re-measuring. *This sheet is 16 min of reading and 18 of
  writing, summed honestly, and the set is 8 questions rather than 9.* Please time the reading
  again — one measurement is not a calibration, and if it overruns a second time I cut the
  section in half rather than adjust the number.
  #v(4pt)
  *Order of the sheet.* Page 1 drill first, cold and book closed. Then Part 0, still book closed.
  Don't turn back to page 1 afterwards.
  #v(4pt)
  *No pre-flight reference note today* — Part 0 is day-07 material and the point is to see what
  survived a day without a re-read.
  #v(4pt)
  *Format rules.* Hard timer on every written part; when it fires, stop mid-sentence. Reading
  timer advisory. Fragments and arrows wanted, prose not.
  #v(4pt)
  *Consistency check before you hand in (\~40 s):* (i) for every sentence naming an enzyme, check
  the substrate you handed it; (ii) for every answer to a #emph[why] question, check that it
  contains at least one noun that is #emph[not] in the question; (iii) *new* — anywhere you wrote
  a number, check it is a count of something you could actually point at.
]

#part[Part 0 · What survived a day (4 min, book closed)]

#q(space: 0pt)[0.1][ *Watching one polymerase for 200 fragments.* You attach a fluorophore to the
α subunit of the *lagging-strand* catalytic core, and film a single replisome through 200
consecutive Okazaki fragments. ]

#sub(space: 2.2cm)[(a)][
  Over those 200 fragments, *how many times does that spot separate from the fork?* A number.
]

#sub(space: 3.4cm)[(b)][
  Name the *two* components that do have to be recruited out of solution for each new fragment.
]

#sub(space: 3.4cm)[(c)][
  One of those two is delivered by an ATP-driven machine. Name the machine, and say what it does
  to the component #emph[physically] in order to deliver it.
]

#q(space: 5.5cm)[0.2][ *From primer to strand — a count.* An Okazaki fragment has just been
finished. Immediately downstream sits the RNA primer of the fragment made before it, and the new
fragment's 3′ end has run up against it. *How many distinct chemical jobs stand between that
arrangement and one continuous daughter strand?* Give the number, then list them in the order
they happen, three words or fewer each. #emph[(This is a count, not an essay. The number is small.)] ]

#part[Part 1 · Read §11.12–§11.13 (16 min, advisory) — pp. 1040–1051]

#refbox[
  Four things to hold onto. All four are asked about below.
  - *Two different solutions to the same problem.* #emph[E. coli] removes the primer one way;
    mammals cannot use that way, and the reason is a missing activity on the polymerase. Note
    which activity is missing, and what mammals do instead.
  - *What FEN1 recognizes.* p. 1042–1043. It is a #emph[shape], not a sequence — and p. 1043
    says what goes wrong in repeated sequences when it is slow. That paragraph is the closest
    this chapter comes to your own field; read it twice.
  - *The ligase reaction.* p. 1044 and p. 1046. Which two termini it demands, what AMP is
    attached to, and in what order the bonds form.
  - *Table 11.3, p. 1049.* The E. coli column is already yours. Learn the eukaryotic column
    #emph[against] it, row by row, rather than as a fresh list of names.
  #v(4pt)
  *Two errors in the printed text, so they don't cost you time:* p. 1047 says nuclear replication
  requires polymerases #emph[α, β, and ε] — it means α, *δ*, and ε (Table 11.2 on the next page
  is right). And the Figure 11.23 caption calls PCNA the homolog of #emph[α] — it is the homolog
  of *β*. Both are typos in the book, not subtleties.
]

#part[Part 2 · Maturation and ligase (8 min)]

#q(space: 5.5cm)[2.1][ *What the AMP is for.* Ligase does not simply join the two ends. AMP is
first carried on the enzyme, then transferred onto the 5′-phosphate at the nick, and only then is
the phosphodiester bond made and the AMP released. *Say what attaching AMP does to that
5′-phosphate that makes the bond possible* — i.e. what state the phosphate is left in. Then name
the terminus that carries out the attack, and the group that leaves. Two sentences.
#emph[(You already know the same three-part shape from chain extension. Only the leaving group
has changed.)] ]

#q(space: 6cm)[2.2][ *The flap.* A mammalian replicative polymerase has no 5′→3′ exonuclease, so
it cannot chew the primer ahead of itself the way Pol I does. It runs into the primer and keeps
synthesizing anyway, peeling it off the template. *Describe the structure that results* — say
exactly which piece is now single-stranded and which piece is still base-paired. Then say what
FEN1 must recognize in order to cut in the right place, given that it cannot be reading a
sequence. ]

#q(space: 5.5cm)[2.3][ *FEN1 removed.* You inactivate FEN1. Strand-displacement synthesis
continues at its normal rate; ligase is untouched and fully active. Say what is sitting at every
fragment junction after one round of replication, and *state the reason ligase cannot act there*
in terms of what ligase demands. Then, from p. 1043: name the kind of sequence where an
unremoved flap does lasting damage, and the two outcomes it produces. Three sentences maximum. ]

#part[Part 3 · The same fork, built from different parts (6 min)]

#q(space: 0pt)[3.1][ *The correspondence.* The left column is yours already. Fill the right one —
one name per line, from Table 11.3 and §11.13. ]

#sub(space: 0pt)[][
  #v(2pt)
  #table(
    columns: (1fr, 1fr),
    inset: 5pt,
    stroke: 0.5pt + luma(150),
    [*E. coli*], [*Eukaryote*],
    [DnaB], [],
    [SSB], [],
    [DnaG primase], [],
    [β clamp], [],
    [γ complex], [],
    [Pol III core, leading strand], [],
    [Pol III core, lagging strand], [],
    [Pol I, 5′→3′ exonuclease job], [],
  )
]

#q(space: 6cm)[3.2][ *Why start with an enzyme you intend to fire.* Pol α/primase lays down about
10 bases of RNA and then continues on itself for another 20–30 bases of DNA — and is then
displaced, on both strands, by a different polymerase. It is the only eukaryotic replicase that
can start a chain from nothing. *Name the property Pol α lacks that makes keeping it on the job
unacceptable*, and say what that implies about the 20–30 bases of DNA it already laid down —
specifically, what has to happen to them, and which enzyme from Part 2 does it. Two sentences. ]

#part[Part 4 · Stretch — skip freely, no penalty]

#q(space: 5.5cm)[4.1][ *One protein or two.* #emph[E. coli] puts the synthesis activity and the
5′→3′ exonuclease in a single polypeptide — Pol I does both jobs, coupled, in one pass.
Eukaryotes split them across two proteins that are not even in the same family: Pol δ synthesizes,
FEN1 cuts. Both arrangements finish the fragment. *Name something the split arrangement can do
that the fused one structurally cannot* — and note where else in the cell you would then expect
to find FEN1 turning up. Two sentences. ]

#closing[
  *Hand back.* Export the marked-up PDF into `solutions/`, and fill the timer block on page 2
  first — day 07's single line about the reading was worth more than the rest of the sheet, and
  it is the reason this one is shaped differently.
  #v(3pt)
  *Sending it over:* tick *Add to Library*, so Share → email exists on the device.
  #v(3pt)
  *Next:* day 09 · §11.14 — lesion bypass and polymerase replacement. That is where Pol IV and
  Pol V finally get taught properly rather than drilled at you; the card has been pulled from the
  deck until then. *Two sheets left in M1 after this one* — day 10 takes origin licensing and
  termination together, and closes with a trace of a eukaryotic fork from origin firing to the
  last ligation, every actor named. Then M2, which is the module your own work actually needs.
]
