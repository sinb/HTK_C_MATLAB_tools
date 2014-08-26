function LPCCmodelParameterMeanVarToMAT(filename)
    %filename = 'tiantian_8_5_mfcce';

    %outfilename = 'a.cpp';
    %fid=fopen(outfilename,'w');
    outfilename = filename;
    O = 13;
    hmms = read_htk_hmm(filename);
    LPCCEmu1 = zeros(O,hmms.nstates, hmms.gmms(1,1).nmix);
    LPCCESigma1 = zeros(O,O,hmms.nstates, hmms.gmms(1,1).nmix);

    a = cell(hmms.nstates,1);
    for i = 1:1:hmms.nstates
        i;
        a{i} = hmms.gmms(1,i).means;
        LPCCEmu1(:,i,:) = a{i};
    end
    b = cell(hmms.nstates,1);
    for i = 1:1:hmms.nstates
        i;
        for j = 1:1:hmms.gmms(1,1).nmix
        b{i} = hmms.gmms(1,i).covars;
        c= b{i}(:,j);
        LPCCESigma1(:,:,i,j)  = diag(c);
        end
    end
    
    save(['../mats/' outfilename 'LPCCEmu1.mat'],'LPCCEmu1');
    save(['../mats/' outfilename 'LPCCESigma1.mat'],'LPCCESigma1');
    
end
