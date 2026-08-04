#import "../template.typ": *

#show: body => sheet(day: "01", title: "Linear Regression & LMS", body)

= Drill

1. What is the shape of the output of $x^T y$ if $x$ and $y$ are both $d times 1$ column vectors?
#v(1in)
2. Write the definition of the gradient $nabla_theta f(theta)$ for a function $f: RR^d -> RR$. What is its shape?
#v(1.5in)
3. What is the derivative of $f(x) = (y - x)^2$ with respect to $x$?
#v(1.5in)
4. If $A$ is a symmetric matrix, what is the gradient $nabla_x (x^T A x)$?
#v(1.5in)
5. What is the geometric interpretation of the dot product $x^T y = 0$?

#pagebreak()

#timer-table(
  ("Deriving LMS", 20),
  ("Vectorized Update", 15)
)

= Linear Regression

#reference-box[
  We model the target variable $y$ as a linear function of features $x$:
  $ h_theta (x) = theta^T x $
  where $theta$ and $x$ are $d$-dimensional vectors. 
  Our cost function for a single training example is $J(theta) = 1/2 (h_theta(x) - y)^2$.
]

#question(space: 3.5in)[
  *Derive it.* Get from the definition of the single-example cost function $J(theta)$ to the gradient $partial / (partial theta_j) J(theta)$. Show your steps.
]

#question(space: 2in)[
  *Take the gradient.* Write the gradient descent update rule for a single parameter $theta_j$, using learning rate $alpha$. 
]

#question(space: 2in)[
  *Dimension check.* In the batch gradient descent rule:
  $ theta := theta + alpha sum_(i=1)^n (y^{(i)} - h_theta (x^{(i)})) x^{(i)} $
  Give the shape of every object in this expression: $theta$, $y^{(i)}$, $h_theta(x^{(i)})$, and $x^{(i)}$.
]

#closing-block()
