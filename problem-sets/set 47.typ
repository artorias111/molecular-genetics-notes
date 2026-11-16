#import "../template.typ": *
#let source(body) = { set text(size: 8pt); ref_box(body) }

#let sfs_plot(vals, ymax: 60, h: 1.3in, w: 0.32in, gap: 0.06in, label: none) = {
  let n = vals.len()
  let width = n * (w + gap)
  box(width: width + 0.4in, height: h + 0.45in)[
    #place(top + left, dx: 0.35in, line(start: (0pt, 0pt), end: (0pt, h), stroke: 0.6pt))
    #place(top + left, dx: 0.35in, dy: h, line(start: (0pt, 0pt), end: (width, 0pt), stroke: 0.6pt))
    #for t in (0, 20, 40, 60).filter(t => t <= ymax) {
      place(top + left, dx: 0in, dy: h - h * t / ymax - 4pt, text(size: 7pt)[#t])
      place(top + left, dx: 0.32in, dy: h - h * t / ymax, line(start: (0pt, 0pt), end: (3pt, 0pt), stroke: 0.6pt))
    }
    #for (i, v) in vals.enumerate() {
      let bh = h * v / ymax
      place(top + left, dx: 0.35in + gap / 2 + i * (w + gap), dy: h - bh, rect(width: w, height: bh, fill: luma(170), stroke: 0.4pt))
      place(top + left, dx: 0.35in + gap / 2 + i * (w + gap) + w / 2 - 3pt, dy: h + 3pt, text(size: 8pt)[#(i + 1)])
    }
  ]
}
#let labeled(label, plot) = stack(spacing: 4pt, text(size: 9pt, weight: "bold")[#label], plot)

#let blank_plot(n: 9, ymax: 60, h: 1.3in) = sfs_plot(range(n).map(i => 0), ymax: ymax, h: h)

#sheet(day: "47", title: "What shapes an SFS", set_label: "set 47")[
#set text(size: 10pt)
#set par(spacing: 0.6em)
#text(size: 9pt)[SFS and population history · about 20 min. *Stop at 25.*]
#parbreak()
Core: Q1 (6 minutes). The three questions are independent.

#ref_box[
*Setup for the whole sheet.* Sample 5 diploid individuals from a population, so 10 chromosome copies. At each SNP, an outgroup tells you which allele is *derived* (the newer mutation). The *derived count* is how many of the 10 copies carry it, 1 to 9. The *unfolded SFS* is a bar chart: for each derived count, how many SNPs have it.
]

#source[Neutral SFS shape: Fu (1995), _Theor. Popul. Biol._ 48:172–197. Tutor question.]
#question(space: 0.3in, gap: 0em)[
*Core: predict the neutral shape · 6 minutes.* A population has been the same size for a very long time, with no selection. Every new mutation starts as 1 copy in the whole population. Each generation, its copy number drifts up or down at random. Most new mutations drift back to 0 and are lost. A few drift up.

- Sketch the SFS you expect on the axes below (100 SNPs total). Shape only.
- One sentence: which bar is tallest, and why?
- One sentence: why are SNPs at derived count 9 rare, but not absent?
]
#align(center, blank_plot())
#v(0.9in)

#pagebreak()
#ref_box[
*Three populations, 100 SNPs each, toy numbers.* One of them stayed constant in size. One crashed to about 20 individuals a few generations ago, then recovered. One grew from about 1,000 to about 1,000,000 over recent history.
#grid(columns: (1fr, 1fr, 1fr), column-gutter: 4pt,
  align(center, labeled("Population X", sfs_plot((15, 14, 13, 12, 11, 10, 9, 8, 8), h: 1.0in, w: 0.1in, gap: 0.04in))),
  align(center, labeled("Population Y", sfs_plot((60, 13, 7, 5, 4, 3, 3, 3, 2), h: 1.0in, w: 0.1in, gap: 0.04in))),
  align(center, labeled("Population Z", sfs_plot((33, 19, 12, 10, 7, 6, 5, 4, 4), h: 1.0in, w: 0.1in, gap: 0.04in))),
)
x axis: derived count (1 to 9). y axis: number of SNPs.
]

#pagebreak()
#source[Growth and rare variants: Keinan & Clark (2012), _Science_ 336:740–743. Rare-variant excess and deficit: Tajima (1989), _Genetics_ 123:585–595; refresher day 4, §4. Tutor toy numbers.]
#question(space: 0in, gap: 0em)[
*Match each SFS to its history · 8 minutes.* Use the three spectra on the previous page.
]
#subpart(space: 1.2in)[*The crash.* 2,000 chromosome copies before; a random 40 survive (20 individuals). A variant on 2% of copies is lost if none of the 40 carry it: compute $0.98^40$. Compare a variant at 50%. Which part of the SFS is depleted after a crash?]
#subpart(space: 1.1in)[*The growth.* After a 1,000-fold increase, most SNPs in the sample arose after the growth began. What does that imply about their frequencies, and which part of the SFS is inflated?]
#subpart(space: 0.6in)[Match: X is \_\_\_\_\_\_\_\_\_\_\_\_, Y is \_\_\_\_\_\_\_\_\_\_\_\_, Z is \_\_\_\_\_\_\_\_\_\_\_\_. Human populations grew explosively over the last few thousand years. Which of X, Y, Z should the human SFS resemble?]

#pagebreak()
#source[Genotype calling and SFS bias at low depth: Nielsen et al. (2011), _Nat. Rev. Genet._ 12:443–451. Estimating the SFS without calls: #link("https://popgen.dk/angsd/index.php/RealSFSmethod")[ANGSD, realSFS method] (web source). Tutor question.]
#question(space: 2.2in, gap: 0em)[
*Low depth and hard calls · 6 minutes.* Population W is known from other data to have been constant in size. It was sequenced at exactly 2 reads per individual per site, and genotypes were hard-called (AT only if both bases appear, otherwise AA or TT). Its count-1 bar comes out at about half the neutral expectation, as if it had crashed.

Take one heterozygous individual (AT) with exactly 2 reads, perfect sequencer. Each read comes from one of its two copies, 50/50, independently.

- Chance both reads come from the A copy? From the T copy? Chance the individual is called homozygous?
- A true singleton sits in one AT individual (T derived). Where does the SNP end up in W's SFS in each of the three read outcomes? Why does the count-1 bar shrink by about half?
]
#subpart(space: 0.8in)[Real crash or artifact? What does realSFS use instead of hard calls?]

#pagebreak()
#ref_box[
*Check your Q1 sketch (after finishing).* For a constant-size neutral population, the expected number of SNPs at derived count $i$ is proportional to $1\/i$. With 100 SNPs and 10 copies, that comes out to about:
#align(center, labeled("Constant size", sfs_plot((35, 18, 12, 9, 7, 6, 5, 4, 4))))
Count 1 (singletons) is tallest. Count 2 has about half as many, count 3 about a third, and so on.
]

]
