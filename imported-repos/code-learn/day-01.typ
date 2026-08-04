#import "template.typ": *

#show: sheet.with(
  day: "01",
  title: "Mixed Gauntlet"
)

#section_heading("Timer")

#timer_table(
  drill: "5m",
  written: "15m",
  total: "20m"
)

#section_heading("Five-card Drill")

#ref_box[
  *1.* What does `&mut` in a Rust function signature promise the caller?
]
#v(1in)

#ref_box[
  *2.* In Nextflow, what does the `collect` operator do to a channel?
]
#v(1in)

#ref_box[
  *3.* In Python, what does a bare `yield` keyword do to a function's return type?
]
#v(1in)

#ref_box[
  *4.* In Rust, what is the core difference between `String` and `&str`?
]
#v(1in)

#ref_box[
  *5.* In C, what happens if you declare `int arr[5]` and then assign `arr[5] = 10;`?
]
#v(1in)

#pagebreak()

#section_heading("Written Exercises")

#question(space: 2in)[
  *Python (Trace it):* Consider the following Python generator. What exact output is printed when this code is executed?
  
  #code_block(lang: "python", "def gen():
    for i in range(3):
        yield i
        yield i * 10

result = list(gen())
print(result)")
]

#question(space: 1.5in)[
  *Rust (JEE-style MCQ):* Consider the following Rust snippet.
  
  #code_block(lang: "rust", "fn main() {
    let mut x = 5;
    let y = &mut x;
    *y += 1;
    let z = &x;
    println!(\"{}\", z);
}")

  Select *all* statements that are correct:
  A. The code compiles and prints `6`.
  B. The compiler throws an error at line 5 (`let z = &x;`) because `x` is already mutably borrowed by `y`.
  C. The compiler allows the borrow at line 5 because the mutable borrow `y` is no longer used after line 4, so its lifetime ends.
  D. If we added `println!(\"{}\", y);` after line 6, the code would fail to compile.
]

#question(space: 2in)[
  *Nextflow (Read and explain):* Look at this DSL2 process block. What exactly is the structure of the item being passed in via `ch_reads`, and what is being assigned to `sample_id` and `reads`?

  #code_block(lang: "groovy", "process ALIGN_READS {
    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path(\"*.bam\")

    script:
    \"\"\"
    bwa mem ref.fa ${reads[0]} ${reads[1]} > ${sample_id}.bam
    \"\"\"
}")
]

#question(space: 1.5in)[
  *Go (Fill the blank):* Below is a snippet from a Go lexer's `NextToken()` switch statement. Fill in the logical missing `token.TokenType`s that would match the given character cases.

  #code_block(lang: "go", "switch l.ch {
case '=':
    tok = newToken(______, l.ch)
case '+':
    tok = newToken(______, l.ch)
case ',':
    tok = newToken(______, l.ch)
case '{':
    tok = newToken(______, l.ch)
}")
]

#closing_block[Stop the timer. Do not run any of this code.]
