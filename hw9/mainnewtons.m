a = @(x) 3*x(1) - cos(x(2)*x(3)) - .5;
b = @(x) (x(1))^2 - 81*(x(2)+.1)^2 + sin(x(3)) +1.06;
c = @(x) exp(-x(1)*x(2))+20*x(3) + ((10*pi)-3)/3;
F = {a;b;c};%the origional func

a =@(x) 3;
b =@(x) x(3)*sin(x(2)*x(3));
c =@(x) x(2)*sin(x(2)*x(3));

d =@(x) 2*x(1);
e =@(x) -162*(x(2)+.1);
f =@(x) cos(x(3));

g = @(x) -x(2)*exp(-x(1)*x(2));
h = @(x) -x(1)*exp(-x(1)*x(2));
i = @(x) 20;

jacobi = {a b c; d e f; g h i};%the jacobi
guess = [.1;.1;-.1];%initial guess
n = 3;%number of x vals
TOL = 10^-5;%tolerance
maxiter = 100;%max iterations
Newtonsmine(n, guess, TOL, maxiter, jacobi, F);
