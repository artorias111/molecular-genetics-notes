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
    # Week 1: real promoters into a tensor

    **The series.** One notebook a week. Together they build `promoter-cnn`: a 1D CNN that says whether a 251 bp human sequence is a promoter. Same model as the refresher workbook, now on real data.

    **This week.** Download the data, look at it, one-hot encode it and get the shape `Conv1d` wants. About 20 minutes, 4 blanks.

    **How it works.**
    - Fill each `...` marked `TODO`. The check cell below it tells you if it worked.
    - Cells starting with `# copy to: ...` are the project code. When the checks pass, paste them into that file in `projects/promoter-cnn/`, in order.
    - Everything else is just for looking.

    **Data.** Human non-TATA promoters vs non-promoter genomic fragments, from Umarov & Solovyev 2017 (PLOS ONE), packaged by Genomic Benchmarks. Label 1 = promoter.
    """)
    return


@app.cell
def _():
    # copy to: src/promoter_cnn/data.py
    from pathlib import Path
    import urllib.request

    import numpy as np
    import pandas as pd
    import torch

    return Path, np, pd, torch, urllib


@app.cell
def _(Path, pd, urllib):
    # copy to: src/promoter_cnn/data.py
    BASE_URL = "https://huggingface.co/datasets/katarinagresova/Genomic_Benchmarks_human_nontata_promoters/resolve/main/data/"
    FILES = {
        "train": "train-00000-of-00001-aeb55728756a44ae.parquet",
        "test": "test-00000-of-00001-d7614d9116c62f44.parquet",
    }


    def download(data_dir="data"):
        data_dir = Path(data_dir)
        data_dir.mkdir(parents=True, exist_ok=True)
        for split, name in FILES.items():
            out = data_dir / f"{split}.parquet"
            if not out.exists():
                urllib.request.urlretrieve(BASE_URL + name, out)


    def load(split, data_dir="data"):
        return pd.read_parquet(Path(data_dir) / f"{split}.parquet")

    return download, load


@app.cell
def _(download, load, mo):
    data_dir = mo.notebook_dir() / "data"
    download(data_dir)
    train = load("train", data_dir)
    train.head()
    return (train,)


@app.cell(hide_code=True)
def _(mo, train):
    mo.md(f"""
    {len(train):,} training sequences, each {train.seq.str.len().iloc[0]} bp. Label counts: {train.label.value_counts().to_dict()}.

    ## 1. The dumbest possible model

    Before any CNN, ask: what accuracy do I get by always saying "promoter"? Any real model has to beat that. It is the classification version of "an untrained 4-class model starts at ln 4".
    """)
    return


@app.cell
def _(train):
    # TODO: fraction of training sequences with label 1. One line of pandas.
    baseline = ...
    baseline
    return (baseline,)


@app.cell
def _(baseline, mo):
    assert baseline is not ..., "Fill in baseline."
    assert abs(baseline - 0.544) < 0.001, f"Got {baseline}. Hint: train.label is 0s and 1s, so its mean is the fraction of 1s."
    mo.md(f"Check passed. Always guessing promoter gives {baseline:.1%}. Your CNN has to beat this.")
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## 2. A look at the biology

    Many human promoters sit in CpG islands, so expect them to be GC rich. Write a function for the GC fraction of one sequence.
    """)
    return


@app.cell
def _():
    # copy to: src/promoter_cnn/data.py
    def gc_content(seq):
        # TODO: fraction of bases that are G or C. str.count helps.
        return ...

    return (gc_content,)


@app.cell
def _(gc_content, mo, train):
    assert gc_content("GGCA") == 0.75, f"gc_content('GGCA') gave {gc_content('GGCA')}, expected 0.75."
    gc_by_class = train.seq.apply(gc_content).groupby(train.label).mean().round(3)
    mo.md(f"""
    Check passed. Mean GC: non-promoters {gc_by_class[0]}, promoters {gc_by_class[1]}.

    That gap is big. A model could score well by learning "GC rich means promoter" and nothing about motifs. Keep that in mind. A later week tests a GC-only baseline against the CNN.
    """)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## 3. One-hot encoding

    One row per position, one column per base in the order A, C, G, T. So a sequence of length $L$ becomes an $(L, 4)$ array. An `N` (unknown base) stays all zeros. The test set has one.
    """)
    return


@app.cell
def _(np):
    # copy to: src/promoter_cnn/data.py
    BASES = "ACGT"


    def one_hot(seq):
        x = np.zeros((len(seq), 4), dtype=np.float32)
        for i, base in enumerate(seq):
            if base in BASES:
                # TODO: set the right cell of row i to 1. BASES.index(base) gives the column.
                ...
        return x

    return (one_hot,)


@app.cell
def _(mo, np, one_hot):
    _expected = np.array([[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1], [0, 0, 0, 0]])
    _got = one_hot("ACGTN")
    assert _got.shape == (5, 4), f"Shape is {_got.shape}, expected (5, 4)."
    assert (_got == _expected).all(), f"one_hot('ACGTN') gave\n{_got}"
    mo.md("Check passed. Each row sums to 1, except the N row, which is 0.")
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## 4. A batch in the shape `Conv1d` wants

    Stacking one-hot arrays gives `(N, L, 4)`. `Conv1d` wants `(N, C, L)` with the 4 bases as channels. This is the part 1 Q1 fix, now for real. `squeeze` won't do it. Reorder the dimensions.
    """)
    return


@app.cell
def _(np, one_hot, torch):
    # copy to: src/promoter_cnn/data.py
    def encode(seqs):
        x = torch.from_numpy(np.stack([one_hot(s) for s in seqs]))
        # TODO: reorder (N, L, 4) into (N, 4, L).
        x = ...
        return x

    return (encode,)


@app.cell
def _(encode, mo, one_hot, train):
    xb = encode(train.seq.iloc[:64])
    _first = train.seq.iloc[0][0]
    assert tuple(xb.shape) == (64, 4, 251), f"Shape is {tuple(xb.shape)}, expected (64, 4, 251)."
    assert xb[0, :, 0].tolist() == one_hot(_first)[0].tolist(), f"Sequence 0 starts with {_first}, so xb[0, :, 0] should be its one-hot row. Did you permute the right dims?"
    mo.md(f"Check passed. Batch shape {tuple(xb.shape)}: 64 sequences, 4 channels, 251 positions.")
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Done for the week

    **Copy into `projects/promoter-cnn/src/promoter_cnn/data.py`, in this order:**
    1. The imports cell.
    2. `BASE_URL`, `FILES`, `download`, `load`.
    3. `gc_content`.
    4. `BASES`, `one_hot`.
    5. `encode`.

    Delete the `# copy to` and `# TODO` comment lines as you paste.

    **Check it works**, from `projects/promoter-cnn/`:
    ```
    uv run python -c "from promoter_cnn.data import download, load, encode; download(); print(encode(load('test').seq[:8]).shape)"
    ```
    It should print `torch.Size([8, 4, 251])`.

    **Optional.** Commit it: `git init`, then your first commit. Push to GitHub whenever you like.

    **Next week.** A PyTorch `Dataset` and `DataLoader`, then one convolution layer on a real batch.
    """)
    return


if __name__ == "__main__":
    app.run()
