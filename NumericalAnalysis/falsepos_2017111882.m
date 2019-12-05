function[rt,fx,ea,iter] = falsepos_2017111882(func,xl, xu, es, maxit)
%falsepos_2017111882 : root lacation zeroes
%   [rt,fx,ea,iter] = falsepos_2017111882(func,xl,xu,es,maxit,varagin, p1,
%   p2 , ...): uses falsepos method to find the root of func
%input :
%   func = name of function
%   xl, xu = lower and upper guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%   p1, p2 ... = additional parameters used by func
%output:
%   rt = real root
%   fx = function value at root
%   ea = approximate relative error (%)
%   iter = number of iterations

if nargin < 3, error('at least 3 input arguments required'), end
test = func(xl) * func(xu);
if test > 0 , error('no sign change'), end
if nargin < 4 | isempty(es), es = 0.0001;end
if nargin < 5 | isempty(maxit), maxit = 50; end
iter = 0; xr = xl; ea = 100;

while(1)
    xrold = xr;
    xr = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu)) ;
    iter = iter + 1;
    
    if xr ~= 0, ea = abs((xr-xrold)/xr)*100 ; end
    
    test = func(xl) * func(xu);
    if test < 0
            xl = xr;
    elseif test > 0 
            xu = xr;
    else
            ea = 0;
    end
    
    if ea <= es | iter >= maxit, break, end
end
rt = xr; fx = func(xr);
  
