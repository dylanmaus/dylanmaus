---
layout: project
name: "Deep Learning Math"
---

## Introduction
Consider the function $$ z(x, y) = a \sin(x) + b \cos(y) $$ and noisy data from sensors that measure $$ z $$ at many $$ (x, y) $$ locations. Our goal is to fit the data with $$ z(x, y) $$ by finding the parameters $$ a $$ and $$ b $$. A nonlinear least squares approach such as the Gauss-Newton algorithm could be used to solve this nonlinear regression problem.

In a real world scenario we may not even know the function $$ z $$ at all. It may be high dimensional and impossible to guess, so it must be approximated. To solve this more advanced problem, we propose a model such as an artificial neural network to approximate $$ z $$. Our goal here is similar, iteratively tune the model parameters to fit the data.

This post explains some of the math behind Deep Learning and why it may be preferred to other approaches.

## Deep learning
# Function approximation
To approximate the unknown function $$ z $$, consider a 2 layer fully connected neural network with 2 inputs, 3 nodes in the hidden layer, 1 output, and sigmoid activation function. The complete breakdown of the neural network $$ f $$ is shown below.

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

$$ f(\mathbf{x}) = \sigma(\sigma(\mathbf{W}_0\mathbf{x} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1) $$

$$ f(\mathbf{x}) = \sigma\left(\sigma\left(
\begin{bmatrix} 
\omega_0& \omega_1 \\
\omega_2& \omega_3 \\
\omega_4& \omega_5
\end{bmatrix}
\begin{bmatrix} 
x_0 \\
x_1
\end{bmatrix} +
\begin{bmatrix} 
b_0 \\
b_1 \\
b_2
\end{bmatrix}
\right)
\begin{bmatrix} 
\omega_6 \\
\omega_7 \\
\omega_8
\end{bmatrix} +
b_3
\right)$$

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

$$ L = \frac{1}{N} \mathbf{1}^T \begin{bmatrix}
(f(\mathbf{x}_0) - y_0)^2 \\
\vdots \\
(f(\mathbf{x}_N) - y_N)^2
\end{bmatrix} $$

$$ \mathbf{X} = \begin{bmatrix}
\mathbf{x}_0 \\
\vdots \\
\mathbf{x}_N
\end{bmatrix} = \begin{bmatrix}
x_0^0 & x_1^0 \\
\vdots & \vdots \\
x_0^N & x_1^N
\end{bmatrix}
$$

$$ \mathbf{Y} = \begin{bmatrix}
y_0 \\
\vdots \\
y_N
\end{bmatrix} $$

$$ L = \frac{1}{N} \mathbf{1}^T (f(\mathbf{X}) - \mathbf{Y})^2 $$

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
\frac{2}{N} (\sigma(\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1) - \mathbf{Y})
d\sigma(\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1)
d\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0)
\mathbf{W}_1 \mathbf{X} $$

$$ \frac{\partial L}{\partial \mathbf{b}_0} =
\frac{2}{N} (\sigma(\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1) - \mathbf{Y})
d\sigma(\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1)
d\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0) $$

$$ \frac{\partial L}{\partial \mathbf{W}_1} =
\frac{2}{N} (\sigma(\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1) - \mathbf{Y})
d\sigma(\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1)
d\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0)
\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0) $$

$$ \frac{\partial L}{\partial \mathbf{b}_1} =
\frac{2}{N} (\sigma(\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0)\mathbf{W}_1 + \mathbf{b}_1) - \mathbf{Y})
d\sigma(\sigma(\mathbf{W}_0\mathbf{X} + \mathbf{b}_0) \mathbf{W}_1 + \mathbf{b}_1)
$$

Weight update

$$ \mathbf{W}_{n+1} = \mathbf{W}_n - \gamma \frac{\partial{W_n}}{\partial{L}}$$

<!-- \frac{d\sigma}{dW_0} -->

<!-- | ![](/assets/plot.svg) | 
|:--:|
| $$ z(x, y) = a \sin(x) + b \cos(y) $$ |

<img src="/assets/plot.svg" alt="drawing" width="800"/> -->
$$ \LaTeX $$
