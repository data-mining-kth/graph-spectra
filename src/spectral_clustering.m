clear all;close all;clc;

K=4; % Number of clusters

E = readmatrix('../data/example1.dat');
E = unique(E, "rows");

col1 = E(:,1);
col2 = E(:,2);
max_ids = max(max(col1,col2));
As = sparse(col1, col2, 1, max_ids, max_ids); % Computation of the adjacency matrix

G = graph (As);

A = full(As); % To not have a sparse matrix

figure
imagesc(A) % Display sparsity matrix

D = diag(sum(A,2)); % Diagonal matrix algorithm
L = D^(-1/2)*A*D^(-1/2);

[Vl,Dl] = eig(L);
% Fiedler Vector is the vector corresponding to the second smallest eigenvalue of the Laplacian matrix, L
fiedlerVec = Vl(:,2); 
sorted_fielderVec = sort(fiedlerVec);
figure;
plot(sorted_fielderVec)

[VK,DK] = eigs(L,K,'largestreal');
D = diag(DK);

denom  =(sum( VK.^2,2)).^(1/2);
Y = bsxfun(@rdivide,VK,denom);

idx = kmeans(Y,K);

figure;
h = plot(G);
highlight(h,find(idx==1),'NodeColor','g')
highlight(h,find(idx==2),'NodeColor','r')
highlight(h,find(idx==3),'NodeColor','b')
highlight(h,find(idx==4),'NodeColor','c')
