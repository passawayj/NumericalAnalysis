function [root,ea,iter] = secant_2017111882(func,x1,x2,es,maxit)
%secant : newton-raphson의 접선의 기울기 구하는 걸 근사화시켜서 root location zeroes
% [root,ea,iter]=secant_2017111882(func, xr, es, maxit):
%   uses secant method to find the root of func
%input:
%   func = name of function
%   x1,x2 = initial guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%output:
%   root = real root
%   ea = approximate relative error(%)
%   iter = number of iterations

if nargin<3, error('at least 3 input arguments required'), end
if nargin<4|isempty(es), es = 0.0001;end
if nargin<5|isempty(maxit), maxit = 50;end
iter = 0; 
while(1)
    xold = x1;
    x1 = xold - ((func(xold) * (x2 - xold)) / (func(x2) - func(xold)));
    iter = iter + 1;
    if x2 ~= 0, ea = abs((x2 - x1) / x1) * 100 ; end
    if ea <= es | iter >= maxit, break, end
end
root = x2;