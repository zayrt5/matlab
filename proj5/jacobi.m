function oA = jacobi(iA, b, tol, x0)
%pretty much copy paste from matlab docs for the respective functions
    k = 0;
   %LU = triu(iA,1) + tril(iA,-1);
   D = diag(diag(iA));
   L = D - tril(iA);
   U = D - triu(iA);
   T = inv(D)*(L + U);
   C = inv(D)*b;
   while k < tol
        %disp('iteration: '); disp(k);
        xi = (T*x0) + C;
        x0 = xi;
        k = k + 1;
        
   
   end
   oA = xi;
  
end

