function [ phi] = phi_initial( N )
% this function calculates the intial value of the function phi at
% different nodes for a given grid size N 

for i = 1:N
    for j = 1:N
        phi(i,j) = V_exact(i/N,j/N); 
    end
end
phi(2:N-1,2:N-1) = 0;
end

