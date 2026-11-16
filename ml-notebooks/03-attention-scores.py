import marimo

__generated_with = "0.25.1"
app = marimo.App(width="medium")


@app.cell
def _():
    import marimo as mo

    return (mo,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    # Attention scores on a promoter (before training)

    I've spent the last six days doing transformer math on paper. Dot products, matrix products, transposes, the $W_Q$ and $W_K$ matrices, embeddings. All of it with tiny made-up numbers, which is great for seeing what's going on, but at some point I want to see it run on actual DNA.

    So here's the first half of attention on a real promoter: letters, then embeddings, then queries and keys, then a score table. No training, no softmax yet. The weights are random, and that turns out to be kind of the point.

    I'm coding this the way I code now, with an AI assistant. I write down what I want, it writes the code, and I read every line. To check it I use numbers I worked out by hand on the paper sheets, since those I actually trust.
    """)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## The data

    Human promoters (label 1) and non-promoter fragments (label 0), 251 bp each, from Umarov & Solovyev 2017, packaged by Genomic Benchmarks. It's the same set I used for the CNN notebooks, so it's already sitting in `data/`.
    """)
    return


@app.cell
def _():
    from pathlib import Path

    import matplotlib.pyplot as plt
    import numpy as np
    import pandas as pd

    train = pd.read_parquet(Path("data") / "train.parquet")
    promoter = train[train.label == 1].seq.iloc[0]
    print(len(train), "sequences")
    print(promoter[:60], "...")
    return np, plt, promoter


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Three small functions

    Here's the spec I gave myself:

    - `one_hot(seq)`: a string of A, C, G, T in, an array of shape (length, 4) out, columns in the order A, C, G, T.
    - `embed(seq, E)`: one-hot the sequence, multiply by the embedding table `E` (4 × d), get `X` of shape (length, d). One row per position.
    - `scores(X, W_Q, W_K)`: make `Q = X W_Q` and `K = X W_K`, return the score table `Q Kᵀ`, shape (length, length).

    Plain numpy, no classes, short enough to read in a minute. numpy is already imported as `np` in this notebook, so the code should only define the three functions, no imports and no other top-level variables (marimo won't let two cells define the same name).
    """)
    return


@app.cell
def _(mo):
    mo.md(r"""
    And the prompt I actually sent:


    >give me these three functions
     - `one_hot(seq)`: a string of A, C, G, T in, an array of shape (length, 4) out, columns in the order A, C, G, T.
     - `embed(seq, E)`: one-hot the sequence, multiply by the embedding table `E` (4 × d), get `X` of shape (length, d). One row per position.
     - `scores(X, W_Q, W_K)`: make `Q = X W_Q` and `K = X W_K`, return the score table `Q Kᵀ`, shape (length, length).
    """)
    return


@app.cell
def _(np):
    def one_hot(seq):
        order = "ACGT"
        out = np.zeros((len(seq), 4))
        for i, base in enumerate(seq):
            out[i, order.index(base)] = 1.0
        return out


    def embed(seq, E):
        return one_hot(seq) @ E


    def scores(X, W_Q, W_K):
        Q = X @ W_Q
        K = X @ W_K
        return Q @ K.T

    return embed, one_hot, scores


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Does it agree with my paper sheets?

    Before trusting any of this on a real sequence, I want it to reproduce two answers I worked out by hand.

    **(a)** Day 6: embedding `GAT` with the table below. I put my hand answer for `X` in `my_X_day06`.

    **(b)** Day 5: the CAAT/GC score table. My hand answer for `S` goes in `my_S_day05`.
    """)
    return


@app.cell
def _(np):
    E_day06 = np.array([[3, 4], [-2, 0], [0, 2], [4, 3]])

    X_day05 = np.array([[1, 2], [1, 0]])
    W_Q_day05 = np.array([[2, 0], [0, 1]])
    W_K_day05 = np.array([[0, 1], [1, 0]])

    my_X_day06 = np.array([[0, 2], [3, 4], [4, 3]])
    my_S_day05 = np.array([[6, 2], [4, 0]])
    return E_day06, W_K_day05, W_Q_day05, X_day05, my_S_day05, my_X_day06


@app.cell
def _(
    E_day06,
    W_K_day05,
    W_Q_day05,
    X_day05,
    embed,
    my_S_day05,
    my_X_day06,
    np,
    scores,
):
    if my_X_day06 is None or my_S_day05 is None:
        _msg = "fill in my_X_day06 and my_S_day05 from the sheets first"
    else:
        _x_ok = np.array_equal(embed("GAT", E_day06), np.array(my_X_day06))
        _s_ok = np.array_equal(scores(X_day05, W_Q_day05, W_K_day05), np.array(my_S_day05))
        _msg = f"embed matches day 6: {_x_ok}\nscores matches day 5: {_s_ok}"
    print(_msg)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Now a real promoter

    One promoter, 251 bases. I'll use a random embedding table with 8 numbers per base, and random $W_Q$, $W_K$ that take 8 numbers down to 4. Random is fine here. It's the shapes and the structure I'm after, not the values.

    **(c)** Before running anything: what shapes do I expect? I wrote my guesses in the next cell as (rows, columns).
    """)
    return


@app.cell
def _():
    my_shape_onehot = (4, 8)
    my_shape_X = ()
    my_shape_Q = ()
    my_shape_S = ()
    return my_shape_Q, my_shape_S, my_shape_X, my_shape_onehot


@app.cell
def _(
    embed,
    my_shape_Q,
    my_shape_S,
    my_shape_X,
    my_shape_onehot,
    np,
    one_hot,
    promoter,
    scores,
):
    rng = np.random.default_rng(0)
    E = rng.normal(size=(4, 8))
    W_Q = rng.normal(size=(8, 4))
    W_K = rng.normal(size=(8, 4))

    X = embed(promoter, E)
    Q = X @ W_Q
    S = scores(X, W_Q, W_K)

    _guesses = [my_shape_onehot, my_shape_X, my_shape_Q, my_shape_S]
    if None in _guesses:
        print("guess all four shapes first")
    else:
        for _name, _guess, _arr in [
            ("one-hot", my_shape_onehot, one_hot(promoter)),
            ("X", my_shape_X, X),
            ("Q", my_shape_Q, Q),
            ("S", my_shape_S, S),
        ]:
            print(f"{_name:8} guessed {_guess}, got {_arr.shape}")
    return E, S, W_K, W_Q


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## What does the score table look like?

    $S$ has $251 \times 251 = 63{,}001$ entries.

    **(d)** Before running the next two cells: how many *different* numbers do I expect in $S$? A guess and one line of reasoning.
    """)
    return


@app.cell
def _():
    my_guess_distinct = None
    return (my_guess_distinct,)


@app.cell
def _(S, mo, my_guess_distinct, np):
    mo.stop(my_guess_distinct is None, mo.md("guess first"))
    n_distinct = np.unique(np.round(S, 8)).size
    print(f"guessed {my_guess_distinct}, actually {n_distinct}")
    return


@app.cell
def _(S, mo, my_guess_distinct, plt, promoter):
    mo.stop(my_guess_distinct is None, mo.md("the heatmap shows up once you've guessed"))
    _n = 30
    _fig, _ax = plt.subplots(figsize=(6, 5.5))
    _im = _ax.imshow(S[:_n, :_n], cmap="RdBu_r")
    _ax.set_xticks(range(_n), list(promoter[:_n]), fontsize=7)
    _ax.set_yticks(range(_n), list(promoter[:_n]), fontsize=7)
    _ax.set_xlabel("key position")
    _ax.set_ylabel("query position")
    _ax.set_title("scores for the first 30 bases")
    _fig.colorbar(_im, ax=_ax, shrink=0.8)
    _fig
    return


@app.cell
def _(mo):
    mo.md(r"""
    **(e)** Why that many, and what does it mean for a model that only has this? In my own words:

    > write it here
    """)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Reading someone else's one-hot

    Here's another way to one-hot a sequence. It's shorter than what I'd write, and it took me a second to see why it works.
    """)
    return


@app.cell
def _(np):
    bases = "ACGT"

    def one_hot_eye(seq):
        idx = np.array([bases.index(b) for b in seq])
        return np.eye(4)[idx]

    one_hot_eye("GAT")
    return


@app.cell
def _(mo):
    mo.md(r"""
    **(f)** What's `np.eye(4)`, what does `[idx]` do to it, and which idea from the day 6 sheet is this exactly?

    > write it here
    """)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## A bug that doesn't crash

    This version of `scores` runs fine and gives a nice small table. That's the problem.
    """)
    return


@app.cell
def _(E, W_K, W_Q, embed, promoter):
    def scores_v2(X, W_Q, W_K):
        Q = X @ W_Q
        K = X @ W_K
        return Q.T @ K

    S_v2 = scores_v2(embed(promoter, E), W_Q, W_K)
    S_v2.shape
    return


@app.cell
def _(mo):
    mo.md(r"""
    **(g)** What shape came out, why didn't numpy complain, and what do the rows and columns of this table stand for? I fixed it in the cell below until the check passed.

    > write it here
    """)
    return


@app.cell
def _(E, S, W_K, W_Q, embed, np, promoter):
    def scores_fixed(X, W_Q, W_K):
        Q = X @ W_Q
        K = X @ W_K
        return Q.T @ K

    _S_fixed = scores_fixed(embed(promoter, E), W_Q, W_K)
    print("shape:", _S_fixed.shape, "| matches S:", _S_fixed.shape == S.shape and np.allclose(_S_fixed, S))
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## What I take away from this

    **(h)** Two or three sentences for the end of the post. What surprised me, and what's missing before this could tell a promoter from a random fragment?

    > write it here
    """)
    return


if __name__ == "__main__":
    app.run()
