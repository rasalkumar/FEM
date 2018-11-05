grid = [80];
c = 1;
l =1;
a = [1/grid(1,l), grid(1,l)];
[W,E,N,S,P] = coefficients(a);                                          % getting the matrix containing west, east, north and south element coefficients
source_mat = source(grid(1,l));                                         % matrix containing source terms
for w = 1:0.2:1.99
    l = 1;
    k = 1;
    r_avg(1,1) = 1;
    phi = phi_initial(grid(1,l));
    
    while r_avg(1,k) > 10^(-8)
        for i = 2:grid(1,l)-1
            for j = 2:grid(1,l)-1
                phi(i,j) = (1-w)*phi(i,j) +( w/P(i,j))*(W(i,j-1)*phi(i,j-1) + E(i,j+1)*phi(i,j+1) + N(i+1,j)*phi(i+1,j) + S(i-1,j)*phi(i-1,j) + source_mat(i,j));
            end
        end
        
        k = k+1;
        res = residual(grid(1,l),source_mat, phi);                           % matrix containing the residual vector
        r_avg(1,k) = sqrt((1/grid(1,l))*(sum(sum(res.^2))));                 %calculation of L2_norm
        
    end
    iterations(1,c) = k;
    c = c+1;
end





