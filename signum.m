   function s = signum(c)

    [m n] = size(c);
    s = 1;
    for i = 1:n
           for j = i+1:n
                   if c(i) > c(j), s = -s; end
           end
    end 