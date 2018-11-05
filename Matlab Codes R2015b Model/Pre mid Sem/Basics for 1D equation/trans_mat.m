function[D, L, U] = trans_mat(A)

D = diag(diag(A));  % extracting the diagonal elements of A 
L = -1*tril(A,-1);
U = -1*triu(A,1);

end