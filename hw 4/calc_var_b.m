function [ b ] = calc_var_b( f,n )
b = zeros(1,n-1);
c = linspace(-pi,pi,31);
for k = 1:n-1
    for x = 1:30
        b(k) = b(k) + (2*pi/30)*f(c(x))*sin((k)*c(x));
        
    end
    b(k) = b(k)/pi;
end
end

