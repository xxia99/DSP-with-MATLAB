## Problem 1

### Problem Description

Deﬁne the continuous-time signal x(t) on [0, 1] as
$$
 x(t)=
 \begin{cases}
 4t,\,\,&0 ≤ t < 1/4\newline
 -4t+2,\,\,&1/4 ≤ t ≤ 1/2\newline
 -sin(20\pi t),\,\,&1/2 ≤ t ≤ 1\newline
 \end{cases}
$$
Write MATLAB code that ﬁnds the closest point $\hat{x}(t)$ in $T_N$ to $x(t)$ for any ﬁxed $N$. By “closest point,” we mean that $\hat{x}(t)$ is the solution to![](http://latex.codecogs.com/svg.latex?)

$$
\min_{y ∈ T_N}  {∥ x(t) − y(t) ∥}_{L 2 ([0,1])}
$$

## Problem 2

### Problem Description

The dual B-spline functions can be written as
$$
\tilde{b}_L (t) = \sum^{\infty}_{l=\infty}h_L[l]b_L (t-l).
$$

1. Compute $h_L [n]$ for $−20 ≤ n ≤ 20$ for $L = 1, 2, 3, 4$. To do this, you will need to approximate the integral 

$$
h_L[n] = \frac{1}{2\pi}\int_{-\pi}^{\pi} H_L (e^{jω} )e^{jωn} \,dω,
$$

for those values of $n$. You can do this using any numerical integration technique with which you are familiar, or by simply taking a sum on a very ﬁne grid and normalizing appropriately to account for the width of the intervals. $h[−20]$ and $h[20]$ should be very close to zero. Also, since $H_L$ is real and even, you can replace $e^{jωn}$ in the expression above with $cos(ωn)$.

2. Using your answer above and the provided $bspline$ functions, plot (a very good approximation of) the dual B-spline functions $\hat{b}_L (t) $for L = 1, 2, 3, 4.

## Problem 3

### Problem Description

Let $x(t)$ be the signal 
$$
x(t)=
\begin{cases}
1/2, \,\,&0\le t \le 10, \\
-sin(\pi t/10),\,\,&10\le t \le 20\\
\end{cases}
$$

Compute and use MATLAB to plot the solutions to
$$
\min_{y\in\nu_{L}} \int_{-\infty}^{\infty}\vert x(t)-y(t)\vert^2\,\,dt,
$$
for $L = 1, 2, 3, 4, $ where
$$
\nu_L = \overline{Span}(\{b_L(t − n)\}_{n\in \Z} ).
$$
To do this, you will need to integrate x(t) against the dual B-splines. You can compute this integral using
$$
\int_{-\infty}^{\infty}x(t)\tilde{b}_L(t − n) dt = \sum_{\ell = -\infty}^{\infty}h_{L}[\ell]x(t)b_L(t−n−\ell) dt.
$$
So the ﬁrst step is to write a function that numerically integrates $x(t) $with shifts of $b_L (t)$ over an appropriate range.

## Problem 4

### Problem Description

The ﬁle $ blocksdeconv.mat$ contains the vectors:

​	• $x$ : the 512 × 1 “blocks” signal

​	• $h$ : a 30 × 1 boxcar ﬁlter

​	• $y$ : a 541 × 1 vector of observations of h convolved with x

​	• $y_n$ : a noisy observation of $y$. The noise is iid Gaussian with standard deviation .01.

1. Write a function which takes an vector $h$ of length $L$ and a number $N$, and returns the $M ×N$ (with $M = N + L − 1$) matrix $A$ such that for any $x \in R^N$ , $Ax$ is the vector of non-zero values of h convolved with $x$.

2. Use MATLAB’s $svd()$ command 1 to calculate the SVD of $A$. What is the largest singular value? What is the smallest singular value? Calculate $A^†y$ and plot it ( $y$ is the noise-free data).

## Problem 5

### Problem Description

Suppose we have a signal $f(t)$ on [0, 1] which is “bandlimited” in that it only has N = 2B + 1 Fourier series coeﬃcients which are non-zero:
$$
f(t) = \sum_{k=-B}^{B}{\alpha_{k}e^{j2πkt}}
\tag 1
$$
for some set of expansion coeﬃcents
$$
\alpha = 
\begin{bmatrix}
\alpha_{-B}\\
\vdots\\
\alpha_{0}\\
\vdots\\
\alpha_{B}
\end{bmatrix}
$$
We observe samples $M$ samples of $f(t)$ at locations $t_1,t_2,\cdots, t_M$which are not necessarily uniformly spaced, 
$$
y[m] = f(t m ),\,\,\, m = 1, . . . , M.\tag 2
$$

1. Write a MATLAB function $sampmat.m$ that takes a vector smptimes of length $M$ containing the sample locations and a dimension $N = 2B+1$ (which you can assume is odd), and returns a $M × N$ matrix $A$ such that when $A$ is applied to a vector of Fourier series coeﬃcients (as in $(2)$), it returns the sample values in $(3)$.

2. The ﬁle $bandlimited.mat$ contains vectors $samptimes$ and y of length $M = 259$, which contain sample times $t_m$ and sample values $f(t_m )$. Find the signal having bandwidth $N = 51$ (so $B = 25$) that best explains these samples in the least-squares sense. Plot your synthesized estimate $\hat{f}(t) $ as a function of time.

## Problem 6

### Problem Description

1. Write a MATLAB function that uses the power iteration procedure described in the class notes to ﬁnd the largest eigenvalue of a matrix A and its associated eigenvector. Keep track of how many iterations it takes until the estimated eigenvalue does not change more than $eps$ (i.e., machine precision) between iterations.

2. Find the largest eigenvalue for the following the above for several diﬀerent random matrices and comment on the following:

​		• A random symmetric $10 × 10$ matrix.

​		• A random symmetric $100 × 100$ matrix.

​		• A random symmetric $1000×1000$​ matrix.

## Problem 7

### Problem Description

Suppose we make a noisy observation of y = Ax, with
$$
A=
\begin{bmatrix}
2&4&-1\\
1&-2&1\\
4&0&1\\
5&6&-1\\
8&-4&2\\
\end{bmatrix}
\,\,\,\,\,
y=
\begin{bmatrix}
1\\
2\\
-1\\
-2\\
5\\
\end{bmatrix}
$$
Find the total-least squares solution to the above linear inverse problem. 

## Problem 8

### Problem Description

Suppose that you wish to solve for x given that $Ax = b$ where

$$
A=
\begin{bmatrix}
10000&10001\\
10001&10002\\
10002&10003\\
10003&10004\\
10004&10005\\
\end{bmatrix}
B=
\begin{bmatrix}
20001\\
20003\\
20005\\
20007\\
20009\\
\end{bmatrix}
$$
Note, the exact solution is $x = [ 1 \\ 1 ]^T$ .

1. Determine the condition number of $A^TA$.
2. Compute the least-squares solution using the formula $\hat{x} = (A^T A)^{−1} A^T b $explicitly.
3. Compute the solution using the QR decomposition. 
4. Compute the solution using the Cholesky factorization.
5. Compute the solution using the MATLAB backslash command “ \ ”. 
