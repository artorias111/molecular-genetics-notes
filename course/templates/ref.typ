// ============================================================================
// ref.typ — shared template for the written-up reference notes, rendered for
// READING on the Kindle Scribe rather than writing on. Same 6.2in x 8.27in
// page as scribe.typ, so a page fills the screen; no answer space, tighter
// leading, and headings that survive being skimmed.
//
// Generated from course/reference/*.md by course/refbuild.py — don't hand-edit
// the .typ files it produces; edit the Markdown, which stays the source.
// ============================================================================

#let note(title: "", source: none, body) = {
  set page(
    width: 6.2in,
    height: 8.27in,
    margin: (x: 1.0cm, top: 1.0cm, bottom: 0.9cm),
    numbering: "1 / 1",
    number-align: center,
  )
  set text(font: "New Computer Modern", size: 11pt)
  set par(justify: true, leading: 0.68em)

  show heading.where(level: 1): it => block(above: 0pt, below: 8pt)[
    #text(15pt, weight: "bold")[#it.body]
  ]
  show heading.where(level: 2): it => block(above: 16pt, below: 6pt, breakable: false)[
    #line(length: 100%, stroke: 0.6pt)
    #v(3pt)
    #text(12.5pt, weight: "bold")[#it.body]
  ]
  show heading.where(level: 3): it => block(above: 12pt, below: 4pt, breakable: false)[
    #text(11pt, weight: "bold")[#it.body]
  ]
  show heading.where(level: 4): it => block(above: 10pt, below: 3pt)[
    #text(10.5pt, style: "italic")[#it.body]
  ]

  set list(indent: 6pt, spacing: 7pt)
  set enum(indent: 6pt, spacing: 7pt)
  show raw.where(block: false): it => box(
    fill: luma(240), inset: (x: 2pt, y: 0pt), outset: (y: 2pt), radius: 2pt,
  )[#text(9.5pt)[#it]]

  text(15pt, weight: "bold")[#title]
  v(2pt)
  line(length: 100%, stroke: 0.8pt)
  if source != none {
    v(3pt)
    text(9pt, fill: luma(80))[#source]
  }
  v(6pt)

  body
}

// A quoted / set-apart statement — the "hold onto this" lines in the notes.
#let pull(body) = block(
  fill: luma(248), stroke: (left: 2pt + luma(175)), inset: (x: 9pt, y: 7pt),
  width: 100%, above: 9pt, below: 9pt,
)[#text(10pt)[#body]]

// A fenced code block: mechanisms written as arrow diagrams, mostly.
#let codeblock(body) = block(
  fill: luma(243), inset: 7pt, radius: 3pt, width: 100%,
  above: 9pt, below: 9pt, breakable: false,
)[#text(9pt, font: "DejaVu Sans Mono")[#body]]

// Section divider (a `---` rule in the Markdown).
#let sep() = block(above: 12pt, below: 12pt)[
  #align(center)[#text(10pt, fill: luma(150))[· · ·]]
]
