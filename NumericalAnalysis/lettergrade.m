function grade = lettergrade(score)
%grade�� score�� �Է��ϸ� ��������� ��ȯ�ϴ� �Լ��̴�.
%input : 
%   score : ����
%output:
%   grade : ���ڷε� �������
%����ڰ� score�� 0���� �۰ų� 100���� ũ�� �Է����� �� �����޽����� ����Ʈ�ϰ� 
%���α׷��� �ߴܽ�Ų��.
score = floor(score);
if score>100  
    error('������ 0���� 100���̷� �Է����ּ���.');
elseif score<0
        error('������ 0���� 100���̷� �Է����ּ���.');
elseif 90<=score
        disp('A');
elseif 80<=score
            disp('B');
elseif 70<=score
                disp('C');
elseif 60<=score
                    disp('D');
                  else
                    disp('F');
                
                  end
end