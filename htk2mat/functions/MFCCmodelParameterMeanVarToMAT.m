function MFCCmodelParameterMeanVarToMAT(filename,outputdir)
    %filename = 'tiantian_8_5_mfcce';

    %outfilename = 'a.cpp';
    %fid=fopen(outfilename,'w');
    outputdir = filename;
    O = 13;
    hmms = read_htk_hmm(filename);
    MFCCEmu1 = zeros(O,hmms.nstates, hmms.gmms(1,1).nmix);
    MFCCESigma1 = zeros(O,O,hmms.nstates, hmms.gmms(1,1).nmix);

    a = cell(hmms.nstates,1);
    for i = 1:1:hmms.nstates
        i
        a{i} = hmms.gmms(1,i).means;
        MFCCEmu1(:,i,:) = a{i};
    end
    b = cell(hmms.nstates,1);
    for i = 1:1:hmms.nstates
        i
        for j = 1:1:hmms.gmms(1,1).nmix
        b{i} = hmms.gmms(1,i).covars;
        c= b{i}(:,j);
        MFCCESigma1(:,:,i,j)  = diag(c);
        end
    end
    save(['../mats/' outputdir 'MFCCEmu1.mat'], 'MFCCEmu1');
    save(['../mats/' outputdir 'MFCCESigma1'], 'MFCCESigma1');
end
