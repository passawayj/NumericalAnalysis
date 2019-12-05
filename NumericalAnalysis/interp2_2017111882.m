function zint = interp2_2017111882(x,y,z,xx,yy)
%interp2_2017111882 : lagrange를 사용하여 intermediate값을 알려주는 것
%input : 
%   x : independent variable
%   y : independent variable
%   z : dependent variable
%   xx : value of x at which the interpolation is calculated
%   yy : value of y at which the interpolation is calculated
%
%output:
%   zint : interpolated value of depent variable

n = length(x);
if length(y) ~= n, error('x and y must be same length'); end
s = 0; product = 1;

for i = 1:n
    for j = 1:n
     product_j = z(i,j);
        for k = 1:n
         if j ~= k
             product_j = product_j * (xx-x(k))/(x(j)-x(k));
         end
        end
     product = product + product_j;
     if i ~= j
            product = product * (yy-y(j)) / (x(i)-x(j));
     end
    end
    s = s + product;
end
zint = s;
    
end