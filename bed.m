   function [Q, D, P] = bed(A)

    [m n] = size(A);  r = 0;   
    D = A; Q = eye(m); P = eye(n);         
    % Invariant relation:   A = Q*D*P^(-1)
    while (r<m & r<n) 
      y = 1.0E-9; 
       for i=r+1:m for j=r+1:n
           if (abs(D(i,j)) >  y) 
                y = abs(D(i,j)); h=i; k=j;
           end
       end;  end
       if  y == 1.0E-9;  return; else r=r+1; end
       E = swap(eye(m),r,h);               % swap rows
       D = E*D;  Q = Q*E^(-1);
       F = swap(eye(n),r,k);               % swap cols
       D = D*F; P = P*F;       
       E = scale(eye(m),r,1/D(r,r));       % scale row
       D = E*D; Q = Q*E^(-1);       
       for i = r+1:m                    
          E = shear(eye(m), i, r,-D(i,r)); % shear rows
          D = E*D; Q = Q*E^(-1);
       end
       for j = r+1:n                    
          F = shear(eye(n),r,j, -D(r,j));  % shear cols
          D = D*F;  P = P*F;
       end
    end  % while 