#!/usr/bin/env bash
# Compile every Typst problem set to PDF (Kindle Scribe sized).
#   ./build.sh                 -> compile all .typ under course/
#   ./build.sh path/to/day.typ -> compile just that one
# --root is required: day files import ../../../templates/scribe.typ, which
# escapes their own directory, and typst sandboxes to the project root.
#
# Source files keep the sortable `day-NN.typ` name; the PDF is emitted as
# "molecular genetics day NN.pdf", because the filename is what shows in the
# Scribe's document list and "day-06" says nothing there.
set -euo pipefail
cd "$(dirname "$0")"

outname() {
  local dir base stem
  dir=$(dirname "$1")
  base=$(basename "$1" .typ)
  case "$base" in
    day-*) stem="molecular genetics day ${base#day-}" ;;
    *)     stem="$base" ;;                # anything not a day set keeps its name
  esac
  printf '%s/%s.pdf' "$dir" "$stem"
}

build() {
  local out
  out=$(outname "$1")
  typst compile --root . "$1" "$out" && echo "built $out"
}

if [ $# -gt 0 ]; then
  for f in "$@"; do
    build "$f"
  done
else
  # reference/ is built by refbuild.py from the Markdown — not here.
  find . -name '*.typ' -type f -not -path './templates/*' -not -path './reference/*' -print0 |
    while IFS= read -r -d '' f; do
      build "$f"
    done
fi
