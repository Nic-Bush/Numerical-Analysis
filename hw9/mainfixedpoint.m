
func1 = @(x) (cos(x(2)*x(3))+.5)/3;
func2 = @(x) sqrt((x(1)^2 +sin(x(3))+1.06)/81)-.1;
func3 = @(x) -(exp(-x(1)*x(2))+(10*pi-3)/3)/20;
func = {func1;func2;func3};%creates array of func
Tol = 10^-9;%tolerance
guess=[.1;.1;-.1];%initial guess
fixedpoint(func,guess,Tol,100);%last number is max itterations