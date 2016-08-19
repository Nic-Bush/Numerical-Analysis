function [ array ] = Newtonsmine( n, guess, TOL, maxiter, jacobi, F )
jacomatrix = zeros(n,n);
Funcmatrix = zeros(n,1);
array= zeros(n,maxiter);
E = zeros(1,maxiter);
rate = zeros(1,maxiter);
array(:,1)=guess;
k=1;
i = 1;
while (i<=n)
   %solve new jacobi 
  jacomatrix(1,i)= jacobi{1,i}(array(:,k)); 
  jacomatrix(2,i)= jacobi{2,i}(array(:,k));
  jacomatrix(3,i)= jacobi{3,i}(array(:,k));
   i = i+1;
end

i=1;
while(i<=n)
Funcmatrix(i) = F{i}(array(:,k));
i = i+1;
end
y = -jacomatrix\Funcmatrix;
array(:,k+1)=array(:,k)+y;



k=2;
E(k)=norm(y,inf);
while(E(k)>TOL)
i=1;
while (i<=n)
   %solve new jacobi 
  jacomatrix(1,i)= jacobi{1,i}(array(:,k)); 
  jacomatrix(2,i)= jacobi{2,i}(array(:,k));
  jacomatrix(3,i)= jacobi{3,i}(array(:,k));
   
   i = i+1;
end

i = 1;

while(i<=n)
    %solve for F
Funcmatrix(i) = F{i}(array(:,k));
i = i+1;
end

y = -jacomatrix\Funcmatrix;
array(:,k+1)=array(:,k)+y;


k=k+1;
E(k)=norm(y,inf);
rate(k) = E(k)/E(k-1);
end


e=k;
k=1;
%make from 1:k and change k var in this to diff var
while (k<=e)
fprintf('%2d \t %13.10f \t %13.10f  \t %13.10f \t %13.10f \t  %4.2f \n', k-1,array(1,k),array(2,k),array(3,k),E(k),rate(k))
k = k+1;
end
end

