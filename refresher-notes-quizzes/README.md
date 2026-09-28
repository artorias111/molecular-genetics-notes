# Chapter 3 refresher — five days of reading + questions

A one-week refresher built for the *Gadus macrocephalus* / *G. ogac* lcWGS chapter
(`PhD chapters/Chapter 3/gadus-speciation`). It is **not** part of the daily
problem-set course in `problem-sets/` — different cadence, different purpose. It exists
because the grounding reading in `notes/reading-list.md` was not getting done, and
because a few of the concepts it covers are load-bearing for analysis decisions that
are about to be made.

Each day is a short reading (~1,300–1,600 words, written to be read once and held) and
six questions with handwriting space. Budget **1–1.5 hours**, Monday to Friday.
Week of **Mon 7 Sep – Fri 11 Sep 2026**.

| Day | File | Topic | Anchor papers |
|---|---|---|---|
| 1 | `day-1-species-and-divergence` | What "same species" means; π, d_xy, d_a, F_ST; the grey zone | de Queiroz 2007; Roux 2016; Hudson 1992 |
| 2 | `day-2-ils-and-introgression` | Coalescent, ILS, ABBA-BABA, and the *morhua*-as-outgroup error | Durand 2011; Patterson 2012; **Codweb 2019** |
| 3 | `day-3-structural-variation` | Inversions, fusions, supergenes, recombination | **Hoff 2026**; Matschiner 2022; Bringloe 2024 |
| 4 | `day-4-islands-and-nulls` | Genomic islands, demographic nulls, range expansion | Cruickshank & Hahn 2014; Excoffier 2009 |
| 5 | `day-5-genotype-likelihoods-and-artifacts` | GLs at 10x, reference bias, batch, relatedness | Lou 2021; Meisner 2018; Günther 2019 |

The two papers that had been skipped — **Codweb** (Day 2) and **Hoff et al. 2026**
(Day 3) — are each the anchor of a day rather than a line in a list.

## How it is meant to run

- Read the reading section first, without the papers open. It is written to stand alone.
- Then answer, closed-book, with the timer running. Skipping a question is a data point.
- The papers are for *after* the questions, or the same evening — the Sources block on
  each day says which parts are worth the time and which to skip.
- Days 2–5 open with a `Carry-forward` box: one or two things recalled from the previous
  day before reading. Do those from memory.

**There is no answer key**, by the rule in `AGENTS.md`. Send the five sheets back
together when the week is done, along with any commentary — including which questions
you think are badly posed. Grading follows, focused on mechanism rather than recall.

## Design notes

- Questions are tagged (`derive`, `trace`, `mechanism`, `design`, `trap`, `judgement`,
  …) so the grading can tell a reasoning failure from a retrieval failure.
- Most items are reconstructible from a stated principle rather than recalled, and
  binary-choice framings are avoided, per the *inverted conclusion* failure mode logged
  in `course/progress.md`.
- Every question is answerable from that day's reading plus the earlier days. Nothing
  requires a paper to have been read first.
- Several questions use real numbers and real open problems from the chapter's
  `notes/experiment-design.md` — the reference-bias two-arm swap, the Greenland depth
  risk, index hopping on the one-lane design, the same-haul Aleutian pairs. Answers to
  those are usable in the methods, not just practice.

## Rebuilding

```
typst compile day-1-species-and-divergence.typ
```

`refresher-template.typ` holds the macros (`sheet`, `budget`, `key`, `trap`, `carry`,
`eq`, `sources`, `question`, `closing`). Page geometry is the same A5 as
`problem-sets/template.typ` so the sheets fit the e-ink tablet; the font is Libertinus
Serif, since Linux Libertine is not installed on this machine.
