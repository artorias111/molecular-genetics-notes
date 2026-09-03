#import "../template.typ": *

#show: sheet.with(
  day: "Pop Quiz",
  title: "Bus Ride Math Revision"
)

#section_heading("Part 1: Matrix Calculus & Dimensions")

#question(space: 1.5in)[
  *1(a) Dimensionality Check.* 
  You have a design matrix $X \in RR^(N times M)$ ($N$ samples, $M$ features) and a target vector $y \in RR^N$. Your linear model is $hat(y) = X theta$. 
  
  What are the exact matrix dimensions of $theta$? What are the dimensions of $hat(y)$?
]

#question(space: 3.5in)[
  *1(b) Expanding the Quadratic.*
  We want to minimize the regularized cost function:
  $ J(theta) = (X theta - y)^T (X theta - y) + lambda theta^T theta $
  
  Expand the polynomial. Combine the cross-terms using the transpose rule.
]

#question(space: 3.5in)[
  *1(c) The Gradient & The Trap.*
  Take the gradient $nabla_theta J(theta)$. Set it to zero and solve for $theta$. 
  
  *(Careful: Watch out for the "adding a scalar to a matrix" trap when you factor out $theta$!)*
]

#pagebreak()

#section_heading("Part 2: Maximum Likelihood Estimation (MLE)")

#question(space: 2.5in)[
  *2(a) The Likelihood Function.*
  You observe a dataset of $N$ independent coin flips. Let $y^((i)) in {0, 1}$ be the outcome of the $i$-th flip, and $theta$ be the probability of getting heads (1).
  
  The probability of a single flip is: $P(y^((i)) | theta) = theta^(y^((i))) (1-theta)^(1-y^((i)))$
  
  Write the full Likelihood function $L(theta)$ for the entire dataset of $N$ flips.
]

#question(space: 2.5in)[
  *2(b) The Log-Likelihood.*
  Write the Log-Likelihood $ell(theta) = log L(theta)$. 
  Use log properties to turn the product into a sum, and bring down the exponents.
]

#question(space: 3.5in)[
  *2(c) Finding the MLE.*
  Take the derivative $frac(d, d theta) ell(theta)$. Set it to zero, and algebraically solve for the Maximum Likelihood Estimate $theta_("MLE")$. 
  
  *(Hint: You will find that the MLE is extremely intuitive!)*
]

#pagebreak()

#section_heading("Part 3: Calculus & Log-Loss (Chain Rule)")

#question(space: 5in)[
  *3. The Logistic Loss Derivative.*
  In Logistic Regression, the cross-entropy loss for a single positive example ($y=1$) is defined as:
  $ L(z) = log(1 + e^(-z)) $
  
  *(a)* Using the Chain Rule, calculate the derivative $frac(d L, d z)$.
  
  *(b)* Manipulate your answer to remove all negative exponents (multiply the top and bottom by $e^z$). What familiar function does this derivative perfectly match?
]

#pagebreak()

#section_heading("Part 4: Covariance Geometry")

#question(space: 5in)[
  *4. Structuring the Matrix.*
  Consider a 2D dataset with features $x_1$ and $x_2$. Write out the general algebraic structure (using symbols like $sigma_1^2, sigma_2^2, sigma_12$, or $0$) for a $2 times 2$ covariance matrix $Sigma$ that represents:
  
  *(a) A "Spherical" Gaussian:* A perfectly round circle.
  
  *(b) A "Diagonal" Gaussian:* An ellipse whose axes are perfectly parallel to the $x_1$ and $x_2$ axes, but which is stretched wider horizontally than vertically.
  
  *(c) A "Full" Gaussian:* An ellipse tilted at a 45-degree angle (indicating a positive correlation between $x_1$ and $x_2$).
]

#pagebreak()

#section_heading("Hints (Don't look unless you're stuck!)")

#ref_box[
  *Hint 1(c):* When factoring $theta$ out of $X^T X theta + lambda theta$, remember that $X^T X$ is a matrix. You must multiply $lambda$ by the Identity matrix $I$ before factoring.
  
  *Hint 2(a):* Because the coin flips are independent, the joint probability (Likelihood) is the product ($product$) of all the individual probabilities.
  
  *Hint 2(b):* Remember the two golden rules of logs: $log(A times B) = log(A) + log(B)$ (products become sums), and $log(A^B) = B log(A)$.
  
  *Hint 3(a):* The derivative of $log(u)$ is $1/u dot (d u)/(d z)$.
  
  *Hint 4:* Off-diagonal elements control the "tilt" or correlation. If they are zero, there is no tilt. Diagonal elements control the variance (stretch) along the specific axes. If they are equal, it's a circle.
]

#closing_block()
