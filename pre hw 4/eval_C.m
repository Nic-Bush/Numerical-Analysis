function [ poly ] = eval_C( func,deg )
Arr = computecoef(func, deg,10);
d = polycheb(0);
poly = @(x) (1/2)*Arr(1)* d(x);
for c = 2 : deg+1
    f = polycheb(c-1);
    poly= @(x) poly(x) + Arr(c)*f(x);
    
end


end

