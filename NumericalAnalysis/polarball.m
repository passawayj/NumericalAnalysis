fuction [eval, evect, ea, iter] = eigPowerDeflation_2017111882(A,es,maxit)
%Power method for largest eigenvalue
%input:
%es = desired relative error (default = 0.0001%)
%maxit = maximum allwable iterations (default = 100)
%output : 
%eval = largest eigenvalue 
%evect = largest eigenvector
%ea = approximate relative error (%)
%iter = number of iterations

if nargin < 1, error('at least 1 input argument required'), end
if nargin <2 | isempty(es), es = 0.0001 ; end
if nargin<3 | isempty(maxit), maxit = 50 ; end

format short g
n = length(A);
vect = ones(n,1);
val = 0; iter = 0; ea = 100;
while(1)
    valold = val;
    vect = A*vect;
    val = max(abs(vect));
    vect = vect - val *vect
    wvect = vect./norm(vect,inf)
    vect = vect./(val*wvect * wvect');
    iter = iter+1;
    if val~=0, ea = abs((val-valoid)/val)*100 ; end
    if ea <=es | iter>=maxit, break, end
end
eval = val ; evect = vect;
end