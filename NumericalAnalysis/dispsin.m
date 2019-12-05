function dispsin(x) 
%dispsin은 사인함수의 각 텀마다의 결과를 단계적으로 보여준다
%input:
%   x : sin(x)에 들어갈 인수값
for i = 1 : 1: 8
    fprintf("sinx = ");
    x = x + ((-1)^(i-1))*(x^(2*i-1))/factorial(2*i-1);
    fprintf('%f \n', x);
end
    