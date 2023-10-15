   function c = next(c)

    [m n] = size(c); % should have m=1
    i = n-1; while c(i) >= c(i+1), i = i-1; end;
    j = n;   while c(j) <= c(i),   j = j-1; end;
    x = c(i);  c(i) = c(j);  c(j) = x;
    i = i+1; j = n;
    while i < j,
           x = c(i);  c(i) = c(j);  c(j) = x;
           i = i+1;   j = j-1;
    end 