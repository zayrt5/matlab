function pairs = gendata(npoints,range, theta)
%generates x y pairs based on truth function
    k= 1;
    step = (range(2)-range(1))/(npoints-1);
    pairs = zeros(npoints, 2);
    for x = range(1):step:range(2)
        y = thetaexp(theta,x); 
        %disp(k);
        %disp(x);
        %disp(y);
        pairs(k,1) = x;
        pairs(k,2) = y;
        k = k + 1;
    end
end

