function xi = solven(iA, x0, maxk, btol, itol)
%JACOBIAN Summary of this function goes here
%   Detailed explanation goes here
    k = 0;
    disp(iA);
    while(k < maxk)
        disp('iteration: ');disp(k);
        J = createJ(iA,x0);
        %disp(J);
        b = evalf(iA,x0);
        %disp(b);
        p = J\-b;
        %disp(p);
        k = k + 1;
        xi = x0 + p;
        xdif = norm(xi - x0);
        x0 = xi;

        if(norm(b) < btol || xdif < itol)
            %xi(1,1) = round(xi(1,1)*1000)/1000;
            %xi(2,1) = round(xi(2,1)*1000)/1000;
            break;
        end
    end
end

