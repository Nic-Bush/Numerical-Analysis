clc;
clear all;
alpha = 1;%defined by the problem in this case there is only d^2u/dx^2 so 1
endpoint = 1;%defined by problem in this case 1 b.c interval is [0,1]
g = 6
m = 2^g;
h = 1/(2^g);
k = h^2/2;
Time = .5; % given in problem
lambda = (alpha^2)*k/(h^2);
g = @(x,t) exp(-(pi^2)*t)*sin(pi*x);
f = @(x) sin(pi*x);
i = (1/m):h:((m-1)/m);
w = zeros(floor(1/h),1);
for j = 1:m-1
w(j) = f(i(j));%no zeroth element in matlab
end
l(1) = 1 + 2*lambda;
u(1) = -lambda/l(1);

for i = 2:m-2
    l(i) = 1+2*lambda + lambda*u(i-1);
    u(i) = - lambda/l(i);
end 

l(m-1) = 1 + 2* lambda + lambda * u(m-2);

for j =1:(Time/k) 
t = j*k;
z(1) = w(1)/l(1);
for i = 2:m-1
   z(i) = ((w(i) + lambda*z(i-1))/l(i));
end
   w(m-1) = z(m-1);
   for i = m-2 :-1: 1
       w(i)= z(i) - u(i)*w(i+1);
   
   
   end
end
subplot(1,2,1)
i = 0:h:1;
plot(i, [0;w],'--')
hold on;
plot(i,g(i,.5) )
title('backwards method m=64')
xlabel('x')
ylabel('y')
legend('aproximate', 'real')

subplot(1,2,2)
a = g(i,.5);
plot(i, a'-[0;w],'--')
title('error plot')
xlabel('x')
ylabel('y')
legend('error')

max_error = norm (a'-[0;w],inf)