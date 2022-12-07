function out1 = plotfun2(tuple)
    %plots central difference
    %index x values
    %change step value for amount of lines
    for i = 1:1:length(tuple)
        disp(i);
        hold on;
        
        if( log(min(tuple{i}{2}{2}{1})) < -25)
            plot(log(tuple{i}{2}{1}), log(tuple{i}{2}{2}{1}), Color='Red');
            out1 = tuple{i}{1};
        else   
        plot(log(tuple{i}{2}{1}), log(tuple{i}{2}{2}{1}), LineStyle="-.");
        end
    end


    hold off;
end
