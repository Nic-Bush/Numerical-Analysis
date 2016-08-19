clear; clc;
k = 6;
N = 2^k;
h = 1/(2^k);
x = (0:h:1);
y = x;

f = @(x,y) 2.*pi.^2.*(cos(2*pi.*x).*(cos(pi.*y)).^2 +...
    (cos(pi.*x)).^2.*cos(2.*pi.*y));
g = @(x,y) cos(pi*x).^2 .*cos(pi*y).^2; 

[X,Y] = meshgrid(x,y); 
XX = X(2:end-1, 2:end-1); 
YY = Y(2:end-1,2:end-1);

B = h^2*f(XX,YY);
        
B(:, 1)   = B(:, 1)      + g(X(2:end-1,1),Y(2:end-1,1));         % BOTTOM
B(1,:)    = B(1,:)       + g(X(1,2:end-1),Y(1,2:end-1));         % LEFT
B(end,:)= B(end,:)   + g(X(end,2:end-1),Y(end,2:end-1)); % RIGHT
B(:,end)= B(:,end)   + g(X(2:end-1,end),Y(2:end-1,end));  % TOP
 
b = B(:);


d = 4*ones((N-1).^2,1);
A = diag(d,0);


D = ones(N-1,N-1);
D(N-1,:) = 0;
u1 = D(:);
u1 = -1.*u1;
u2 = -1.*ones((N-1).^2 - (N-1),1);

Q = diag(u1(1:end-1),1) + diag(d,0) + diag(u1(1:end-1),-1) + diag(u2,N-1) + ...
    diag(u2,-(N-1));
w = Q\b;

U = zeros(N+1,N+1);
W = reshape(w,N-1,N-1);

U(2:end-1,2:end-1) = W;
U(1,:)= g(0,y);
U(end,:) = g(h*N,y);
U(:,end) =  g(x,h*N);
U(:,1) =  g(x,0);
u = U(:);



Actual = figure;
I = g(X,Y);
E = I-U;
mesh(X,Y,I);
str = sprintf('Actual plot N = %d',N);
title(str)
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')

Aprox = figure;
mesh(X,Y,U);
str = sprintf('Aproximation plot N = %d',N);
title(str);
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')

Error = figure;
mesh(X,Y,E);
str = sprintf('error plot N = %d',N);
title(str)
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
N
e = E(:);
norm(e,inf)