#import "/design.typ": *

#set page(
  width: 6.21in, height: 8.94in,
  margin: (top: 0.7in, bottom: 0.55in, left: 0.45in, right: 0.45in),
  header: context {
    set text(size: 7.5pt, fill: muted)
    grid(columns: (1fr, auto), [side quest · DNA in bits], [#counter(page).display("1")])
  },
)
#set text(font: sans, size: 10.5pt, fill: ink)
#set par(justify: false, leading: 0.62em, spacing: 0.9em)
#show math.equation: set text(font: "Noto Sans Math")
#show raw: set text(font: mono, size: 9.5pt)
#show strong: set text(weight: 600)

#let hd(x) = text(size: 8pt, fill: accent, weight: 600, x)
#let b(x) = text(font: mono, size: 9.5pt, x)
#let bitcell(x, hot: false) = box(width: 0.24in, height: 0.26in, radius: 2pt,
  fill: if hot { tint } else { white }, stroke: 0.6pt + if hot { accent } else { soft },
  align(center + horizon, text(font: mono, size: 9.5pt, x)))
#let base(name, bits) = box(inset: (x: 3pt), stack(dir: ttb, spacing: 3pt,
  align(center, text(font: serif, weight: 700, size: 12pt, fill: accent, name)),
  box(bitcell(bits.at(0), hot: true) + h(1pt) + bitcell(bits.at(1), hot: true))))

#grid(columns: (auto, 1fr), column-gutter: 12pt, align: (top, bottom),
  text(font: serif, size: 40pt, weight: 800, fill: accent)[SQ],
  text(font: serif, size: 18pt, weight: 700)[DNA in bits],
)
#v(2pt)
#text(fill: muted)[Every k-mer counter, aligner and BAM file you've used stores DNA as bits, not letters. Four bases fit in two bits, so a 31-mer fits in one 64-bit number, and things like "reverse complement" or "how many mismatches" turn into a couple of bit operations. This sheet is about seeing why that works, by hand, with tiny numbers.]
#v(2pt)
#h(1fr) #text(size: 8.5pt, fill: muted)[side quest · about 45 min, fine to split in two]
#line(length: 100%, stroke: 0.6pt + line-c)

#define[The four operations, quick refresher][On each bit position separately:
  - `&` (AND): 1 only if both are 1. Used to *keep* some bits and zero the rest (a *mask*).
  - `|` (OR): 1 if either is 1. Used to *drop bits into* empty slots.
  - `^` (XOR): 1 if they differ. So `x ^ y` is zero exactly where `x` and `y` agree.
  - `<<` and `>>`: slide every bit left or right. `x << 2` adds two zeros on the right (that's $times 4$). `x >> 2` drops the two rightmost bits.
  Tiny example: `0110 & 0011 = 0010`, `0110 | 0011 = 0111`, `0110 ^ 0011 = 0101`, `0110 << 1 = 1100`.]

#v(4pt)
The encoding everyone uses (BWA, minimap2, Jellyfish, KMC, more or less): alphabetical order, so the bases are just 0, 1, 2, 3.
#v(2pt)
#align(center, base("A", "00") + h(14pt) + base("C", "01") + h(14pt) + base("G", "10") + h(14pt) + base("T", "11"))
#v(2pt)
Call the left bit the *high* bit and the right one the *low* bit. That's all you need. The fun part is how much biology happens to hide in these two bits.

#source[Encoding as used in minimap2 (Li 2018, Bioinformatics 34:3094) and BWA. Bit puzzles are tutor-made.]
#pagebreak()

#task(kind: "see", minutes: 8, title: [The biology hiding in two bits],
  src: [tutor-made, using the A 00, C 01, G 10, T 11 encoding])[
  Just by looking at the four codes on page 1.

  #ask[Complement: A pairs with T, C with G. XOR each base with `11`. What do you get for each one? So what single operation complements a base?]
  #work(0.7in)
  #ask[Compare the high bit and low bit of each base. For which bases are they different? What do those bases have in common? (So `high ^ low` is a one-bit test for something.)]
  #work(0.6in)
  #ask[Look only at the low bit. Which two bases have low bit 0? Remember A and G are purines, C and T are pyrimidines.]
  #work(0.5in)
  #ask[XOR two bases together. A with G, then C with T. These are the *transitions* (purine to purine, pyrimidine to pyrimidine). What do both give?]
  #work(0.5in)
  #ask[Now the four *transversions*: A with C, A with T, G with C, G with T. What do their XORs give? So how can you tell a transition from a transversion with one XOR?]
  #work(0.7in)
  #aside[None of this was designed in. Alphabetical order just got lucky.]
]
#pagebreak()

#task(kind: "do", minutes: 10, title: [Packing and rolling k-mers],
  src: [tutor-made, following the rolling-hash k-mer scan in minimap2 (Li 2018)])[
  To pack a sequence, start at 0 and for each base do `x = (x << 2) | code`. Shift left to make room, then drop the new base's two bits in. Worked example, "AC": start `0`, after A: `00`, after C: `00 01`, which is 1 in decimal.

  #{
    set text(size: 9.5pt)
    table(
      columns: (1.1in, 1.5in, 1fr),
      rows: (auto, 0.38in, 0.38in, 0.38in),
      align: center + horizon,
      stroke: (x, y) => (bottom: 0.6pt + soft, top: if y == 0 { 0.6pt + soft } else { none }),
      fill: (x, y) => if x > 0 and y > 0 { tint } else { none },
      table.header(hd[k-mer], hd[bits, two per base, left to right], hd[decimal (add up the place values: 32, 16, 8, 4, 2, 1)]),
      [TCG], [], [],
      [CGT], [], [],
      [GTA], [], [],
    )
  }
  #ask[Fill in the table. These are the three 3-mers of the sequence TCGTA. Use the table for working.]
  #ask[Packing each 3-mer from scratch is wasteful. Start from TCG and do one step of `(x << 2) | code` with the next base, T. Write the result as 8 bits. Which base is "stuck" on the far left that shouldn't be there?]
  #work(0.45in)
  #ask[A 3-mer needs 6 bits. The mask `111111` (that's 63) keeps the right six bits and zeroes everything above. AND your answer from (b) with it. Do you get CGT from the table?]
  #work(0.45in)
  #ask[Do one more roll, adding A. Do you land on GTA? So every new base costs one shift, one OR and one AND, no matter how long $k$ is.]
  #work(0.45in)
  #ask[A computer word is 64 bits. What's the longest k-mer that fits in one word? (This is a big part of why older tools capped $k$ at 31 or 32, and why many still default to it. Newer ones use two words when they need longer k-mers.)]
  #work(0.45in)
]
#v(8pt)

#task(kind: "do", minutes: 9, title: [Reverse complements and canonical k-mers],
  src: [tutor-made; canonical k-mers as in Jellyfish (Marçais & Kingsford 2011) and minimap2])[
  A read can come from either strand. So TCG on one strand and its reverse complement on the other are really the same place in the genome. Tools count them together by storing only the *canonical* one: whichever of the two packed numbers is smaller.

  #ask[Reverse complement of TCG: complement each base, then read backwards. Use your trick from task 1(a) for the complement step. What do you get?]
  #work(0.45in)
  #ask[TCG is 54 (task 2's table). Pack your answer from (a), and pick the canonical one of the two. Then do the same for GTA: find its reverse complement, pack it, and pick the canonical one.]
  #work(0.8in)
  #ask[Try a 2-mer, AT. What's its reverse complement? Same for CG. What do you notice?]
  #work(0.4in)
  #ask[A k-mer that is its own reverse complement is a headache: you can't tell which strand it came from, and in an assembly graph its node loops back onto itself. Now say $k$ is odd, like 3. For a 3-mer to be its own reverse complement, the middle base would have to equal its own complement. Can any base do that? So what's the advantage of odd $k$ (k = 21, 31) for canonical counting?]
  #work(0.7in)
  #aside[Next time you see k = 21 or k = 31 in a methods section, this is part of why.]
]
#v(8pt)

#task(kind: "do", minutes: 8, title: [Counting mismatches with XOR],
  src: [tutor-made; the same trick shows up in bit-parallel aligners])[
  Two packed 4-mers: ACGT = `00 01 10 11` and GGGA = `10 10 10 00`. XOR is zero wherever bits agree, so a base pair that matches gives `00`, and a mismatch gives something non-zero in that pair.

  #ask[Compute ACGT `^` GGGA, keeping the pairs separate. Which positions are non-zero? Check them against the letters.]
  #work(0.6in)
  #ask[A mismatch pair can be `01`, `10` or `11`, so you can't just count the 1 bits. Here's the fix: OR the XOR with itself shifted right by one, `z | (z >> 1)`, then AND with `01 01 01 01`. Do it for your answer from (a). What's left in each pair?]
  #work(0.9in)
  #ask[Now count the 1s (that's *popcount*, one CPU instruction). How many mismatches? Does it match what you see by eye?]
  #work(0.35in)
  #ask[Look back at your XOR pairs from (a). Using task 1, was each mismatch a transition or a transversion?]
  #work(0.4in)
]
#pagebreak()

#task(kind: "use", minutes: 7, title: [SAM flags are bits too],
  src: [Sequence Alignment/Map format spec (SAMv1), §1.4, the FLAG field | samtools-view man page])[
  Every read in a BAM has a FLAG, one number that packs yes/no facts as separate bits. A few of them:
  #{
    set text(size: 9pt)
    align(center, table(
      columns: 4,
      stroke: 0.4pt + line-c, inset: 4pt, align: (center, center, left, center),
      [*bit*], [*hex*], [*meaning*], [*decimal*],
      [0], [0x1], [read is paired], [1],
      [1], [0x2], [mapped in a proper pair], [2],
      [2], [0x4], [read is unmapped], [4],
      [4], [0x10], [read is on the reverse strand], [16],
      [6], [0x40], [first read of the pair], [64],
      [8], [0x100], [secondary alignment], [256],
      [10], [0x400], [PCR or optical duplicate], [1024],
      [11], [0x800], [supplementary alignment], [2048],
    ))
  }
  To ask "is this bit on?", AND the flag with that bit and see if you get zero.

  #ask[A read has flag 1107. Break it into the decimals above (start with the biggest that fits). What do we know about this read?]
  #work(0.5in)
  #ask[`samtools markdup` (the PCR duplicate step) doesn't delete duplicates, it just turns on one bit. Which one? What does `1107 & 1024` give, and what does that tell you?]
  #work(0.4in)
  #ask[A common filter is `samtools view -F 0x904`, which drops any read with *any* of those bits on. 0x904 is 2048 + 256 + 4. What three kinds of reads does it throw out? Would the read with flag 1107 survive it? (Check: is `1107 & 2308` zero?)]
  #work(0.5in)
  #ask[So does `-F 0x904` drop PCR duplicates? What number would you give `-F` to drop duplicates as well?]
  #work(0.4in)
]
#v(8pt)

#task(kind: "optional", minutes: 15, title: [Code it],
  src: [your own Python, `# %%` cells in Zed])[
  If you want to try it in code, a few small functions, checked against your hand answers above:
  - `pack(seq)` returns the integer for a string like "ACG" (task 2's table).
  - `kmers(seq, k)` rolls along a sequence with shift, OR and mask, yielding each k-mer's integer (task 2(b)-(d)).
  - `revcomp(x, k)` on a packed integer. Hint: complement all at once with `x ^ mask`, then reverse the order of the pairs in a loop.
  - `mismatches(x, y)` with the XOR trick from task 4. Python's `bin(n).count("1")` works as popcount.
]

#v(10pt)
#kicker(color: accent)[Wrap up, 3 min]
#takeaway(room: 0.9in)[Say it to a labmate in two sentences, no code: why do k-mer tools store DNA as 2-bit numbers, and why do they like odd $k$?]
