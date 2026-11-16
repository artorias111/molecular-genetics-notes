# Design guide for quizzes and study sheets
If you're an agent here to see how to make a quiz, worksheet or guide for Shriram, start here. Everything below applies to any new sheet, in this repo or elsewhere.

- Working example: `transformers/day 01.typ` (and its compiled `.pdf`).
- Typst template: `design.typ` at this repo's root. Copy it into your project if you work elsewhere (typst imports must sit inside `--root`).
- Writing voice: `writing-style.md` at this repo's root. Read it before writing any text.

## Page and device
- Read and written on an iPad Air 4 with an Apple Pencil.
- Page 6.21 x 8.94 in, portrait. Margins 0.45 in sides, 0.7 in top, 0.55 in bottom.
- White pages only. No black or dark pages, it means switching pencil ink.
- Copy every finished PDF to `~/Library/Mobile Documents/com~apple~CloudDocs/exercises/`.

## Fonts
All in `~/Documents/fonts`. Compile with `--font-path ~/Documents/fonts`.
- Solway: headings, titles, big numbers.
- Google Sans: body text, 10.5 pt.
- Google Sans Code: source lines and code only. Everything else in Google Sans.
- Noto Sans Math: equations.
- Mansalva: short handwritten asides only, one or two per sheet.
- No spaced-out uppercase labels anywhere.

## Colors
The colors rotate daily. Everything else stays fixed.
- Pool of 8 palettes in `palettes.typ`, from Color Hunt's popular list. Day N uses palette (N - 1) mod 8. Preview all of them in `palettes-preview.pdf`.
- Each palette has an `accent` (headings, question letters, borders, answer boxes; must have contrast >= 4.5 on white), a `pop` (the query vector or the one thing to look at; saturated, a different hue from the accent), and a `tint` for cards (taken from the palette when it's light enough, otherwise mixed from the accent). `soft` (dot grids, outlines) is always 30% accent on white.
- Fixed in every palette: ink `#1c1c1c`, muted `#6b6b6b`, rules `#d6d6d6`, and the red today-marker `#ec5b38` in the progress bar.
- In sheet code, use the names `accent`, `pop`, `tint`, `soft`, never hex codes, so the rotation works.
- To add a palette: pull candidates from `curl -s -X POST https://colorhunt.co/php/feed.php -d "step=0&sort=popular&tags=&timeframe=4000"`, check the contrast rules above, add it to `palettes.typ`, look at the preview.

## Building blocks in `design.typ`
- `sheet(day:, topic:)`: page setup, header with a 30-segment progress bar (one per day).
- `cover(...)`: compact header on page 1, not its own page. Day number, title, one-line subtitle, a small pipeline with today's step highlighted, time.
- `define[term][body]`: definition card for the reading page.
- `task(kind:, minutes:, title:, src:)`: numbered task with a see/do/use tag and a source line.
- `ask(answer: slot())[...]`: a lettered question (a), (b), (c). Letters reset per task.
- `work(height)`: dot-grid writing area. `slot()`: answer box, default 0.66 x 0.42 in, big enough for Pencil handwriting.
- `blank-matrix(...)`, `vec-plot(...)`: pre-drawn matrices and 2D vector plots.
- `aside[...]`: handwritten note. `takeaway[...]`: "in my own words" box. `next-up(day)[...]`: what comes next.

## Sheet structure
- Page 1: compact header plus the reading primer. Then three tasks (see it, do it, use it), then a wrap-up sentence.
- About 15-20 minutes total, stated in the header.
- Short reading primer before any new term: a definition, a tiny worked example, a pointer to the source.
- Experiment with layout. Diagrams, shapes, drawn vectors and matrices are welcome. Avoid plain walls of text.

## Content rules
- Every question is lettered, one question per letter. Bullets are only for statements.
- Generous writing space. Never shrink it to save pages.
- Pre-draw tables and matrices. Every column header says what goes in the cell and how to get it.
- Clean small numbers. No chains where one slip in (a) ruins (b) to (d).
- Source line on each task: book, section, PDF and printed pages. Mark made-up examples as made up.
- No answer key on the sheet. Keep the key separately.
- Before handing it over, have a second agent solve it from the text alone and flag anything vague.
- Render pages to PNG and look at them. Check nothing spills onto a near-empty page.

## Build
`pixi run typst compile --root . --font-path ~/Documents/fonts --input day=1 "transformers/day 01.typ"`
- `--input day=N` picks the palette. `sheet()` refuses to compile if it is missing or doesn't match `sheet(day: N)`.
