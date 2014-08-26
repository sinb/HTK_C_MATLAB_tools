%clear;clc
%filename = 'hmm_460tiantianmfcce_10_state';
%outfilename = 'modelParametersTransPI.cpp';
function LPCCmodelParameterTransPiToMAT(filename)
    outfilename = filename;
    txt = read_text_file(filename);
    a = txt(6); a = cell2mat(a);
    nstates = str2num(a(size(a,2)-1:size(a,2)));

    hmms = read_htk_hmm(filename);
    LPCCEtransmat1 = txt(size(txt,1)-nstates:size(txt,1)-1);
    LPCCEtransmat1 = cell2mat(LPCCEtransmat1);
    LPCCEtransmat1 = str2num(LPCCEtransmat1);
    LPCCEtransmat1(hmms.nstates+1,hmms.nstates+1) = 1;
    LPCCEtransmat1 = LPCCEtransmat1(2:hmms.nstates+1,2:hmms.nstates+1);
    LPCCEprior1 = zeros(1,hmms.nstates);
    LPCCEprior1(1) = 1;
    save(['../mats/' outfilename 'LPCCEtransmat1.mat'], 'LPCCEtransmat1');
    save(['../mats/' outfilename 'LPCCEprior1.mat'], 'LPCCEprior1');
end