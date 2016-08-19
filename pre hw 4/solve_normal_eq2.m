%n-1 is degree
%i dont think an m is needed if we use the sum command...
function a = solve_normal_eq(m,n,x,y)
A = zeros(n);%create a array of zeroes that is nxn
B = zeros(n,1);%creates a sol matrix
for c= 1:n
    for d = 1:n
        A(c,d) = sum(x.^(c+d-2));%will get a matrix A with all data in it
    end
end
for e= 1:n
    B(e) = sum(y.*x.^(e-1));%gives the solution matrix
end
    a = A\B
end