function [ y ] = polycheb(deg)
Tn = @(x) x;
Tnminus = @(x) 1;
if deg == 0
    y = @(x) 1;
    return
end
for n = 1: 1: deg-1
    Tnplus = @(x) (2*x.*Tn(x) - Tnminus(x));
    Tnminus = @(x) Tn(x);
    Tn = @(x) Tnplus(x);
end
y = @(x) Tn(x);
end

