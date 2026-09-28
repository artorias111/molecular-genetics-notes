# Proof techniques — your working toolkit

You chose **proof-forward**, so this sheet is central. A proof is just a convincing,
gap-free argument that a statement is true. The skill is knowing which *shape* of argument to
reach for, and being honest about where an argument actually has a gap vs. is just informally
worded.

## The shapes

### Direct proof
To prove "if $P$ then $Q$": assume $P$, and derive $Q$ by a chain of justified steps.
> *Claim:* if $n$ is even then $n^2$ is even. *Proof:* $n = 2k$ for some integer $k$, so
> $n^2 = 4k^2 = 2(2k^2)$, which is even. ∎

### Contrapositive
"If $P$ then $Q$" is logically identical to "if not $Q$ then not $P$." Sometimes the
contrapositive is far easier to prove directly.
> To prove "if $n^2$ is even then $n$ is even," instead prove "if $n$ is odd then $n^2$ is
> odd" — which is a clean direct proof.

### Proof by contradiction
Assume the statement is false, derive an impossibility. Powerful, but don't reach for it when
a direct proof exists — contradiction proofs are easy to get subtly wrong.
> *$\sqrt{2}$ is irrational:* suppose $\sqrt2 = a/b$ in lowest terms; square to get
> $a^2 = 2b^2$, so $a$ is even, so $a=2c$, so $b^2 = 2c^2$, so $b$ is even too — contradicting
> "lowest terms." ∎

### Induction
To prove $P(n)$ for all $n \ge n_0$:
1. **Base case:** show $P(n_0)$.
2. **Inductive step:** assume $P(k)$ (the *inductive hypothesis*), prove $P(k+1)$.
> The dominoes: base case tips the first; the step guarantees each tips the next.

*Strong induction* assumes $P(n_0),\dots,P(k)$ all hold to prove $P(k+1)$ — use it when
$P(k+1)$ depends on more than just the immediately preceding case.

### Existence & uniqueness
Two separate jobs. **Existence:** exhibit an object (construct one, or prove one must exist).
**Uniqueness:** assume two such objects $x, y$ and show $x = y$. "$\exists!$" demands both.

### Proving sets equal ($A = B$)
Show $A \subseteq B$ **and** $B \subseteq A$: take an arbitrary $x \in A$, prove $x \in B$;
then the reverse.

### Proving a bijection
Either exhibit an explicit inverse function, or prove injective (distinct inputs give distinct
outputs) **and** surjective (everything in the codomain is hit) separately.

## Habits that separate a proof from a hand-wave

- **Quantify explicitly.** "For all", "there exists" — say which, in order. Most buggy proofs
  swap a $\forall\exists$ for an $\exists\forall$.
- **Name your objects before using them.** "Let $k$ be the integer with $n = 2k$" — don't let
  a symbol appear from nowhere.
- **Every step needs a reason** — a definition, hypothesis, or prior result. If you can't name
  the reason, that's the gap.
- **State where you use the hypothesis.** A proof that never uses $P$ is proving something else.
- **∎ or QED** marks the end.

## Self-check before you call it done

1. Did I actually prove the thing asked, or its converse / a special case?
2. Is every "clearly / obviously" genuinely obvious, or hiding work?
3. Would a skeptical reader accept every step, or is one doing too much?
4. Did I use every hypothesis? (If not, either the proof is wrong or the hypothesis was
   unnecessary — figure out which.)
