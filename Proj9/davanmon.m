function C = davanmon(pairs)
%generates coeffients of polynomial 
    dim = size(pairs);
    x = pairs(1,:);
    y = pairs(2,:);
    vM = zeros(dim(1));
    disp(x);
    disp(y);
    for i = 1:1:dim(1)
        for j = 1:1:dim(1)
            
            vM(i,j) = x(i)^(j-1);
            
        end

    end

    C = vM\y;


end

