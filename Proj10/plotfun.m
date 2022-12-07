function out1 = plotfun(tuple)
    %plots backwards and forwards
    %index x values
    %change step value for amount of lines
    for i = 1:1:length(tuple)
        disp(i);
        hold on;
        %identifying anomolous x value
        if( log(min(tuple{i}{2}{2}{2})) < -25)
            plot(log(tuple{i}{2}{1}), log(tuple{i}{2}{2}{2}), Color='Red');
            plot(log(tuple{i}{2}{1}), log(tuple{i}{2}{2}{3}), Color='Red');
            out1 = tuple{i}{1};
        else   
        plot(log(tuple{i}{2}{1}), log(tuple{i}{2}{2}{2}), Color=[0,tuple{i}{1}*2,1]);
        %plot(log(tuple{i}{2}{1}), log(tuple{i}{2}{2}{3}), LineStyle="--");
        end
    end


    hold off;
end

