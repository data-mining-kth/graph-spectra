% Implementation of the algorithm
% Given the set of points S
S = readmatrix('../data/example1.dat');
n = size(S, 1);
x_coord = S(:,1);
y_coord = S(:,2);
% Form the affinity matrix A
A = zeros(n,n);
sigma = 3;
for i = 1:n
    for j = 1:n
        A(i,j) = exp(-norm(S[i]-S[j], 2)/(2*sigma^2));
        if  i == j
            A(i,j) = 0;
        end
    end
end
% Define D diagonal matrix

