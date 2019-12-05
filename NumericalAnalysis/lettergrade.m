function grade = lettergrade(score)
%grade는 score를 입력하면 성적등급을 반환하는 함수이다.
%input : 
%   score : 점수
%output:
%   grade : 문자로된 성적등급
%사용자가 score를 0보다 작거나 100보다 크게 입력했을 시 에러메시지를 프린트하고 
%프로그램을 중단시킨다.
score = floor(score);
if score>100  
    error('점수를 0에서 100사이로 입력해주세요.');
elseif score<0
        error('점수를 0에서 100사이로 입력해주세요.');
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