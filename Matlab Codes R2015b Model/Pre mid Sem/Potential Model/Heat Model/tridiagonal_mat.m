function [TDM] = tridiagonal_mat(a)
N = a(1,10);
P = a(1,4)*ones(1,N-2);
Q = a(1,5)*ones(1,N-2);
R = a(1,6)*ones(1,N-2);

% storing values to form tri-diagonal matrix (TDM)
TDM(1,1) = a(1,1);
TDM(2,1) = a(1,2);
TDM(3,1) = a(1,3);
TDM(1,N) = a(1,7);
TDM(2,N) = a(1,8);
TDM(3,N) = a(1,9);
TDM(1,2:N-1) = P(:,:);
TDM(2,2:N-1) = Q(:,:);
TDM(3,2:N-1) = R(:,:);

end
