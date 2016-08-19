function [ output_args ] = PoissonEq( end_points, func, numberofpts, g  )
x = zeros(numberofpts(1),1);
y = zeros(numberofpts(2),1);
h = (end_points(2)-end_points(1))/numberofpts(1);
k = (end_points(4)-end_points(3))/numberofpts(2);
w = zeros(numberofpts(1),numberofpts(2));

for i = 1:numberofpts(1)-1
    x(i)= end_points(1)+ i*h;
    
end

for i = 1: numberofpts(2)-1
    end_points(3) + i*k;
    
end

lambda =  (h^2)/(k^2);
mu = 2*(1 + lambda);
l=1;

while l<=numberofpts(1)%runs a gauss seidgel method.

    z = (-(h^2)*func(x(1),y(numberofpts(2)-1))+g(end_points(1),y(numberofpts(2)-1))+lambda*(g(x(1),end_points(4)) + lambda*(w(1,numberofpts(2)-1))))/mu;
    
    
    
    
    
    
end

end

