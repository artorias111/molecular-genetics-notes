# Run from ml-notebooks/: uv run python 03-attention-scores-plain.py

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

here = Path(__file__).parent
train = pd.read_parquet(here / "data" / "train.parquet")
promoter = train[train.label == 1].seq.iloc[0]


# Write these three:
# one_hot(seq): string of A, C, G, T -> array (length, 4), columns in order A, C, G, T
# embed(seq, E): one_hot(seq) @ E -> X, shape (length, d)
# scores(X, W_Q, W_K): Q = X W_Q, K = X W_K, return Q K^T, shape (length, length)

def one_hot(seq):
    ohe_array = []

    for i in seq:
        if i == 'A':
            ohe_array.append([1, 0, 0, 0])
        if i == 'C':
            ohe_array.append([0, 1, 0, 0])
        if i == 'G':
            ohe_array.append([0, 0, 1, 0])
        if i == 'T':
            ohe_array.append([0, 0, 0, 1])

    return np.array(ohe_array)

def embed(seq, E):
    ohe_array = one_hot(seq)
    return ohe_array @ E


def scores(X, W_Q, W_K):
    Q = X @ W_Q
    K = X @ W_K

    return Q @ K.T

# (a), (b) Your hand answers from day 06 (X for GAT) and day 05 (S for CAAT/GC)
my_X_day06 = [[0, 2], [3, 4], [4, 3]]
my_S_day05 = [[6, 2], [4, 0]]

# (c) Guess the shapes as (rows, columns) for the 251 bp promoter.
# E is 4 x 8, W_Q and W_K are 8 x 4.
my_shape_onehot = (251, 4)
my_shape_X = (251, 8)
my_shape_Q = (251, 4)
my_shape_S = (251, 251)

# (d) S has 251 x 251 = 63,001 entries. How many different numbers are in it?
my_guess_distinct = 251 # sparse, 1 per row?


def stop_if_missing(*values):
    if any(v is None for v in values):
        raise SystemExit("fill in your guesses above first")


print("--- (a), (b) does it match the sheets?")
stop_if_missing(my_X_day06, my_S_day05)
E_day06 = np.array([[3, 4], [-2, 0], [0, 2], [4, 3]])
X_day05 = np.array([[1, 2], [1, 0]])
W_Q_day05 = np.array([[2, 0], [0, 1]])
W_K_day05 = np.array([[0, 1], [1, 0]])
print("embed matches day 6:", np.array_equal(embed("GAT", E_day06), np.array(my_X_day06)))
print("scores matches day 5:", np.array_equal(scores(X_day05, W_Q_day05, W_K_day05), np.array(my_S_day05)))

print("\n--- (c) shapes")
stop_if_missing(my_shape_onehot, my_shape_X, my_shape_Q, my_shape_S)
rng = np.random.default_rng(0)
E = rng.normal(size=(4, 8))
W_Q = rng.normal(size=(8, 4))
W_K = rng.normal(size=(8, 4))
X = embed(promoter, E)
Q = X @ W_Q
S = scores(X, W_Q, W_K)
print("one-hot  guessed", my_shape_onehot, "got", one_hot(promoter).shape)
print("X        guessed", my_shape_X, "got", X.shape)
print("Q        guessed", my_shape_Q, "got", Q.shape)
print("S        guessed", my_shape_S, "got", S.shape)

print("\n--- (d) distinct values in S")
stop_if_missing(my_guess_distinct)
print("guessed", my_guess_distinct, "actually", np.unique(np.round(S, 8)).size)

n = 30
fig, ax = plt.subplots(figsize=(6, 5.5))
im = ax.imshow(S[:n, :n], cmap="RdBu_r")
ax.set_xticks(range(n), list(promoter[:n]), fontsize=7)
ax.set_yticks(range(n), list(promoter[:n]), fontsize=7)
ax.set_xlabel("key position")
ax.set_ylabel("query position")
ax.set_title("scores for the first 30 bases")
fig.colorbar(im, ax=ax, shrink=0.8)
fig.savefig(here / "03-heatmap.png", dpi=150, bbox_inches="tight")
print("heatmap saved to 03-heatmap.png")

# (d) Open 03-heatmap.png. Anything you notice?
#
#
# (e) Why that many distinct values in S, and what does it mean for a model
# that only has this?
#
#

print("\n--- (f) someone else's one-hot")
bases = "ACGT"
idx = np.array([bases.index(b) for b in "GAT"])
print(np.eye(4)[idx])

# (f) What's np.eye(4), what does [idx] do to it, and which idea from the
# day 06 sheet is this exactly?
#
#

print("\n--- (g) a bug that doesn't crash")


def scores_v2(X, W_Q, W_K):
    Q = X @ W_Q
    K = X @ W_K
    return Q.T @ K


print("scores_v2 shape:", scores_v2(X, W_Q, W_K).shape)

# (g) What shape came out, why didn't numpy complain, and what do the rows
# and columns of this table stand for?
#
#


# Fix this one so the check below passes
def scores_fixed(X, W_Q, W_K):
    Q = X @ W_Q
    K = X @ W_K
    return Q.T @ K


S_fixed = scores_fixed(X, W_Q, W_K)
print("fixed shape:", S_fixed.shape, "| matches S:", S_fixed.shape == S.shape and np.allclose(S_fixed, S))


# (h) Two or three sentences for the end of the post. What surprised you,
# and what's missing before this could tell a promoter from a random fragment?
#
#
