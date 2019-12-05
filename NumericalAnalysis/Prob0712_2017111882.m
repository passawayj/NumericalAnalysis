function [x, y, fval] =  Prob0712_2017111882 (func,conr1l,conr1u,conr2l,conr2u,fminl,fminu )
% Prob0712_2017111882 : function to plotting contour, mesh, and use
% fminsearch.
%input : 
%   func : function
%   conr1 ,conr2: contour plot을 그릴 때 사용하는 범위 
%   meshr1,mesh2 : mesh plot을 그릴 때 사용하는 범위
%   fminl,fminu : fminsearch의 guesses
%output:
%
if nargin < 7, error('at least 7 input arguments required'), end

x = linspace(conr1l,conr1u,40); y = linspace(conr2l, conr2u,40);
[X, Y] = meshgrid(x,y);
Z = func(X,Y);
subplot(1,2,1);
cs = contour(X,Y,Z); clabel(cs);
xlabel('x'); ylabel('y');
title('(a) Contour plot'); grid;

subplot(1,2,2);
cs = surfc(X,Y,Z);
zmin = floor(min(Z));
zmax = ceil(max(Z));
xlabel('x'); ylabel('y'); zlabel('f(x,y)');
title ('(b) Mesh plot');
func = @(x) 1 / (1 + x(1)^2 + x(2)^2 + x(1) + x(1)*x(2));
[x, fval] = fminsearch(func,[fminl, fminu]);
%[x, fval] = fminsearch(func,[fminl, fminu]);
%[y, fval] = fminsearch(func, [fminl, fminu]);


