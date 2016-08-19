clc;
clear;
alpha = 1;%defined by the problem in this case there is only d^2u/dx^2 so 1
endpoint = 1;%defined by problem in this case 1 b.c interval is [0,1]
g = 10;
m = 2^g;
h = 1/(2^g);
k = 1/100;
Time = .5; % given in problem
lambda = (alpha^2)*k/(h^2);
g = @(x,t) exp(-(pi^2)*t)*sin(pi*x);
f = @(x) sin(pi*x);
i = (1/m):h:((m-1)/m);
w = zeros(floor(1/h)-1);
b = (1+2*lambda)*ones(floor(1/h)-1,1);
c = -lambda*ones(floor(1/h)-2,1);

w = diag(b)+diag(c,-1)+diag(c,1);

for j = 1:m-1
u(j) = f(i(j));%no zeroth element in matlab
end
u=u';
for j= 1: Time/k 
u = w\u;

end
subplot(1,2,1)
i = 0:h:1;
plot([0:h:1], [0;u;0],'--')
hold on;
plot(i,g(i,.5) )
title('forewards method orig problem')
xlabel('x')
ylabel('y')
legend('aproximate', 'real')
%plot true sol now then done.

subplot(1,2,2)
a = g(i,.5);
plot(i, a'-[0;u;0],'--')
title('error plot')
xlabel('x')
ylabel('y')
legend('error')

max_error = norm (a'-[0;u;0],inf)