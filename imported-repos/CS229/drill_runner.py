import sys
import json
import os
import random

DECK_FILE = "drill_deck.txt"
STATE_FILE = "drill_state.json"

def load_deck():
    cards = {}
    if not os.path.exists(DECK_FILE): return cards
    with open(DECK_FILE, 'r') as f:
        for line in f:
            if not line.strip() or line.startswith('id|'): continue
            parts = line.strip().split('|')
            if len(parts) >= 4:
                cards[parts[0]] = {"q": parts[1], "a": parts[2], "hook": parts[3]}
    return cards

def load_state():
    if os.path.exists(STATE_FILE):
        with open(STATE_FILE, 'r') as f:
            return json.load(f)
    return {"history": {}, "boxes": {}}

def save_state(state):
    with open(STATE_FILE, 'w') as f:
        json.dump(state, f, indent=2)

def propose(day):
    cards = load_deck()
    state = load_state()
    
    issued_today = state["history"].get(day, [])
    
    if issued_today:
        print(f"Cards already issued for Day {day}.")
    else:
        available = [cid for cid in cards.keys() if cid not in issued_today]
        picks = random.sample(available, min(5, len(available)))
        state["history"][day] = picks
        save_state(state)
        issued_today = picks
    
    print(f"--- Drill Cards for Day {day} ---")
    for i, cid in enumerate(issued_today):
        print(f"Card {i+1} (ID {cid}): {cards[cid]['q']}")

def review(day):
    cards = load_deck()
    state = load_state()
    picks = state["history"].get(day, [])
    
    if not picks:
        print(f"No cards were issued for Day {day}.")
        return

    for cid in picks:
        print(f"\nQ: {cards[cid]['q']}")
        ans = input("Your written answer (or press Enter to see actual): ")
        print(f"A: {cards[cid]['a']}")
        print(f"Hook: {cards[cid]['hook']}")
        verdict = input("Did you get it right? (y/n): ")
        
        if "log" not in state: state["log"] = []
        state["log"].append({"day": day, "id": cid, "written": ans, "correct": verdict.lower() == 'y'})
        
    save_state(state)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python drill_runner.py [propose|review] [day]")
        sys.exit(1)
    
    action = sys.argv[1]
    day = sys.argv[2]
    
    if action == "propose":
        propose(day)
    elif action == "review":
        review(day)
