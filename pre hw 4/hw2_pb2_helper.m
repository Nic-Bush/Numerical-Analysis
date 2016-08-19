clc; clear all; close all;

m = 10; % size of data
n = 2;  % size of a; n-1 is the degree
x = [1:10]';
y = [1.3, 3.5, 4.2, 5, 7, 8.8, 10.1, 12.5, 13, 15.6]';

a = solve_normal_eq(m, n, x, y)

% error
a0 = a(1);
a1 = a(2);
P1 = a0 + a1*x
error = 0;
for it = 1:m
    error = error + (y(it) - P1(it))^2;
end

figure; hold on;
% this plots the data
plot(x, y, '*', 'linewidth', 2);
% this plots the fit
plot(x, P1, 'r');

legend('data', 'approxiomation')