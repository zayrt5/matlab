function intapprox = ccrule(a, b, npoints)
    [x,w] = fclencurt(npoints, a,b);
    intapprox = 0;
    for i = 1:1:size(x)

        intapprox = intapprox + fd( x(i) ) * w(i);
    end    
    sprintf('evlautions: %i', i)
end

