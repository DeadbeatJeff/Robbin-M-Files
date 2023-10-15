  function B = swap(A,p,q)
  
  B = A; B([p q],:) = A([q p],:);
