# exp, log and softmax
About 10 minutes. Write answers under each question.

The score table gives you numbers like 6, 2, -1. Attention needs weights that are all positive and add up to 1, so each query can split its attention across keys. Softmax does that in two steps.

- exp: `e^x`, with e ≈ 2.718. Some values: `e^0 = 1`, `e^1 ≈ 2.7`, `e^4 ≈ 55`.
  - Always positive, even for negative x. `e^-2 ≈ 0.14`.
  - Bigger x gives a much bigger output. Each +1 multiplies it by about 2.7.
- log: `ln` undoes exp. `ln(e^x) = x` and `e^(ln y) = y`, so `e^(ln 6) = 6`.
- Softmax: exp each score, then divide each one by the total.
  - `softmax(s)_i = e^(s_i) / (e^(s_1) + e^(s_2) + ...)`
  - Example: scores (0, 0) give (1, 1) after exp, so the weights are (0.5, 0.5).

## (a)
One query has scores (ln 6, ln 3, 0) against keys A, B, C. Work out the softmax weights. No calculator needed.

- unscaled exp: 6, 3, 1
- sum: 10
- softmax weights: 0.6, 0.3 and 0.1


## (b)
Another query has scores (2, -1, -1). Why can't you just divide each score by the total of the scores? Try it and see what goes wrong, in two ways.


- because some of them are negative. we can e^x them to make them all positive. 
- if we dont, sum: 0. while scaling, zero denominator. 



## (c)
Back to day 05: query CAAT scored (6, 2) against keys CAAT and GC. Work out the weight on GC. Use `e^4 ≈ 55`. Hint: divide the top and bottom by `e^2` first.

weights: e^6 and e^2 
sum: e^6 + e^2
weight for GC: e^2/(e^2 + e^6) = 1/(1+e^4) = 1/(1+55) = 1/56. 


## (d)
In (c) the scores were 6 and 2, but the weights come out nowhere near 6 : 2. In a sentence, what does exp do to a gap between two scores?

a linear increase in gap in scores increases exponentially when weighted with softmax.
