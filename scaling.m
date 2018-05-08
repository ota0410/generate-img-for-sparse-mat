function A = scaling(A)
    for k=1:size(A,1)
        x = A(k,:);
        absvec = abs(x);
        absmax = max(absvec);
        A(k,:) = (1.0/absmax)*A(k,:);
    end
   return
end