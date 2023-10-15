    function [R, lead, free] = gj(A)

    [m n] = size(A);
    R=A; lead=zeros(1,0); free=zeros(1,0);
    r = 0;  % rank of first k columns

    for k=1:n
       if r==m, free=[free, k:n]; return; end
       [y,h] = max(abs(R(r+1:m, k))); h=r+h; % (*)
       if  (y < 1.0E-9) % (i.e if y == 0)
            free = [free, k];
       else
           lead = [lead, k]; r=r+1;
           R([r h],:) = R([h r],:);   % swap
           R(r,:) = R(r,:)/R(r,k);    % scale
           for i = [1:r-1,r+1:m]      % shear
              R(i,:) = R(i,:) - R(i,k)*R(r,:);
           end
      end % if
   end  % for