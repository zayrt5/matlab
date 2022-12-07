function a1 = plotfun(coe,terror,fun1)
    k = 1;
    fplot(fun1,[-1,1],'LineWidth',2, 'LineStyle','--');
    hold on;
    for i = 1:1:length(coe)
        
        polyplotqr{k} = newpoly(coe{i,1})
        polyplotne{k} = newpoly(coe{i,2})
        fplot(polyplotne{k},[-1,1]);
        fplot(polyplotqr{k},[-1,1]);
        
        
        k = k + 1;
 
    end    
    disp(k);
    hold off;


    
    a1 = polyplotqr;

end

