  function Phi = Nbasis3(A)

    [m,n] = size(A); Phi = zeros(n,0);
    while (1) % infinite loop
       X = randsoln(A);
       if sum(abs(randsoln([Phi X])))> 0 
           return;
       else
           Phi=[Phi,X];
       end
    end