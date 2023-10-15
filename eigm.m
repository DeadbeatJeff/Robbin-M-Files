function [Q H] = eigm(A)
% Q*H*inv(Q) = A
    [m n] = size(A);
    [Q H] = hess(A);
    I=eye(n);

    % Triangularize
    t = 0;
	n2 = n;
	while 0<n2
	    n0=onesmall(H,n2);
		its = 0;
		while  n0 < n2
		    its = its+1;
			if its==30, H=H-t*I; return; end
			s = shift(H,its, n2);
			H=H-s*I;
			t = t-s;
			n1=twosmall(H,n0,n2);  % n0 <= n1 < n2
			[P H] = lr2rl(H,n1,n2);
			Q=Q*P;
			n0=onesmall(H,n2);
	    end
	    n2=n2-1;
	end
	H = H-t*I;
    if nargout==1 Q=diag(H); return end
	V=zeros(n,n);
	for k=1:n
	    V(:,k)=randsoln(H-H(k,k)*I);
    end
    if abs(det(V))<1.0E-20
        disp('Multiple eigenvalues')
    else
        H=inv(V)*H*V;
        Q=Q*V;
    end
