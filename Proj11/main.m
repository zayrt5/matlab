function out1 = main(maxn, a, b)
    k = 0;
    %this is for testing multiple as and bs
    %parameters for plots were:
    %   n = 500
    %   [a,b] = -.1667,.1667
    %   [a,b] = -1,1
    %   [a,b] = -pi, pi
    %   [a,b] = 0,.1
    %step a and b at arbitrary linear rates
    for l = a:.25:b
        l = l *1.03;
        ns = zeros(1,maxn);
        cregime = zeros(1,maxn);
        tregime = zeros(1,maxn);
        sregime = zeros(1,maxn);
    
        for i = 1: 1: maxn
            ns(i) = i;
            [cregime(i), tregime(i), sregime(i)] = generror(l,b,i);
    
        end
        %decrease b by some arbitrarty amount 
        b= b *.93;
    
        %plot
        hold on;
        plot(log(ns), log(sregime),  LineStyle='--', Color=[k/10 , 0, .5]);
        plot(log(ns), log(cregime), Color=[1 , 0, k/10]);
        plot(log(ns), log(tregime), LineStyle='-.', Color=[0 , k/10, 1]);
        %plot(ns, sregime);
        
        k = k + 1;
        
    end
    hold off;
    out1 = 1;
end

