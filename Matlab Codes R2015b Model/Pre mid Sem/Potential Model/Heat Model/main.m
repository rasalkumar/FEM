N = [12,22,42,82];
q = 0.3*10^(6);
k = 25; 
T_s = 365;
b(1,1) =0;
T1 = zeros(82,4);
T_analyical = zeros(82,4);  % analytical/exact Potential matrix

for i =  1:4
a =[0,1,-1,1,-2,1,0,1,0,N(1,i)];                                            % matrix of coefficients 
b(N(1,i),1) = T_s;
b(2:(N(1,i)-1),1) = (-q/k)*((0.1/(N(1,i)-1))^(2));
TDM  = tridiagonal_mat(a);
[B,A] = res_mat(b,TDM);
T = TDM_sol(B,A);
T(1,1) = T(2,1);
T1(1:N(1,i),i) = T(:,1);                                                    % Potential values calculated using TDM with different grid sizes. 
T_analytical(1:N(1,i),i) = T_exact(T_s,N(1,i));                             % exact potential values with different grid sizes
Error(1:N(1,i),i) = T_analytical(1:N(1,i),i)-T1(1:N(1,i),i);
Average_L2_Norm(1,i) = sqrt((1/(N(1,i)-1))*(sum(Error(:,i).^(2))));
end

x1 = 0:(0.1/11):0.1;
x2 = 0:(0.1/21):0.1;
x3 = 0:(0.1/41):0.1;
x4 = 0:(0.1/81):0.1;

figure % Potential Plot (both numerical and analytical)
plot(x1,T1(1:12,1),'.',x1,T_analytical(1:12,1),'.')
hold on 
plot(x2,T1(1:22,2),'o',x2,T_analytical(1:22,2),'o')
hold on 
plot(x3,T1(1:42,3),':',x3,T_analytical(1:42,3),':')
hold on
plot(x4,T1(1:82,4),'*',x4,T_analytical(1:82,4),'*')

figure (2) % Error Plot 
plot(x1,Error(1:12,1),'.')
hold on 
plot(x2,Error(1:22,2),'o')
hold on 
plot(x3,Error(1:42,3),':')
hold on
plot(x4,Error(1:82,4),'*')


