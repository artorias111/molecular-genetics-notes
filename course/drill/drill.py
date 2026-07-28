#!/usr/bin/env python3
"""Typed-recall drill with Leitner spacing, over course/drill/cards.md.

    python3 course/drill/drill.py            # today's due cards + a few new ones
    python3 course/drill/drill.py --all      # every card, ignore the schedule
    python3 course/drill/drill.py --tag names
    python3 course/drill/drill.py --stats

You type the answer; the script marks it. You are never asked to judge yourself.
Every attempt is appended to attempts.log, which is what gets read at grading time.
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
            elif st["due"] <= now:
                due.append(card)
        random.shuffle(due)
        random.shuffle(fresh)
        sel = due + fresh[:args.new]
    if args.tag:
        sel = [x for x in sel if args.tag in x["tags"]]
    random.shuffle(sel)
    return sel[:args.limit]


def ask(card, state, log):
    print()
    print(c("? " + card["Q"], "1"))
    try:
        answer = input(c("> ", "36"))
    except (EOFError, KeyboardInterrupt):
        print()
        return None
    ok = grade(answer, card)
    st = state.setdefault(card["id"], {"box": 0, "due": today().isoformat(),
                                       "seen": 0, "correct": 0})
    st["seen"] += 1
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
    log.write("\t".join([
        datetime.datetime.now().isoformat(timespec="seconds"),
        card["id"], "ok" if ok else "miss", str(st["box"]),
        answer.replace("\t", " ").strip(),
    ]) + "\n")
    return bool(ok)


def stats(cards, state):
    print("%-26s %5s %5s %5s  %s" % ("card", "box", "seen", "ok", "due"))
    for card in sorted(cards, key=lambda x: x["id"]):
        st = state.get(card["id"])
        if st:
            print("%-26s %5d %5d %5d  %s" % (card["id"], st["box"], st["seen"],
                                             st["correct"], st["due"]))
        else:
            print("%-26s %5s %5s %5s  %s" % (card["id"], "-", "-", "-", "new"))


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--all", action="store_true", help="ignore the schedule")
    ap.add_argument("--tag", help="only cards with this tag")
    ap.add_argument("--limit", type=int, default=12, help="max cards (default 12)")
    ap.add_argument("--new", type=int, default=4, help="max unseen cards (default 4)")
    ap.add_argument("--stats", action="store_true", help="show the schedule and exit")
    args = ap.parse_args()

    cards = parse_cards(CARDS)
    state = load_state()

    if args.stats:
        stats(cards, state)
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
            res = ask(card, state, log)
            if res is None:
                break
            asked += 1
            right += res
            if not res:
                missed.append(card)
        if missed:
            print("\n" + c("-- second pass on the %d you missed --" % len(missed), "35"))
            for card in missed:
                if ask(card, state, log) is None:
                    break

    save_state(state)
    print("\n%d/%d first pass." % (right, asked))
    if missed:
        print("Back tomorrow: " + ", ".join(x["id"] for x in missed))


if __name__ == "__main__":
    main()
