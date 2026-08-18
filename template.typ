#let question_counter = counter("question")

#let sheet(day: "01", title: "", body) = {
  set page(
    width: 6.2in, 
    height: 8.27in,
    margin: (top: 0.8in, bottom: 0.6in, left: 0.5in, right: 0.5in),
    header: context {
      let total = question_counter.final().first()
      align(right, text(size: 10pt, fill: luma(100), weight: "bold")[
        Day #day — #title — #total Questions
      ])
    }
  )
  set text(font: "Linux Libertine", size: 11pt)
  set par(justify: true)
  
  align(center, text(size: 18pt, weight: "bold")[Daily Synthesis — Day #day])
  v(1em)
  
  body
}

#let section_heading(title) = {
  v(1.5em)
  text(size: 14pt, weight: "bold", title)
  v(0.5em)
}

#let timer_table(genetics: none, math: none, code: none, stats: none, total: none) = {
  align(center)[
    #table(
      columns: (100pt, 100pt),
      align: center,
      stroke: 0.5pt,
      [*Section*], [*Time*],
      ..if genetics != none { ("Genetics", genetics) } else { () },
      ..if math != none { ("Math/ML", math) } else { () },
      ..if code != none { ("CS/Code", code) } else { () },
      ..if stats != none { ("Stats", stats) } else { () },
      [*Total*], [*#total*]
    )
  ]
}

#let question(space: 1.5in, body) = {
  question_counter.step()
  v(1em)
  context [
    *Q#question_counter.get().first().* #body
  ]
  block(height: space, width: 100%)[]
}

#let subpart(space: 0.5in, body) = {
  v(0.5em)
  pad(left: 1.5em)[
    • #body
    #block(height: space, width: 100%)[]
  ]
}

#let ref_box(body) = {
  v(0.5em)
  rect(
    fill: luma(240),
    stroke: 0.5pt + luma(150),
    radius: 4pt,
    width: 100%,
    inset: 10pt,
    body
  )
  v(0.5em)
}

#let grade_callout(body) = {
  pad(left: 10pt, block(
    stroke: (left: 2pt + luma(100)),
    inset: (left: 10pt, top: 5pt, bottom: 5pt),
    body
  ))
}

#let code_block(lang: "", source) = {
  v(0.5em)
  let lines = source.split("\n")
  let numbered = lines.enumerate().map(p => {
    let (i, l) = p
    let num = str(i + 1)
    if num.len() == 1 { num = " " + num }
    num + " | " + l
  }).join("\n")

  block(
    fill: luma(250),
    stroke: 0.5pt + luma(200),
    inset: 10pt,
    width: 100%,
    radius: 4pt,
    [
      #raw(numbered, lang: lang, block: true)
    ]
  )
  v(0.5em)
}

#let closing_block() = {
  v(2em)
  align(center)[
    *End of Day* \
    Stop the timer. Return the sheet as-is — don't check anything first.
  ]
}
