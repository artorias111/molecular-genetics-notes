#!/usr/bin/env python3
"""Spaced-repetition drill over course/drill/cards.md.

As of 2026-08-02 Shriram answers the drill *in pen, on page 1 of the day set* — so the
script is no longer something he runs. It is now the deck, the Leitner schedule, and the
two commands that bracket a paper sheet:

    python3 course/drill/drill.py --propose               # the pool for tomorrow's page 1
    python3 course/drill/drill.py --issue a b c --for day-07   # record + emit #drill(...)
    python3 course/drill/drill.py --mark a=ok b=miss --typed 'b=what he wrote'
    python3 course/drill/drill.py --stats                 # schedule ("unmarked" = my turn)

--propose ranks but does not choose: the final pick is editorial, because a card the day
set itself asks about must be held to the next sheet or it becomes an answer key printed
above the question.

The interactive typed mode below still works (`drill.py` with no flags) and is kept for
a day at a keyboard. Either way he never marks himself — verdicts sit `pending` until I
apply them. Every attempt lands in attempts.log, which is what gets read at grading time.
"""

import argparse
import datetime
import json
import os
import random
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
CARDS = os.path.join(HERE, "cards.md")
STATE = os.path.join(HERE, "state.json")
LOG = os.path.join(HERE, "attempts.log")

# Leitner intervals in days, indexed by box.
INTERVALS = [1, 1, 2, 4, 8, 16, 32, 64]

KEYS = ("Q", "A", "accept", "accept[ordered]", "hook", "tags")
KEY_RE = re.compile(r"^(%s):\s?(.*)$" % "|".join(re.escape(k) for k in KEYS))
SUPERSCRIPT = str.maketrans("⁰¹²³⁴⁵⁶⁷⁸⁹", "0123456789")


# ---------------------------------------------------------------- parsing

def parse_cards(path):
    cards = []
    cur = None
    key = None
    in_fence = False
    with open(path, encoding="utf-8") as fh:
        for line in fh:
            line = line.rstrip("\n")
            if line.lstrip().startswith("```"):
                in_fence = not in_fence
                continue
            if in_fence:
                continue
            if line.startswith("### "):
                cur = {"id": line[4:].strip()}
                cards.append(cur)
                key = None
                continue
            if cur is None:
                continue
            m = KEY_RE.match(line)
            if m:
                key = m.group(1)
                cur[key] = m.group(2).strip()
            elif key and line.strip():
                # indented continuation of the previous field
                cur[key] = (cur[key] + " " + line.strip()).strip()
            elif not line.strip():
                key = None
    out = []
    for c in cards:
        if "Q" not in c or "A" not in c:
            continue
        ordered = "accept[ordered]" in c
        raw = c.get("accept[ordered]") or c.get("accept") or ""
        c["groups"] = [
            [normalize(a) for a in g.split("|") if normalize(a)]
            for g in raw.split(";") if g.strip()
        ]
        c["ordered"] = ordered
        c["tags"] = c.get("tags", "").split()
        out.append(c)
    return out


def normalize(text):
    text = text.translate(SUPERSCRIPT).lower()
    return "".join(ch for ch in text if ch.isalnum())


# ---------------------------------------------------------------- grading

def grade(answer, card):
    """True if every accept-group is present (in order, if the card says so)."""
    if not card["groups"]:
        return None  # no key: cannot auto-mark
    norm = normalize(answer)
    if not norm:
        return False
    pos = 0
    for group in card["groups"]:
        hits = [(norm.find(alt, pos if card["ordered"] else 0), alt)
                for alt in group]
        hits = [(i, a) for i, a in hits if i >= 0]
        if not hits:
            return False
        if card["ordered"]:
            i, alt = min(hits)
            pos = i + len(alt)
    return True


# ---------------------------------------------------------------- state

def load_state():
    if os.path.exists(STATE):
        with open(STATE, encoding="utf-8") as fh:
            return json.load(fh)
    return {}


def save_state(state):
    with open(STATE, "w", encoding="utf-8") as fh:
        json.dump(state, fh, indent=1, sort_keys=True)


def today():
    return datetime.date.today()


def due_date(box):
    return (today() + datetime.timedelta(days=INTERVALS[min(box, len(INTERVALS) - 1)])).isoformat()


# ---------------------------------------------------------------- display

USE_COLOR = sys.stdout.isatty()


def c(text, code):
    return "\033[%sm%s\033[0m" % (code, text) if USE_COLOR else text


def wrap(text, width=78, indent="  "):
    words, lines, cur = text.split(), [], ""
    for w in words:
        if cur and len(cur) + 1 + len(w) > width - len(indent):
            lines.append(indent + cur)
            cur = w
        else:
            cur = (cur + " " + w).strip()
    if cur:
        lines.append(indent + cur)
    return "\n".join(lines)


# ---------------------------------------------------------------- session

def pick(cards, state, args):
    if args.all:
        sel = list(cards)
    else:
        now = today().isoformat()
        due, fresh = [], []
        for card in cards:
            st = state.get(card["id"])
            if st is None:
                fresh.append(card)
            elif st.get("pending"):
                continue          # answered but not yet marked — don't re-ask
            elif st["due"] <= now:
                due.append(card)
        random.shuffle(due)
        random.shuffle(fresh)
        sel = due + fresh[:args.new]
    if args.tag:
        sel = [x for x in sel if args.tag in x["tags"]]
    random.shuffle(sel)
    return sel[:args.limit]


def ask(card, state, log, auto=False):
    print()
    print(c("? " + card["Q"], "1"))
    try:
        answer = input(c("> ", "36"))
    except (EOFError, KeyboardInterrupt):
        print()
        return None
    st = state.setdefault(card["id"], {"box": 0, "due": today().isoformat(),
                                       "seen": 0, "correct": 0})
    st["seen"] += 1

    if auto:
        ok = grade(answer, card)
        if ok:
            st["correct"] += 1
            st["box"] = min(st["box"] + 1, len(INTERVALS) - 1)
            print(c("  ✓", "32") + "  " + card["A"])
        else:
            st["box"] = 0
            print(c("  ✗", "31"))
            print(wrap(card["A"], indent="     "))
            if card.get("hook"):
                print(c(wrap("↳ " + card["hook"], indent="     "), "33"))
        st["due"] = due_date(st["box"])
        verdict = "ok" if ok else "miss"
    else:
        # No verdict here. Show the answer and the mechanism either way; the box
        # doesn't move until the attempt is marked.
        st["pending"] = True
        st["due"] = (today() + datetime.timedelta(days=1)).isoformat()
        print(c("  ·", "34") + "  " + wrap(card["A"], indent="     ").lstrip())
        if card.get("hook"):
            print(c(wrap("↳ " + card["hook"], indent="     "), "33"))
        verdict = "pending"

    log.write("\t".join([
        datetime.datetime.now().isoformat(timespec="seconds"),
        card["id"], verdict, str(st["box"]),
        answer.replace("\t", " ").strip(),
    ]) + "\n")
    return bool(verdict == "ok") if auto else True


# ------------------------------------------------------- deferred marking

def read_log():
    if not os.path.exists(LOG):
        return []
    rows = []
    with open(LOG, encoding="utf-8") as fh:
        for line in fh:
            parts = line.rstrip("\n").split("\t")
            if len(parts) >= 5:
                rows.append(parts[:4] + ["\t".join(parts[4:])])
    return rows


def show_pending(cards, verbose=True):
    """Print unmarked attempts, with the key, for a human/model grading pass."""
    by_id = {x["id"]: x for x in cards}
    rows = [r for r in read_log() if r[2] == "pending"]
    if not rows:
        print("Nothing pending.")
        return
    for ts, cid, _, _, answer in rows:
        card = by_id.get(cid, {})
        print("\n" + c("%s  %s" % (ts, cid), "1"))
        print("  Q:      " + card.get("Q", "?"))
        print(c("  typed:  " + (answer or "(blank)"), "36"))
        if verbose:
            print("  key:    " + card.get("A", "?"))
    print("\n%d pending. Mark with:\n  python3 course/drill/drill.py --mark %s"
          % (len(rows), " ".join("%s=ok|miss" % i
                                 for i in sorted({r[1] for r in rows}))))


def apply_marks(cards, state, marks, typed=None):
    """marks: list of 'card-id=ok' / 'card-id=miss'. Updates state and the log.

    `typed` is a list of 'card-id=what he actually wrote', used when the answers
    came back handwritten on a PDF — the log is only useful if it records the
    answer, not just the verdict."""
    ids = {x["id"] for x in cards}
    verdicts = {}
    for m in marks:
        cid, _, v = m.partition("=")
        if v not in ("ok", "miss"):
            sys.exit("bad verdict %r in %r — use ok or miss" % (v, m))
        if cid not in ids:
            sys.exit("no such card: %s" % cid)
        verdicts[cid] = v

    transcripts = {}
    for t in typed or []:
        cid, _, answer = t.partition("=")
        if cid not in ids:
            sys.exit("no such card: %s" % cid)
        transcripts[cid] = answer.replace("\t", " ").strip()

    rows = read_log()
    touched = {cid: [] for cid in verdicts}
    for r in rows:
        if r[2] == "pending" and r[1] in verdicts:
            r[2] = verdicts[r[1]]
            if r[1] in transcripts:
                r[4] = transcripts[r[1]]
            touched[r[1]].append(r)

    for cid, v in verdicts.items():
        st = state.setdefault(cid, {"box": 0, "due": today().isoformat(),
                                    "seen": 0, "correct": 0})
        st.pop("pending", None)
        if v == "ok":
            st["correct"] += 1
            st["box"] = min(st["box"] + 1, len(INTERVALS) - 1)
        else:
            st["box"] = 0
        st["due"] = due_date(st["box"])
        for r in touched[cid]:          # only the rows just marked
            r[3] = str(st["box"])
        print("%-26s %-5s box %d, back %s%s"
              % (cid, v, st["box"], st["due"],
                 "" if touched[cid] else "  (no pending row in the log)"))

    with open(LOG, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write("\t".join(r) + "\n")
    save_state(state)


# ------------------------------------------------------- paper sheets
# As of 2026-08-02 the drill is answered in pen on page 1 of the day set, not
# typed here. The deck and the Leitner state stay; what changes is that the
# cards are *issued* onto a sheet and marked later off the exported PDF.

def candidates(cards, state):
    """Due cards weakest-box-first, then unseen ones. Pending cards are skipped."""
    now = today().isoformat()
    due, fresh = [], []
    for card in cards:
        st = state.get(card["id"])
        if st is None:
            fresh.append(card)
        elif st.get("pending"):
            continue                       # issued but not yet marked
        elif st["due"] <= now:
            due.append(card)
    due.sort(key=lambda c: (state[c["id"]]["box"], state[c["id"]]["due"]))
    random.shuffle(fresh)
    return due, fresh


def propose(cards, state, n):
    """Print the pool for the next sheet. Changes nothing — the final pick is
    editorial: a card the day set itself asks about has to be held back."""
    due, fresh = candidates(cards, state)
    for kind, group in (("due", due), ("new", fresh)):
        for card in group[: n * 3]:
            st = state.get(card["id"], {})
            print("%-5s %-26s box %-3s %s"
                  % (kind, card["id"], st.get("box", "-"), card["Q"]))
    print("\n%d due, %d unseen. Pick %d, check them against the day set for "
          "priming, then:\n  python3 course/drill/drill.py --issue <id> ... --for day-NN"
          % (len(due), len(fresh), n))


def issue(cards, state, ids, label):
    """Record cards as issued onto a paper sheet, and print them Typst-ready."""
    by_id = {x["id"]: x for x in cards}
    for cid in ids:
        if cid not in by_id:
            sys.exit("no such card: %s" % cid)
    with open(LOG, "a", encoding="utf-8") as log:
        for cid in ids:
            st = state.setdefault(cid, {"box": 0, "due": today().isoformat(),
                                        "seen": 0, "correct": 0})
            st["seen"] += 1
            st["pending"] = True
            st["due"] = (today() + datetime.timedelta(days=1)).isoformat()
            log.write("\t".join([
                datetime.datetime.now().isoformat(timespec="seconds"),
                cid, "pending", str(st["box"]), "(on paper: %s)" % label,
            ]) + "\n")
    save_state(state)
    print("#drill(")
    for cid in ids:
        print("  [%s],   // %s" % (by_id[cid]["Q"], cid))
    print(")")
    print("\n%d issued as %s. They won't be re-picked until marked." % (len(ids), label))


def stats(cards, state):
    print("%-26s %5s %5s %5s  %s" % ("card", "box", "seen", "ok", "due"))
    for card in sorted(cards, key=lambda x: x["id"]):
        st = state.get(card["id"])
        if st:
            print("%-26s %5d %5d %5d  %s" % (card["id"], st["box"], st["seen"],
                                             st["correct"],
                                             "unmarked" if st.get("pending") else st["due"]))
        else:
            print("%-26s %5s %5s %5s  %s" % (card["id"], "-", "-", "-", "new"))


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--all", action="store_true", help="ignore the schedule")
    ap.add_argument("--tag", help="only cards with this tag")
    ap.add_argument("--limit", type=int, default=12, help="max cards (default 12)")
    ap.add_argument("--new", type=int, default=4, help="max unseen cards (default 4)")
    ap.add_argument("--stats", action="store_true", help="show the schedule and exit")
    ap.add_argument("--auto", action="store_true",
                    help="mark by keyword match, immediately (off by default)")
    ap.add_argument("--pending", action="store_true",
                    help="list attempts awaiting a verdict")
    ap.add_argument("--mark", nargs="+", metavar="ID=ok|miss",
                    help="apply verdicts to pending attempts")
    ap.add_argument("--typed", nargs="+", metavar="ID=answer",
                    help="transcribe handwritten answers into the log while marking")
    ap.add_argument("--propose", action="store_true",
                    help="show the pool for the next paper sheet (changes nothing)")
    ap.add_argument("--issue", nargs="+", metavar="ID",
                    help="record cards as issued on a paper sheet, print them Typst-ready")
    ap.add_argument("--for", dest="label", default="paper",
                    help="which sheet --issue is for, e.g. day-07")
    args = ap.parse_args()

    cards = parse_cards(CARDS)
    state = load_state()

    if args.stats:
        stats(cards, state)
        return
    if args.pending:
        show_pending(cards)
        return
    if args.propose:
        propose(cards, state, args.new + 1)
        return
    if args.issue:
        issue(cards, state, args.issue, args.label)
        return
    if args.mark:
        apply_marks(cards, state, args.mark, args.typed)
        return

    session = pick(cards, state, args)
    if not session:
        nxt = min((s["due"] for s in state.values()), default=None)
        print("Nothing due today." + (" Next: %s." % nxt if nxt else ""))
        print("(`--all` drills everything anyway.)")
        return

    print("%d card%s. Type what you can; blank = don't know." %
          (len(session), "" if len(session) == 1 else "s"))
    right = asked = 0
    missed = []
    with open(LOG, "a", encoding="utf-8") as log:
        for card in session:
            res = ask(card, state, log, auto=args.auto)
            if res is None:
                break
            asked += 1
            if args.auto:
                right += res
                if not res:
                    missed.append(card)
        if missed:
            print("\n" + c("-- second pass on the %d you missed --" % len(missed), "35"))
            for card in missed:
                if ask(card, state, log, auto=True) is None:
                    break

    save_state(state)
    if args.auto:
        print("\n%d/%d first pass." % (right, asked))
        if missed:
            print("Back tomorrow: " + ", ".join(x["id"] for x in missed))
    else:
        print("\n%d answered, unmarked. Nothing moves box until they're marked —\n"
              "ask me to grade the drill, or run --pending to see them." % asked)


if __name__ == "__main__":
    main()
