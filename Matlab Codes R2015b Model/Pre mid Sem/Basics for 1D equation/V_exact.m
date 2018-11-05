function [V] = V_exact(x,y)
% This function calcuates the exact value of phi a the given node(x,y)

V = 500*(exp(-50*((1-(x*x)) + (y*y)))) + 100*(1-y)*x;

end