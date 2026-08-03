#!/usr/bin/env bash
# File a marked-up sheet from the Scribe into solutions/.
#
#   ./course/intake.sh 06                 newest PDF in ~/Downloads -> solutions/day-06.pdf
#   ./course/intake.sh 06 ~/some.pdf      that file instead
#   ./course/intake.sh 06 --screens       page screenshots off the mounted Kindle, bound
#                                         into solutions/day-06.pdf in filename order
#   ./course/intake.sh 06 --screens DIR   screenshots from DIR instead of the Kindle
#
# --screens is the fallback for a document that was sent to the device WITHOUT
# "Add to Library" ticked: no cloud copy means no Share menu and no PDF export,
# but screenshots (tap two opposite corners) are ordinary PNGs on the device.
#
# Then say "grade day 06" — the drill on page 1 gets marked off the same file.
set -euo pipefail
cd "$(dirname "$0")/.."

day=${1:?usage: intake.sh <day-number> [file.pdf | --screens [dir]]}
src=${2:-}

# ---- screenshots -> one PDF -------------------------------------------------
if [ "$src" = "--screens" ]; then
  dir=${3:-}
  if [ -z "$dir" ]; then
    dir=$(ls -d /Volumes/Kindle* 2>/dev/null | head -1 || true)
    [ -n "$dir" ] || { echo "no Kindle mounted under /Volumes — plug it in, or pass a directory" >&2; exit 1; }
  fi
  dest="solutions/day-${day}.pdf"
  mkdir -p solutions
  [ -e "$dest" ] && { echo "$dest already exists — move it aside first" >&2; exit 1; }

  # Screenshots are timestamp-named, so filename order is capture order.
  python3 - "$dir" "$dest" <<'PY'
import fitz, os, sys
src_dir, dest = sys.argv[1], sys.argv[2]
shots = sorted(
    os.path.join(r, f)
    for r, _, fs in os.walk(src_dir)
    for f in fs
    if f.lower().endswith((".png", ".jpg", ".jpeg")) and not f.startswith("._")
)
if not shots:
    sys.exit("no PNG/JPG screenshots found under %s" % src_dir)
doc = fitz.open()
for path in shots:
    img = fitz.open(path)
    pdfbytes = img.convert_to_pdf()
    doc.insert_pdf(fitz.open("pdf", pdfbytes))
    img.close()
doc.save(dest)
print("bound %d screenshot(s) -> %s" % (len(shots), dest))
for p in shots:
    print("   " + os.path.basename(p))
PY
  echo "check the page order above, then tell Claude: grade day ${day}"
  exit 0
fi

if [ -z "$src" ]; then
  # Newest PDF in Downloads, by mtime. macOS stat; no find -printf here.
  src=$(find "$HOME/Downloads" -maxdepth 1 -name '*.pdf' -type f -exec stat -f '%m %N' {} + |
        sort -rn | head -1 | cut -d' ' -f2-)
  [ -n "$src" ] || { echo "no PDFs in ~/Downloads" >&2; exit 1; }
fi

dest="solutions/day-${day}.pdf"
mkdir -p solutions
[ -e "$dest" ] && { echo "$dest already exists — move it aside first" >&2; exit 1; }

mv "$src" "$dest"
pages=$(python3 -c "import fitz,sys; print(fitz.open(sys.argv[1]).page_count)" "$dest" 2>/dev/null || echo '?')
echo "filed $(basename "$src") -> $dest  ($pages pages)"
echo "now tell Claude: grade day ${day}"
