p= @(x) -2/x;
q= @(x) 2/(x^2);
r= @(x) sin(log(x))/(x^2);
p_q_r_equations={p,q,r};
N = 9;
BoundryCond = [1,2];
endpoints = [1,2];
FiniteDifferences( p_q_r_equations, N, BoundryCond, endpoints);