#!/bin/bash

# Compiles one or all Typst day files into nicely formatted PDF names.

if [ "$1" == "" ]; then
    # Compile all
    for file in day-*.typ; do
        if [ -f "$file" ]; then
            day_num=$(echo "$file" | grep -o -E '[0-9]+')
            echo "Compiling $file -> problems/code day $day_num.pdf"
            typst compile "$file" "problems/code day $day_num.pdf"
        fi
    done
else
    # Compile one specific file passed as argument
    file=$1
    if [ -f "$file" ]; then
        day_num=$(echo "$file" | grep -o -E '[0-9]+')
        echo "Compiling $file -> problems/code day $day_num.pdf"
        typst compile "$file" "problems/code day $day_num.pdf"
    else
        echo "File $file not found."
    fi
fi
