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
    # batches and a first convolution

    **This week.** Wrap the data in a PyTorch `Dataset`, split off a validation set, batch it with a `DataLoader`, and run one `Conv1d` on a real batch. Then hand-build a filter that counts CpGs. About 20 minutes, 4 blanks.

    **Same rules.** Fill each `...` marked `TODO`. The check cell below tells you if it worked. Cells starting with `# copy to:` are project code.
    """)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## 0. Last week's code

    The next cell is week 1's `data.py`, already filled in, so this notebook runs on its own. Nothing to do here.
    """)
    return


@app.cell(hide_code=True)
def _(mo):
    from pathlib import Path
    import urllib.request

    import numpy as np
    import pandas as pd
    import torch

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

    BASES = "ACGT"

    def one_hot(seq):
        x = np.zeros((len(seq), 4), dtype=np.float32)
        for i, base in enumerate(seq):
            if base in BASES:
                x[i, BASES.index(base)] = 1
        return x

    data_dir = mo.notebook_dir() / "data"
    download(data_dir)
    train = load("train", data_dir)
    return np, one_hot, torch, train


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## 1. A `Dataset`

    A `Dataset` is any object with two methods:
    - `__len__()`: how many examples there are.
    - `__getitem__(i)`: example `i` as a pair `(x, y)`.

    Here `x` is one sequence as a `(4, 251)` float tensor (channels first, like last week) and `y` is its label as a float tensor (0. or 1.). Float, because next week's loss wants float targets.

    Last week `encode` did the permute for a whole batch with `(0, 2, 1)`. One sequence has no batch dimension, so `one_hot(seq)` is `(251, 4)` and `.T` flips it to `(4, 251)`.
    """)
    return


@app.cell
def _(one_hot, torch):
    # copy to: src/promoter_cnn/data.py
    from torch.utils.data import Dataset


    class PromoterDataset(Dataset):
        def __init__(self, df):
            self.seqs = df.seq.tolist()
            self.labels = df.label.tolist()

        def __len__(self):
            return len(self.seqs)

        def __getitem__(self, i):
            # TODO: x = one-hot of sequence i as a (4, 251) tensor, y = label i as a float tensor.
            # torch.from_numpy turns a numpy array into a tensor. torch.tensor(1, dtype=torch.float32) makes a float scalar.
            x = ...
            y = ...
            return x, y

    return (PromoterDataset,)


@app.cell
def _(PromoterDataset, mo, train):
    ds = PromoterDataset(train)
    _x, _y = ds[0]
    assert _x is not ..., "Fill in x."
    assert tuple(_x.shape) == (4, 251), f"x has shape {tuple(_x.shape)}, expected (4, 251). Did you transpose?"
    assert _x.dtype.is_floating_point, f"x is {_x.dtype}, expected float32."
    assert _y.dtype.is_floating_point and _y.dim() == 0, f"y should be a float scalar tensor, got {_y!r}."
    assert _y.item() == train.label.iloc[0], "y does not match train.label for example 0."
    assert _x.sum().item() == 251, "Every column of x should sum to 1 for a sequence with no N."
    mo.md(f"Check passed. `len(ds)` = {len(ds):,}. Example 0: x {tuple(_x.shape)}, y = {_y.item()}.")
    return (ds,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## 2. Train / validation split

    The test set stays locked until the last week. To judge training as you go, hold out 10% of the training data as a validation set.

    `random_split(ds, [n_train, n_val], generator=g)` shuffles and splits. The generator with a fixed seed makes the split the same every run, so validation numbers are comparable week to week.
    """)
    return


@app.cell
def _(torch):
    # copy to: src/promoter_cnn/data.py
    from torch.utils.data import random_split


    def split(ds, val_frac=0.1, seed=0):
        # TODO: n_val = val_frac of len(ds), rounded down to a whole number. n_train = the rest.
        n_val = ...
        n_train = ...
        g = torch.Generator().manual_seed(seed)
        return random_split(ds, [n_train, n_val], generator=g)

    return (split,)


@app.cell
def _(ds, mo, split):
    train_ds, val_ds = split(ds)
    assert len(train_ds) + len(val_ds) == len(ds), "Train and val sizes should add up to len(ds)."
    assert len(val_ds) == len(ds) // 10, f"val has {len(val_ds)}, expected {len(ds) // 10}. Hint: int(...) rounds down."
    _again, _ = split(ds)
    assert list(_again.indices[:5]) == list(train_ds.indices[:5]), "Same seed should give the same split."
    mo.md(f"Check passed. Train {len(train_ds):,}, val {len(val_ds):,}.")
    return train_ds, val_ds


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## 3. A `DataLoader`

    The loader pulls examples from a dataset and stacks them into batches. Two settings matter:
    - `batch_size=64`.
    - `shuffle=True` for training, so each epoch sees the examples in a new order. `shuffle=False` for validation; order doesn't matter there, and fixed order makes it reproducible.
    """)
    return


@app.cell
def _(train_ds, val_ds):
    # copy to: src/promoter_cnn/data.py
    from torch.utils.data import DataLoader


    def loaders(train_ds, val_ds, batch_size=64):
        # TODO: train loader shuffles, val loader does not. Both use batch_size.
        train_dl = ...
        val_dl = ...
        return train_dl, val_dl


    train_dl, val_dl = loaders(train_ds, val_ds)
    return train_dl, val_dl


@app.cell
def _(mo, train_dl, val_dl):
    assert train_dl is not ..., "Fill in train_dl."
    xb, yb = next(iter(train_dl))
    assert tuple(xb.shape) == (64, 4, 251), f"Batch x is {tuple(xb.shape)}, expected (64, 4, 251)."
    assert tuple(yb.shape) == (64,), f"Batch y is {tuple(yb.shape)}, expected (64,)."
    _v1, _ = next(iter(val_dl))
    _v2, _ = next(iter(val_dl))
    assert (_v1 == _v2).all(), "val_dl gave a different first batch twice. Should val shuffle?"
    mo.md(f"""
    Check passed. One batch: x {tuple(xb.shape)}, y {tuple(yb.shape)}, {int(yb.sum())} promoters out of 64.

    {len(train_dl)} batches per epoch. The last one is smaller, because {len(train_dl.dataset):,} is not a multiple of 64.
    """)
    return xb, yb


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## 4. One convolution on a real batch

    `nn.Conv1d(4, 16, kernel_size=8)` makes 16 filters. Each is a `(4, 8)` weight table: a score for each base at each of 8 positions, like a position weight matrix. It slides along the sequence and at each start position outputs the sum of (weight × one-hot), plus a bias.

    **Predict before running.** A filter of width 8 on 251 positions, no padding. How many start positions fit? Write it in the TODO below as arithmetic, not a typed-in number from the output.
    """)
    return


@app.cell
def _(torch, xb):
    from torch import nn

    torch.manual_seed(0)
    conv = nn.Conv1d(in_channels=4, out_channels=16, kernel_size=8)
    out = conv(xb)

    # TODO: output length as arithmetic in L and k.
    L, k = 251, 8
    predicted_len = ...
    return conv, nn, out, predicted_len


@app.cell
def _(conv, mo, out, predicted_len):
    assert predicted_len is not ..., "Fill in predicted_len."
    assert out.shape[-1] == predicted_len, f"You predicted {predicted_len}, output length is {out.shape[-1]}. Hint: a width-2 filter on 3 positions fits twice."
    mo.md(f"""
    Check passed. Output shape {tuple(out.shape)}: 64 sequences, 16 filters, {out.shape[-1]} positions.

    Weight shape {tuple(conv.weight.shape)}: (filters, bases, width). That's {conv.weight.numel()} weights + {conv.bias.numel()} biases = {conv.weight.numel() + conv.bias.numel()} parameters. These are random now; training will move them.
    """)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## 5. A filter you build by hand: CpG counter

    No TODO here, just read and run. One filter, width 2, weights set by hand: +1 for C at position 1 and +1 for G at position 2, zero elsewhere. Bias 0.

    At a "CG" the filter scores 2. At "CA" or "TG" it scores 1. Elsewhere 0. So `(out == 2).sum()` counts CpG dinucleotides. That's exactly what a trained filter could discover on its own. Promoters often sit in CpG islands; non-promoter DNA is CpG depleted, because methylated C in CpG mutates to T.
    """)
    return


@app.cell
def _(mo, nn, torch, train, train_ds):
    cpg = nn.Conv1d(4, 1, kernel_size=2, bias=False)
    with torch.no_grad():
        cpg.weight.zero_()
        cpg.weight[0, 1, 0] = 1
        cpg.weight[0, 2, 1] = 1

    _ds = train_ds.dataset
    _rows = train.sample(2000, random_state=0).index
    _counts = {0: [], 1: []}
    for _i in _rows:
        _x, _y = _ds[_i]
        _n = (cpg(_x.unsqueeze(0)) == 2).sum().item()
        _counts[int(_y.item())].append(_n)

    _mean0 = sum(_counts[0]) / len(_counts[0])
    _mean1 = sum(_counts[1]) / len(_counts[1])
    _check = train.seq[_rows].str.count("CG")
    assert sum(_counts[0]) + sum(_counts[1]) == _check.sum()
    mo.md(f"""
    Mean CpGs per 251 bp, 2,000 random training sequences: non-promoters **{_mean0:.1f}**, promoters **{_mean1:.1f}**. Matches `str.count("CG")`.

    For scale: if bases were random at the class GC content from week 1, expect 250 × (GC/2)². Promoters (GC 0.63): about 25. Non-promoters (GC 0.48): about 14. Promoters come close to expected; the rest of the genome has about a third of it.

    Note this is the same GC signal from week 1, seen through a filter. A CNN can win on this alone. Week 6 tests whether it learns more.
    """)
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Done for the week

    **First, week 1.** `projects/promoter-cnn/src/promoter_cnn/data.py` is still empty. Paste week 1's copy cells in first (list at the end of `01-data.py`), then run week 1's check command.

    **Then add to the same `data.py`, in order:**
    1. `from torch.utils.data import Dataset` and `PromoterDataset`.
    2. `from torch.utils.data import random_split` and `split`.
    3. `from torch.utils.data import DataLoader` and `loaders` (only the function, not the `train_dl, val_dl = ...` line).

    Move the three imports up to the top with the others if you like. Delete `# copy to` and `# TODO` lines.

    **Check it works**, from `projects/promoter-cnn/`:
    ```
    uv run python -c "from promoter_cnn.data import load, PromoterDataset, split, loaders; tr, va = split(PromoterDataset(load('train'))); x, y = next(iter(loaders(tr, va)[0])); print(x.shape, y.shape)"
    ```
    It should print `torch.Size([64, 4, 251]) torch.Size([64])`.

    **Next week.** The full model: conv, ReLU, pooling, a linear layer to one logit. Check the starting loss is near ln 2.
    """)
    return


if __name__ == "__main__":
    app.run()
