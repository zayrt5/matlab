function intapprox = simps(a, b)
    
    % (b-a)/6   *   ( fa -  4*f((a + b)/2) + f(b) )  
    

    intapprox = (fd(a) +    4 * fd( (a + b)/2 )  +  fd(b) ) * ((b - a)/6);
    

end

