function [W ,E ,N ,S, P] = coefficients(a)
% W E N S P  is the matrix which contains the coefficients of the neighboring grid
% nodes ( West East North South respectively )contributing to the value of phi at 
%the given point p (P matrix). a is the matrix which are the values assigned to the
%coefficients. They can change with different iterations but not in the
%case discussed.  Where (-Num*Num) is the coefficient.
Num = a(1,2);
W = (-a(1,2)*a(1,2))*(ones(Num,Num));
E = (-a(1,2)*a(1,2))*(ones(Num,Num));
N = (-a(1,2)*a(1,2))*(ones(Num,Num));
S = (-a(1,2)*a(1,2))*(ones(Num,Num));
P = (-4*a(1,2)*a(1,2))*(ones(Num,Num));
%W(1:Num,1) = 0;   % as all the nodes in the first column of grids have no west neighbour
%S(1,1:Num) = 0;   % as all the nodes in the first row of grids have no south neighbour
%E(1:Num,Num) = 0;   % as all the nodes in the last column of grids have no east neighbour
%N(Num,1:Num) = 0;   % as all the nodes in the last row of grids have no north neighbour

end

