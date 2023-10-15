      function [P, R] = schurtri(A)
      
      [n, n]=size(A);  
      P=eye(n); R=A;      % A=P*R*R^(-1)
      for k=0:n-2
           B=R(k+1:n,k+1:n); 
           lambda = max(eig(B));
           X = randsoln(lambda*eye(n-k)-B);
           c = sqrt(X'*X);
           E = zeros(n-k,1);  E(1) = c;
           U=R(1:k,k+1); Y = [U; X];  Z = [U; E];
           W = flip(Y,Z);
           P = P*W';  R = W*R*W';
      end