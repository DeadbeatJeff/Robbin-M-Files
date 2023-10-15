    function d = detm(A)
	          % invariant relation d*det(A) = constant
    [m n] = size(A);  d=1; 
    for k=1:n 
       [y,h] = max(abs(A(k:m, k))); h=k-1+h; 
       if  y < 1.0E-9  % (i.e if y == 0)  
           d=0; return
       else
           if (k~=h)
              A([k h],:) = A([h k],:); % swap
              d=-d; 
           end
           c = A(k,k);
           A(k,:) = A(k,:)/c;         % scale    
           d=c*d; 
           for i =  k+1:m             % shear
              A(i,:) = A(i,:) - A(i,k)*A(k,:); 
           end
      end % if
   end  % for