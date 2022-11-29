clc;clear all;close all;

E = readmatrix('../data/example1.dat');

col1 = E(:,1);
col2 = E(:,2);
max_ids = max(max(col1,col2));
As= sparse(col1, col2, 1, max_ids, max_ids); 
A = full(As);

A = adjacency(G);

[v,D] = eig(A);
SD = sort(diag(D));
figure(1)
plot(SD)

figure(1)
imagesc(A)

G = graph(A);
figure(2)
plot(G)

%L = D-A;
L = D^(-1/2)*A*D^(-1/2);

[Vl,Dl] = eig(L);
k=4;
X = maxk(Vl,k)';
%X = maxk(Vl,k);
%Y = normalize(X)';
Y = zeros(241,k);
for i = 1:241
    for j = 1:k
        Y(i,j) = X(i,j)/(sqrt(sum(X(i,:).^2)));
    end
end

idx = kmeans(Y,4,'MaxIter',100);
%Sc = sort(idk);

size(idx)
idx;
figure(3);
hold on;
h = plot(G);
highlight(h,find(idx==1),'NodeColor','r')
highlight(h,find(idx==2),'NodeColor','g')
highlight(h,find(idx==3),'NodeColor','b')
highlight(h,find(idx==4),'NodeColor','c')
