#import "palettes.typ": palettes
#set page(width: 6.21in, height: 8.94in, margin: 0.4in)
#set text(font: "Google Sans", size: 9pt)
#for (i, p) in palettes.enumerate() {
  let a = rgb(p.accent)
  let t = if p.tint != none { rgb(p.tint) } else { color.mix((a, 8%), (white, 92%)) }
  let s = color.mix((a, 30%), (white, 70%))
  block(width: 100%, inset: 8pt, radius: 6pt, fill: t, stroke: (left: 2pt + a), below: 6pt, grid(columns: (1fr, auto), align: horizon,
    [#text(font: "Solway", size: 13pt, weight: 700, fill: a)[day #(i+1), #(i+9), #(i+17), #(i+25) · #p.name] \ #text(fill: a, weight: 700)[(a)] question text in ink, with a #text(fill: rgb(p.pop), weight: 700)[query q] in the pop colour],
    stack(dir: ltr, spacing: 3pt, ..(a, rgb(p.pop), s, t).map(c => box(width: 22pt, height: 22pt, radius: 3pt, fill: c, stroke: 0.5pt + luma(200))))))
}
