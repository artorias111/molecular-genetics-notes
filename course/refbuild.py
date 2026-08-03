#!/usr/bin/env python3
"""Render course/reference/*.md to Kindle-Scribe-sized PDFs.

    python3 course/refbuild.py                  # all reference notes
    python3 course/refbuild.py fork-strand-separation.md

The Markdown stays the source of truth — it is what I read and edit. This makes
a reading copy for the device, one PDF per note (they're stable once written, so
each gets sent to the Kindle once), named

    course/reference/pdf/molecular genetics ref - fork strand separation.pdf

so it sorts next to "molecular genetics day NN" in the Kindle library.

The converter handles exactly the Markdown these notes use: ATX headings, bullet
and ordered lists, pipe tables, blockquotes, fenced code, `---` rules, and inline
**bold** / *italic* / `code`. It is deliberately not a general Markdown engine —
if a note starts using something else, extend this rather than working around it.
"""

import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REFDIR = os.path.join(HERE, "reference")
OUTDIR = os.path.join(REFDIR, "pdf")
BUILD = os.path.join(REFDIR, ".build")        # generated .typ, not the source

# Characters that mean something in Typst content mode and must be escaped in
# ordinary prose. Backslash first or it eats the escapes it just wrote.
SPECIALS = "\\#$*_`<>@[]~"


# ------------------------------------------------------------------ inline

def esc(text):
    for ch in SPECIALS:
        text = text.replace(ch, "\\" + ch)
    return text


def inline(text):
    """`code`, **bold**, *italic* -> Typst, everything else escaped."""
    out = []
    for i, chunk in enumerate(re.split(r"(`[^`]*`)", text)):
        if i % 2:                                  # a code span
            out.append("#raw(%s)" % typst_str(chunk[1:-1]))
            continue
        pieces = re.split(r"(\*\*[^*]+\*\*|(?<!\*)\*[^*\n]+\*(?!\*))", chunk)
        for j, piece in enumerate(pieces):
            if j % 2 == 0:
                out.append(esc(piece))
            elif piece.startswith("**"):
                out.append("#strong[%s]" % esc(piece[2:-2]))
            else:
                out.append("#emph[%s]" % esc(piece[1:-1]))
    return "".join(out)


def typst_str(text):
    return '"%s"' % text.replace("\\", "\\\\").replace('"', '\\"')


# ------------------------------------------------------------------ blocks

def split_row(line):
    cells = line.strip().strip("|").split("|")
    return [c.strip() for c in cells]


def convert(md):
    """Markdown -> Typst body. Returns (title, source_line, body)."""
    lines = md.split("\n")
    title, source = "", None
    out = []
    i = 0

    # Title = the first H1; the italic "Source: ..." line under it becomes the
    # header strip rather than body text.
    while i < len(lines):
        if lines[i].startswith("# "):
            title = lines[i][2:].strip()
            i += 1
            break
        i += 1
    src = []
    while i < len(lines) and not lines[i].startswith(("#", "---", "|", "- ", "> ", "```")):
        if lines[i].strip():
            src.append(lines[i].strip())
        elif src:
            break
        i += 1
    if src:
        source = " ".join(src)

    while i < len(lines):
        line = lines[i]
        stripped = line.strip()

        if not stripped:
            out.append("")
            i += 1
        elif stripped.startswith("```"):
            i += 1
            buf = []
            while i < len(lines) and not lines[i].strip().startswith("```"):
                buf.append(lines[i])
                i += 1
            i += 1
            body = "\n".join(buf).replace("\\", "\\\\").replace('"', '\\"')
            out.append("#codeblock[#raw(\"%s\", block: true)]" % body.replace("\n", "\\n"))
        elif re.match(r"^-{3,}$", stripped):
            out.append("#sep()")
            i += 1
        elif stripped.startswith("#"):
            level = len(stripped) - len(stripped.lstrip("#"))
            out.append("%s %s" % ("=" * level, inline(stripped[level:].strip())))
            i += 1
        elif stripped.startswith("> "):
            buf = []
            while i < len(lines) and lines[i].strip().startswith(">"):
                buf.append(lines[i].strip().lstrip(">").strip())
                i += 1
            out.append("#pull[%s]" % inline(" ".join(buf)))
        elif stripped.startswith("|"):
            rows = []
            while i < len(lines) and lines[i].strip().startswith("|"):
                rows.append(split_row(lines[i]))
                i += 1
            rows = [r for r in rows if not all(re.fullmatch(r":?-{2,}:?", c) for c in r)]
            if rows:
                ncol = max(len(r) for r in rows)
                head, body = rows[0], rows[1:]
                cells = ["table.header(%s)" %
                         ", ".join("[%s]" % inline(c) for c in head)]
                for r in body:
                    r = r + [""] * (ncol - len(r))
                    cells += ["[%s]" % inline(c) for c in r]
                out.append(
                    "#block(above: 9pt, below: 9pt)[#text(9.5pt)[#table(\n"
                    "  columns: %d, inset: 5pt, align: left + top,\n"
                    "  stroke: 0.4pt + luma(170),\n  %s,\n)]]" % (ncol, ",\n  ".join(cells))
                )
        elif re.match(r"^[-*] ", stripped) or re.match(r"^\d+[.)] ", stripped):
            # A list: keep nesting by indentation, and fold continuation lines in.
            buf = []
            while i < len(lines):
                cur = lines[i]
                if not cur.strip():
                    if i + 1 < len(lines) and re.match(r"^\s+\S", lines[i + 1]):
                        i += 1
                        continue
                    break
                m = re.match(r"^(\s*)([-*]|\d+[.)])\s+(.*)$", cur)
                if m:
                    indent = len(m.group(1))
                    marker = "+" if m.group(2)[0].isdigit() else "-"
                    buf.append((indent, marker, [m.group(3)]))
                elif buf and re.match(r"^\s+\S", cur):
                    buf[-1][2].append(cur.strip())
                else:
                    break
                i += 1
            for indent, marker, parts in buf:
                out.append("%s%s %s" % (" " * indent, marker, inline(" ".join(parts))))
        else:
            buf = []
            while i < len(lines) and lines[i].strip() and not lines[i].strip().startswith(
                    ("#", "|", ">", "```", "- ", "* ")):
                buf.append(lines[i].strip())
                i += 1
            out.append(inline(" ".join(buf)))

    # The `---` that closes the title block in the Markdown would render as a
    # divider immediately under the header rule. Drop it.
    while out and (not out[0].strip() or out[0] == "#sep()"):
        out.pop(0)

    return title, source, "\n".join(out)


# ------------------------------------------------------------------ driver

def pdf_name(stem):
    return "molecular genetics ref - %s.pdf" % stem.replace("-", " ")


def build(path):
    stem = os.path.splitext(os.path.basename(path))[0]
    with open(path, encoding="utf-8") as fh:
        title, source, body = convert(fh.read())

    typ = os.path.join(BUILD, stem + ".typ")
    with open(typ, "w", encoding="utf-8") as fh:
        fh.write('#import "../../templates/ref.typ": *\n\n')
        fh.write("#show: note.with(\n  title: %s,\n" % typst_str(title))
        if source:
            fh.write("  source: [%s],\n" % inline(source))
        fh.write(")\n\n")
        fh.write(body + "\n")

    out = os.path.join(OUTDIR, pdf_name(stem))
    subprocess.run(["typst", "compile", "--root", HERE, typ, out], check=True)
    print("built %s" % os.path.relpath(out, os.path.dirname(HERE)))


def main():
    os.makedirs(OUTDIR, exist_ok=True)
    os.makedirs(BUILD, exist_ok=True)
    args = sys.argv[1:]
    files = ([os.path.join(REFDIR, os.path.basename(a)) for a in args] if args
             else sorted(os.path.join(REFDIR, f) for f in os.listdir(REFDIR)
                         if f.endswith(".md")))
    for f in files:
        build(f)


if __name__ == "__main__":
    main()
