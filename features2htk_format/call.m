%clear;clc
%load('tiantian_460_mfcce.mat');
%load('tiantian_460_lpcce.mat');

MFCCEcell = MFCCEcell';
LPCCEcell = LPCCEcell';
 for i = 1:1:728
     a = MFCCEcell{1,i};
     a = cell2mat(a);
     b = LPCCEcell{1,i};
     b = cell2mat(b);
     numstr = num2str(i);
     filename1 = rawData(i,2);
     filename1 = filename1{1};
     filename1(size(filename1,2)-2 : size(filename1,2) ) = 'mfc';
     filename1 = [filename1 'c'];
     name1 = ['htk_format_mfcce2/' filename1];
     filename1(size(filename1,2)-3 : size(filename1,2) ) = 'lpcc';
     name2 = ['htk_format_lpcce2/' filename1];
      htkwrite(a,name1,6+64);%mfcc_e
      htkwrite(b,name2,3+64);%lpcc_e  
 end

