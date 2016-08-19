function S = eval_Snx_k(n, x, fhandle)

y = fhandle(x);
z = (2/3)*pi*x - (1/3)*pi

k = [0:n];

ak = 0;
for j = 1:2*n
    ak = ak + y(j)*cos(k*z(j)) 
end
ak = ak/n;
ak(1) = ak(1)/2;
ak(end) = ak(end)/2;

bk = 0;
for j = 1:2*n
    bk = bk + y(j)*sin(k*z(j)); 
end
bk = bk/n;

S = 0;
for k = 1:n+1
    S = S + ak(k)*cos((k-1)*z) + bk(k)*sin((k-1)*z);
end

ak
bk