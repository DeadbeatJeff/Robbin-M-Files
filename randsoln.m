    function X = randsoln(A, Y)

    [m, n] = size(A);
    X = zeros(n,1);             % change if possible 
    if nargin == 1              % homgeneous case 
        Phi  =  Nbasis1(A);
        [toss, nullity] = size(Phi);
        if nullity>0
             X = Phi*rand(nullity,1);
        end 
    elseif nargin == 2          % inhomogeneous case
        W = randsoln([A -Y]);   % recursive call
        if abs(W(n+1)) > 1.0E-9
             X = W(1:n)/W(n+1); % normalize
        end
    end 