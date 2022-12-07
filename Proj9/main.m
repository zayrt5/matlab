function [a1,a2,a3] = main(argv)


    frange = [-1,1];
    interval = argv;

    %creating equal points of testing and training data
    %   for easier error calculation alegbra
    xstrain = transpose(linspace(frange(1),frange(2),interval));
    fxstrain = fm( xstrain );

    rxstest = transpose(frange(1)+ (frange(2)-frange(1)).*rand(interval,1));
    fxstest = transpose(fm( rxstest ));


    %vandermonde for both training and testing data
    vpA = fliplr(vander(xstrain));
    vpAtest = fliplr(vander(rxstest));

    %polydsnuts is a cell holding all coeffiecent solutions
    %   for each d
    polydsnuts= cell(interval,2);

    %going to hold all error values for each d
    dterror= zeros(interval,2);

    %holding condition number for each d
    condd = zeros(1,interval);

    for d = 1:1:interval
        disp("degree poly: "); disp(d-1);

        %get vandermonde of up to d columns / coeffiencts
        vAtrain = vpA(:,1:d);
        vAtest = vpAtest(:,1:d);
        condd(d) = cond(vAtest);

        
        %get coeffiecients of polynomial degree d-1 for both
        %   methods and store in cell
        polyqr = thinqr(vAtrain, fxstrain);        
        polyne = normeq(vAtrain, fxstrain);
        polydsnuts{d,1} = polyqr;
        polydsnuts{d,2} = polyne;
        
        %residual
        %(true values - (respectivevandermon * our coef of polyapprox))^2
        qrteste = (fxstest - (vAtest * polyqr)).^2;
        neteste = (fxstest - (vAtest * polyne)).^2;
        
        %frfr error
        pqrterror = sum(qrteste) / sum(fxstest.^2);
        pneterror = sum(neteste) / sum(fxstest.^2);
        
        %normin and squarin resid to get true error
        %   then store in matrix
        dterror(d,1) = pqrterror^1/2;
        dterror(d,2) = pneterror^1/2;
        %polyplotne = newpoly(polyne);
        %polyplotqr = newpoly(polyqr);

    end    
    
    %chosen outputs
    a1 = polydsnuts;
    a2 = condd;
    a3 = dterror;
end

