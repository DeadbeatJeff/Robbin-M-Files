function s = shift(H,its, n2)
	if its == 10 | its == 20
		s = abs(H(n2, n2-1))+abs(H(n2-1, n2-2));
	else
		s = H(n2, n2);
		x = H(n2-1,n2)*H(n2, n2-1);
		if x~=0
		   y = (H(n2-1, n2-1)-s)/2;
	       u = y*y+x;
	       z = sqrt(u);
		   if real(y)*real(z)+imag(y)*imag(z)<0 z = -z; end
		   u = y+z;
	       x = x/u;
	       s = s-x;
		end
	end
