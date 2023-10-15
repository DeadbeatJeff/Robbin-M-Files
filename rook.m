    function [L, D, U] = rook(A)

    [m n] = size(A);  
    R=A; L=eye(m);                   % A = L*R
    tol=1.0E-9;   tol2=tol*tol;

    for q = 1:n  %    loop on columns
        for p=1:m
           c =R(p,q); H=R(p, 1:q-1); 
           leading = (H*H'<tol2 & abs(c)>tol);
           if (leading)  break; end
        end 
        if (leading)
             R(p,:) = R(p,:)/c;      % scale 
             L(:,p)=L(:,p)*c; 
             for i=p+1:m             % shear
                  c = R(i,q);
                  R(i,:) = R(i,:) - c*R(p,:);
                  L(:,p) = L(:,p) + c*L(:,i);
             end
        end
    end

    D = R; U=eye(n);                % R=D*U^(-1)
    if nargin == 2, return; end
    for p=1:m  %  loop on rows
        q=1;
        while (D(p,q) < tol & q<n) q=q+1; end
        for j=q+1:n                 % shear
            c=D(p,j);
            D(:,j) = D(:,j) - c*D(:,q);
            U(:,j) = U(:,j) - c*U(:,q);
        end
    end