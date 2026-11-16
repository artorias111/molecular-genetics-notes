// Shriram's iPad sheet design. Compile with --font-path ~/Documents/fonts. Mono only for source lines and code.
// White pages, accent accents, from the blog light theme. Red marks today and the query.

#import "palettes.typ": palettes

#let ink = rgb("#1c1c1c")
#let muted = rgb("#6b6b6b")
#let line-c = rgb("#d6d6d6")
#let marker = rgb("#ec5b38")

#let input-day = int(sys.inputs.at("day", default: "0"))
#let pal = palettes.at(calc.rem(calc.max(input-day, 1) - 1, palettes.len()))
#let accent = rgb(pal.accent)
#let pop = rgb(pal.pop)
#let tint = if pal.tint != none { rgb(pal.tint) } else { color.mix((accent, 8%), (white, 92%)) }
#let soft = color.mix((accent, 30%), (white, 70%))

#let serif = "Solway"
#let sans = "Google Sans"
#let mono = "Google Sans Code"
#let hand = "Mansalva"

#let total-days = 69
#let task-counter = counter("task")
#let letter-counter = counter("letter")

#let progress(day) = {
  let cells = ()
  for i in range(1, total-days + 1) {
    let c = if i < day { soft } else if i == day { marker } else { line-c }
    cells.push(box(width: 1fr, height: 3.5pt, radius: 1.5pt, fill: c))
    if i < total-days {
      cells.push(h(if i in (9, 10, 15, 19, 23, 27, 33, 38, 44, 50, 58, 61, 67) { 5pt } else { 1.6pt }))
    }
  }
  box(width: 100%, cells.join())
}

#let dotgrid(color) = tiling(size: (11pt, 11pt))[
  #place(dx: 5pt, dy: 5pt, circle(radius: 0.6pt, fill: color))
]

#let sheet(day: 1, topic: "", body) = {
  assert(input-day == day, message: "compile with --input day=" + str(day) + " so the palette matches the day")
  set page(
    width: 6.21in,
    height: 8.94in,
    margin: (top: 0.7in, bottom: 0.55in, left: 0.45in, right: 0.45in),
    header: context {
      set text(size: 7.5pt, fill: muted)
      progress(day)
      v(-4pt)
      grid(columns: (1fr, auto),
        [day #str(day) of #total-days · #lower(topic)],
        [#counter(page).display("1")])
    },
  )
  set text(font: sans, size: 10.5pt, fill: ink)
  set par(justify: false, leading: 0.62em, spacing: 0.9em)
  set list(marker: text(fill: accent)[•], indent: 0.2em, spacing: 0.6em)
  show math.equation: set text(font: "Noto Sans Math")
  show raw: set text(font: mono, size: 9.5pt)
  show strong: set text(weight: 600)
  body
}

#let kicker(body, color: accent) = text(size: 9pt, weight: 600, fill: color, body)

#let cover(day: 1, title: "", subtitle: "", minutes: "", pipeline: (), now: 0) = {
  grid(columns: (auto, 1fr), column-gutter: 12pt, align: (top, bottom),
    text(font: serif, size: 44pt, weight: 800, fill: accent)[#if day < 10 [0]#day],
    text(font: serif, size: 18pt, weight: 700, fill: ink, title),
  )
  v(2pt)
  text(size: 10.5pt, fill: muted, subtitle)
  v(2pt)
  if pipeline.len() > 0 {
    let parts = ()
    for (i, p) in pipeline.enumerate() {
      let hot = i == now
      parts.push(box(
        inset: (x: 5pt, y: 4pt), radius: 4pt,
        fill: if hot { accent } else { white },
        stroke: 0.6pt + if hot { accent } else { line-c },
        text(size: 8pt, fill: if hot { white } else { ink }, weight: if hot { 600 } else { 400 }, p)))
    }
    parts.join(h(2pt) + text(fill: muted, size: 8pt)[→] + h(2pt))
  }
  h(1fr)
  text(size: 8.5pt, fill: muted)[#minutes]
  v(4pt)
  line(length: 100%, stroke: 0.6pt + line-c)
  v(4pt)
}

#let define(term, body) = block(
  width: 100%, inset: (left: 10pt, y: 7pt, right: 8pt),
  stroke: (left: 2pt + accent), fill: tint, radius: (right: 4pt),
)[
  #text(font: serif, weight: 700, fill: ink, term) \
  #body
]

#let aside(body, color: accent, angle: -1.5deg) = align(right, rotate(angle, reflow: true,
  box(width: 85%, text(font: hand, size: 13pt, fill: color, body))))

#let source(body) = block(width: 100%, above: 4pt, below: 10pt,
  text(font: mono, size: 7.5pt, fill: muted, body))

#let task(kind: "see", minutes: 5, title: "", src: none, body) = {
  task-counter.step()
  letter-counter.update(0)
  v(4pt)
  block(width: 100%, below: 6pt, grid(
    columns: (auto, 1fr, auto), column-gutter: 9pt, align: (horizon, horizon, horizon),
    box(width: 26pt, height: 26pt, radius: 13pt, fill: accent,
      align(center + horizon, text(font: serif, size: 14pt, weight: 800, fill: white, context task-counter.display()))),
    text(font: serif, size: 15pt, weight: 700, fill: ink, title),
    box(inset: (x: 6pt, y: 3pt), radius: 8pt, stroke: 0.6pt + accent,
      text(size: 8pt, fill: accent, weight: 600)[#kind · #minutes min]),
  ))
  if src != none { source(src) }
  body
}

#let ask(answer: none, body) = {
  letter-counter.step()
  let label = text(weight: 700, fill: accent, context [(#letter-counter.display("a"))])
  block(width: 100%, above: 10pt, below: 6pt,
    if answer == none { grid(columns: (20pt, 1fr), column-gutter: 2pt, label, body) }
    else { grid(columns: (20pt, 1fr, auto), column-gutter: (2pt, 10pt), align: (top, top, horizon), label, body, answer) })
}

#let work(height, label: none) = block(
  width: 100%, breakable: false, height: height, radius: 6pt, above: 4pt, below: 8pt,
  fill: dotgrid(soft), stroke: 0.6pt + soft,
  if label != none { pad(6pt, text(size: 7.5pt, fill: soft.darken(20%), label)) },
)

#let slot(w: 0.66in, h: 0.42in) = box(width: w, height: h, radius: 3pt, stroke: 0.7pt + accent, fill: white, baseline: 30%)

#let takeaway(prompt, room: 0.7in) = block(
  width: 100%, inset: 10pt, radius: 6pt, fill: tint, above: 12pt,
)[
  #kicker(color: accent)[In my own words]
  #v(1pt)
  #text(size: 9.5pt, fill: muted, prompt)
  #v(room)
]

#let next-up(day, body) = block(width: 100%, inset: (x: 10pt, y: 7pt), radius: 6pt, stroke: 0.8pt + accent, above: 8pt)[
  #text(size: 9pt, fill: accent, weight: 600)[next, day #day] #h(6pt)
  #text(size: 9.5pt, fill: ink, body)
]

// 2D vector plot: grid from (x0,y0) to (x1,y1), unit u. vecs: ((x, y, label, color), ...)
#let vec-plot(x0: -3, x1: 5, y0: -2, y1: 3, u: 0.3in, vecs: (), grid-c: line-c, axis-c: muted, show-grid: true) = {
  let W = (x1 - x0) * u
  let H = (y1 - y0) * u
  let px(x) = (x - x0) * u
  let py(y) = (y1 - y) * u
  box(width: W, height: H, {
    if show-grid {
      for i in range(x0, x1 + 1) {
        place(top + left, line(start: (px(i), 0pt), end: (px(i), H), stroke: if i == 0 { 0.9pt + axis-c } else { 0.4pt + grid-c }))
      }
      for j in range(y0, y1 + 1) {
        place(top + left, line(start: (0pt, py(j)), end: (W, py(j)), stroke: if j == 0 { 0.9pt + axis-c } else { 0.4pt + grid-c }))
      }
    }
    for (x, y, lab, c) in vecs {
      let len = calc.sqrt(x * x + y * y)
      let ux = x / len
      let uy = -y / len
      let tx = px(x)
      let ty = py(y)
      let hl = 8pt
      let hw = 3.6pt
      let bx = tx - ux * hl
      let by = ty - uy * hl
      place(top + left, line(start: (px(0), py(0)), end: (bx, by), stroke: 1.6pt + c))
      place(top + left, polygon(fill: c, stroke: none,
        (tx, ty), (bx - uy * hw, by + ux * hw), (bx + uy * hw, by - ux * hw)))
      place(top + left, dx: tx + ux * 9pt - 9pt, dy: ty + uy * 9pt - 6pt,
        box(width: 18pt, align(center, text(size: 9.5pt, weight: 700, fill: c, lab))))
    }
  })
}

// Blank matrix with bracket sides, optional row/col labels
#let blank-matrix(rows: 2, cols: 2, cw: 0.5in, ch: 0.36in, row-labels: none, col-labels: none, filled: (:)) = {
  let cells = ()
  if col-labels != none {
    if row-labels != none { cells.push([]) }
    for c in col-labels { cells.push(align(center, text(size: 8pt, fill: muted, c))) }
  }
  for r in range(rows) {
    if row-labels != none { cells.push(align(right + horizon, text(size: 8pt, fill: muted, row-labels.at(r)))) }
    for c in range(cols) {
      let key = str(r) + "," + str(c)
      cells.push(box(width: cw, height: ch, radius: 2pt, stroke: 0.6pt + soft, fill: white,
        align(center + horizon, text(size: 9.5pt, filled.at(key, default: [])))))
    }
  }
  let ncols = cols + if row-labels != none { 1 } else { 0 }
  grid(columns: ncols, column-gutter: 3pt, row-gutter: 3pt, ..cells)
}
