%im assuming that i need to take the integral for the x values, the y
%values, the x*y val, x^2 val, x^3 val and x^4 val in order to solve them
x0 = 2;
x1 = @(x) x;
x2 = @(x) x.^2;
x3 = @(x) x.^3;
x4 = @(x) x.^4;
x5 = @(x) x.^5;
x6 = @(x) x.^6;
yval = @(x) exp(x);% int(y val)
yvalx = @(x) exp(x).*x;
yvalxsq = @(x) exp(x).*(x.^2);
yvalxcu = @(x) exp(x).*(x.^3);
a1 = gaussleg(yval,17);%sum(y)
a2 = gaussleg(yvalx,17);%sum(x*y)
a3 = gaussleg(yvalxsq,17);%sum((x^2)*y)
a4 = gaussleg(yvalxcu,17);
b = gaussleg(x1,17);
c = gaussleg(x2,17);
d = gaussleg(x3,17);
e = gaussleg(x4,17);
f = gaussleg(x5,17);
g = gaussleg(x6,17);

A = [x0 b; b c];%degree 1
A1 = [a1; a2];
deg1 = A\A1
B = [x0 b c; b c d; c d e];%degree 2
B1 = [a1; a2; a3];
deg2 = B\B1
C = [x0 b c d; b c d e; c d e f; d e f g ];%degree 3
C1 = [a1; a2; a3; a4];
deg3 = C\C1

func1 = @(x) deg1(1) + deg1(2)*x 
func2 = @(x) deg2(1) + deg2(2)*x + deg2(3)*x.^2
func3 = @(x) deg3(1) + deg3(2)*x + deg3(3)*x.^2 + deg3(4)*x.^3
y = -1:.01:1;
figure
subplot(2,1,1)
plot (y, yval(y),y,func1(y),'--',y,func2(y), ':',y,func3(y),'-.' )
legend('exp(x)','P1(x)','P2(x)','P3(x)')
title('least squares aproximations foe exp(x)')
xlabel('x')
ylabel('y')

subplot(2,1,2)

plot(y,yval(y)-func1(y),'--',y,yval(y)-func2(y), ':',y,yval(y)-func3(y),'-.' )
legend('rem p1(x)','rem p2(x)','rem p3(x)')
xlabel('x')
ylabel('y')
 title('remainders of the least squares of order 1-3')