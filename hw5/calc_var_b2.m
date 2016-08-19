function [ b ] = calc_var_b2( f,n,x )
b = zeros(1,n+1);
c = (2/3)*pi*x - (1/3)*pi; 
for k = 2:n
    for e = 1:2*n
        b(k) = b(k) + (1/n)*f(x(e))*sin((k-1)*c(e));
        
    end
end
end

%works