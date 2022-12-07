function polyapprox = newpoly(coe)
%adds symbolic respective monomial x 
%to previously calculated coeffients
    syms x;
    polyapprox = 0;
    for i = 1:1:length(coe)
            
        polyapprox = polyapprox + (coe(i) * x^(i-1));

    end    
end

