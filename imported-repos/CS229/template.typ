#let q_counter = counter("question")

#let sheet(day: "01", title: "", body) = {
  set page(
    width: 6.2in,
    height: 8.27in,
    margin: (x: 0.5in, y: 0.6in),
    header: context {
      let total_q = q_counter.final().at(0)
      [
        *CS229* #h(1fr) Day #day: #title #h(1fr) #total_q Questions
        #v(-0.5em)
        #line(length: 100%, stroke: 0.5pt)
      ]
    }
  )
  set text(font: "New Computer Modern", size: 11pt)
  show math.equation: set text(size: 12pt)
  body
}

#let question(body, space: 1.5in) = {
  q_counter.step()
  v(1em)
  context [*Q#q_counter.get().at(0).* ]
  body
  v(space)
}

#let subpart(label: "a", body, space: 1in) = {
  v(0.5em)
  [*(#label)* ]
  body
  v(space)
}

#let reference-box(body) = {
  rect(fill: luma(245), width: 100%, inset: 10pt, radius: 2pt, body)
}

#let grading-callout(body) = {
  rect(stroke: (left: 2pt + black, rest: 0pt), fill: luma(250), width: 100%, inset: 10pt, body)
}

#let timer-table(..sections) = {
  let rows = ()
  let total_time = 0
  for s in sections.pos() {
    rows.push(s.at(0))
    rows.push(str(s.at(1)) + " min")
    rows.push("")
    total_time += s.at(1)
  }
  align(center)[
    #table(
      columns: (2in, 1in, 1.5in),
      align: (left, right, left),
      [*Section*], [*Est.*], [*Actual*],
      ..rows,
      [*Total*], [*#total_time min*], []
    )
  ]
}

#let closing-block() = {
  v(1fr)
  align(center)[*End of Day*]
}
