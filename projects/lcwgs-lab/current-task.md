# Task 001 — turn a Phred score into an error probability

Issued with Day 20. Budget: at most 10 optional minutes, outside the one-hour sheet.
Status: pending
Ready for review: no

Implement only `phred_to_error(q)` in `likelihood.py`.
A Phred base quality Q is defined by Q = -10 log10(e), where e is the base-call error probability.
Rearrange this definition and return e. Inputs for this first task are nonnegative numbers;
input validation, file parsing, dependencies and plots are not assigned.

Try Q = 0, 10, 20 by hand and compare with your function. In one comment, explain why a
larger Q should produce a smaller result. Stop at ten minutes, even if incomplete.

To request review: submit your attempt or change “Ready for review” above to yes. If skipped,
this exact task carries forward. It does not become two tasks on Day 21.
