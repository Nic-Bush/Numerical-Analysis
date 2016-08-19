function [ s ] = evals( n,x,a,b )
z = (2/3)*pi*x - (1/3)*pi;
s=zeros(1,2*n);
for i = 1:2*n
   for k = 1: n+1
       s(i) = s(i) + a(k)*cos((k-1)*z(i)) + b(k)*sin((k-1)*z(i));
   end
end
end

