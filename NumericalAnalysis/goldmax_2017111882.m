function [x, fx, ea, iter] = goldmax_2017111882(f, xl, xu, es, maxit)
%goldmax : maximazation golden section search
%   [x,fx,ea,iter] = goldmin(f, xl, xu, es, maxit,):
%       uses golden section search to find the maximum of f
%input:
%   f = name of function
%   xl, xu = lower and upper guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%output:
%   x = location of munumym
%   fx = maximum function value
%   ea = approximate relative error (%)
%   iter = number of iterations

if nargin<3, error('at least 3 input arguments required'), end
if nargin<4|isempty(es), es = 0.0001;end
if nargin<5|isempty(maxit), maxit = 50;end
phi = (1 + sqrt(5)) / 2;
iter = 0;
while(1)
        d = (phi-1) * (xu-xl);
        x1 = xl + d;
        x2 = xu - d;
        if f(x1) < f(x2)
            xopt = x2;
            xu = x1;
        else
            xopt = x1;
            xu = x2;
        end
        iter = iter + 1;
        if xopt ~= 0, ea = (2 - phi) * abs((xu-xl) / xopt) * 100;end
        if ea <= es | iter >= maxit, break, end
end
x = xopt; fx = f(xopt);