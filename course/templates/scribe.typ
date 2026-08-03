// ============================================================================
// scribe.typ — shared template for daily problem sets, sized for the
// Kindle Scribe (10.2", 1860 x 2480 px @ 300 ppi = 6.2in x 8.27in).
//
// The page size matches the screen exactly, so a sheet fills the display with
// no pinch-zooming and no letterboxing. Every question reserves blank space to
// write the answer in, so the whole set is answered on the device itself.
//
// Usage in a day file:
//   #import "../../../templates/scribe.typ": *      // depth depends on folder
//   #show: sheet.with(title: "M1 · Day 07 — ...", reading: "...", budget: "30 min")
//
// Compile from course/:  ./build.sh modules/m1-replication-fork/problems/day-07.typ
// (the --root flag in build.sh is required — the template import escapes the
// day file's own directory, and typst sandboxes to the root)
// ============================================================================

#let QUESTIONS = counter("questions")

// ---- page + type ------------------------------------------------------------
#let sheet(
  title: "",
  subtitle: "",
  reading: none, // e.g. "§11.10–11.11, pp. 1027–1039"
  budget: none, // e.g. "30 min"
  intro: none,
  drill: (), // array of 5 drill prompts — becomes page 1, see below
  drill-budget: "4 min",
  drill-space: 2.2cm,
  body,
) = {
  set page(
    width: 6.2in,
    height: 8.27in,
    margin: (x: 0.95cm, top: 1.0cm, bottom: 0.9cm),
    numbering: "1 / 1",
    number-align: center,
  )
  set text(font: "New Computer Modern", size: 11pt)
  set par(justify: true, leading: 0.7em)

  let titlebar = {
    text(13pt, weight: "bold")[#title]
    if subtitle != "" [ #h(1fr) #text(9pt, fill: luma(90))[#subtitle] ]
    v(2pt)
    line(length: 100%, stroke: 0.8pt)
    v(3pt)
  }

  // ---- page 1: the drill ----------------------------------------------------
  // Spaced-repetition recall, cold and book closed, before anything else. It gets
  // its own page so nothing on it can be read off the day set, and nothing from
  // the day set — not even the reading range — is visible while answering it.
  // Drill items do NOT go through q(): they must not inflate the question count,
  // and the card count below is taken from the array, so it can't be asserted wrong.
  if drill.len() > 0 {
    titlebar
    text(11.5pt, weight: "bold")[Drill · #drill.len() cards]
    h(1fr)
    text(9pt, fill: luma(90))[cold · book closed · #drill-budget]
    v(3pt)
    text(9pt, fill: luma(70))[
      Fragments, not sentences — spelling and wording are not marked. *A blank is a cleaner
      signal than a guess*, so leave one. Don't turn back to this page once the set starts.
      I mark these off the PDF you send back, and the boxes move then.
    ]
    for (i, item) in drill.enumerate() {
      block(above: 10pt, below: 0pt, breakable: false)[
        #text(weight: "bold")[D#(i + 1)] #text(10pt)[#item]
      ]
      v(drill-space)
    }
    pagebreak()
  }

  titlebar

  // The question count is computed by the document itself, so the stated size
  // is always the true size.
  text(9pt, fill: luma(70))[
    #if budget != none [*Budget:* #budget · ]
    *#context QUESTIONS.final().first() questions.*
    #if reading != none [ *Reading:* #reading ]
  ]
  if intro != none {
    v(3pt)
    text(9.5pt, fill: luma(70))[#intro]
  }
  v(4pt)

  body
}

// ---- structure --------------------------------------------------------------
#let part(t) = block(above: 14pt, below: 7pt, breakable: false)[
  #line(length: 100%, stroke: 0.6pt)
  #v(2pt)
  #text(11.5pt, weight: "bold")[#t]
]

// Grey box: reading targets, pre-flight lists, reference facts, format rules.
#let refbox(body) = block(
  fill: luma(243), inset: 8pt, radius: 3pt, width: 100%,
  above: 8pt, below: 8pt, breakable: false,
)[#text(9.5pt)[#body]]

// Left-barred box: the grading note / "here is what last set showed" callout.
#let callout(body) = block(
  fill: luma(248), stroke: (left: 2pt + luma(180)), inset: (x: 9pt, y: 8pt),
  width: 100%, above: 7pt, below: 8pt,
)[#text(9.5pt)[#body]]

// ---- questions --------------------------------------------------------------
// Every call bumps the counter, so the header count stays honest.
// `space` is the handwriting room given to this question.
#let q(label, body, space: 3.5cm) = {
  QUESTIONS.step()
  block(above: 10pt, below: 0pt, breakable: false)[
    #text(weight: "bold")[#label] #body
  ]
  v(space)
}

// (a) / (b) inside a question — adds room, does NOT bump the question count.
#let sub(label, body, space: 2.4cm) = {
  block(above: 7pt, below: 0pt, breakable: false)[
    #pad(left: 9pt)[*#label* #body]
  ]
  v(space)
}

// Bare writing space (e.g. after a multi-bullet prompt).
#let work(h) = v(h)

// ---- the timer / hand-back block --------------------------------------------
// Rendered as a fillable table so it can be completed on the device in pen,
// which is the whole point of it being at the top.
#let timers(..rows) = {
  let cell(t) = box(width: 100%, height: 0.85cm, stroke: 0.5pt + luma(170),
    inset: 4pt, baseline: 0pt)[#text(9pt)[#t]]
  block(above: 8pt, below: 8pt, breakable: false)[
    #text(9.5pt, weight: "bold")[Fill this in FIRST — it sets the size of every future set.]
    #v(4pt)
    #grid(
      columns: (1fr, 2.2cm),
      column-gutter: 4pt, row-gutter: 4pt,
      ..rows.pos().map(r => (cell(r), cell[])).flatten(),
    )
    #v(4pt)
    #box(width: 100%, height: 1.7cm, stroke: 0.5pt + luma(170), inset: 4pt)[
      #text(9pt)[Anything else about the day (tired, rushed, interrupted):]
    ]
  ]
}

// ---- misc -------------------------------------------------------------------
#let closing(body) = block(above: 12pt, width: 100%)[
  #line(length: 100%, stroke: 0.5pt + luma(150))
  #v(3pt)
  #text(9pt, fill: luma(80))[#body]
]
