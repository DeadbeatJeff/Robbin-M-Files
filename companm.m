 function C = companm(p)

       p = p(:).';        % make sure p is a row
       q = p(2:size(p)(1,2));
       n = max(1,size(p)(1,2)-1);

       if  n > 1
            C = zeros(n,n);
            for i=  1:n-1, C(i,i+1)=1; end
       else
            C = 1;
       end
       C(n,:) = -q(n:-1:1);