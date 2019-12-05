function [root,ea,iter] = modsecant_2017111882(func,xr,es,maxit)  
%secant : newton-raphson�� ������ ���� ���ϴ� �� �ٻ�ȭ���Ѽ� root location zeroes + �̴ϼ�
%           �ϳ��� ����
% [root,ea,iter]=modsecant_2017111882(func, xr, es, maxit):
%   uses secant method to find the root of func
%input:
%   func = name of function
%   xr = initial guess
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%output:
%   root = real root
%   ea = approximate relative error(%)
%   iter = number of iterations

if nargin<2, error('at least 3 input arguments required'), end
if nargin<3|isempty(es), es = 0.0001;end
if nargin<4|isempty(maxit), maxit = 50;end
iter = 0; deltax = xr * 10^-6;
while(1)
    xrold = xr;
    xr = xrold - ( (deltax * func(xrold)) / (func(xrold + deltax) - func(xrold)) );
    iter = iter + 1;
    if xr ~= 0, ea = abs((xr - xrold) / xr) * 100 ; end
    if ea <= es | iter >= maxit, break, end
end
root = xr;