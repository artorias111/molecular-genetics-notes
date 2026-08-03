# Working conventions for this repo

A self-taught molecular genetics course for Shriram, built around Lewin's *Genes XII*
(`textbooks/`). I write the day sets, he answers them, I grade them. `course/module-map.md`
is the syllabus; `course/progress.md` is the private ledger of what happened and what was
adjusted (gitignored — never commit or publish it).

## The daily sheet is Typst → PDF, answered in pen

Adopted 2026-08-02. He answers off-screen on a Kindle Scribe, so **day sets are written as
`day-NN.typ`, not Markdown**, and compiled to a PDF sized to fill the device screen.

- Template: `course/templates/scribe.typ`. Page is 6.2in × 8.27in = the Scribe's
  1860×2480 @300ppi panel exactly, so a sheet fills the display with no pinch-zooming.
- Build: `course/build.sh` (all sheets) or `course/build.sh modules/.../day-07.typ` (one).
  The `--root .` in that script is required — day files import `../../../templates/`,
  which escapes their own directory, and Typst sandboxes to the root.
- **Naming:** the source keeps the sortable `day-NN.typ`; `build.sh` emits
  **`molecular genetics day NN.pdf`** next to it. The filename is what shows in the Scribe's
  document list, where "day-06" says nothing. Set 2026-08-02 at his request — don't
  "tidy" the spaces out of it.
- Helpers: `sheet` (with `drill:`), `part`, `q`, `sub`, `work`, `refbox` (grey box),
  `callout` (left-barred grading note), `timers`, `closing`.
- Typst markup, not Markdown: `*bold*`, `#emph[italic]`, `` `code` ``, `$10^(-5)$`.
  Unicode primes (`3′-OH`), Greek and arrows pass through as literal text.
- Sending it over: `amazon.com/sendtokindle`, and **"Add to Library" must be ticked**. A
  document sent to the device only never gets a cloud copy, and the Share/export path runs
  through the cloud — so without it there is no way to get the annotated PDF back off the
  device. Learned the hard way on day 06, 2026-08-02.
- He returns a **marked-up PDF with no text layer** — handwritten. Render it with pymupdf
  to read it, and watch for pages scanned upside-down (it has happened). Intake:
  `course/intake.sh 06` moves the newest PDF out of `~/Downloads` to `solutions/day-06.pdf`;
  `course/intake.sh 06 --screens` binds page screenshots off the mounted Kindle into one PDF,
  which is the fallback when a sheet was sent without "Add to Library".
- Old `day-01`–`day-05` Markdown files stay as they are. Don't migrate them.

Two rules that are load-bearing:

1. **Pose every day-set question through `#q()`.** It reserves the writing space *and*
   increments a counter that the header prints, so the stated size of a set is computed by
   the document rather than asserted. `#sub()` gives an (a)/(b) its own space without
   inflating the count. If a set is meant to be nine questions, the header says nine or the
   set is wrong.
2. **Give generous `space:`.** He is writing by hand on glass. Page count is irrelevant on
   e-ink — page turns are instant — so err long: ~4cm for a two-sentence answer, ~5cm for
   three.

## Page 1 is the drill — five cards, every day

Also adopted 2026-08-02, replacing the typed `drill.py` session. Same deck
(`course/drill/cards.md`), same Leitner state, answered in pen on the same sheet.

- Pass five prompts as `drill: (...)` to `sheet`. They get their own page, ahead of the
  set's own header, so nothing from the day set is visible while he answers them cold.
  They deliberately don't go through `#q()` — the drill must not inflate the question count.
- Choosing them: `drill.py --propose` ranks the pool (due cards weakest-box-first, then
  unseen), then **`drill.py --issue <ids> --for day-NN`** records them and prints the
  `drill:` block. Issued cards sit `pending` and are not re-picked until marked.
- **Check the pick against the day set for priming, every time.** A card the set itself asks
  about is an answer key printed above the question. Hold it to the next sheet. Three cards
  were held back from day 06 for exactly this.
- Grading: read the drill answers off the returned PDF, then
  `drill.py --mark id=ok id=miss --typed 'id=what he actually wrote'`. The transcription is
  not optional — `attempts.log` is only useful because it records *how* a card failed.
- Put the shortest-answer card last; the final slot only gets the space left on the page.

## Hard constraints on how he's taught

These are conclusions from `course/progress.md`, not preferences. The numbered adjustments
there are the full list; these are the ones that bind every set.

- **He never grades himself.** No "did you get that right?", no asking him to flag his own
  wrong answers. I mark everything, including the drill.
- **A miss prints the mechanism, not the fact.** Repeating a correction as a fact has
  demonstrably not worked on him; re-teaching it as a mechanism has. That's what `hook:` on
  each card is for.
- **Consequence form for any same/different or up/down item.** His error mode is an inverted
  conclusion on top of sound reasoning, and warnings don't prevent it — only changing *what
  is asked* does. If the consequence is the graded object, don't ask for the label at all:
  a label offered anywhere in the item is a label available to flip.
- **Prefer what he can reconstruct over what he must recall.** Where a fact has a derivation,
  teach the derivation as the primary object and the fact as its output. His recall carries a
  sign error; his reasoning doesn't.
- **Verify page ranges against the PDF before writing reading instructions.** A false
  instruction costs him reading time hunting for something that isn't there.
- **Explanations get written to `course/reference/`, not left in chat**, and each day set
  names the one reference file that covers its Part 0 as a two-minute pre-flight. The Markdown
  is the source; `course/refbuild.py` renders each note to
  `course/reference/pdf/molecular genetics ref - <name>.pdf` so he can read it on the Scribe.
  One PDF per note, deliberately — notes are stable once written, so each gets sent to the
  device once, where a combined volume would need re-sending on every addition. Rebuild after
  editing a note, and name the note in the day set's pre-flight by its **PDF** title.
- Budget is 30 min/day, ~9 questions, 8-minute advisory reading window. Don't grow it
  without timer data.

## Layout

| Path | What |
|---|---|
| `course/module-map.md` | syllabus, M1–M9 |
| `course/progress.md` | private ledger: log, calibration, numbered adjustments (gitignored) |
| `course/modules/*/problems/day-NN.typ` | the day sets |
| `course/reference/` | written explanations, his to re-read |
| `course/drill/` | deck, runner, Leitner state (`state.json`/`attempts.log` gitignored) |
| `course/templates/scribe.typ`, `course/build.sh` | the sheet format |
| `solutions/` | his returned PDFs (gitignored) |
