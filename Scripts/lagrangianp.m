function L = lagrangianp(M,joint_variables,Inertial_matrixes,gv,masses,r)
% funkcija za iznaogjanje na lagranzianot na edna robotska raka od
% nejzinite transformacioni matrici od D-H modelot na rakata

% kako agrumenti prima:
%  M -> matriza vo koj se site transformacii od nultiot koordinaten sitem T01 T02 T03 ...
%      M matricata e matrica od matrici poradi toa se povikuva kako M(:,:,i) za
%      itata matrica.

% joint_variables -> lista od site promenlivi na zglobovite.

% Inertial_matrixes -> inerciski matrici za sekoj zglob posebno, Inertial_matrixes
%                      matricata e matrica od matrici, poradi toa se povikuva 
%                      kako Inertial_matrixes(:,:,i) za
%                      itata matrica.

% gv -> gravitaciski vektor se opredeluva od prviot koordinaten sistem.

% masses -> lista od masite za sekoj krak posebno.

% r -> ako masata ne e rasporedena vo tochka ova e vektor koj kazhuva kolku
%      da se vratime od i-tiot koordinaten sistem so cel da stigneme do centarot
%      na masa.

%  Karakteristichni oblici na nekoi vektori: 
%         g =[gx ;gy; gz; 0]  -> Vnimavaj koloni se !.
%         r=[rx ;ry; rz ;1]   -> Vnimavaj koloni se !.

% Vo sluchaj ako zaglavish so dokumentacijava bi trebala da ima edna
% skripta vo koja imam resheno nekoj zadacha so pomosh na ovaa funcija i so
% pomosh na funkcijata rforces koja ke bide postavena na GitHub ili pratena
% zaedno so ovaa skripta.

%Ne se plashi ako pochekash ovaa skripta da se izvrshi, 3 for ciklusi treba
% da se izminat i da se izdiferenciraat mnogu matrici isto so pomosh na 2
% for ciklusa vo funcijata Uix koja se koristi vo ovaa skripta 

K = 0;
for i=1:1:length(joint_variables);
    for p=1:1:i;
        for s=1:1:i;
            K=K+(1/2)*trace(Uix(M,i,p,joint_variables)*Inertial_matrixes(:,:,i)*transpose(Uix(M,i,s,joint_variables)))*diff(joint_variables(p))*diff(joint_variables(s));
        end 
    end 
end 

P = 0;

for i=1:1:length(joint_variables);
    P=P+(masses(i)*transpose(gv)*M(:,:,i)*r(:,:,i));
end 
    L=K-P;

end 