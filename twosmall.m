function n1=twosmall(H, n0,n2)
% used by eigtri

    eps = 1.0E-100;
	h11 = abs(H(n2-1, n2-1));
	h21 = abs(H(n2, n2-1));
	h22 = abs(H(n2, n2));
	n1 = n2-1;
	while n0 < n1
		h32 = h21;  h21 = abs(H(n1, n1-1));
		h33 = h22;  h22 = h11;  h11 = abs(H(n1-1, n1-1));
		if   h21 <= eps*(h22/h32)*(h11+h22+h33)  return end
		n1=n1-1;
	end

