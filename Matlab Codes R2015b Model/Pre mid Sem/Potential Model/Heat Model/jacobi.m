function [X, i, L2_norm] = jacobi(D, L, U, tol, b)
N = size(D,2);
x = zeros(N,1);         % temperature matrix
L2_norm = 1;
i = 0;
y = zeros(N,1);         % temperature matrix for previous iteration 
while ( L2_norm > tol)
    x = (inv(D))*(L-U)*x + inv(D)*b;
    err = x - y;
    L2_norm = sqrt((1/(N-1))*((sum(err(1:N,1).^(2)))));
    i = i+1;
    y = x;
end
X = x;
end