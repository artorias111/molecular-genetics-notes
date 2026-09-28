# Notation cheatsheet — how to *read* the symbols

> **⚠ SUPERSEDED 2026-08-02 — the live version is `course/reference/notation.typ` →
> `math notation.pdf`.** He reads on a Kindle Scribe, and a Markdown file in the repo is
> invisible at the moment he actually needs it (mid-problem, on the device). The Typst version
> carries everything below *plus* calculus/optimization and the whole statistics/MLE block, and
> it is the one that gets extended. This file is kept only as the Phase-0 record.

The point of this sheet is not to memorize symbols but to **unfold** them. When you hit a
dense equation in a paper, the move is always the same: name every symbol, identify the
index and its bounds, and mentally (or on paper) expand the first two or three terms.

## Sets

| Symbol | Reads as | Note |
|---|---|---|
| $\{x : P(x)\}$ | "the set of all $x$ such that $P(x)$ holds" | the colon/`\|` is "such that" |
| $x \in A$ | "$x$ is an element of $A$" | $\notin$ = not in |
| $A \subseteq B$ | "$A$ is a subset of $B$" | every element of $A$ is in $B$ |
| $A \cup B,\ A \cap B$ | union, intersection | "or", "and" |
| $A \setminus B$ | "$A$ minus $B$" | elements in $A$ but not $B$ |
| $\lvert A \rvert$ | "size / cardinality of $A$" | number of elements |
| $\mathbb{N},\mathbb{Z},\mathbb{Q},\mathbb{R},\mathbb{C}$ | naturals, integers, rationals, reals, complex | |
| $A \times B$ | Cartesian product | set of ordered pairs $(a,b)$ |

## Quantifiers and logic

| Symbol | Reads as |
|---|---|
| $\forall x$ | "for all $x$" |
| $\exists x$ | "there exists an $x$" |
| $\exists! x$ | "there exists a unique $x$" |
| $\implies$ | "implies / if…then" |
| $\iff$ | "if and only if" |
| $\neg P$ | "not $P$" |
| $s.t.$ | "such that" |

**Reading order matters.** $\forall x\, \exists y\, P(x,y)$ ("for every $x$ there is a $y$")
is *not* the same as $\exists y\, \forall x\, P(x,y)$ ("there is one $y$ that works for all
$x$"). The second is much stronger.

## The "loops": Σ and Π

$$\sum_{i=1}^{n} a_i = a_1 + a_2 + \cdots + a_n \qquad \prod_{i=1}^{n} a_i = a_1 \cdot a_2 \cdots a_n$$

Read a summation exactly like a `for` loop:

```python
total = 0
for i in range(1, n+1):   # i = 1 .. n   (the bounds under/over the Σ)
    total += a[i]         # the body is the expression to the right of Σ
```

- The variable under the sign (here $i$) is the **index**; the bounds tell you its range.
- Nested sums = nested loops: $\sum_{i=1}^{n}\sum_{j=1}^{m} a_{ij}$ is a double loop.
- Index over a set: $\sum_{x \in S} f(x)$ means "loop over every element of $S$."
- Empty sum $= 0$; empty product $= 1$ (the identity of each operation).
- **Always expand the first 2–3 terms** when an indexed expression looks opaque. This single
  habit is the difference between "just another equation" and understanding.

## Functions

| Notation | Reads as |
|---|---|
| $f : A \to B$ | "$f$ maps set $A$ to set $B$" ($A$ = domain, $B$ = codomain) |
| $x \mapsto f(x)$ | "$x$ maps to $f(x)$" (defines the rule) |
| $f \circ g$ | "$f$ composed with $g$": $(f\circ g)(x) = f(g(x))$ |
| $f^{-1}$ | inverse function (exists iff $f$ is a bijection) |
| injective | one-to-one: different inputs → different outputs |
| surjective | onto: every element of $B$ is hit |
| bijective | both — a perfect pairing |

## Greek letters you'll meet constantly

$\alpha,\beta,\gamma,\delta$ (parameters/angles), $\theta$ (parameter, esp. in stats/MLE),
$\lambda$ (eigenvalue, rate), $\mu$ (mean), $\sigma$ (std. dev.; $\sigma^2$ variance),
$\Sigma$ (sum, or covariance matrix), $\pi$ (the constant, or a probability/permutation),
$\epsilon$ (a small positive number, esp. in limit proofs), $\nabla$ ("nabla", the gradient).
