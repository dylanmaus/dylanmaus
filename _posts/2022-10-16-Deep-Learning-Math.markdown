---
layout: post
title: "Deep Learning Math"
date: 2022-10-16
permalink: /projects/deep+learning+math
categories: projects
---

## Introduction
Consider the function $$ z(x, y) = a \sin(x) + b \cos(y) $$ and noisy data from sensors that measure $$ z $$ at many $$ (x, y) $$ locations. Our goal is to fit the data to $$ z(x, y) $$ and find the parameters $$ a $$ and $$ b $$. A nonlinear least squares approach such as the Gauss-Newton algorithm could be used to solve this nonlinear regression problem.

In a real world scenario we may not even know the function $$ z $$, so it must be approximated. To solve this more advanced problem, we propose a model i.e. an artificial neural network to approximate $$ z $$. The parameters of this model must be iteratively tuned to fit the data.

This post attempts to explain some of the math behind Deep Learning and why it may be preferred to other mathematical approaches.

## Deep learning
# Function approximation
To approximate the unknown function $$ z $$, consider a 2 layer fully connected neural network with 2 inputs, 3 nodes in the hidden layer, 1 output, and sigmoid activation function. The complete breakdown of the neural network $$ f $$ is shown below.

$$ f(\mathbf{x}) = \sigma(\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1) $$

$$ \mathbf{x} = \begin{bmatrix} 
x_0 \\
x_1
\end{bmatrix} $$

$$ \mathbf{W}_0 = \begin{bmatrix} 
\omega_0& \omega_1 \\
\omega_2& \omega_3 \\
\omega_4& \omega_5
\end{bmatrix} $$

$$ \mathbf{b}_0 = \begin{bmatrix} 
b_0 \\
b_1 \\
b_2
\end{bmatrix} $$

$$ \mathbf{W}_1 = \begin{bmatrix} 
\omega_6 \\
\omega_7 \\
\omega_8
\end{bmatrix} $$

$$ \mathbf{b}_1 = \begin{bmatrix} 
b_3
\end{bmatrix} $$

$$ f(\mathbf{x}) = \sigma\left(\begin{bmatrix} 
\sigma(\omega_0 x_0 + \omega_1 x_1 + b_0) \\
\sigma(\omega_2 x_0 + \omega_3 x_1 + b_1) \\
\sigma(\omega_4 x_0 + \omega_5 x_1 + b_2) \\
\end{bmatrix}^T
\begin{bmatrix} 
\omega_6 \\
\omega_7 \\
\omega_8
\end{bmatrix}
+ b_3\right)
$$

$$ f(\mathbf{x}) = \sigma(
\sigma(\omega_0 x_0 + \omega_1 x_1 + b_0)\omega_6 +
\sigma(\omega_2 x_0 + \omega_3 x_1 + b_1)\omega_7 +
\sigma(\omega_4 x_0 + \omega_5 x_1 + b_2)\omega_8 +
b_3) $$

# Activation function

Sigmoid

$$ \sigma = \frac{1}{1 + e^{-x}} $$

$$ \frac{d\sigma}{dx} = \frac{e^{-x}}{(1 + e^{-x})^2} $$

# Loss
We will use Mean squared error as our loss function.

$$ L = \frac{1}{N} \sum_{i=0}^N (f(\mathbf{x}_i) - y_i)^2 $$

The objective of training the neural network is to minimize $$ L $$. During training, $$ N $$ is equal to the batch size.

# Gradient descent

The gradient is the derivative generalized to multiple dimensions that finds the direction of steepest ascent. This is applicable in maximization problems. However, minimization problems require finding the direction of steepest descent. So the negative gradient is computed. 

$$ \nabla L = \begin{bmatrix}
\frac{\partial L}{\partial \mathbf{W}_0} \\
\frac{\partial L}{\partial \mathbf{W}_1} \\
\frac{\partial L}{\partial \mathbf{B}_0} \\
\frac{\partial L}{\partial \mathbf{B}_1} \\
\end{bmatrix} $$

$$ \frac{\partial L}{\partial \mathbf{W}_0} =
\frac{2}{N} (\sigma(\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1) - \mathbf{y})
d\sigma(\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1)
d\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0)
\mathbf{W}_1 \mathbf{x} $$

$$ \frac{\partial L}{\partial \mathbf{b}_0} =
\frac{2}{N} (\sigma(\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1) - \mathbf{y})
d\sigma(\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1)
d\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0) $$

$$ \frac{\partial L}{\partial \mathbf{W}_1} =
\frac{2}{N} (\sigma(\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1) - \mathbf{y})
d\sigma(\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1)
d\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0)
\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0) $$

$$ \frac{\partial L}{\partial \mathbf{b}_1} =
\frac{2}{N} (\sigma(\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1) - \mathbf{y}) $$

<!-- \frac{d\sigma}{dW_0} -->

<!-- | ![](/assets/plot.svg) | 
|:--:|
| $$ z(x, y) = a \sin(x) + b \cos(y) $$ |

<img src="/assets/plot.svg" alt="drawing" width="800"/> -->
$$ \LaTeX $$
