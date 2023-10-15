    function N = randsutr(n)

   	N = zeros(n,n);
        for i=1:n for j=i+1:n
            N(i,j) = rand(1,1);
        end; end