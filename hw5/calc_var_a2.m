function [ a ] = calc_var_a2( f, n, x )
a = zeros(1,n+1); %return var
b = (2/3)*pi*x - (1/3)*pi; 
c = x;
for k = 0:n
    for e =  1:2*n
    a(k+1) =( a(k+1) + (1/(n))*f(c(e))* cos((k)* b(e)));%prev val + next val
        
    end    
end
a(1) = a(1)/2;
a(n+1)=a(n+1)/2;
end

