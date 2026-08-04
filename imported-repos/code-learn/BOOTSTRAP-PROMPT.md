# code-learn — bootstrap prompt

Paste everything between the rules into Google Antigravity, in this directory.

---

I want you to build me a self-taught **syntax-and-code-reading course**, run the same way as a
course I already have going for molecular genetics. Read this whole brief before doing anything.

## What I'm trying to get out of it

I want to get **good at reading code and good at writing code**, primarily in **Rust** and
**Nextflow**, with **Python** as a steady third. This is for the fun of syntax — I like knowing
how a language actually fits together, not just how to get something working. Algorithms are a
minor thread, not the point. Some days should drop into **Go, Haskell, C++, awk** or similar
purely for contrast, so I get used to reading unfamiliar syntax cold.

I'm a bioinformatician, so I already program day to day. Assume competence and no hand-holding
about what a loop is. What I don't have is *precision* — I read Rust and Nextflow by pattern
matching rather than by actually knowing the rules.

History: I grew up in india, so ICSE Java until grade 10, C++ in class 11 and 12, C programming in first year of undergrad (bits pilani), and self taught python. Learning rust in grad school, code in python regularly. Dabbled in Ruby, haskell, etc. but never really got into them. 

## The single most important constraint: I answer on paper, in pen

I do these on a **Kindle Scribe**, handwritten, away from a keyboard and away from a compiler.
**So I am never typing out code, and I can never run anything.** Every question has to be
answerable in pen in a reserved blank space on the page. That means the good question types are:

- **Trace it.** Here is a short program. What does it print? (Exact output, including whitespace
  and ordering where that's the point.)
- **Point out the error.** Here is a program with something wrong. What's wrong, and what does
  the compiler say? For Rust especially: which rule is violated, and at which line.
- **Rewrite it.** Here is a working snippet; rewrite these three lines using an iterator chain /
  pattern match / `?` operator instead.
- **Fill the blank.** Here is a function with the signature and body given but the types elided.
  Write the types in.
- **Pseudocode it.** Six lines of pseudocode, not real syntax, for a small algorithm.
- **Read and explain.** Here is a Nextflow workflow block. What runs in what order, how many
  times does each process execute, and what's in the channel at each step?

Bad question types, which I want you to never use: "write a program that…", anything needing more
than ~10 lines written by hand, anything where the answer is only checkable by running it.

**Steal the question taxonomy from `sources/Let us C.pdf`.** Its exercises are exactly the right
shape — go look at the end of chapter 2 (PDF pages ~95–109) to see the format: `[A] What will be
the output of the following programs`, `[E] Point out the errors, if any, in the following
programs`, `[I] Rewrite the following programs using conditional operators`. Short, punchy, lots
of them, each one targeting one specific piece of syntax or one specific trap. That book is the
*style* reference for how problems are posed. I want Rust problems built the same way.

## Sources

In `sources/`:

| File | Use it for |
|---|---|
| `Rust in a month of lunches.pdf` | primary Rust spine |
| `Let us C.pdf` | the problem *style*, and C days |
| `Writing an interpreter in GO.pdf` | Go days, and the algorithms thread (lexing/parsing) |
| `The awk programming language.pdf` | awk days, and a good contrast language |

**There is no Nextflow source and no Python source in that directory.** Don't paper over this.
Tell me what you propose — official Nextflow docs (nextflow.io/docs) fetched and pinned into a
local reference, a book I should buy, or my own pipelines in `~/Documents/nf-core-projects` as
the reading material. Nextflow is one of the two languages I care most about, so this needs a
real answer before the course starts.

## The format: Typst → PDF, sized for the Scribe

Build a shared Typst template. The page must be **6.2in × 8.27in**, which is the Scribe's
1860×2480 @300ppi panel exactly, so a sheet fills the screen with no pinch-zooming. Give it
helpers for: the sheet wrapper, section headings, a question (with a `space:` parameter that
reserves handwriting room), a sub-part, a grey reference box, a left-barred grading callout, a
timer table, and a closing block. Plus a **code block helper** — this is the one thing my other
course doesn't need and this one lives or dies by: monospaced, syntax-legible at e-ink
resolution, with **line numbers**, because half the questions will say "line 7".

Two rules that are load-bearing, both learned the hard way on the other course:

1. **Every question goes through the question helper**, which increments a counter that the
   header prints. The stated size of a set is then *computed* by the document rather than
   asserted by me. If a set is meant to be twelve questions, the header says twelve or the set
   is wrong.
2. **Reserve generous writing space.** I'm writing by hand on glass. Page count is irrelevant on
   e-ink — page turns are instant — so err long. A three-line traced output needs more room than
   you think.

A build script that compiles one file or all of them. Name the output PDF something that reads
well in the Kindle's document list — `code day 03.pdf`, not `day-03.pdf`. Keep the source file
sortable (`day-03.typ`) and let the build script rename on output.

## Page 1 of every sheet is a five-card drill

Spaced repetition, Leitner boxes, answered cold with the book closed before the rest of the sheet
is visible. Cards are things like "what does `&mut` in a function signature promise the caller",
"what does the Nextflow `collect` operator do to a channel", "in Python, what does a bare `yield`
do to a function's type". Build the deck as a plain-text file plus a small script that: proposes
the next five cards ranked by schedule, records them as issued against a day, and later applies
my verdicts and logs what I actually wrote.

Two rules about the drill:

- **The drill must not inflate the question count.** Cards don't go through the question helper.
- **Check the five picks against the day set before issuing.** A card that the set itself asks
  about is an answer key printed above the question.

## How I want to be taught

These are conclusions from the other course, not preferences. They cost me real marks to learn.

- **I never grade myself.** Never ask me "did you get that right?" or to flag my own wrong
  answers. You mark everything, including the drill, off the returned PDF.
- **A miss prints the mechanism, not the fact.** Telling me the right answer again doesn't work
  on me. Re-teaching it as a mechanism does. Every drill card carries a "hook" field that
  explains *why* the answer is what it is, and that's what gets surfaced when I miss.
- **Never offer me a choice inside a question.** This is my specific failure mode: my reasoning
  is sound and my conclusion comes out inverted. If a question says "does this compile, or not?"
  or "is this moved or borrowed?", I will flip it roughly half the time even when everything I
  wrote leading up to it was correct. So: **one degree of freedom per question, and it must be
  the thing being graded.** Ask "what does line 7 print" (a value), "how many times does this
  process execute" (a count), "which line does the borrow checker point at" (a location). Never
  offer two options and ask me to pick.
- **Prefer what I can reconstruct over what I must recall.** Where a rule has a derivation, teach
  the derivation and let the fact fall out of it.
- **Verify page ranges against the actual PDFs before writing reading instructions.** A wrong page
  reference costs me real time hunting for something that isn't there.
- **Explanations get written to files in the repo, not left in chat**, and rendered to their own
  PDFs so I can read them on the device. Each day set names the one reference note that covers
  its warm-up section.

## Budget

**Up to an hour per session**, and I'd rather it be honestly sized than optimistically sized. Put
a **timer block at the top of page 2** with one row per section for me to fill in — on the other
course I skipped it for three sets running and the set sizing silently drifted, and when I
finally filled it in the reading window turned out to be off by a factor of three. Sum the
section budgets honestly and print the total. If the parts add to 55 minutes, say 55.

Reading windows are advisory; written sections get a hard timer that I stop at mid-sentence.

## Keep a ledger

A private, gitignored progress file: a log of what was issued, what I scored, what I got wrong
and what that revealed, and a running numbered list of adjustments to how sets are written. That
file is where the course actually improves. Re-read it before writing each set.

Also keep a public conventions file at the repo root that records the format decisions, so they
survive into future sessions when the context is gone.

## What to do now

Don't write day 01 yet. Instead:

1. Look at the four PDFs in `sources/` and tell me what's actually in them and how many usable
   chapters each has.
2. Propose a **module map**: what gets covered in what order across Rust, Nextflow and Python,
   roughly how many days each block takes, and where the contrast-language days fall. Assume
   ~5 days a week and that I'll skip days.
3. Give me your answer on the **Nextflow and Python source problem**.
4. Tell me what you'd put in day 01, and what the first five drill cards would be.

Then stop and let me sign off before you build anything. Once I approve, build the template,
the build script, the drill deck and runner, the ledger, and day 01 — in that order.

One more thing: I want to add **SQL** in about two months, once this is a habit. Don't plan for
it now, just don't design anything that makes it awkward to bolt on later.
