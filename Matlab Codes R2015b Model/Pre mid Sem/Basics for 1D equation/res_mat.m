function [B,A] = res_mat(b,TDM)
N = size(b,1);
B(1,1) = b(1,1); % B is the matrix at RHS 
B(N,1) = b(N,1);
 
  for i = 2:(N-1)
    TDM(2,i) = TDM(2,i)-((TDM(3,i-1)/TDM(2,i-1))*TDM(1,i)); % updating values of TDM
    B(i,1) = b(i,1) - (B(i-1,1)/TDM(2,i-1)*TDM(1,i));       % updating RHS matrix
  end
  A = TDM;   % updated TDM
end 