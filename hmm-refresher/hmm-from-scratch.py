import marimo

__generated_with = "0.23.8"
app = marimo.App(width="medium")


@app.cell
def imports():
    import marimo as mo
    import numpy as np
    import matplotlib.pyplot as plt

    return mo, np, plt


@app.cell(hide_code=True)
def title(mo):
    mo.md(r"""
    # Building an HMM from scratch

    We'll implement the forward, backward, and Viterbi algorithms
    ourselves — no `hmmlearn`, no black boxes — on a toy version of
    the coverage-segmentation problem: a sequence of noisy depth
    measurements hiding three states (`deletion` / `normal` /
    `duplication`).

    The sliders further down are live — move them and every plot
    below recomputes. Turn `noise` up and `stickiness` down to see
    the naive per-point classifier fall apart while Viterbi holds up.
    """)
    return


@app.cell(hide_code=True)
def intro_ingredients(mo):
    mo.md(r"""
    ## 1. The three ingredients of any HMM

    - **Initial distribution** $\pi$ — how likely each state is at
      position 0.
    - **Transition matrix** $A$ — $P(\text{state}_{t+1} \mid
      \text{state}_t)$. This is the piece that gives the model
      *memory* across positions — the thing a per-point threshold
      doesn't have.
    - **Emission model** — $P(\text{observation} \mid
      \text{state})$. We'll use a Gaussian per state here; real read
      depth is closer to Poisson / negative binomial (more on that
      at the end).

    Below: a 3-state model with emission means at 0.5x, 1x, and 1.5x
    coverage.
    """)
    return


@app.cell
def define_hmm(np):
    state_names = ["deletion", "normal", "duplication"]
    means = np.array([0.5, 1.0, 1.5])
    return means, state_names


@app.cell
def controls(mo):
    stay_prob = mo.ui.slider(
        0.85, 0.995, value=0.97, step=0.005,
        label="stickiness — P(stay in same state)",
    )
    noise_std = mo.ui.slider(
        0.02, 0.35, value=0.20, step=0.01,
        label="noise — observation std",
    )
    seq_len = mo.ui.slider(50, 400, value=200, step=10, label="sequence length")
    resample = mo.ui.button(
        label="draw a new random sequence", value=0, on_click=lambda n: n + 1
    )
    mo.vstack([stay_prob, noise_std, seq_len, resample])
    return noise_std, resample, seq_len, stay_prob


@app.cell
def build_params(np, stay_prob):
    off = (1 - stay_prob.value) / 2
    A = np.array(
        [
            [stay_prob.value, off, off],
            [off, stay_prob.value, off],
            [off, off, stay_prob.value],
        ]
    )
    pi = np.array([0.05, 0.90, 0.05])
    return A, pi


@app.cell(hide_code=True)
def md_simulate(mo):
    mo.md(r"""
    ## 2. Simulate data

    Sample a path through the Markov chain using $\pi$ and $A$, then
    draw a noisy observation at each position from that state's
    Gaussian. This gives us ground truth to check our algorithms
    against — a luxury real data never gives you.
    """)
    return


@app.cell
def simulate(A, means, noise_std, np, pi, resample, seq_len):
    rng = np.random.default_rng(resample.value)
    T = seq_len.value
    true_states = np.zeros(T, dtype=int)
    true_states[0] = rng.choice(len(pi), p=pi)
    for t in range(1, T):
        true_states[t] = rng.choice(len(pi), p=A[true_states[t - 1]])
    observations = rng.normal(means[true_states], noise_std.value)
    return T, observations, true_states


@app.cell
def plot_helpers():
    state_colors = {0: "#D85A30", 1: "#888780", 2: "#639922"}

    def contiguous_runs(states):
        runs = []
        start = 0
        for i in range(1, len(states) + 1):
            if i == len(states) or states[i] != states[start]:
                runs.append((start, i, states[start]))
                start = i
        return runs

    def plot_state_track(ax, states, alpha=0.85):
        for start, end, s in contiguous_runs(states):
            ax.axvspan(start, end, color=state_colors[s], alpha=alpha)
        ax.set_yticks([])

    return plot_state_track, state_colors


@app.cell
def plot_raw(T, means, np, observations, plot_state_track, plt, true_states):
    _fig, _ax = plt.subplots(figsize=(9, 2.3))
    plot_state_track(_ax, true_states, alpha=0.25)
    _ax.plot(np.arange(T), observations, ".", color="0.2", markersize=3)
    for m in means:
        _ax.axhline(m, color="0.7", linewidth=0.5, linestyle="--")
    _ax.set_title("Simulated read depth (shading = true hidden state)")
    _ax.set_xlabel("window index")
    _ax.set_ylabel("depth ratio")
    _fig.tight_layout()
    _fig
    return


@app.cell
def md_naive(mo):
    mo.md(r"""
    ## 3. The naive baseline: classify each point on its own

    For every observation, just pick whichever state mean it's
    closest to — no use of neighboring points at all. This is
    exactly the shape of a threshold, generalized to more than two
    classes.
    """)
    return


@app.cell
def naive_classify(means, np, observations):
    naive_states = np.array([np.argmin(np.abs(o - means)) for o in observations])
    return (naive_states,)


@app.cell
def md_forward_backward(mo):
    mo.md(r"""
    ## 4. Forward-backward: state probabilities at every position

    The forward variable accumulates evidence left-to-right:

    $$\alpha_t(k) = \Big[\sum_j \alpha_{t-1}(j)\,A(j,k)\Big]\, b_k(x_t)$$

    and the backward variable $\beta$ does the mirror-image
    computation right-to-left. Multiplying them together and
    normalizing gives the posterior $P(\text{state}_t \mid
    \text{all observations})$ — this is exactly what lets one noisy
    point borrow strength from its neighbors on *both* sides.
    Everything below runs in log-space, since these products
    underflow almost immediately otherwise.
    """)
    return


@app.cell
def hmm_algorithms(np):
    def log_gaussian_pdf(x, mean, std):
        return -0.5 * np.log(2 * np.pi * std ** 2) - (x - mean) ** 2 / (2 * std ** 2)

    def logsumexp(values):
        m = np.max(values)
        return m + np.log(np.sum(np.exp(values - m)))

    def forward(obs, pi, A, means, std):
        T, K = len(obs), len(means)
        log_alpha = np.zeros((T, K))
        log_pi, log_A = np.log(pi), np.log(A)
        log_alpha[0] = log_pi + log_gaussian_pdf(obs[0], means, std)
        for t in range(1, T):
            for k in range(K):
                log_alpha[t, k] = (
                    logsumexp(log_alpha[t - 1] + log_A[:, k])
                    + log_gaussian_pdf(obs[t], means[k], std)
                )
        return log_alpha

    def backward(obs, A, means, std):
        T, K = len(obs), len(means)
        log_beta = np.zeros((T, K))
        log_A = np.log(A)
        for t in range(T - 2, -1, -1):
            for k in range(K):
                log_beta[t, k] = logsumexp(
                    log_A[k] + log_gaussian_pdf(obs[t + 1], means, std) + log_beta[t + 1]
                )
        return log_beta

    def posterior_probs(log_alpha, log_beta):
        log_gamma = log_alpha + log_beta
        log_gamma = log_gamma - log_gamma.max(axis=1, keepdims=True)
        gamma = np.exp(log_gamma)
        gamma = gamma / gamma.sum(axis=1, keepdims=True)
        return gamma

    def viterbi(obs, pi, A, means, std):
        T, K = len(obs), len(means)
        log_delta = np.zeros((T, K))
        backptr = np.zeros((T, K), dtype=int)
        log_pi, log_A = np.log(pi), np.log(A)
        log_delta[0] = log_pi + log_gaussian_pdf(obs[0], means, std)
        for t in range(1, T):
            for k in range(K):
                scores = log_delta[t - 1] + log_A[:, k]
                backptr[t, k] = np.argmax(scores)
                log_delta[t, k] = scores.max() + log_gaussian_pdf(obs[t], means[k], std)
        path = np.zeros(T, dtype=int)
        path[-1] = np.argmax(log_delta[-1])
        for t in range(T - 2, -1, -1):
            path[t] = backptr[t + 1, path[t + 1]]
        return path

    return backward, forward, posterior_probs, viterbi


@app.cell
def run_forward_backward(
    A,
    backward,
    forward,
    means,
    noise_std,
    observations,
    pi,
    posterior_probs,
):
    log_alpha = forward(observations, pi, A, means, noise_std.value)
    log_beta = backward(observations, A, means, noise_std.value)
    gamma = posterior_probs(log_alpha, log_beta)
    return (gamma,)


@app.cell
def plot_posterior(
    T,
    gamma,
    np,
    plot_state_track,
    plt,
    state_colors,
    state_names,
    true_states,
):
    _fig, _axes = plt.subplots(2, 1, figsize=(9, 3.6), sharex=True, height_ratios=[1, 2])
    plot_state_track(_axes[0], true_states, alpha=0.85)
    _axes[0].set_title("True hidden state")
    for k, name in enumerate(state_names):
        _axes[1].plot(np.arange(T), gamma[:, k], color=state_colors[k], label=name)
    _axes[1].set_ylabel("posterior P(state)")
    _axes[1].set_xlabel("window index")
    _axes[1].legend(loc="upper right", fontsize=8, ncol=3)
    _fig.tight_layout()
    _fig
    return


@app.cell
def md_viterbi(mo):
    mo.md(r"""
    ## 5. Viterbi: the single best path

    Forward-backward gives per-position probabilities; Viterbi
    instead finds the *one* most likely sequence of states for the
    whole track, by swapping the sum in the forward recursion for a
    max:

    $$\delta_t(k) = \max_j\big[\delta_{t-1}(j)\,A(j,k)\big]\, b_k(x_t)$$

    A backpointer array records which $j$ won at each step, so once
    we reach the end we can walk back through the winning path. This
    is the one you'd actually use to call discrete segments.
    """)
    return


@app.cell
def run_viterbi(A, means, noise_std, observations, pi, viterbi):
    viterbi_states = viterbi(observations, pi, A, means, noise_std.value)
    return (viterbi_states,)


@app.cell
def plot_comparison(
    naive_states,
    plot_state_track,
    plt,
    true_states,
    viterbi_states,
):
    _fig, _axes = plt.subplots(3, 1, figsize=(9, 3.2), sharex=True)
    plot_state_track(_axes[0], true_states)
    _axes[0].set_ylabel("truth", rotation=0, labelpad=30, fontsize=9)
    plot_state_track(_axes[1], naive_states)
    _axes[1].set_ylabel("naive", rotation=0, labelpad=30, fontsize=9)
    plot_state_track(_axes[2], viterbi_states)
    _axes[2].set_ylabel("viterbi", rotation=0, labelpad=30, fontsize=9)
    _axes[2].set_xlabel("window index")
    _fig.tight_layout()
    _fig
    return


@app.cell
def accuracy(mo, naive_states, np, true_states, viterbi_states):
    naive_acc = (naive_states == true_states).mean()
    viterbi_acc = (viterbi_states == true_states).mean()
    naive_switches = int(np.sum(naive_states[1:] != naive_states[:-1]))
    viterbi_switches = int(np.sum(viterbi_states[1:] != viterbi_states[:-1]))
    true_switches = int(np.sum(true_states[1:] != true_states[:-1]))
    mo.md(
        f"""
        | | accuracy vs. true state | number of state changes |
        |---|---|---|
        | naive (per-window) | {naive_acc:.1%} | {naive_switches} |
        | HMM / Viterbi | {viterbi_acc:.1%} | {viterbi_switches} |
        | true sequence | — | {true_switches} |
        """
    )
    return


@app.cell
def md_next_steps(mo):
    mo.md(r"""
    ## 6. Where to take this next

    - **Learn the parameters instead of fixing them.** Baum-Welch
      (EM) alternates: run forward-backward to get soft state
      assignments, then re-estimate $A$, the emission
      means/variances, and $\pi$ from those. Useful when you don't
      already know good means.
    - **Swap the emission model.** Real read depth looks more like
      Poisson or negative binomial than Gaussian (variance scales
      with the mean). The forward / backward / Viterbi recursions
      don't change at all — only `log_gaussian_pdf` does.
    - **Add covariates.** GC content and mappability shift the
      expected depth locally; fold that into the emission model
      per-bin instead of one global mean per state.
    - **Try it on real data.** Pull per-window depth from
      `samtools depth` or `mosdepth`, normalize by the genome-wide
      median, and feed it straight into `forward` / `backward` /
      `viterbi` above.
    - **Compare against a library.** Once this feels solid,
      `hmmlearn.hmm.GaussianHMM` implements the same algorithms plus
      Baum-Welch fitting, if you want a production-grade version.
    """)
    return


if __name__ == "__main__":
    app.run()
