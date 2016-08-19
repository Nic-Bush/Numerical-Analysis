
func1 = @(x) (x(1)^2 + x(2)^2 + 8)/10;
func2 = @(x) (x(1)*x(2)^2 + x(1) +8)/10;

func = {func1;func2};%creates array of func
Tol = 10^-3;%tolerance
guess=[2; 1.5];%initial guess
fixedpoint2(func,guess,Tol,100);%last number is max itterations