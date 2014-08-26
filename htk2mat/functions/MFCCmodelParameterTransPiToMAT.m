%clear;clc
%filename = 'hmm_460tiantianmfcce_10_state';
%outfilename = 'modelParametersTransPI.cpp';
function MFCCmodelParameterTransPiToMAT(filename)
    outfilename = filename;
    txt = read_text_file(filename);
    a = txt(6); a = cell2mat(a);
    nstates = str2num(a(size(a,2)-1:size(a,2)));

    hmms = read_htk_hmm(filename);
    MFCCEtransmat1 = txt(size(txt,1)-nstates:size(txt,1)-1);
    MFCCEtransmat1 = cell2mat(MFCCEtransmat1);
    MFCCEtransmat1 = str2num(MFCCEtransmat1);
    MFCCEtransmat1(hmms.nstates+1,hmms.nstates+1) = 1;
    MFCCEtransmat1 = MFCCEtransmat1(2:hmms.nstates+1,2:hmms.nstates+1);
    MFCCEprior1 = zeros(1,hmms.nstates);
    MFCCEprior1(1) = 1;
    save(['../mats/' outfilename 'MFCCEtransmat1.mat'], 'MFCCEtransmat1');
    save(['../mats/' outfilename 'MFCCEprior1.mat'], 'MFCCEprior1');
end