grid = [20,40,80];                                                        % grid sizes 
r_avg(1,1) = 1;                                                            % initialization of L2_norm
for l = 1:size(grid,2)
   k = 1;                                                                  % initilization of number of  iterations
   phi = phi_initial(grid(1,l));                                           
   phi_old = zeros(grid(1,l),grid(1,l));                                     
   a = [1/grid(1,l), grid(1,l)];
   [W,E,N,S,P] = coefficients(a);                                          % getting the matrix containing west, east, north and south element coefficients
   source_mat = source(grid(1,l));                                         % matrix containing source terms
   error_avg(1,1) = 1;                                                     % initialization of average error
   while r_avg(1,k) > 10^(-8)
        for i = 2:grid(1,l)-1
            for j = 2:grid(1,l)-1
                phi(i,j) = (1/P(i,j))*(W(i,j-1)*phi(i,j-1) + E(i,j+1)*phi(i,j+1) + N(i+1,j)*phi(i+1,j) + S(i-1,j)*phi(i-1,j) + source_mat(i,j));
            end         
        end
        
      k = k+1;
      res = residual(grid(1,l),source_mat, phi);            % matrix containing the residual vector
      error_avg(1,k) = sqrt((1/grid(1,l))*(sum(sum((phi - phi_old).^2)))); % average error calculation 
      r_avg(1,k) = sqrt((1/grid(1,l))*(sum(sum(res.^2))));                 %calculation of L2_norm
      phi_old = phi;
      
      
   end
  iterations(1,l) = k;
  lambda_max(1,l) = error_avg(1,k)/error_avg(1,k-1);
  error_avgs{l,:} = error_avg;
  r_avgs{l,:} = r_avg;
  
end

x1 = 1:iterations(1,1);
x2 = 1:iterations(1,2);
x3 = 1:iterations(1,3);

figure 
subplot(1,3,1)
semilogx(error_avgs{1,:},x1,'-',r_avgs{1,:},x1,'*');
subplot(1,3,2)
semilogx(error_avgs{2,:},x2,'-',r_avgs{2,:},x2,'*');
subplot(1,3,3)
semilogx(error_avgs{3,:},x3,'-',r_avgs{3,:},x3,'*');



% lambda_max =  0.9729    0.9928    0.9985;
% iterations = 872        3780       15820; 
