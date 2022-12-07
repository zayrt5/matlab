function oA = jacobi2(iA, b, nit, tol, x0)
%your lecture code and this dudes code for error calc
%https://sites.google.com/site/numericosspj/systems-of-linear-equations/jacobi

k = 0;
   LU = triu(iA,1) + tril(iA,-1);
   D = diag(diag(iA));
    fx = iA*x0 -b;
   while (k < nit)
        
        %disp('iteration: '); disp(k);
        ci = b - LU*x0;
        xi = D\ci;
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

