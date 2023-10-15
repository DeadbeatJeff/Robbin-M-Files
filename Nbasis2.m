  function Phi = Nbasis2(A)

     [m, n] = size(A);
     [Q D P] = bed(A);
     r = round(sum(sum(D)));
     if abs(n-r) < 0.5,  return, end
     Phi = P * [zeros(r,n-r); eye(n-r)];
