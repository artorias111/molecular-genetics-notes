// Template for the Chapter 3 refresher series (read + answer, ~1-1.5 h/day).
// A5 geometry matches problem-sets/template.typ so it fits the e-ink tablet.
// Font is Libertinus Serif (Linux Libertine is not installed on this machine).

#let question_counter = counter("question")

#let sheet(day: "1", title: "", strap: "", body) = {
  set page(
    width: 6.2in,
    height: 8.27in,
    margin: (top: 0.75in, bottom: 0.6in, left: 0.5in, right: 0.5in),
    header: context {
      let total = question_counter.final().first()
      align(right, text(size: 8.5pt, fill: luma(110), weight: "bold")[
        Ch.3 Refresher — Day #day — #total questions
      ])
    },
    footer: context align(center, text(size: 8.5pt, fill: luma(130))[
      #counter(page).display("1")
    ])
  )
  set text(font: "Libertinus Serif", size: 10pt)
  set par(justify: true, leading: 0.62em)
  show heading.where(level: 1): it => {
    v(0.4em)
    text(size: 12.5pt, weight: "bold", it.body)
    v(0.25em)
  }
  show heading.where(level: 2): it => {
    v(0.5em)
    text(size: 10.5pt, weight: "bold", style: "italic", it.body)
    v(0.1em)
  }

  align(center)[
    #text(size: 16pt, weight: "bold")[Day #day]
    #v(-0.4em)
    #text(size: 12.5pt, weight: "bold")[#title]
    #v(-0.3em)
    #text(size: 9.5pt, style: "italic", fill: luma(90))[#strap]
  ]
  v(0.6em)
  line(length: 100%, stroke: 0.5pt + luma(160))
  v(0.4em)

  body
}

// Time budget box
#let budget(read: none, answer: none, total: none) = {
  align(center)[
    #table(
      columns: (1.4in, 0.8in),
      align: (left, center),
      stroke: 0.4pt + luma(170),
      inset: 5pt,
      text(size: 9pt)[*Segment*], text(size: 9pt)[*Time*],
      text(size: 9pt)[Reading], text(size: 9pt)[#read],
      text(size: 9pt)[Questions], text(size: 9pt)[#answer],
      text(size: 9pt, weight: "bold")[Total], text(size: 9pt, weight: "bold")[#total],
    )
  ]
  v(0.4em)
}

// A boxed "hold on to this" statement
#let key(body) = {
  v(0.4em)
  block(
    fill: luma(243),
    stroke: (left: 2pt + luma(110)),
    inset: (left: 9pt, right: 9pt, top: 7pt, bottom: 7pt),
    width: 100%,
    radius: (right: 3pt),
    text(size: 9.5pt, body)
  )
  v(0.4em)
}

// A warning / trap box
#let trap(body) = {
  v(0.4em)
  block(
    fill: rgb("#f7f2e8"),
    stroke: 0.6pt + rgb("#b9a06a"),
    inset: 9pt,
    width: 100%,
    radius: 3pt,
    text(size: 9.5pt, body)
  )
  v(0.4em)
}

// Display equation with a little air
#let eq(body) = {
  v(0.3em)
  align(center, body)
  v(0.3em)
}

// Sources block at the end of the reading
#let sources(body) = {
  set par(leading: 0.5em)
  v(0.6em)
  block(
    breakable: false,
    stroke: (top: 0.6pt + luma(150), bottom: 0.6pt + luma(150)),
    inset: (top: 6pt, bottom: 6pt),
    width: 100%,
    [
      #text(size: 9pt, weight: "bold")[Sources for today] \
      #v(0.2em)
      #text(size: 8pt, body)
    ]
  )
  v(0.5em)
}

// Question with handwriting space
#let question(space: 1.5in, tag: none, body) = {
  question_counter.step()
  v(0.7em)
  context [
    #text(weight: "bold")[Q#question_counter.get().first().]
    #if tag != none [ #h(0.3em) #box(fill: luma(235), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(size: 7.5pt, fill: luma(80), tag)) ]
    #h(0.3em) #body
  ]
  block(height: space, width: 100%)[]
}

#let subpart(space: 0.55in, body) = {
  v(0.35em)
  pad(left: 1.2em)[
    #body
    #block(height: space, width: 100%)[]
  ]
}

// Carry-forward item from the previous day
#let carry(body) = {
  v(0.4em)
  block(
    fill: rgb("#eef3f8"),
    stroke: 0.6pt + rgb("#8fb0cc"),
    inset: 9pt,
    width: 100%,
    radius: 3pt,
    text(size: 9.5pt, body)
  )
  v(0.4em)
}

#let closing(body) = {
  v(1.2em)
  line(length: 100%, stroke: 0.5pt + luma(160))
  v(0.5em)
  align(center, text(size: 9pt, style: "italic", fill: luma(90), body))
}
