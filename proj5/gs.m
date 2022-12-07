function oA = gs(iA, b, nit, tol, x0)

    k = 0;
   D = diag(diag(iA));
   L = tril(iA,-1);
   U = triu(iA,1);
    fx = iA*x0 -b;
   while (k < nit)
        
        %disp('iteration: '); disp(k);
        ci = b - U*x0;
        xi = (D+L)\ci;
        cerror = norm(xi-x0);
        if (fx == 0 | cerror < tol)
            break;
        end    
        x0 = xi;
        k = k + 1;
        fx = iA*x0 - b;
   
   end
   disp('iteration: '); disp(k);
   oA = xi;
  
end

