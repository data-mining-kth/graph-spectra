# Spectral Graph Clustering with K-eigenvector Algorithm

Authors: Brando Chiminelli, Tommaso Praturlon

The goal of this work is to implement a spectral graph clustering algorithm as the one described by the research of [Ng, Jordan and Weiss](http://ai.stanford.edu/~ang/papers/nips01-spectral.pdf) using MATLAB. Given a graph, described as a series of edges (u,v) in a .csv file, we want to discover how many communities are present. Firstly, we work on a dataset prepared by Ron Burt. He dug out the 1966 data collected by Coleman, Katz, and Menzel on medical innovation. They collected data from physicians in four towns in Illinois, Peoria, Bloomington, Quincy, and Galesburg. Secondly, we worked on a synthetic graph to further test our implementation.

The basic idea behind the algorithm is to depart from the standard clustering approach based on generative models. We do apply k-means, but not directly to the data, instead, we apply it to the data mapped in Rk.

| Applying k-means directly to the dataset | Applying k-means after the algorithm implementation |
| :---: | :---: |
| <img src="./img/bad-cluster.png" alt="drawing" width="50%"/> | <img src="./img/good-cluster.png" alt="drawing" width="50%"/> |

## Implementation

### First Graph

Start by reading the data and creating the affinity matrix A.

```
K=4; % Number of clusters

E = readmatrix('../data/example1.dat');

col1 = E(:,1);
col2 = E(:,2);
max_ids = max(max(col1,col2));
As = sparse(col1, col2, 1, max_ids, max_ids); % Computation of the adjacency matrix
G = graph (As);

A = full(As); % To not have a sparse matrix
```

[image of affinity matrix](path/to/image)


### Second Graph

Then do

```
K=4; % Number of clusters

E = readmatrix('../data/example1.dat');

col1 = E(:,1);
col2 = E(:,2);
max_ids = max(max(col1,col2));
As = sparse(col1, col2, 1, max_ids, max_ids); % Computation of the adjacency matrix
G = graph (As);

A = full(As); % To not have a sparse matrix
```
