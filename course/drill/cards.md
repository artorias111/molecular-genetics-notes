# Drill deck

Cards are drawn from actual errors in the day sets, not from the textbook at large.
Run them with `python3 course/drill/drill.py`.

Format per card:

```
### card-id
Q: the prompt
A: the canonical answer (shown after you answer)
accept: group ; group ; group      <- each group must appear; alternatives inside a group are a|b|c
accept[ordered]: ...               <- same, but the groups must appear in this order
hook: the mechanism that makes it stick (shown when you miss it)
tags: m1 names
```

Matching ignores case, spaces and punctuation, so `dna A`, `DnaA` and `dnaa` are all the
same. Write fragments, not sentences.

---

### origin-trio-order
Q: Three proteins act in sequence at oriC. Name them, in the order they act.
A: DnaA → DnaC → DnaB
accept[ordered]: dnaa; dnac; dnab
hook: Alphabetical order is the order they were *discovered*, not the order they act. The
  action order is A → C → B. DnaC exists only to load DnaB, so C and B are a pair that
  always travels together; DnaA is the odd one out that goes first.
tags: m1 names origin

### origin-trio-jobs
Q: At oriC: which protein melts the duplex, which loads the third onto it, and which propagates the opening?
A: DnaA melts (initiator, binds the 13-mers and opens them) · DnaC loads (helicase loader)
  · DnaB propagates (the helicase itself)
accept[ordered]: dnaa; dnac; dnab
hook: melt → install → propagate. Only DnaA can open closed duplex; DnaB cannot start on
  duplex DNA at all, which is *why* a separate loader is needed — DnaC hands it onto
  ssDNA that DnaA has already opened. No melting, nothing to load onto.
tags: m1 names origin

### primer-provenance
Q: Which enzyme lays down the RNA primer on the lagging strand, and why can't a polymerase do it?
A: Primase = DnaG. A DNA polymerase cannot start a chain — it can only extend a free 3'-OH.
accept: primase|dnag; 3'|three prime|extend
hook: The chemistry only runs one way: an incoming dNTP's α-phosphate is attacked *by an
  existing 3'-OH*. No 3'-OH, no reaction. Primase is an RNA polymerase, and RNA polymerases
  can start from nothing — that is the entire reason RNA is involved in DNA replication.
tags: m1 names lagging

### exo-5to3-stance
Q: The 5'→3' exonuclease attacks an RNA primer. Which end of the primer is it standing on, and does it travel toward the fork or away from it?
A: On the primer's 5' end, at the nick. It travels 5'→3', which is AWAY from the fork.
accept: 5'|five prime; away
hook: Every Okazaki fragment starts near the fork and extends backwards, so a fragment's 5'
  end is its fork-proximal end. Travelling 5'→3' therefore carries you away from the fork,
  into already-replicated DNA. Pol I's polymerase site follows from the 3'-OH on the other
  side: nick translation.
tags: m1 geometry nuclease

### exo-3to5-stance
Q: Why can the 3'→5' proofreading exonuclease never attack an RNA primer?
A: A 3'→5' exo needs a free 3' end. A primer is at a 5' end, and its own 3' end is covalently
  continuous with the DNA extended from it — so no 3' terminus is ever presented.
accept: 3'|three prime; free|no 3|continuous|extended|covalent
hook: NOT because proofreading is confined to the leading strand — it isn't; every Pol III
  core carries ε and every Okazaki fragment gets proofread. The question is always: which
  *terminus* does this enzyme require, and does that terminus exist here?
tags: m1 geometry nuclease

### pol3-subunits
Q: Pol III: which subunit is the polymerase and which the proofreader — subunit letter, gene name, and phenotype when each is lost?
A: α = dnaE = polymerase = lethal · ε = dnaQ (= mutD) = 3'→5' proofreading = viable, mutator (10²–10³×)
accept: alpha|α; dnae; lethal|essential|dead; epsilon|ε; dnaq|mutd; mutator|viable
hook: Same shape as polA (viable) vs polC (lethal): an accessory that *improves* an essential
  process is dispensable; the essential process itself is not. If you can name the phenotype
  you can re-derive which is which.
tags: m1 names pol3

### pol4-pol5
Q: What are Pol IV and Pol V for, what are their genes, and what feature of their active site makes them behave that way?
A: Translesion synthesis / damage tolerance (NOT repair) · dinB (IV), umuD'₂C (V) · open, roomy
  active site
accept: translesion|lesion|bypass|tolerance; dinb; umu; open|roomy|loose|flexible
hook: An open site accommodates a distorted, damaged template base — which is the point — but
  the same looseness accommodates mispairs. They repair nothing; they let the fork past
  damage at the cost of errors. Fidelity and lesion-tolerance are one knob turned two ways.
tags: m1 names translesion

### alpha-phosphate
Q: In chain extension, which phosphate of the incoming dNTP is attacked, and what leaves?
A: The α-phosphate (the one nearest the sugar). Pyrophosphate (β + γ) leaves.
accept: alpha|α; pyrophosphate|ppi|betaandgamma|twophosphate
hook: Count outward from the sugar: α, β, γ. The 3'-OH attacks the phosphate closest to the
  sugar, because that is the one that ends up in the backbone bond. Irreversibility comes
  later and from elsewhere — pyrophosphatase destroying the PPi.
tags: m1 chemistry names

### fidelity-budget
Q: Give the fidelity budget as numbers: the rate after active-site selectivity, the improvement from proofreading, the improvement from mismatch repair, and the endpoint.
A: ~10⁻⁵ → ×10² proofreading → 10⁻⁷ → ×10²–10³ MMR → ~10⁻⁹
accept[ordered]: 105|1e5; 102; 109|1e9
hook: Two different kinds of number: a *rate left behind* and an *improvement factor*. They
  multiply because the stages are statistically independent — which is also why losing two
  of them is worse than additive. The 10⁻² you may remember is the baseline from base-pairing
  energy alone, not a stage.
tags: m1 numbers fidelity

### bp-geometry
Q: A chemist gives you a system where A–T pairs are 2 Å wider than G–C. Name one thing a single rigid polymerase active site could no longer do — and the cost of the fix.
A: It could no longer accept all four correct pairs with one geometry (tuned to one width it
  vetoes the other). Fix = flexibility or a second site — and flexibility IS loss of fidelity.
accept: both|all four|one site|single|four|geometry alone|one geometry|same geometry|one shape|caliper; flexib|loose|open|second site|less rigid|non rigid|not rigid|no longer rigid; fidelity|mutation|error|accuracy|misincorp
hook: Real A–T and G–C are isosteric — same width, same C1'–C1' distance. That is the entire
  reason ONE rigid caliper can gauge all four pairs without ever reading the sequence. Pol IV
  is the existence proof of the cost: open site, damage-tolerant, error-prone.
tags: m1 geometry fidelity

### hand-domains
Q: Name the three domains of the polymerase cleft and give the job of each.
A: Palm = conserved motifs, catalytic active site · Fingers = position the template ·
  Thumb = binds DNA as it exits, sets processivity
accept: palm; catalytic|active site; finger; template|position; thumb; exit|processiv
hook: The hand is a right hand holding a rod. The palm is the bench the chemistry happens on;
  the fingers close over the incoming nucleotide; the thumb is the back grip that stops the
  DNA falling out — hence processivity.
tags: m1 structure

### closing-motion-numbers
Q: When a correct nucleotide binds, what moves, by how much?
A: Fingers rotate 60° toward the palm, tips travelling ~30 Å. Thumb rotates 8°. Palm doesn't move.
accept: finger; 60; 30; thumb; 8
hook: 60 / 30 Å / 8. Big motion = fingers, small = thumb, none = palm. The cycle reverses on
  incorporation, then the DNA translocates one position to recreate an empty open site.
tags: m1 numbers structure

### mispair-consequence
Q: What happens inside the enzyme when a mispair occupies the catalytic site, and why is that the selectivity step rather than the base pairing itself?
A: The fingers cannot rotate to the palm → no closed site → the chemical step can't fire →
  the 3' end is left free, rotates 30 Å into the exonuclease site. Closure is an induced-fit
  checkpoint that converts a weak thermodynamic difference into a large kinetic one.
accept: cannot close|can't close|not close|no clos|fails to close|doesn't close; exo|editing|proofread
hook: Base pairing energy alone only buys 10⁻². The polymerase gets 10⁻⁵. The extra comes
  from making catalysis physically impossible until the shape check passes — the mispair is
  not forbidden, it's just slow enough that it diffuses away first.
tags: m1 mechanism fidelity

### palm-conservation
Q: Five polymerase families share no sequence homology, yet the palm is conserved and the fingers and thumb aren't. Why?
A: The palm does catalysis — positioning two Mg²⁺ ions via conserved acidic residues to
  sub-ångström precision. That has one geometric solution. Fingers and thumb only have to
  grip, and many folds can grip.
accept: catal|chemistry|metal|mg|active site; grip|bind|hold|shape|fold|topolog
hook: Conservation tracks the NUMBER OF AVAILABLE SOLUTIONS, not the importance of the job.
  One answer → frozen sequence. Thousands of answers → sequence drifts while shape stays.
tags: m1 evolution structure

### exo-site-distance
Q: The proofreading exo site is 30 Å from the polymerase site. Give a reason the cell is better off with them far apart.
A: (i) The two chemistries need incompatible pockets — a caliper for a paired duplex terminus
  vs. a site that accepts a frayed single-stranded 3' end. (ii) The trip is slow, and the
  slowness is a threshold: only a stalled (mispaired) terminus loiters long enough to make it.
accept: shape|pocket|geometr|duplex|singlestrand|frayed|melt|slow|time|threshold|competition|stall
hook: An in-place nuclease fires on correct pairs too — the exo isn't perfectly selective
  either — giving futile cycling, correct bases removed as fast as they're added, net
  synthesis → 0. The trip isn't overhead. It's the filter.
tags: m1 mechanism fidelity

### thumb-mutant
Q: A polymerase with a damaged thumb (palm and fingers intact) — which error class rises, and where in the genome would you look for it?
A: Frameshifts rise (processivity is lost); substitutions stay roughly flat. Look in
  homopolymeric runs and short tandem repeats.
accept: frameshift|indel|slip; homopolymer|repeat|microsat|tandem|run
hook: Every dissociation is a chance to re-anneal in the wrong register. Slip by one in a
  dA·dT run and every base is still correctly paired — REGISTER IS INVISIBLE TO A LOCAL
  SENSOR, so no amount of proofreading catches it. This is the small-scale version of the
  M3 repeat problem.
tags: m1 mechanism m3-bridge

### fork-supercoiling
Q: What physically happens to the DNA *ahead* of a moving replication fork, and whose problem is it?
A: It becomes overwound — positive supercoils accumulate. Topoisomerase (gyrase) relieves it.
  An elongation-phase problem, not an initiation one.
accept: overwound|positive|tightlywound|supercoil; topo|gyrase
hook: Torsion is GENERATED BY FORK MOVEMENT. So no fork movement → no new torsion → no job.
  That is also why topoisomerase has nothing to do with opening the origin: it has no
  strand-separating activity at all.
tags: m1 mechanism topo

### exo-terminus-rule
Q: An exonuclease is named for a direction (3'→5' or 5'→3'). Which terminus does each one require handed to it as a substrate, and what is the rule that gets you there every time?
A: 3'→5' exo requires a free 3' end. 5'→3' exo requires a free 5' end. Rule: the name starts
  at the end it starts at — the FIRST prime in the name is the terminus it needs.
accept[ordered]: 3'|three prime; 5'|five prime
hook: The name is the answer, read left to right: a 3'→5' exo begins at the 3' end and walks
  toward the 5'; it cannot begin anywhere else. Swapping them is the single most expensive
  error available here, because every downstream question (which enzyme touches a primer,
  what nick translation is, why proofreading can't reach a primer) is decided by the terminus.
tags: m1 geometry nuclease

### mutd-arithmetic
Q: A mutD strain has lost proofreading. Active-site selectivity leaves ~10⁻⁵ and mismatch repair still supplies its usual ~10². Write the line of arithmetic and give the rate — then say how it compares to wild type.
A: 10⁻⁵ × 10⁻² = 10⁻⁷. Wild type is 10⁻⁹, so the strain is a ~100× mutator.
accept: 107|1e7; 109|1e9|100|hundred|10²|102
hook: An improvement FACTOR of 10² enters the line as ×10⁻², because it makes errors rarer.
  Write ×10² and you get 10⁻³ — a strain with mismatch repair making MORE errors than one
  without any repair at all. The sanity check is free: if a repair system appears in your
  line and the rate goes up, the sign is wrong.
tags: m1 numbers fidelity

### dnab-strand
Q: DnaB is a 5'→3' helicase and moves with the fork. Which parental strand does it ride, and where would it travel if it were on the other one?
A: The lagging-strand template — that is the strand the fork traverses 5'→3'. On the
  leading-strand template it would translocate AWAY from the fork into already-replicated
  duplex, unwinding nothing ahead; the fork would not advance.
accept: lagging; away|backward|behind|opposite|already replicated|wrong direction
hook: Polarity and strand choice are ONE decision. And the objection that it would collide
  with the Okazaki machinery is backwards — primase (DnaG) docks on DnaB precisely because
  DnaB sits on the lagging template, which is where a new primer is needed every 1–2 kb.
  Eukaryotes run the mirror convention: MCM/CMG is 3'→5', so it rides the leading template.
tags: m1 geometry helicase

### helicase-cannot
Q: Name the one thing the text says a helicase cannot do, and the two independent reasons DnaB needs a loader.
A: It cannot unwind closed duplex DNA — it can only continue an opening already started, and
  it initiates at ssDNA adjacent to a duplex. (i) So something else must open the origin: DnaA.
  (ii) It is a hexameric RING encircling DNA, so it can only be got on over a free end or by
  being cracked open and reclosed: DnaC.
accept: duplex|double|closed|start|initiate|already; ring|encircle|hexamer|topolog|closed circle
hook: A ring is topologically trapped — that is the same property that buys processivity for
  many kilobases. The cost of not falling off sideways is not being able to get on sideways.
  So the loader is a STRUCTURAL necessity, not a story about weak binding affinity.
tags: m1 mechanism helicase

### pseudofragments
Q: Nearly all briefly-labelled DNA in E. coli comes back as short fragments, which looks like both strands are discontinuous. Why isn't it, and which gene do you delete to prove it?
A: Some pieces are pseudofragments — continuous chain cut AFTERWARDS, because uracil got
  incorporated and uracil-excision repair leaves a break until the T is replaced. Delete ung
  (or dut): half the label then appears in long continuous chains.
accept: uracil|ung|dut; repair|excis|glycosylase|after|break
hook: To abolish an effect, delete the enzyme that CAUSES it, never one that cleans up after it.
  The break is cut by uracil-N-glycosylase (ung), so ung is the deletion — or dut, which stops
  the uracil arriving in the first place. Every polymerase here is downstream: Pol I fills the
  gap back in, so deleting a polymerase makes the fragmentation worse, not better. If your
  answer is a polymerase, you have named the repairman for the hole, not the one who cut it.
tags: m1 experiment lagging

### strand-discrimination
Q: Mismatch repair has to know which strand is the new one. What signal does it use in bacteria, and what in eukaryotes?
A: Bacteria: transient hemimethylation of GATC (Dam lags the fork); MutS binds the mismatch,
  MutH nicks the UNmethylated strand. Eukaryotes: strand discontinuities — unligated Okazaki
  nicks and free 3' ends, read via PCNA orientation.
accept: methyl|dam|gatc|muth; nick|discontinu|okazaki|pcna|3'
hook: At a mismatch both bases are chemically normal, so nothing in the lesion says which is
  wrong; guessing is 50% and a wrong guess writes the error into the template permanently.
  The signal isn't in the mismatch — it's in the AGE OF THE STRAND. Anything transiently
  asymmetric between parent and daughter will do.
tags: m1 mechanism mmr
