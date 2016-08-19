p= @(x) -2*x/(1+x^2);
q= @(x) 1;
r= @(x) 2/(1+x^2) - log(1+x^2);
p_q_r_equations={p,q,r};
N = 4;
BoundryCond = [0,log(2)];
endpoints = [0,1];
true_eq = @(x) log(1+x.^2);
FiniteDifferencesPartB( p_q_r_equations, N, BoundryCond, endpoints,true_eq);

fprintf('\n')
N = 8;

FiniteDifferencesPartB( p_q_r_equations, N, BoundryCond, endpoints,true_eq);

fprintf('\n')
N = 16;

FiniteDifferencesPartB( p_q_r_equations, N, BoundryCond, endpoints,true_eq);
fprintf('\n')