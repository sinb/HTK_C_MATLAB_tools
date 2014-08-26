function LPCCmodelParameterWeightToMAT(filename)
    hmms = read_htk_hmm(filename);
    txt = read_text_file(filename);
    states = hmms.nstates;
    mixes = hmms.gmms(1,1).nmix;
    MFCCEmixmat1 = zeros(states,mixes);
    outfilename = filename;
    for i = 1:1:hmms.nstates
        STATE_ln = 9 + (32 + 6*(hmms.gmms(1,1).nmix - 5)) * (i - 1);
        for j = 1:1:hmms.gmms(1,1).nmix
            [i+1,j,STATE_ln + 6 *(j-1)];
            a = cell2mat(txt(STATE_ln + 6 *(j-1)));
            a = regexp(a, '\s+', 'split');
            a = cell2mat(a(3));
            a = str2num(a);
            MFCCEmixmat1(i,j) = a;
        end
    end
    save(['../mats/' outfilename 'MFCCEmixmat1.mat'],'MFCCEmixmat1');

    
end
