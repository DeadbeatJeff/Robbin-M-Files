  function B = shear(A,p,q,c)
  
  B = A; B(p,:) =A(p,:) + c*A(q,:);
