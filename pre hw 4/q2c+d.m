%for log part of 2... and also bx^a part
m = 10; % size of data
n = 2;  % size of a; n-1 is the degree
x = [4, 4.2, 4.5, 4.7, 5.1, 5.5, 5.9, 6.3, 6.8, 7.1]';
y = [102.56, 113.18, 130.11, 142.05, 167.53, 195.14, 224.87, 256.73, 299.5, 326.72]';
z = log(y);
f = log(x);
d = solve_normal_eq(m, 2, x, z);
lnb = d(1);
a = d(2);
b = exp(lnb);
P1 =@(x) b*exp(a*x);
error4=0;
error5 = 0;
for it = 1:m
    error4 = error4 + (y(it) - P1(x(it)))^2;
end

d = solve_normal_eq(m, 2, f, z);
lnb = d(1);
a = d(2);
b = exp(lnb);
P2 = @(x) b*x.^a;

for it = 1:m
    error5 = error5 + (y(it) - P2(x(it)))^2;
end

figure; hold on;
% this plots the data
plot(x, y, '*', 'linewidth', 2);
% this plots the fit
plot(x, P1(x), 'r', x, P2(x), '--');
legend('data', 'y=b*exp(ax)', 'y = b*x^a')
xlabel('x')
ylabel('y')
 title('exponential and ax^n guesses')