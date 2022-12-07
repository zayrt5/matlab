function oA = lumax(iA, opt)
%LUMAX Summary of this function goes here
%   Detailed explanation goes here
    L = tril(iA,-1);
   U = triu(iA,1);
    D = diag(diag(iA));
    oA1 = max(max( inv(D) * (L + U)  )); %Jacobi
    oA2 = max(max(  inv(L + D) * U  )); %GS
    
    if opt >= 1 %Jacobi for 1 or greater
        disp('jacobi');
        oA = oA1;
    else
        disp('gs');
        oA = oA2; %GS for < 1

    end
end

