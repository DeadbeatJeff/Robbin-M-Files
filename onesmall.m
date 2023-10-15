function n0 = onesmall(H,n2)
eps = 1.0E-100;
n0=n2;
while(1<n0)
    h21 = abs(H(n0, n0-1));
    h11 = abs(H(n0-1, n0-1));
    h22 = abs(H(n0, n0));
    if (h21 <= eps*(h11+h22)) return end
    n0=n0-1;
end