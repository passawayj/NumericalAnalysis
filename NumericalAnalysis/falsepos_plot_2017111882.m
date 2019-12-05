function[rt,fx,ea,iter, plotting] = falsepos_plot_2017111882(func,xl, xu, es, maxit, plotting)
%falsepos_plot_2017111882 : root lacation zeroes , added plot funtion.
%   [rt,fx,ea,iter,plotting] = falsepos_2017111882(func,xl,xu,es,maxit,varagin,...
%  ...  plotting): uses falsepos method to find the root of func.
%
%input :
%   func = name of function
%   xl, xu = lower and upper guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%   plotting : plotting is the string "on", the function plots the curve
%                as a black line and the root as a red spot in a figure
%              window.  If the input ¡°plotting¡± has the string ¡°off¡±
%                or the empty, the function works as the above function 
%                before being modified. 

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
if nargin < 6 | isempty(plotting), plotting = 'on'; end
iter = 0; xr = xl; ea = 100; plotx = xl; ploty = xu;
plotting_def = 'on';

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
    
    if ea <= es | iter >= maxit,    break;   end
end
rt = xr; fx = func(xr);
plotc = @(cd)rt;

       if(strcmp(plotting_def, plotting) == 1)
           fplot(func, [plotx ploty], 'k'); hold on; plot(rt, func(rt),'or');
       else
            fplot(func, [plotx ploty], 'k');
       end