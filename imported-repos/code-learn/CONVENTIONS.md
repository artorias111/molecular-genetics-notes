# Code Learn Conventions

## Daily Setup
- Each day is a Typst-rendered PDF sized 6.2in × 8.27in (Kindle Scribe native).
- Run `build.sh` to compile all `.typ` files to `.pdf`.

## Format Rules
- **No Mandatory Reading:** The course is purely problem-driven. Reading assignments are given as retro-active lifelines for missed questions.
- **Mixed Sets:** Every day contains problems from multiple languages to force context-switching.
- **JEE MCQs:** Allowed for deeply testing edge cases (multi-correct).
- **Five-card Drill:** 5 spaced-repetition cards at the start of every day (using `drill_runner.py`).

## File Structure
- `template.typ`: The UI components and page constraints.
- `day-XX.typ`: The daily problem set source.
- `build.sh`: Generates output PDF.
- `.ledger.md`: Git-ignored file tracking course adjustments, logs, and grades.
- `drill_deck.txt`: The text file containing drill flashcards.
- `drill_runner.py`: The script to propose cards and log verdicts.
