function Phi = Nbasis1(A)

     [m, n] = size(A);
     [R, lead, free] = gj(A);
     [toss, rank] = size(lead);
     [toss, nullity] = size(free);
     Phi = zeros(n,nullity);
     if nullity==0 return; end % for PC Matlab
     Phi(free,:) = eye(nullity);
     Phi(lead,:) = -R(1:rank,free);
