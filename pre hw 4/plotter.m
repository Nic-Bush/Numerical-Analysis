z = -1:.05:1;
a =  polycheb(0);

b =  polycheb(1);

c =  polycheb(2);


d =  polycheb(3);

e =  polycheb(4);


f = polycheb(5);
figure
subplot(1,1,1)
plot (z,a(z),z,b(z),'--',z,c(z), ':',z,d(z),'-.',z,e(z),'-', z,f(z),'--' )
legend('C0','C1','C2','C3', 'C4', 'C5', 'c6')
title('Chebyshev polynomials and degrees')
xlabel('x')
ylabel('y')
