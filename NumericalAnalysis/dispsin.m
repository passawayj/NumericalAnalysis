function dispsin(x) 
%dispsin�� �����Լ��� �� �Ҹ����� ����� �ܰ������� �����ش�
%input:
%   x : sin(x)�� �� �μ���
for i = 1 : 1: 8
    fprintf("sinx = ");
    x = x + ((-1)^(i-1))*(x^(2*i-1))/factorial(2*i-1);
    fprintf('%f \n', x);
end
    