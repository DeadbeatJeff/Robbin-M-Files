 function Psi = Rbasis4(A)
  
  Psi = A; [m k]=size(Psi);
  while k>0 % or until return
        X=randsoln(Psi);
        [b j] = max(abs(X'));
        if b==0 return; end
        Psi = Psi(:, [1:j-1,j+1:k]);
        k = k-1;
  end