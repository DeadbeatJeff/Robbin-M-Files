   function A = intinv(n)

       U = eye(n);  L = eye(n);
       for i = 1:n
          for j = i+1:n
               U(i,j) = 3-round(6*rand(1,1));
               L(j,i) = 3-round(6*rand(1,1));
         end
       end
       A = U*L;  