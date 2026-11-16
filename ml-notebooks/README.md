# ML notebooks
From 11-03-2026: weekly sessions follow the plan in `../transformers/README.md` (Weekly coding session). `# %%` cells in Zed, I write the code. Marimo notes below are older.
One marimo notebook a week.

## Transformer notebooks (from 10-30-2026)
Paired with the 30-day sheets in `../transformers/`. AI-assisted: I write the prompt, my assistant writes the code, I read every line. Checks use my hand answers from the paper sheets. Each one is also a blog post.
- `03-attention-scores.py`: one_hot, embed, scores on a real promoter. After day 06.
- Export for the blog: `uv run marimo export md 03-attention-scores.py -o 03-attention-scores.md`

## Old CNN route (paused 10-28)
Together the `# copy to` cells build `projects/promoter-cnn/`.

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
