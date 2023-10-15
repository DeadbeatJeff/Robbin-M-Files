function [P B] = lr2rlm(H,n1,n2)
% P*B*inv(P)=H, assume H is hessenberg
[m n] = size(H);
if m~= n disp('square matrix required in lr2rl') return end
B=H; P=eye(n);
if nargin<>3 n1=1; n2=n; end
for i = n1+1:n2
        x = B(i-1, i-1);
	    y = B( i, i-1);
	    if  abs(x) < abs(y)
			B([i-1, i],:)=B([i, i-1],:);
			P(:,[i-1, i])=P(:,[i, i-1]);
			if abs(y) > 1.0E-50
				z = x/y;
			else
				B(i-1, i-1) = 0;
				B(i, i-1) = 0;
				z = 0;
			end
		else % abs(y) <= abs(x)
			if abs(x) > 1.0E-50
				z = y/x;
			else
				B(i-1, i-1) = 0;
				B(i, i-1) = 0;
				z = 0;
		    end
		end
		B(i,:) = B(i,:) - z*B(i-1,:);
		P(:,i-1)=P(:,i-1)+z*P(:,i);
end
B = B*P;
