function xhpair = main(hintervalexp, xrange, xpoints,hprecision, hstart,maxit)
    
    %range of xs to use and interval
    xlow = xrange(1);
    xhigh = xrange(2);
    xstep = (xhigh - xlow)/xpoints;

    k = 1;
    for i = xlow:xstep:xhigh
        disp('   ');disp('   ');disp(i); disp('   ');disp('   ');
        hit = 1;
        hcur = hstart;

        %run through a whole bunch of hs until either precision is met or 
        %   max iterations
        while true
            if (hcur < hprecision || hit > maxit )
                disp(hit);
                break;
            end
            %gather all approximates and truths for current x and h
            curapprox = approxdrv(i, hcur);
            
            truthd(hit) = curapprox(4);

            %store hs
            hs(hit) = hcur;

            %assuming error formula is abs(true - approx)
            cerror(hit) = abs(truthd(hit) - curapprox(3));
            berror(hit) = abs(truthd(hit) - curapprox(2));
            ferror(hit) = abs(truthd(hit) - curapprox(1));
              
            %reduce h by some amount
            hcur = hcur/hintervalexp;
            hit = hit + 1;
        end
        errorset = {hs, {cerror, berror, ferror}};
        xhpair{k} = {i,errorset};
        %oh boy, why am i like this
        %tuples galore
%                   xhpairs           
%                      /\
%               xi          hs+error
%                              /\
%                     htested    herrorset     
%                                  /   |   \            
%                              cent  bwd   fwd
% 
% 
%       tree{xpoints}{ [1=x] [2=next tuple] }{ [1 = hs][2 = error sets] }
%       i mean...  
        k = k + 1;
    end
end

