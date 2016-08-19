f = @(x) exp(x);
c = linspace(-pi,pi,31);

n = 1;
a = calc_var_a(f,n);
b = calc_var_b(f,n);
s = calc_s(a,b,n);
error = figure
compare = figure

figure(compare)
subplot(2,2,1)
plot (c,f(c),c,s(c),'--' )
legend('original','Least Squares')
title('Least Squares aproximation 1 vs. origional')
xlabel('x')
ylabel('y')

figure(error)

subplot(2,2,1)
plot (c,f(c)- s(c),'--' )
legend('error')
title('Least Squares error deg 1')
xlabel('x')
ylabel('y')

figure(compare)

n = 2;
a = calc_var_a(f,n);
b = calc_var_b(f,n);
s = calc_s(a,b,n);

subplot(2,2,2)
plot (c,f(c),c,s(c),'--' )
legend('original','Least Squares')
title('Least Squares aproximation 2 vs. origional')
xlabel('x')
ylabel('y')

figure(error)

subplot(2,2,2)
plot (c,f(c)- s(c),'--' )
legend('error')
title('Least Squares error deg 2')
xlabel('x')
ylabel('y')

figure(compare)

n = 3;
a = calc_var_a(f,n);
b = calc_var_b(f,n);
s = calc_s(a,b,n);

subplot(2,2,3)
plot (c,f(c),c,s(c),'--' )
legend('original','Least Squares')
title('Least Squares aproximation 3 vs. origional')
xlabel('x')
ylabel('y')


figure(error)

subplot(2,2,3)
plot (c,f(c)- s(c),'--' )
legend('error')
title('Least Squares error deg 3')
xlabel('x')
ylabel('y')