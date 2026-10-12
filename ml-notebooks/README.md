# ML notebooks
One marimo notebook a week. Together the `# copy to` cells build `projects/promoter-cnn/`.

- Open: `uv run marimo edit 01-data.py` from this folder.
- Fill the `...` TODOs. Each check cell says if it worked.
- When all checks pass, paste the copy cells into the named file.

## Roadmap (adapts to how it goes)
1. Data to tensor: download, GC by class, one-hot, permute. `data.py`
2. Dataset, DataLoader, train/val split, one `Conv1d` on a real batch.
3. Full model: ReLU, pooling, linear logits. Check the starting loss is near ln 2. `model.py`
4. Training loop, validation loss, accuracy vs the 54% baseline. `train.py`
5. Break it on purpose: lr too high, no `zero_grad`, overfit a tiny set. Read the curves.
6. GC-only baseline vs the CNN. Is the CNN learning more than GC content?
7. Look inside: turn filters into motif logos, compare to known promoter motifs.
8. Test set once, README, command-line entry point. Push to GitHub.

## Data
Human non-TATA promoters vs non-promoter fragments. Umarov & Solovyev 2017, PLOS ONE 12:e0171410. Packaged by Genomic Benchmarks (Grešová et al. 2023). Apache 2.0.
