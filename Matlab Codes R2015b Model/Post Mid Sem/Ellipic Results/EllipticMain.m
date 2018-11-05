%2D PDE Elliptic PDE
clear; clc % Clear Workspace , Command Window

%Input
Nx=50;
Ny=50;
Lx=1;
Ly=1;

% Grid
x=linspace(0,Lx,Nx); %Mesh
y=linspace(0,Ly,Ny);
dx=x(2)-x(1); %Mesh Size
dy=y(2)-y(1);

% Initialize Matrices
N=Nx*Ny;        % # of unknowns
M=zeros(N,N);   % N rows, N columns
B=zeros(N,1);   % N rows, 1 columns 

for i=2:Nx-1 %Loop over X direction, skipping First and Last Grid Points
    for j=2:Ny-1 %Loop over Y direction, skipping First and Last Grid Points
        n=i+(j-1)*Nx; %Convert ij point to the nth Grid Point
        M(n,n   )=-4; %Main Diagonal
        M(n,n-1 )=1;  %Off Diagonal to the left
        M(n,n+1 )=1;  %Off Diagonal to the right 
        M(n,n-Nx)=1;  %Far Off Diagonal to the left 
        M(n,n+Nx)=1;  %Far Off Diagonal to the right 
        B(n,1   )=0;  %Source Term for this problem
    end
end
% Boundary Conditions
% Left BC phi=y
i=1;
for j=1:Ny;
    n=i+(j-1)*Nx; % nth column for this ij
    M(n,n)=1;     % Main Diagonal
    B(n,1)=y(j);  % BC at y_j
end
% Right BC phi=1-y
i=Nx;
for j=1:Ny;
    n=i+(j-1)*Nx; % nth column for this ij
    M(n,n)=1;     % Main Diagonal
    B(n,1)=1-y(j); % BC at x_i
end
% Bottom BC phi=x
j=1;
for i=1:Nx;
    n=i+(j-1)*Nx; % nth column for this ij
    M(n,n)=1;     % Main Diagonal
    B(n,1)=x(i); % BC at x_i
end
% Top BC phi=1-x
j=Ny;
for i=1:Nx;
    n=i+(j-1)*Nx; % nth column for this ij
    M(n,n)=1;     % Main Diagonal
    B(n,1)=1-x(i); % BC at x_i
end
%Solve for potential M*phi=B;
%phi=inv(M)*B;
phi_vec=M\B;

% Convert the Vector Solution to a 2D Array
for i=1:Nx
    for j=1:Ny
        n=i+(j-1)*Nx; % nth row of this ij
        phi(i,j)=phi_vec(n);
    end
end

%Plot Result
surf(x,y,phi') % ' takes Transpose
xlabel('x');
ylabel('y');
set(gca,'Fontsize',16)

% Compute velocity From potential
% u = -dphi/dx % x comp.of velocity
% v = -dphi/dy % y comp.of velocity

u=zeros(Nx,Ny);
v=zeros(Nx,Ny);
for i=2:Nx-1 % Loop Over Interior Grid Points
    for j=2:Ny-1
        u(i,j)=-(phi(i+1,j)-phi(i-1,j))/(2*dx);
        v(i,j)=-(phi(i,j+1)-phi(i,j-1))/(2*dy);
    end
end
figure(2);clf(2)
quiver(x,y,u',v')
xlabel('x')
ylabel('y')
title('Velocity Field')
    
    