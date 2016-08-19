m = 10; % size of data
n = 2;  % size of a; n-1 is the degree
x = [4, 4.2, 4.5, 4.7, 5.1, 5.5, 5.9, 6.3, 6.8, 7.1]';
y = [102.56, 113.18, 130.11, 142.05, 167.53, 195.14, 224.87, 256.73, 299.5, 326.72]';
a = solve_normal_eq(m, 2, x, y);
% error
a0 = a(1);
a1 = a(2);
P1 = a0 + a1*x;
error1 = 0;
for it = 1:m
error1 = error1 + (y(it) - P1(it))^2;
end
a = solve_normal_eq2(m, 3, x, y);
a0 = a(1);
a1 = a(2);
a2 = a(3);
P2 = a0 + a1*x + a2*x.^2;
error2 = 0;
for it = 1:m
error2 = error2 + (y(it) - P2(it))^2;
end
a = solve_normal_eq2(m, 4, x, y);
a0 = a(1);
a1 = a(2);
a2 = a(3);
a3 = a(4)
P3 = a0 + a1*x + a2*x.^2 + a3*x.^3;
error3 = 0;
for it = 1:m
error3 = error3 + (y(it) - P3(it))^2;
end
figure; hold on;
% this plots the data
plot(x, y, '*', 'linewidth', 2);
% this plots the fit
plot(x, P1, 'r', x, P2, '--', x, P3,':');
legend('data', 'P1', 'P2','P3')
xlabel('x')
ylabel('y')
 title('exponential and ax^n guesses')