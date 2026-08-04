import json
import sys
import datetime

DECK_FILE = 'drill_deck.json'
LEDGER_FILE = '.ledger.md'

def load_deck():
    with open(DECK_FILE, 'r') as f:
        return json.load(f)

def save_deck(deck):
    with open(DECK_FILE, 'w') as f:
        json.dump(deck, f, indent=2)

def propose():
    deck = load_deck()
    today = datetime.date.today().isoformat()
    
    # Sort by due date, then by box (lower box first), then ID
    due_cards = sorted(deck, key=lambda c: (c['next_due'], c['box'], c['id']))
    picks = due_cards[:5]
    
    print("=== Proposed Drill Cards ===")
    for c in picks:
        print(f"[{c['id']}] ({c['lang']}) {c['question']}")
        print(f"    Hook: {c['hook']}")
        print(f"    Box: {c['box']} | Due: {c['next_due']}")
    print("============================")

def score(card_id, verdict, actual_written):
    deck = load_deck()
    card = next((c for c in deck if c['id'] == card_id), None)
    if not card:
        print(f"Card {card_id} not found.")
        return

    today = datetime.date.today()
    if verdict.lower() in ['pass', 'y', '1']:
        card['box'] += 1
        # Simple Leitner spacing: 2^box days
        days_to_add = 2 ** card['box']
        status = "PASSED"
    else:
        card['box'] = 0
        days_to_add = 1
        status = "FAILED"

    card['next_due'] = (today + datetime.timedelta(days=days_to_add)).isoformat()
    save_deck(deck)

    # Log to ledger
    with open(LEDGER_FILE, 'a') as f:
        f.write(f"\n* Drill Card {card_id} ({card['lang']}) - {status}\n")
        f.write(f"  * Question: {card['question']}\n")
        f.write(f"  * Written: {actual_written}\n")
        if status == "FAILED":
            f.write(f"  * Missed Hook: {card['hook']}\n")

    print(f"Card {card_id} scored {status}. Moved to Box {card['box']}. Next due: {card['next_due']}")

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python drill_runner.py propose")
        print("       python drill_runner.py score <id> <pass/fail> \"<actual_written>\"")
        sys.exit(1)

    cmd = sys.argv[1]
    if cmd == 'propose':
        propose()
    elif cmd == 'score':
        if len(sys.argv) < 5:
            print("Usage: python drill_runner.py score <id> <pass/fail> \"<actual_written>\"")
            sys.exit(1)
        score(int(sys.argv[2]), sys.argv[3], sys.argv[4])
    else:
        print("Unknown command.")
