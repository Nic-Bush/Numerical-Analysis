function [ Arr ] = computecoef( func, n, m  )
Arr = (1:n+1);
for c = 0: n
    d = polycheb(c);
    f = @(x) func(x).* d(x).*(1./sqrt(1-x.^2))*2/pi;
    Arr(c+1) = gaussleg(f,m);
end
end

