#let question_counter = counter("question")

#let sheet(day: "01", title: "", set_label: none, body) = {
  set page(
    width: 6.2in, 
    height: 8.27in,
    margin: (top: 0.8in, bottom: 0.6in, left: 0.5in, right: 0.5in),
    header: context {
      let total = question_counter.final().first()
      align(right, text(size: 10pt, fill: luma(100), weight: "bold")[
        #if set_label == none [Day #day] else [#set_label] — #title — #total Questions
      ])
    }
  )
  set text(font: "Libertinus Serif", size: 11pt)
  set par(justify: true)
  
  align(center, text(size: 18pt, weight: "bold")[ #if set_label == none [Daily Synthesis — Day #day] else [#set_label] ])
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

#let question(space: 1.5in, gap: 1em, body) = {
  question_counter.step()
  v(gap)
  context [
    *Q#question_counter.get().first().* #body
  ]
  if space > 0pt { block(height: space, width: 100%)[] }
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

// Day 20 onward: ordered, inclusive daily budget. Legacy timer_table remains for old sheets.
#let daily_timer(review: 10, math: 20, ml: 0, biology: 20, stats: 5, buffer: 5, compact: false, calculus: 0, short_session: false, math_label: "Genotype likelihoods") = {
  let total = review + math + ml + biology + stats + buffer + calculus
  assert(total <= 60, message: "Required daily work must fit within 60 minutes")
  if compact {
    if short_session {
      text(size: 9pt)[Recall #review min · #if math > 0 [#math_label #math min · ]#if ml > 0 [ML #ml min · ]Calculus #calculus min. *Cap: #total min.*]
    } else {
    text(size: 9pt)[Recall #review min · Popgen #math min · ML #ml min · Bio #biology min · Stats #stats min. *Cap: #total min.*]
    }
  } else {
  table(columns: (1fr, 55pt), inset: 5pt, stroke: 0.5pt + luma(160),
    [*Section*], [*Minutes*],
    [1. Spaced repetition], [#review],
    [2. Math], [#math],
    ..if ml > 0 { ([ML foundations], [#ml]) } else { () },
    [3. Biology], [#biology],
    [4. Stats], [#stats],
    [Buffer], [#buffer],
    [*Total cap*], [*#total*],
  )
  }
}
