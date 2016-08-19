alpha = 1;%defined by the problem in this case there is only d^2u/dx^2 so 1
endpoint = 1;%defined by problem in this case 1 b.c interval is [0,1]
m = 10;
h = .1;
k = .01;
Time = .5; % given in problem
lambda = (alpha^2)*k/(h^2);
g = @(x,t) exp(-(pi^2)*t)*sin(pi*x);
f = @(x) sin(pi*x);
i = (1/m):h:((m-1)/m);
w = zeros(floor(1/h), floor(Time/k)+1);
for j = 1:m-1
w(j,1) = f(i(j));%no zeroth element in matlab
end
l(1) = 1 + 2*lambda;
u(1) = -lambda/l(1);

for i = 2:m-2
    l(i) = 1+2*lambda + lambda*u(i-1);
    u(i) = - lambda/l(i);
end 

l(m-1) = 1 + 2* lambda + lambda * u(m-2);

for j =2:(Time/k)+1 
t = j*k;
z(1) = w(1,j-1)/l(1);
for i = 2:m-1
   z(i) = ((w(i,j-1) + lambda*z(i-1))/l(i));
end
   w(m-1,j) = z(m-1);
   for i = m-2 :-1: 1
       w(i,j)= z(i) - u(i)*w(i+1,j);
   
   
   end
end
for i = 1:m-1
   fprintf('value %8.6f \n',w(i,floor(Time/k)+1)) 
    
end