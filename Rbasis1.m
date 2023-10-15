 function Psi = Rbasis1(A)

     [R lead] = gj(A'); B = R';
     [toss, rank] = size(lead);
     Psi = B(:,1:rank);
