    function B = adj(A)
      
      [m n] = size(A); B = zeros(n,n); si = 1;
      for i = 1:n
          si = -si;  sj = si;
          for j = 1:n
             sj = -sj;
             rows  = [1:i-1,i+1:n];
             cols  = [1:j-1,j+1:n];
             B(j,i) = sj*det(A(rows,cols));
           end % for j
      end % for i 