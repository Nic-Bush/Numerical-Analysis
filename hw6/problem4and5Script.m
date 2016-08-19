n = 10;
A = [9 1; 1 2];
q = [1;1]; 
v = [1.0; 0.140055]; 
powerseries(n,A,q,v);

%extra credit
n = 1375;
A = [.99 0; 0 1];
q = [1; 1];
v = [0; 1];
powerseries(n,A,q,v);
