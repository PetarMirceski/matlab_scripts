function Uix_matrix = Uix(M,i,x,joint_variables)
    syms dummy
    temp_matrix = M(:,:,i)
    
    temp_matrix=subs(temp_matrix,joint_variables(1,x),dummy)
    
    for i=1:1:4
        for j=1:1:4
            temp_matrix(i,j)=diff(temp_matrix(i,j),dummy)
            
            
        end 
    end 
    temp_matrix = subs(temp_matrix,joint_variables(1,x),dummy)

    Uix_matrix=temp_matrix

end     