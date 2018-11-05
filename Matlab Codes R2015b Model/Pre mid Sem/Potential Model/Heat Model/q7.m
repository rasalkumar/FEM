N = [12,22,42,82];
q = 0.3*10^(6);                          % rate of heat generation
k = 25;                                  % thermal conductivity 
tol = 10^(-8);                           % tolerance
T_s = 365;                               % end point temperature 
for i = 1:size(N,2);
    % making of the matrix A for the relation AX = B
    p = -2*ones(1,N(1,i));
    s = ones(1,(N(1,i)-1));
    r = ones(1,(N(1,i)-1));
    A = diag(p);
    B = diag(s,1);
    C = diag(r,-1);
    A = A + B + C;
    A(1,1) = -3;
    A(1,2) = 4;
    A(1,3) = -1;
    A(N(1,i),N(1,i)) = 1;
    A(N(1,i),N(1,i)-1) = 0;
    b(1,1) = 0;
    b(N(1,i),1) = T_s;
    b(2:(N(1,i)-1),1) = (-q/k)*((0.1/(N(1,i)-1))^(2));
    [D, L, U] = trans_mat(A);
    [X,iter ,L2_norm] = gauss_siedel(D,L,U,tol,b);
    T(1:N(1,i),i) = X;                                          % temerature matrix for different number of grids
    L2_norms(1,i) = L2_norm;                                    % matrix of L2 norms
    
end

x1 = 0:(0.1/11):0.1;
x2 = 0:(0.1/21):0.1;
x3 = 0:(0.1/41):0.1;
x4 = 0:(0.1/81):0.1;

figure % Temperature Plot (both numerical and analytical)
plot(x1,T(1:12,1),'.',x2,T(1:22,2),'o',x3,T(1:42,3),':',x4,T(1:82,4),'*')
% hold on 
% plot(x2,T(1:22,2),'o','green')
% hold on 
% plot(x3,T(1:42,3),':','blue')
% hold on
% plot(x4,T(1:82,4),'*','yellow')
