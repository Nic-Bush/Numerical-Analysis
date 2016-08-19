function [ s ] = calc_s( a,b,n )
s = @(x) a(1)/2 + a(n+1)*cos(n*(x)); %has terms a0 and an in it
for k = 1:n-1
s = @(x) s(x) + a(k+1).*cos(k*x) + b(k).*sin(k*x);
end
end

