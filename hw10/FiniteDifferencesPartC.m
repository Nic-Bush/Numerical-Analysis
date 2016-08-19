function [ E ] = FiniteDifferencesPartC( p_q_r_equations, N, BoundryCond, endpoints,true_eq )
a = zeros(N,1);
b = zeros(N,1);
d = zeros(N,1);
c = zeros(N,1);
L = zeros(N,1);
u = zeros(N,1);
z = zeros(N,1);
w = zeros(N+2,1);
xvals = zeros(N+2,1);
g = 1:N+2;

h = (endpoints(2)-endpoints(1))/(N+1); %makes h given two endpoints
xvals(1) = endpoints(1);
xvals(N+2) = endpoints(2);
for i=2:N+1
   xvals(i) = endpoints(1) + (i-1)*h; 
    
end

x = endpoints(1) + h;


a(1) = 2 + (h^2)* (p_q_r_equations{2}(x));
b(1) = -1 + (h/2)* (p_q_r_equations{1}(x));
d(1) = (-h^2)*(p_q_r_equations{3}(x)) + (1 + (h/2)*(p_q_r_equations{1}(x)))*(BoundryCond(1));

for i=2:N-1
    x = endpoints(1)+i*h;
    a(i)=  2 + (h^2)* (p_q_r_equations{2}(x));
    b(i)= -1 + (h/2)* (p_q_r_equations{1}(x));
    c(i)= -1 - (h/2)* (p_q_r_equations{1}(x));
    d(i)= -(h^2)*(p_q_r_equations{3}(x));
end

x = endpoints(2) - h;
a(N) = 2 + (h^2)* (p_q_r_equations{2}(x));
c(N)= -1 - (h/2)* (p_q_r_equations{1}(x));
d(N) = -(h^2)*(p_q_r_equations{3}(x)) + (1 - (h/2)*(p_q_r_equations{1}(x)))*(BoundryCond(2));

L(1)= a(1);
u(1)= b(1)/a(1);
z(1)= d(1)/L(1);

for i=2:N 
    L(i)= a(i) - c(i)*u(i-1);
    u(i)= b(i)/L(i);
    z(i)= (d(i) - c(i)*z(i-1))/L(i);
end
L(N)= a(N) - c(N)*u(N-1);
z(N)= (d(N)-c(N)*z(N-1))/L(N);

w(1) = BoundryCond(1);
w(N+2) = BoundryCond(2);
w(N+1) = z(N);

for i = N-1:-1:1
   w(i+1)= z(i)-u(i)*w(i+2); 
end


E = norm ((w(g)-true_eq(xvals)),inf);

end

