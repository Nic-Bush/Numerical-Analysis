function [ array ] = fixedpoint( func,guess,Tol,maxitter )
array= zeros(3,maxitter);
E = zeros(1,maxitter);
rate = zeros(1,maxitter);
array(:,1)=guess;
array(1,2)=func{1}(array(:,1));
array(2,2)=func{2}(array(:,1));
array(3,2)=func{3}(array(:,1));
k=2;
E(k)= norm(array(:,k)-array(:,k-1),inf);
while (E(k)>Tol)
k=k+1;
if(k>maxitter)
    fprintf('failed to converge')
    return;
end
array(1,k)=func{1}(array(:,k-1));
array(2,k)=func{2}(array(:,k-1));
array(3,k)=func{3}(array(:,k-1));
E(k)=norm(array(:,k)-array(:,k-1),inf);
rate(k) = E(k)/E(k-1);
end
e=k;
k=1;
%make from 1:k and change k var in this to diff var
while (k<=e)
fprintf('%2d %9.6f %9.6f %9.6f %13.6f %4.2f \n', k-1,array(1,k),array(2,k),array(3,k),E(k),rate(k))
k = k+1;
end
%first two itterations of print give rate as zero and first itteration
%gives error as zero
