function A = scaling(A)
    sz = size(A,1);
    parfor k=1:sz
        x = A(k,:);
        absmax = max(abs(x));
        A(k,:) = (1.0/absmax) * x;
    end
   return
end