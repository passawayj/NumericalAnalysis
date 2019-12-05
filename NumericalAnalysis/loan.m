function A = loan(n)
%loan : 갚아야하는 대출값을 계산하는 함수이다.
%input :
%   n = 연체달 수 
%output : 
%   A = 총 갚아야하는 대출값
P = 100000;
i = 0.033;
A = P * (i*((1+i).^n))/((1+i).^n-1);