    function [M, R] = gjm(A)

       [m,n] = size(A);
       RaM = gj([A eye(m)]);
       R = RaM(:,1:n);
       M = RaM(:,n+1:n+m); 