function A = corrp(A)
% funkcija za korekcija na nulite kaj D-H model na robotska raka 
% se vkluchuvaat site transformacioni matrici kaj koj nema simbolicna
% promenlina 
%
% PR: trotz(thera)*corrp(transl(0,0,3)*trotx(90,'deg'))
%      delot trotx(90,'deg')<--- e ona shto go pravi problemot so nulite 
A(A<1.e-3 & A>-1.e-3)=0;

end 