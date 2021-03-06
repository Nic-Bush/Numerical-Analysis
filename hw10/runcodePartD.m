p= @(x) -2*x/(1+x^2);
q= @(x) 1;
r= @(x) 2/(1+x^2) - log(1+x^2);
p_q_r_equations={p,q,r};
BoundryCond = [0,log(2)];
endpoints = [0,1];
true_eq = @(x) log(1+x.^2);
E = zeros(7,1);
R = zeros(7,1);
for i = 1:7
   N= 2^i; 
   E(i)=FiniteDifferencesPartC( p_q_r_equations, N, BoundryCond, endpoints,true_eq); 
end
i= 1:7;
log_graph = figure;
figure(log_graph)
plot(i,log(E),'--')
legend('error')
title('log log graph')
xlabel('x axis')
ylabel('y axis')
log(E(7))-log(E(6))