function [ S ] = calc_s( n,x,a,b )
z = (2/3)*pi*x - (1/3)*pi;
S=0;
for k = 1:n+1
    S = S + a(k)*cos((k-1)*z) + b(k)*sin((k-1)*z);
end
end

