P0 = @(x) 1;
P1 = @(x) x;
P2 = @(x) ((((4+1)/3)*x.^2)-((2/3)*1));
P3 = @(x) (7/4)*x.*P2(x)-(3/4)*x;
y = -1:.01:1;
plot (y,P1(y),'--',y,P2(y), ':',y,P3(y),'-.' )
legend('P1(x)','P2(x)','P3(x)')
title('Legendre polynomial aproximation')
xlabel('x')
ylabel('y')