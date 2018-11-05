function [T] = TDM_sol(B,A)
N = size(B,1);
T(N,1) = B(N,1)/A(2,N);

   for i = N-1:-1:2
      T(i,1) = (B(i,1) - (A(3,i)*T(i+1,1)))/A(2,i);   % calculating Potential matrix using Tri-diagonal matrix.
   end
end
