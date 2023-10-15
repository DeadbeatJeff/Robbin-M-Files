  function Psi = Rbasis3(A)

     [R, lead] = gj(A);
     Psi = A(:,lead);
