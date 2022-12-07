function [cerror, serror, terror] = generror(a,b, npoints)
    
    ccapprox = ccrule(a,b, npoints);
    sapprox = 0;
    tapprox = 0;
    xstep = (b - a)/npoints;
    k = 1;

    %start evlautations at a, a + step,
    % each iteration goes above a step
    % and then back one ti b is reached
    for i = a + xstep  :xstep:  b
        %sprintf('evlautiing: (%f - %f)', i - xstep, i)
        curs = simps(i - xstep, i );
        curt = traprule(i - xstep, i);
        %sprintf('simp and trap approx: (%f , %f)', curs, curt)
        
        %sum the individual approximations
        sapprox = sapprox + curs;
        tapprox = tapprox + curt; 
        k  = k + 1;
    end
    %sprintf('evlautions: %i', k-1)
    %calculate true values from true integral
    intruth = fint(b) - fint(a);
    cerror = abs(ccapprox - intruth);
    serror = abs(sapprox - intruth);
    terror = abs(tapprox - intruth);
end

