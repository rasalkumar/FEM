function [T_analytical] = T_exact(T_s,N)
 q = 0.3*10^(6);
 k = 25;
    for j = 1:N
        T(1,j) = T_s + (q/(2*k))*(0.01-(((0.1/(N-1))*(j-1))^2));
    end
    T_analytical = T;
    
end