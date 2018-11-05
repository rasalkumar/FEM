% 2D Hyperbolic PDE Advection Eqn

clear;
clc

% define variables
xmin=0;    % minimum value of x
xmax=1;    % maximum value of x
N=100;     % no. nodes -1
dt=0.009;  % timestep 
t=0;       % time
tmax=0.5;  % maximum value of t
v = 1;     % velocity

% discetize the domain
dx = (xmax-xmin)/N;
x = xmin - dx : dx : xmax + dx;

% set initial conditions
u0 = exp(-200*(x - 0.25).^2);
u = u0;
unp1 = u0;

% loop through time
nsteps = tmax/dt;
for n = 1 : nsteps
    
    % calculate boundary conditions
    u(1)=u(3);
    u(N+3)=u(N+1);
    
    % calculating the Fou Scheme
    for i = 2 : N + 2
        unp1(i) = u(i) - v*dt/dx*(u(i)-u(i-1));
    end
    
    % Update t and u
    t = t + dt;
    u = unp1;
    
    % Calculate exact solution
    exact = exp(-200*(x-0.25-v*t).^2);
    
    % plot solution
    plot(x,exact,'r-');
    hold on
    plot(x,u,'bo-','markerfacecolor','b');
    hold off
    axis([xmin xmax -0.5 1.5])
    xlabel('x','fontsize',16)
    ylabel('U(t,x)','fontsize',16)
    title(sprintf('time = %1.3f',t),'fontsize',16)
    shg
    pause(dt);
end
