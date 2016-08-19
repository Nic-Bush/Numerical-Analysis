function [ a ] = calc_var_a( f, n )
a = zeros(1,n+1); %return var
b = linspace(-pi,pi,31); %used as vals for trap rule
for k = 0:n
    for x =  1:30
    a(k+1) =( a(k+1) + (2*pi/30)*f(b(x))* cos((k)* b(x)));%prev val + next val
        
    end
a(k+1) = a(k+1)/(pi);    
end

end

