b = @(x) (1./(1+25.*(x.^2)));
a = linspace (-1,1,3);
c = polyfit(a,b(a),2);
g = linspace (-1,1,5);
d = polyfit(g,b(g),4);
h = linspace (-1,1,7);
e = polyfit(h,b(h),6);
i = linspace (-1,1,9);
f = polyfit(i,b(i),8);
xval = -1:1:.05;
figure
subplot(2,1,1)
plot(a,(polyval(c,a)),g,polyval(d,g),'--',h,polyval(e,h), ':',i,polyval(f,i),'-.', xval, b(xval),'-')
legend('P0','P1','P2','P3', 'Actual val')
title('poly fit command')
xlabel('x')
ylabel('y')

subplot(2,1,2)
plot(a,(polyval(c,a)-b(a)),g,polyval(d,g)-b(g),'--',h,polyval(e,h)-b(h), ':',i,polyval(f,i)-b(i),'-.')
legend('P0','P1','P2','P3')
title('error poly fit')
xlabel('x')
ylabel('y')
