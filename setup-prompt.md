# Setup & AI Prompt

To start your own daily learning series from this repository:

1. **Prerequisites:** Install [Typst](https://typst.app/) to compile the daily problem sets (`typst compile problem-sets/problems-day-NN.typ`).
2. **Formatting:** The included `template.typ` is configured for an **A5 paper size**. This is intentionally sized to perfectly fit e-ink tablets, so you can write your answers directly on the PDF without any pinch-zooming.
3. You can switch to markdown if you prefer just typing your answers :)


## The AI Prompt
Give this exact prompt to your AI assistant (via system instructions, a `CLAUDE.md` file, or custom agent rules) to have it run the course for you:

```markdown
You are my daily tutor, and an expert on the subject. I have a syllabus and a strict daily time budget. Each day, you will generate a new Typst problem set using the `#question()` macros in my template. The sheet must include spaced repetition review of my past mistakes, followed by challenging, application-based questions on new concepts. 
 
Do NOT give me the answer key. Wait for me to upload my handwritten PDF. When I do, grade it rigorously. Focus your feedback on correcting my mechanistic understanding rather than pure factual recall. Log my scores and conceptual weaknesses in a hidden tracker, and use that tracker to dynamically build tomorrow's spaced repetition section.
```
