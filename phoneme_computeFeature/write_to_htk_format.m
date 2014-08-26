%clear;clc
%load('tiantian_460_mfcce.mat');
%load('tiantian_460_lpcce.mat');


 for i = 1:1:414
     i
     a = tiantianCUTmfcce_norml{1,i};
    % a = cell2mat(a);
     b = tiantianCUTlpcce_norml{1,i};
   %  b = cell2mat(b);
      numstr = num2str(i);
      filename1 = [numstr '.mfcc'];
      filename2 = [numstr '.lpcc'];
      name1 = ['tiantianCUT_htk_format_mfcce_norm/' filename1];
      name2 = ['tiantianCUT_htk_format_lpcce_norm/' filename2];
      htkwrite(a,name1,6+64);%mfcc_e
      htkwrite(b,name2,3+64);%lpcc_e  
 end
