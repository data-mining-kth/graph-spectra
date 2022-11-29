clc;
clear all;
close all;

K=4; % Number of clusters

E = readmatrix('../data/example1.dat');

col1 = E(:,1);
col2 = E(:,2);
max_ids = max(max(col1,col2));
As = sparse(col1, col2, 1, max_ids, max_ids); % Computation of the adjacency matrix
G = graph (As);

A = full(As); % To not have a sparse matrix

figure
imagesc(A)

%[V,D] = eig(A);


D = diag(sum(A,2));           %Diagonal matrix algorithm
L = D^(-1/2)*A*D^(-1/2);
Laplacian = D-A;

%[Vl,Dl] = eig(L);
%X = maxk(Vl,k)';

[eigVecsK,eigValsK] = eigs(L,K,'largestreal');
D = diag(eigValsK);

%Y = normalize(X)';
%Y = zeros(241,K);
%for i = 1:241
%    for j = 1:K
%        %Y(i,j) = D(i,j)/(sqrt(sum(D(i,:).^2)));
%        Y(i,j) = D(i,j)/sum(D(i,:).^2).^(1/2);
%    end
%end

denom  =(sum( eigVecsK.^2,2)).^(1/2);
Y = bsxfun(@rdivide,eigVecsK,denom);

idx = kmeans(Y,K);

size(idx)
idx;
figure;
hold on;
h = plot(G);
highlight(h,find(idx==1),'NodeColor','r')
highlight(h,find(idx==2),'NodeColor','g')
highlight(h,find(idx==3),'NodeColor','b')
highlight(h,find(idx==4),'NodeColor','c')
