    function [Q, R] = hh(A)

       [m n] = size(A); r=0;
       Q=eye(m); R=A;
       for k=1:n 
           if (r==m) return; end
           Y = R(:,k); Z=Y;
           c=sqrt(Y(r+1:m)'*Y(r+1:m));
           if c>1.0E-9
                r=r+1;
                Z(r)=c;  
                Z(r+1:m) = zeros(m-r,1);
                P = flip(Y,Z);
                Q = Q*P'; R=P*R;
           end
       end