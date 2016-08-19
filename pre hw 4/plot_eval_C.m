b = @(x) (1./(1+25.*(x.^2)));
c =eval_C(b, 2);
d =eval_C(b, 4);
e =eval_C(b, 6);
f =eval_C(b, 8);
a = -1:.05:1;

figure
subplot(2,1,1)
plot(a,b(a),a,c(a),'--',a,d(a), ':',a,e(a),'-.', a, f(a),'-')
legend('Actual val','P0','P1','P2','P3')
title('Eval c command')
xlabel('x')
ylabel('y')

subplot(2,1,2)
plot(a,(c(a)-b(a)),a,d(a)-b(a),'--',a,e(a)-b(a), ':',a,f(a)-b(a),'-.')
legend('P0','P1','P2','P3')
title('error evalc')
xlabel('x')
ylabel('y')
