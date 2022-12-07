function oA = luchol(iA, b)
%pretty much copy paste from matlab docs for the respective functions
if issymmetric(iA) 
    disp('is sym, using chol');
    R = chol(iA);
    oA = R\(R'\b);
else
    disp('not sym, using lu');
    [L, U, P] = lu(iA);
    y = L\(P*b);
    oA = U\y;

end

end

