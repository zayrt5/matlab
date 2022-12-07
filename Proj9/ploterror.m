function a1 = ploterror(terror,condd)
    


    
    
    semilogy(terror(:,1),LineStyle="--", Color="red");
    hold on;
    %semilogy(condd);
    semilogy(terror(:,2),LineStyle="-.");

    hold off;
    a1 = 1;

end

