function m = approxdrv(xi, h)
    %used for later substitution of created quadratic
    syms x;

    %kept this variable to extend range of plotted polynomial if needed
    plotmoreh = h*10;

    %compute y values at each needed point relative to h and x
    %fm is the matlab function of the given sin function
    %   function y = fm(x)
    %       y = sin(4.8 * pi * x );
    %   end
    fxph = fm(xi + h);
    fxmh = fm(xi - h);
    fxc = fm(xi);

    %put in answer matrix
    b = [fxmh;fxc;fxph];
    
    %fwd and bwd derivative approx and true derivate calc
    fwddf = (fxph - fxc)/h;
    bwddf = (fxc - fxmh)/h;
    %df is the matlab function of the handcalculated derivative function
    %      function y = df(x)
    %           coe = 4.8 * pi;
    %           y = coe * cos(coe * x);
    %      end
    trueder = df(xi);
    
    %fitting a quadratic to the 3 points below
    vquad = fliplr(vander([xi - h, xi, xi + h]));
    %coe of the quadratic
    quadcoe = vquad \ b;

    %derivative of quad
    quadder = polyder(fliplr(transpose(quadcoe)));
    
    %adding symbolic x and exponents
    quadderpoly = newpoly(flip(transpose(quadder)));

    %substitute x into the quadratic give out central derivate approx
    cdf = subs(quadderpoly,x,xi);
    
    %answer set
    m = [fwddf; bwddf; cdf; trueder];
end

