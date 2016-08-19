%this is my test script for all of my functions 
%
clc; clear all; close all;
n = 2;
xx=linspace(-1,2,2*n+1);
x=xx(1:2*n);
f = @(x) (x.^2).*((x+1).^2).*((x-2).^2) - exp(-(x).^2).*(sin(x+1).^2).*(sin(x-2).^2);
a = calc_var_a2( f, n, x );
b = calc_var_b2( f, n, x );
s = evals(n,x,a,b);
plots = figure;
figure(plots) 
subplot(2,2,1)
hold on;
plot(xx,[s,s(1)],'ro')
plot(xx,f(xx))
legend('DFT','F(x)')
title('Discrete Fourier Transform n=2')
xlabel('x')
ylabel('y')

n = 4;
xx=linspace(-1,2,2*n+1);
x=xx(1:2*n);
a = calc_var_a2( f, n, x );
b = calc_var_b2( f, n, x );
s = evals(n,x,a,b);
subplot(2,2,2)
hold on;
plot(xx,[s,s(1)],'ro')
plot(xx,f(xx))
legend('DFT','F(x)')
title('Discrete Fourier Transform n=4')
xlabel('x')
ylabel('y')

n = 8;
xx=linspace(-1,2,2*n+1);
x=xx(1:2*n);
a = calc_var_a2( f, n, x );
b = calc_var_b2( f, n, x );
s = evals(n,x,a,b);
subplot(2,2,3)
hold on;
plot(xx,[s,s(1)],'ro')
plot(xx,f(xx))
legend('DFT','F(x)')
title('Discrete Fourier Transform n=8')
xlabel('x')
ylabel('y')

n = 16;
xx=linspace(-1,2,2*n+1);
x=xx(1:2*n);
a = calc_var_a2( f, n, x );
b = calc_var_b2( f, n, x );
s = evals(n,x,a,b);
subplot(2,2,4)
hold on;
plot(xx,[s,s(1)],'ro')
plot(xx,f(xx))
legend('DFT','F(x)')
title('Discrete Fourier Transform n=16')
xlabel('x')
ylabel('y')

figure; hold on;
plot(xx, f(xx))
plot(xx,[s,s(1)])

legend('F(x)')
title('the function')
xlabel('x')
ylabel('y')
