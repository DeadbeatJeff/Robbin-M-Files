 function B = scale(A,p,c)
  
  B = A; B(p,:) = c*A(p,:);
