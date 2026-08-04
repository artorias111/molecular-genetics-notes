#!/bin/bash
# Builds all day-*.typ files in the problems/ directory or a specific one.

build_file() {
    src=$1
    # Extract the day number: day-01.typ -> 01
    day=$(basename "$src" | grep -oE '[0-9]{2}')
    if [ -n "$day" ]; then
        # Put the PDF in the problems directory as well
        dir=$(dirname "$src")
        dest="$dir/cs229 day ${day}.pdf"
        echo "Compiling $src to $dest..."
        typst compile --root . "$src" "$dest"
    else
        echo "Could not extract day from $src"
    fi
}

if [ -z "$1" ]; then
    for f in problems/day-*.typ; do
        [ -e "$f" ] && build_file "$f"
    done
else
    build_file "$1"
fi
