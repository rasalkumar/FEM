function [s] = source(N)

s = zeros(N,N);
for x = 1:N
    for y = 1:N
s(x,y) = 50000*(100*((1-((x*x)/(N*N)))+((y*y)/(N*N)))-2)*(exp(-50*((1-((x*x)/(N*N))) +((y*y)/(N*N)))));
    end
end

end