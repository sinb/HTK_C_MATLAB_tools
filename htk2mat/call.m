%working folder:current folder
cd models/
filename = 'tiantianCUT_12_5_lpcce_norm';
LPCCmodelParameterMeanVarToMAT(filename)
LPCCmodelParameterTransPiToMAT(filename)
LPCCmodelParameterWeightToMAT(filename)
filename = 'tiantian_8_10_mfcce';
MFCCmodelParameterMeanVarToMAT(filename)
MFCCmodelParameterTransPiToMAT(filename)
MFCCmodelParameterWeightToMAT(filename)
cd ..