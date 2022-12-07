function [kdata,kcond, xtrue,xne,xqr,nekmeans, qrkmeans] = firstk(A)
    [am,an] = size(A);

    %creates the matricies of A up until the ith column
    %each cell of Aindexed is some A_k
    Aindexed = cell(1,101);
    Aindexed{1} = A(:,1);
    for i = 2:1:an
        can = A(:,i);
        Aindexed{i} = [Aindexed{i-1} can];
    end


    %gathers size condition and rank
    %size and rank are in a cell, condition in a matrix
    kdata = cell(26,2);
    kcond = zeros(1,26);
    for i = 1:1:26
        j = i + 39;
        %disp(j);
        kdata{i,1} = size(Aindexed{j});
        kdata{i,2} = rank(Aindexed{j});
        kcond(i) = cond(Aindexed{j});
    end   



    bn = cell(1,100); %100 randomly generated bs of size R^m

    %cells containing all generated x values for each A and b
    xtrue = cell(100, 26 );
    xne = cell(100, 26 );
    xqr = cell(100, 26 );
    %ouput cell columns index A_k
    %rows are for each random b

    %these store the relative error of every x value for all As and bs
    errorne = cell(100, 26 );
    errorqr = cell(100, 26 );

    %these hod the average error of all xs for all A and b
    meannee = zeros(100,26);
    meanqre = zeros(100,26);

    %average error of all of xs for all 100 bs, indexed by A_k
    nekmeans = zeros(26);
    qrkmeans = zeros(26);

    for i = 1:1:100
        bn{i} = rand(am,1);
        for j = 1:1:26
            kindex = j+39;
            disp(size(Aindexed{kindex}));
            disp(size(bn{j}));
            
            %current truth matrix x
            ctrue = Aindexed{kindex} \ bn{i};


            %my current solutions and their calculated relative error
            cne = normeq(Aindexed{kindex}, bn{i});
            cnere = abs((ctrue - cne) ./ ctrue);
            cqr = thinqr(Aindexed{kindex}, bn{i});
            cqrre = abs((ctrue - cqr) ./ ctrue);

            
            %storin them
            xtrue{i,j} = ctrue;
            xne{i,j} = cne;
            xqr{i,j} = cqr;
            errorne{i,j} = cnere;
            errorqr{i,j} = cqrre;

            meannee(i,j) = mean(cnere);
            meanqre(i,j) = mean(cqrre);


        end    

    end    
    nekmeans = mean(meannee,1);
    qrkmeans = mean(meanqre,1);
end

