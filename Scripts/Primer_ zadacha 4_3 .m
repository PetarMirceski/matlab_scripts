% Primer zadacha 4.3 vo koja se koristat: corrp lagrangianp i rforces skriptite 

syms d1(t); % <- Vnimavaj mora vaka da se definiraat promenlivite na zglobovite
syms d2(t); % <- Vnimavaj mora vaka da se definiraat promenlivite na zglobovite
syms m1;
syms m2;
syms g ;

T01=transl(0,0,d1(t))*corrp(trotx(90,'deg'));
T12=transl(0,0,d2(t));

M=[T01];
M(:,:,2)=T01*T12;    %<- matrica od matrici 

joint_variables=[d1(t),d2(t)];

Inertial_matrixes=[0 0 0 0 ; 0 0 0 0; 0 0 0 0; 0 0 0 m1];
Inertial_matrixes(:,:,2)=[0 0 0 0 ; 0 0 0 0; 0 0 0 0; 0 0 0 m2]; % <- matrica od matrici

gv=[0;0;g;0];

masses=[m1,m2];

r=[0;0;0;1];
r(:,:,2)=[0;0;0;1]; % <- matrica od matrici

L=lagrangianp(M,joint_variables,Inertial_matrixes,gv,masses,r)

pretty(L) 

f1=rforces(L,d1(t))  
f2=rforces(L,d2(t))

pretty(f1)
pretty(f2)






