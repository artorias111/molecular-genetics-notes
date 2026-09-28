"""Learner-owned toy lcWGS project. Implement the current task only."""


def phred_to_error(q: float) -> float:
    """Return the error probability for a nonnegative Phred base quality."""
    # TODO (task 001): your implementation and one-sentence interpretation.
    raise NotImplementedError("Task 001 is pending")


if __name__ == "__main__":
    for quality in (0, 10, 20):
        print(quality, phred_to_error(quality))
