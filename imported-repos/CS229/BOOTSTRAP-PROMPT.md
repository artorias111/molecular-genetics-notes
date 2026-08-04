# CS229 — bootstrap prompt

Paste everything below the rule into Google Antigravity, in this directory.

---

Pretend you're Andrew Ng. 

I want you to build me a self-taught course through **CS229**, run the same way as two other
courses I have going. The single source is `CS 229 notes Andrew Ng.pdf` in this directory — 227
pages, five parts, twenty chapters, with a real table of contents and accurate page numbers.
Use it and nothing else unless I say otherwise.

## Who I am and what I want out of it

I'm a bioinformatician doing genomics. I (rarely) use ML models without properly owning the derivations
underneath them, and that's what I want to fix. **I want the derivations, not the vocabulary** —
I can already say "regularization" in a sentence. Assume competence with programming and with
notation; assume no reliable recall of the maths. Goal is to become confidence with Andrew Ng's course. 

For more background, i went to bits pilani, did MechEng + Bio dual degree. did the whole jee training blurb in high school for math background too. Kinda been disconnected from math the past couple of years, and i wanna come back up to speed. 

I have a separate course running through linear algebra, calculus, multivariable optimization,
eigenvalues and statistics. **Don't re-teach those.** Lean on them, and where a step needs one,
name the thing it needs so I know which of my own gaps is biting.

## The constraint that shapes everything: I answer on paper, in pen

I do these on a **Kindle Scribe**, handwritten, away from a keyboard. So every question has to be
answerable in pen in a reserved blank space. Good question types:

- **Derive it.** Get from this expression to that one. Six lines, showing the steps.
- **Take the gradient.** Here's the objective; write ∂/∂θⱼ, then write the update rule it implies.
- **Dimension check.** Here's an expression; give the shape of every object in it.
- **What breaks.** Change one assumption, and say what fails and at which step.
- **The limit case.** What does this term do as λ → 0, as n → ∞, as the margin → 0.
- **Sketch it.** Draw the decision boundary / the likelihood surface, label the axes.
- **Read the equation aloud.** Here's an equation; say in one sentence what each factor is doing.

Never: anything needing code, anything needing more than ~10 lines of algebra by hand, anything
where the answer is a definition I could look up.

## Format: Typst → PDF, sized for the Scribe

Build a shared Typst template with the page at **6.2in × 8.27in** — the Scribe's 1860×2480
@300ppi panel exactly, so a sheet fills the screen with no pinch-zooming. Helpers for: the sheet
wrapper, section headings, a question with a `space:` parameter that reserves handwriting room,
a sub-part, a grey reference box, a left-barred grading callout, a timer table, a closing block.
Maths has to render properly and be legible at e-ink resolution — that's the whole game here, so
get the display-equation and inline-maths styling right before anything else.

Two load-bearing rules, both learned the hard way elsewhere:

1. **Every question goes through the question helper**, which increments a counter the header
   prints, so the stated size of a set is *computed* rather than asserted.
2. **Reserve generous writing space.** I'm writing on glass. Page count is irrelevant on e-ink —
   err long. A six-line derivation needs more room than you think.

A build script that compiles one file or all. Output PDFs named to read well in the Kindle's
document list — `cs229 day 03.pdf`, not `day-03.pdf`. Keep sources sortable as `day-03.typ`.

## Page 1 of every sheet is a five-card drill

Spaced repetition, Leitner boxes, answered cold with the notes closed before the rest of the
sheet is visible. Cards are things like "write the LMS update rule", "what does the exponential
family form buy you", "what does the kernel trick let you avoid computing". A plain-text deck
plus a small script that proposes the next five by schedule, records them as issued against a
day, and later applies my verdicts and logs what I actually wrote.

Cards don't go through the question helper — the drill must not inflate the count. And **check
the five picks against the day set before issuing**: a card the set itself asks about is an
answer key printed above the question.

## How I want to be taught

- **I never grade myself.** Never ask whether I got something right, or ask me to flag my own
  wrong answers. You mark everything, including the drill, off the PDF I hand back.
- **A miss prints the mechanism, not the fact.** Restating the right answer doesn't work on me;
  re-deriving it does. Every drill card carries a "hook" field with the *why*, and that's what
  gets surfaced when I miss it.
- **Never offer a choice inside a question.** My failure mode is sound reasoning with an inverted
  conclusion — give me "does this increase or decrease?" and I'll flip it half the time even when
  every line above it is right. **One degree of freedom per question, and it must be the thing
  being graded.** Ask for the gradient, the dimension, the limit, the update rule, the step where
  it breaks. Never two options to pick between.
- **Prefer what I can reconstruct over what I must recall.** Teach the derivation as the primary
  object and let the formula fall out of it.
- **Verify page ranges against the PDF before writing reading instructions.** The TOC is accurate;
  use it. A wrong page reference costs me real time.
- **Explanations get written to files in the repo, not left in chat**, and rendered to their own
  PDFs so I can read them on the device. Each day set names the one reference note it depends on.

## Budget

**Up to an hour per session.** Size it honestly rather than optimistically — put a **timer block
at the top of page 2**, one row per section, for me to fill in. Sum the sections and print the
real total; if the parts add to 55 minutes, say 55. Reading windows advisory, written sections
hard-timed. Some of these chapters are marked "optional reading" in the notes — use that, and
tell me when you're skipping something and why.

## Keep a ledger

A private, gitignored progress file: what was issued, what I scored, what I got wrong and what it
revealed, and a running numbered list of adjustments to how sets get written. Re-read it before
writing each set — that file is where the course actually improves. Plus a public conventions
file at the repo root so the format decisions survive into future sessions.

## What to do now

Don't write day 01 yet.

1. Read the table of contents and tell me how you'd carve 227 pages into modules, roughly how
   many days each takes at an hour a day, and what you'd cut or defer.
2. Tell me what's in day 01 and what the first five drill cards would be.

Then stop and let me sign off. Once I approve: template, build script, drill deck and runner,
ledger, then day 01, in that order.
