function Uix_matrix = Uix(M,i,x,joint_variables)

% funkcija za naogjanje na dTi/dq 
% se koristi samo vo funkcijata lagrangianp

% kako agrumenti prima:
% M -> matriza vo koj se site transformacii od nultiot koordinaten sitem T01 T02 T03 ...
%  M matricata e matrica od matrici, poradi toa se povikuva kako M(:,:,i) za
%  itata matrica.
% i -> koja transformaciona matrica ni treba  T0i.
% x -> koja promenliva ni treba theta_i ili di.
% joint_variables -> lista od site promenlivi na zglobovite.
    syms dummy;
    temp_matrix = M(:,:,i);
    
    temp_matrix=subs(temp_matrix,joint_variables(1,x),dummy);
    
    for i=1:1:4;
        for j=1:1:4;
            temp_matrix(i,j)=diff(temp_matrix(i,j),dummy);
        end 
    end 
    temp_matrix = subs(temp_matrix,joint_variables(1,x),dummy);

    Uix_matrix=temp_matrix;

end     