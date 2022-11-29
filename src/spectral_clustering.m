%% Implementation of the algorithm
% Given the set of points S
S = readmatrix('../data/example1.dat');
n = size(S, 1);
x_coord = S(:,1);
y_coord = S(:,2);
% Form the affinity matrix A
% It is computing the distance between points
% the smaller the distance between point, the higher exp()
% set to zero the distance between a point and itself
% because it would  be one otherwise
% The higher the value of A(i,j) the higher the affinity
A = zeros(n,n);
sigma = 3;
for i = 1:n
    for j = 1:n
        A(i,j) = exp(-norm(S(i,:)-S(j,:), 2)/(2*sigma^2));
        if  i == j
            A(i,j) = 0;
        end
    end
end
figure(1)
imagesc(A)
%% Define D diagonal matrix and build Laplacian
D = zeros(n,n);
for i = 1:n
    for j = 1:n
        if i == j
        D(i,j) = sum(A(i,:));
        end
    end
end
% Construct matrix L, Laplacian matrix
% L is symmetrically normalized Laplacian
% it measures the extent to which a point
% differs from its neighbors
L = sqrt(inv(D))*A*sqrt(inv(D));
%% Form the matrix X of max eigenvectors
k = 10;
eig_vect = eig(A);
figure()
imagesc(A)
