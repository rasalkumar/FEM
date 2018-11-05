function [res] = residual(Num, source_mat, phi)

res = zeros(Num,Num);                                % initialization of residual matrix of size Num*Num
a = [1/Num,Num];
[W , E, N, S ,P] = coefficients(a);                  % coefficient matrices
        for o = 2:Num-1
            for p = 2:Num-1
                res(o,p) = source_mat(o,p) - (phi(o,p)*P(o,p) - W(o,p-1)*phi(o,p-1) - E(o,p+1)*phi(o,p+1) - N(o+1,p)*phi(o+1,p) - S(o-1,p)*phi(o-1,p)) ;
            end         
        end

end