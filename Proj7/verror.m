function eout = verror(npoints,range, theta, poly)
% does the function listed on last page of the hw
    syms x;
    k= 1;
    step = (range(2)-range(1))/(npoints-1);

    curerror = zeros(npoints, 1);
    for i = range(1):step:range(2)
        y1 = thetaexp(theta,i);
        y2 = subs(poly, x, i);
        
        curerror(k) = (abs(y1 - y2)) / (abs(y1));
        k = k + 1;
    end
    disp(curerror);
    eout = max(curerror);
end

