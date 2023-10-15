 function [Phi, T] = gs(Psi)

     [n, nu] = size(Psi); 
     Phi=zeros(n,nu); T=zeros(nu,nu);
     for k=1:nu
        V = Psi(:,k);
        Z = Phi'*V;
        W = V -  Phi*Z;
        c = sqrt(W'*W);
        if c<1.0E-9
            disp('dependent columns')
            return
        else
            T(:, k) = Z;
            T(k,k) = c;
            Phi(:,k) =  W/c;
        end
     end
