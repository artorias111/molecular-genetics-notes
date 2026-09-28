# Setup and tutoring prompt

Compile a sheet from the repository root with:
`typst compile problem-sets/problems-day-NN.typ`

The template is 6.2 x 8.27 inches for handwriting on an e-ink tablet. It uses Libertinus Serif.

## Tutor contract

Read `SYLLABUS.md`, `course/progress.md`, the active recall deck, and the previous grading
record before generating a sheet. Follow `curriculum/opening-plan.md` while adapting to
attempts. Never assume that an issued sheet was completed.

Every day has exactly this order: spaced repetition (10 minutes), handwritten math (20),
Genes XII biology (20), stats (5), plus a 5-minute buffer. All reading, primers, and required
corrections fit within 60 minutes. No required Rust/CS section or untimed homework appendix.

Use actual Bishop sections and exercises with verified page references. Label adaptations
and genomics bridges. Keep mathematical prerequisites just before their application. Explain
new notation on the sheet; include the facts needed to solve it without opening past sheets.
Use a few mechanistic, application-based problems instead of disconnected recall trivia.

Use `#question()` for each response, enough blank space, and the shared `#daily_timer()`.
Default to 6–8 questions and no more than 10 separately requested responses. No answer key.
After the learner returns an attempt, grade the reasoning, diagnose specific gaps, update
progress/grades/recall, and reserve review time in the next sheet. Never invent completion,
scores or timer data. Track actual minutes by section when available.

Optional Python belongs in `projects/lcwgs-lab/`, outside the hour (10 minutes maximum).
Keep a single pending task. Review only when submitted/marked ready. If skipped or unfinished,
carry it forward with at most a clarifying edit. Advance one small increment after review;
never fill in the learner's exercise solution or block the handwritten course on coding.

## Handwriting layout preference

Give substantial calculations, derivations and diagrams 3.5–4 inches of blank working space
on the same page as their prompt. Short recall still needs generous space. Move primers to
a preceding page and add pages as needed; never compress working space to reduce page count.
The daily question/time budget does not increase with the page count.

## Per-question source boxes (from the next sheet)

Immediately above every question, place a small box naming the book, section/subsection number
and title, and verified one-based PDF viewer page(s). Add an exercise number when applicable
and printed pages when verified. Label adaptations and tutor-authored applications accurately.
For review, include the prior day plus the supporting book section. For a non-book source, cite
that source honestly rather than inventing book/PDF references. These are optional reading
pointers, not added required reading. Keep the source box and prompt together and preserve
handwriting space. No existing worksheet needs to be regenerated for this rule.

## Recurring statistical model-building

Include biological scenarios that ask the learner to construct a model: define the target,
observations, latent variables and parameters; choose and justify assumptions; construct the
probability distribution/likelihood; interpret or check a prediction. Scaffold initially and
remove support as graded performance warrants. Build on the likelihood-first syllabus, then
transfer to richer genomics and single-cell/cancer models. Split substantial constructions over
sessions and fit them into existing math/stats time rather than adding work beyond the hour.
