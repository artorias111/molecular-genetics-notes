# Drill — 5 cards, page 1 of every day set

## Why this exists

The day sets are the only place active recall was happening, which means each fact gets
tested once every several days at best, and only if it happens to fall in that day's Part 0.
That is not a spacing schedule, it's a lottery. This closes the gap.

Three design constraints, all deliberate:

1. **You answer it. You never mark it.** No "did you get that right? (y/n)" — self-
   assessment is not something you should be asked for. Originally the *script* marked it by
   keyword match; **as of 2026-08-01 it doesn't, and I do.** The run records your answer,
   shows you the key and the mechanism, and leaves the verdict `pending`. Ask me to grade the
   drill and the boxes move then. Reason: on the first live run the matcher called three of
   eight attempts wrong that were right — twice on `bp-geometry` for saying "less-rigid"
   instead of "flexible", once on `alpha-phosphate` for a typo in "pyrophosphate". In a system
   where you can't overrule the marker, a false negative is worse than a slow verdict.
   (`--auto` still runs the old behaviour if you ever want an instant, unreliable score.)
2. **A miss shows you the mechanism, not the fact.** Repeating a correction as a fact has
   demonstrably not worked; re-teaching it as a mechanism has. So every card carries a
   `hook:` line, and that's what prints when you miss.
3. **The deck is built from your own errors.** Cards come out of the repetition pool in
   `progress.md` — things actually missed on days 01–04 — not from the textbook at large.

## Use — as of 2026-08-02, you don't run this

The drill is **five cards on page 1 of the day set**, in pen, cold, book closed, before
anything else on the sheet. Nothing to launch and nothing to type. It comes back to me
inside the same exported PDF, I mark it there, and the Leitner boxes move then.

What changed and what didn't: the deck, the spacing schedule, the no-self-marking rule and
the mechanism-on-a-miss rule are all unchanged. Only the input device is different.

One consequence worth knowing, because it shows up in what you get asked: **a card the day
set itself asks about gets held to the next sheet.** On the old flow the drill ran before
the set, so an overlap was cold recall followed by the real question. Printed on page 1 of
the same sheet, the same overlap is an answer key sitting above the question. Three cards
were held back from day 06 for this reason.

The script is now mine, not yours — it's the deck plus the schedule:

```sh
python3 course/drill/drill.py --propose                     # pool for the next sheet
python3 course/drill/drill.py --issue <ids> --for day-07     # record + emit the #drill block
python3 course/drill/drill.py --mark a=ok b=miss --typed 'b=what he wrote'
python3 course/drill/drill.py --stats                        # what's due when
```

The interactive typed mode (`drill.py` with no flags) still works if you ever want it at a
keyboard — same rules, blank input = "don't know", verdicts still wait for me.

Miss a card and it drops to box 0 and comes back tomorrow. Get it right and the interval
doubles out: 1, 2, 4, 8, 16, 32, 64 days. **A card is only retired once it survives a
32-day gap** — which is the point, because everything currently "known" has only ever been
tested across two or three days.

Page 1 is where it is for a reason: cold recall first, book and feedback second. It is the
first thing on the sheet and the reading range isn't even visible until you turn the page.

## Files

| File | What it is |
|---|---|
| `cards.md` | the deck — human-editable, in the repo, review it freely |
| `drill.py` | the deck reader, scheduler, and the issue/mark commands |
| `state.json` | scheduling state (gitignored) |
| `attempts.log` | every attempt, tab-separated (gitignored) |

`attempts.log` is the useful one. It records what you wrote, not just right/wrong, so the
grading pass can see *how* a card fails — wrong label, right mechanism, hedge, or blank.
Handwritten answers get transcribed into it at marking time (`--typed`), so this stays true
now that the answers arrive on paper.

## Adding cards

Copy the shape of an existing card. `accept:` groups are separated by `;`, alternatives
inside a group by `|`, and every group must appear in the answer for it to count.
`accept[ordered]:` additionally requires the groups in that order — use it for sequences
like DnaA → DnaC → DnaB, where getting the order wrong is exactly the failure worth catching.
