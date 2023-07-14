# pca-svd
# Image Compression Using Singular Value Decomposition (SVD)

This repository contains the implementation of an image compression algorithm using Singular Value Decomposition (SVD). The algorithm compresses the image with a low-rank approximation, where the rank is determined based on a specified threshold. This threshold ensures that a sufficient amount of information is retained during compression.

## How to Choose k

When creating a low-rank approximation of a matrix, we typically specify a target rank `k` as a parameter. The question is how to choose the value of `k`. Ideally, we can use the singular values of the matrix `A` to guide us in selecting `k`. If the top few singular values are significantly larger than the others, then we can set `k` to be the number of these large singular values. In practice, we may choose a value of `k` that is as small as possible while still obtaining a useful approximation, where the definition of "useful" depends on the specific application.

## Methods to Choose the Optimal k

1. **Energy preservation:** Choose `k` based on the proportion of the total energy preserved in the approximation.
2. **Error tolerance:** Set a maximum allowable error tolerance for the approximation, and choose `k` such that the error between the original matrix and its rank-k approximation is within this tolerance. 

## Trade-offs

The graphs in the repository help in understanding the trade-offs between the quality of the image approximation, computation time, and memory usage. We can choose an appropriate threshold value that balances these factors according to requirements.
