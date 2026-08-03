# Kindle Scribe worksheet format — prompt + brief

> **Adopted 2026-08-02. This file is history now — read `CLAUDE.md` instead.** The format is
> the standing convention for all future day sets, and two things below are already out of
> date: page 1 of every sheet is now the five-card drill (passed as `drill:` to `sheet`, not
> a separate helper), and generated PDFs are still gitignored — the `.typ` is the source of
> truth and regenerates them, so tracking both was redundant. Kept for the reasoning behind
> the page size and the send-to-device workflow, which are unchanged.

Shriram now has a Kindle Scribe (2022) and wants to answer daily sets on the device in pen,
then export the marked-up PDF back. The Typst scaffolding for that is already in this repo
(added 2026-08-02 from the math-cs repo, where the same change was made). Nothing has been
migrated yet beyond one worked example.

---

## Paste this to the Claude session in this repo

> I've switched to solving these on a Kindle Scribe, so problem sets should be Typst → PDF
> instead of Markdown. The scaffolding is already here — read `SCRIBE-SETUP-PROMPT.md`, then
> `course/templates/scribe.typ` and the worked example
> `course/modules/m1-replication-fork/problems/day-06.typ`. Adopt it as the standing format:
> write future day sets as `day-NN.typ`, compile them with `course/build.sh`, and record the
> convention wherever this repo keeps its conventions so it survives into future sessions.
> Don't migrate the old day files unless I ask.

---

## What's already here

| File | What it is |
|---|---|
| `course/templates/scribe.typ` | The shared template. Page is **6.2in × 8.27in** — the Scribe's 1860×2480 @300ppi screen *exactly*, so a sheet fills the display with no pinch-zooming. |
| `course/build.sh` | `./build.sh` rebuilds every `.typ`; `./build.sh path/to/day-07.typ` does one. |
| `course/modules/m1-replication-fork/problems/day-06.typ` + `.pdf` | Day 06 converted verbatim as a worked example of every feature. The `.md` is untouched next to it. |

`typst` is already installed (0.15). Nothing else is needed.

## How to write a day file

```typst
#import "../../../templates/scribe.typ": *   // depth depends on the folder

#show: sheet.with(
  title: "M1 · Day 07 — the sliding clamp",
  subtitle: "holoenzyme as subcomplexes",
  budget: "30 min",
  reading: [§11.10–11.11, pp. 1027–1039],
  intro: [ ...page-range detail, verified against the text... ],
)

#timers([Part 0 (4 min) — timer fired?], [Part 1 (8 min) — reading finished?], ...)
#callout[ ...the "here's what last set showed" grading note... ]
#refbox[ ...pre-flight files, format rules, consistency check... ]

#part[Part 0 · Reconstruction, not recall (4 min, book closed)]
#q(space: 4cm)[0.1][ The question text. ]
#sub(space: 3cm)[(a)][ A lettered piece of that question. ]
#closing[ Hand back / drill / next-day block. ]
```

Helpers: `sheet`, `part`, `q`, `sub`, `work`, `refbox` (grey box), `callout` (left-barred box),
`timers` (fillable table), `closing`.

## The two rules that matter

1. **Pose every question through `#q()`.** It reserves the blank writing space *and* increments
   a counter, and the header prints that counter — so the stated size of a set is computed by
   the document rather than asserted. `#sub()` gives an (a)/(b) its own space without inflating
   the question count. If a set is meant to be nine questions, the header will say nine or the
   set is wrong.
2. **Give generous `space:`.** He is writing by hand on glass; cramped space is how answers get
   thinned. Page count is irrelevant on e-ink — page turns are instant — so err long. `~4cm`
   suits a two-sentence answer, `~5cm` a three-sentence one.

## Gotchas

- `build.sh` passes `--root .` from `course/`. Without it Typst refuses the template import,
  since `../../../templates/` escapes the day file's own directory.
- Typst markup, not Markdown: `*bold*`, `#emph[italic]`, `` `code` ``. Math is
  `$10^(-5)$`, `$10^2$`. Unicode primes (`3′-OH`), Greek (`ΦX`) and arrows (`→`) all pass
  through as literal text.
- `.gitignore` currently has `*.pdf`, so generated sheets aren't tracked. Add
  `!course/**/*.pdf` if you want the exact sheet he solved kept in history (they're ~100 KB).
  The math-cs repo does this.
- He returns work as a **marked-up PDF exported from the Scribe** — handwritten, no text layer.
  Render it with pymupdf to read it, and watch for pages scanned upside-down (it has happened).

## Getting the file onto the device

`amazon.com/sendtokindle` in a browser — drag the PDF in, it lands in Documents. Open it there
and write directly on the page. Export back via the document's share menu (send as PDF by
email), then drop the file into `solutions/`.
