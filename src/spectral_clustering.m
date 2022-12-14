clear all;close all;clc; 

E = readmatrix('../data/example1.dat');
E = unique(E, "rows"); % Get the unique edge, no duplicates

vertex1 = E(:,1);
vertex2 = E(:,2);
max_ids = max(max(vertex1,vertex2)); % Get total number of vertices
As = sparse(vertex1, vertex2, 1, max_ids, max_ids); % Computation of the adjacency matrix

G = graph (As);
figure
plot(G)

K=4; % Number of clusters (deduced from the graph)

A = full(As); % To not have a sparse matrix

figure
imagesc(A) % Display sparsity matrix

D = diag(sum(A,2)); % Diagonal matrix algorithm
L = D^(-1/2)*A*D^(-1/2); % Laplacian matrix

[Vl,Dl] = eig(L); % Get eigenvectors and eigenvalues of L
% Fiedler Vector is the vector corresponding to the second smallest eigenvalue of the Laplacian matrix, L
fiedlerVec = Vl(:,2); 
sorted_fielderVec = sort(fiedlerVec);
figure;
plot(sorted_fielderVec) % Display Fiedler vector

[VK,DK] = eigs(L,K,'largestreal'); % Get the K largest eigenvectors of L
D = diag(DK); 
X = VK; % X is the matrix of the K largest eigenvectors

denom  =(sum( X.^2,2)).^(1/2);
Y = bsxfun(@rdivide,X,denom); % Normalize X

idx = kmeans(Y,K); % Apply k-means to cluster the graph into K clusters

figure;
h = plot(G, "MarkerSize", 6);
highlight(h,find(idx==1),'NodeColor','magenta')
highlight(h,find(idx==2),'NodeColor','red')
highlight(h,find(idx==3),'NodeColor','blue')
highlight(h,find(idx==4),'NodeColor','green')
