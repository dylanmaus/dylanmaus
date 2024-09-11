---
layout: post
title: "Deep Learning Math"
date: 2022-10-16
permalink: /projects/deep+learning+math
categories: projects
---

Consider the function $$ z(x, y) = a \sin(x) + b \cos(y) $$ and noisy data from sensors that measure $$ z $$ at many $$ (x, y) $$ locations.

| ![](/assets/plot.svg) | 
|:--:| 
| $$ z(x, y) = a \sin(x) + b \cos(y) $$ |

Our goal is to fit the data to $$ z(x, y) $$ and find the parameters $$ a $$ and $$ b $$. A non-linear least squares approach such as the Gauss-Newton algorithm could be used to solve this problem.

This post explains some basic math behind Deep Learning. Starting with data fitting and building up to artificial neural networks.

# Data Fitting

The simplest example is fitting a linear function to data $$ f(x; m, b) = y = mx + b $$

Testing $$ \LaTeX $$ $$ \nabla_{\boldsymbol{x}} J(\boldsymbol{x}) $$
