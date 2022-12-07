function intapprox = traprule(a, b)
    
%(f(a) - f(b))/2 * (b - a)
    
    intapprox = (   (fd(a) + fd(b))/2  ) * (b - a);

end

