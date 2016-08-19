function [ s ] = calc_s2( a,b,n,x)
s = zeros(1,n);
c = (2/3)*pi*x - (1/3)*pi;
%%calc actual values
s(1)= a(1);
for j = 1:2*n
a(n+1)= a(n+1)*cos(c(j));
end
for k=2:n-1
for j=1:2*n
s(k) = s(k) + a(k+1).*cos(k*c(j)) + b(k).*sin(k*c(j));
end
end

