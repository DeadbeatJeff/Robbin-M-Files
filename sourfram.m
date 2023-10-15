      function p=sourfram(A)

         n = max(size(A));
         p = zeros(1,n);
         B = eye(n);
         for k = 1:n
                p(k) = -sum(diag(A*B))/k;
                B = A*B+p(k)*eye(n);
         end 