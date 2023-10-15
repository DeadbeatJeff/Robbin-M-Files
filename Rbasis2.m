 function Psi = Rbasis2(A)

     [m, n] = size(A);
     [P D Q] = bed(A);
     r = round(sum(sum(D)));
     if abs(r) < 0.5,  return, end
     Psi = P * [eye(r); zeros(m-r,r)];
