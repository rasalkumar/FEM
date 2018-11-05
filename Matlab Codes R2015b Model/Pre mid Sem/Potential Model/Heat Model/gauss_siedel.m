function [X, i, L2_norm] = gauss_siedel(D, L, U, tol, b)
N = size(D,2);
x = zeros(N,1);  % temperature matrix for current iteration 
L2_norm = 1;
i = 0;
y = zeros(N,1); % temperature matrix for previous iteration 
while ( L2_norm > tol) 
    x = ((D-L)\U)*x + (D-L)\b;
    err = x - y;
    L2_norm = sqrt(((sum(err(1:N-1,1).^(2))))/(N-1));
    i = i+1;
    y = x;
   
end
X = x;
end