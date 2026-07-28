# Drill — 3 minutes a day, between the day sets

## Why this exists

The day sets are the only place active recall was happening, which means each fact gets
tested once every several days at best, and only if it happens to fall in that day's Part 0.
That is not a spacing schedule, it's a lottery. This closes the gap.

Three design constraints, all deliberate:

1. **You type the answer. The script marks it.** No "did you get that right? (y/n)". Self-
   assessment is not something you should be asked for, and it isn't needed here — every
   card in this deck is a *label* or an *inventory*, which a string match can check.
2. **A miss shows you the mechanism, not the fact.** Repeating a correction as a fact has
   demonstrably not worked; re-teaching it as a mechanism has. So every card carries a
   `hook:` line, and that's what prints when you miss.
3. **The deck is built from your own errors.** Cards come out of the repetition pool in
   `progress.md` — things actually missed on days 01–04 — not from the textbook at large.

## Use

```sh
python3 course/drill/drill.py           # today's due cards, plus up to 4 new ones
python3 course/drill/drill.py --all     # everything, ignoring the schedule
python3 course/drill/drill.py --tag names
python3 course/drill/drill.py --stats   # what's due when
```

No dependencies. Blank input = "don't know" — use it, it is a cleaner signal than guessing.
Fragments beat sentences; matching is on keywords and ignores case, spaces and punctuation.

Miss a card and it drops to box 0 and comes back tomorrow. Get it right and the interval
doubles out: 1, 2, 4, 8, 16, 32, 64 days. **A card is only retired once it survives a
32-day gap** — which is the point, because everything currently "known" has only ever been
tested across two or three days.

**Best time to run it: immediately before the day set, not after.** Cold recall first, book
and feedback second.

## Files

| File | What it is |
|---|---|
| `cards.md` | the deck — human-editable, in the repo, review it freely |
| `drill.py` | the runner |
| `state.json` | scheduling state (gitignored) |
| `attempts.log` | every attempt, tab-separated (gitignored) |

`attempts.log` is the useful one. It records what you typed, not just right/wrong, so the
grading pass can see *how* a card fails — wrong label, right mechanism, hedge, or blank.
Point me at it any time and it gets read alongside the day set.

## Adding cards

Copy the shape of an existing card. `accept:` groups are separated by `;`, alternatives
inside a group by `|`, and every group must appear in the answer for it to count.
`accept[ordered]:` additionally requires the groups in that order — use it for sequences
like DnaA → DnaC → DnaB, where getting the order wrong is exactly the failure worth catching.
