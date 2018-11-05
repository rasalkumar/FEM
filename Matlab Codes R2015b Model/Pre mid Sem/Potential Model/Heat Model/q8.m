N = 12;                             % N-1 grids and N points 
q = 0.3*10^(6);                     % rate of heat generation
k = 25;                             % thermal conductivity 
tol = 10^(-8);                      % tolerance 
T_s = 365;                          % end point temperature 

    % making of the matrix A for the relation AX = B
    p = -2*ones(1,N);
    s = ones(1,(N-1));
    r = ones(1,(N-1));
    A = diag(p);
    B = diag(s,1);
    C = diag(r,-1);
    A = A + B + C;
    A(1,1) = -3;
    A(1,2) = 4;
    A(1,3) = -1;
    A(N,N) = 1;
    b(1,1) = 0;
    b(N,1) = T_s;
    b(2:(N-1),1) = (-q/k)*((0.1/(N-1))^(2));
    [D, L, U] = trans_mat(A);
    [T,iter,L2_norm] = jacobi(D,L,U,tol,b);         % calculating temperature using gauss-siedel method. 
                                                               % iter is number of iterations
                                                            
                                                              
