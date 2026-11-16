// Daily palette pool, from Color Hunt popular palettes (colorhunt.co), vetted for white pages.
// accent: text-safe on white (contrast >= 4.5). pop: saturated, visible, different hue from accent.
// tint: palette's lightest color when light enough, else none (derived from accent).
// Day N uses palette (N - 1) mod 8.

#let palettes = (
  (name: "cobalt", accent: "#1746a2", pop: "#ff731d", tint: "#fff7e9", from: "ff731d fff7e9 5f9df7 1746a2"),
  (name: "navy coral", accent: "#2b3467", pop: "#eb455f", tint: none, from: "eb455f fcffe7 bad7e9 2b3467"),
  (name: "forest", accent: "#395144", pop: "#aa8b56", tint: "#f0ebce", from: "395144 4e6c50 aa8b56 f0ebce"),
  (name: "plum", accent: "#5d1c6a", pop: "#ca5995", tint: "#fff1d3", from: "fff1d3 ffb090 ca5995 5d1c6a"),
  (name: "harbor", accent: "#2c687b", pop: "#db1a1a", tint: "#fff6f6", from: "db1a1a fff6f6 8cc7c4 2c687b"),
  (name: "sunset", accent: "#155263", pop: "#ff6f3c", tint: none, from: "155263 ff6f3c ff9a3c ffc93c"),
  (name: "cocoa", accent: "#492828", pop: "#84934a", tint: "#ececec", from: "ececec 84934a 656d3f 492828"),
  (name: "rust", accent: "#ae431e", pop: "#8a8635", tint: none, from: "d06224 ae431e 8a8635 e9c891"),
)
