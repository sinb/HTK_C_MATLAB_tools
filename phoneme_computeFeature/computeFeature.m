clear;clc
% % % % % % % ian without sil feature 
% % % % % % % % % % % % % % % % % % % % % % % % 
% ian_nosil_mfcce_norm = {};
% ian_nosil_lpcce_norm = {};
% for i = 1:1:3739
%     i
%     x = wavread(['/home/sinb/matlabworks/ASCCD/cut/ian_wav/' num2str(i) '.wav']);
%     mfcce = mfcc_e(x);
%     lpcc = lpc_2mc(x);
%     lpcce = [lpcc,mfcce(:,13)];
%     ian_nosil_mfcce_norm = [ian_nosil_mfcce_norm mfcce];
%     ian_nosil_lpcce_norm = [ian_nosil_lpcce_norm lpcce];
% end
% % % % % % % ending % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % 

% % % % % % % % % t with sil at the head
% % % % % % % % % 
% t_sil_head_mfcce = {};
% t_sil_head_lpcce = {};
% for i = 1:1:2739
%     i
%     x = wavread(['/home/sinb/matlabworks/ASCCD/cut/t_wav/' num2str(i) '.wav'])';
%     a = round(rand(1,1)*1834);
%     sil = wavread(['/home/sinb/matlabworks/ASCCD/cut/sil/' num2str(a) '.wav'])';
%     x = [sil x]';
%     mfcce = mfcc_e(x);
%     lpcc = lpc_2mc(x);
%     lpcce = [lpcc,mfcce(:,13)];
%     t_sil_head_mfcce = [t_sil_head_mfcce mfcce];
%     t_sil_head_lpcce = [t_sil_head_lpcce lpcce];
% end
% % % % % % % % % % % % % % % % %

% % % % % % % ian with sil at the end feature 
% % % % % % % % % % % % % % % % % % % % % % % % 
% ian_sil_tail_mfcce_norm = {};
% ian_sil_tail_lpcce_norm = {};
% for i = 1:1:3739
%     i
%     a = round(rand(1,1)*1834 +1);
%     x = wavread(['/home/sinb/matlabworks/ASCCD/cut/ian_wav/' num2str(i) '.wav'])';
%     sil = wavread(['/home/sinb/matlabworks/ASCCD/cut/sil/' num2str(a) '.wav'])';
%     x = [x sil]';
%     mfcce = mfcc_e(x);
%     lpcc = lpc_2mc(x);
%     lpcce = [lpcc,mfcce(:,13)];
%     ian_sil_tail_mfcce_norm = [ian_sil_tail_mfcce_norm mfcce];
%     ian_sil_tail_lpcce_norm = [ian_sil_tail_lpcce_norm lpcce];
% end
% % % % % % % ending % % % % % % % % 
% % % % % % % % % % % % % % % % % % % 



% % % % % % % t+i without sil feature 
% % % % % % % % % % % % % % % % % % % % % % % % 
% t_i_nosil_mfcce_norm = {};
% t_i_nosil_lpcce_norm = {};
% for i = 1:1:843
%     i
% %    a = round(rand(1,1)*1834 +1);
%     x = wavread(['/home/sinb/matlabworks/ASCCD/cut/t_i_wav/' num2str(i) '.wav']);
% %    sil = wavread(['/home/sinb/matlabworks/ASCCD/cut/sil/' num2str(a) '.wav'])';
% %    x = [x sil]';
%     if size(x,1) < 256
%         x(size(x,1):256) = 0;
%     end
%     mfcce = mfcc_e(x);
%     lpcc = lpc_2mc(x);
%     lpcce = [lpcc,mfcce(:,13)];
%     t_i_nosil_mfcce_norm = [t_i_nosil_mfcce_norm mfcce];
%     t_i_nosil_lpcce_norm = [t_i_nosil_lpcce_norm lpcce];
% end
% % % % % % % ending % % % % % % % % 
% % % % % % % % % % % % % % % % % % % 




% % % % % % t+aeio without sil feature 
% % % % % % % % % % % % % % % % % % % % % % % 
% t_aeio_nosil_mfcce_norm = {};
% t_aeio_nosil_lpcce_norm = {};
% for i = 1:1:2544
%     i
%   % a = round(rand(1,1)*1834 +1);
%     x = wavread(['/home/sinb/matlabworks/ASCCD/cut/t_aeio_wav/' num2str(i) '.wav']);
%  %  sil = wavread(['/home/sinb/matlabworks/ASCCD/cut/sil/' num2str(a) '.wav'])';
%  %  x = [x sil]';
%     if size(x,1) < 256
%         x(size(x,1):256,1) = 0;
%     end
%     mfcce = mfcc_e(x);
%     lpcc = lpc_2mc(x);
%     lpcce = [lpcc,mfcce(:,13)];
%     t_aeio_nosil_mfcce_norm = [t_aeio_nosil_mfcce_norm mfcce];
%     t_aeio_nosil_lpcce_norm = [t_aeio_nosil_lpcce_norm lpcce];
% end
% % % % % % ending % % % % % % % % 
% % % % % % % % % % % % % % % % % % 


% % % % % % t+aeio with sil at the head feature 
% % % % % % % % % % % % % % % % % % % % % % % 
% t_aeio_sil_head_mfcce_norm = {};
% t_aeio_sil_head_lpcce_norm = {};
% for i = 1:1:2544
%     i
%     a = round(rand(1,1)*1834 +1)
%     x = wavread(['/home/sinb/matlabworks/ASCCD/cut/t_aeio_wav/' num2str(i) '.wav'])';
%     sil = wavread(['/home/sinb/matlabworks/ASCCD/cut/sil/' num2str(a) '.wav'])';
%     x = [sil x]';
% %     if size(x,2) < 256
% %         x(size(x,2):256) = 0;
% %     end
%     mfcce = mfcc_e(x);
%     lpcc = lpc_2mc(x);
%     lpcce = [lpcc,mfcce(:,13)];
%     t_aeio_sil_head_mfcce_norm = [t_aeio_sil_head_mfcce_norm mfcce];
%     t_aeio_sil_head_lpcce_norm = [t_aeio_sil_head_lpcce_norm lpcce];
% end
% % % % % % % ending % % % % % % % % 
% % % % % % % % % % % % % % % % % % % 



% % % % % % t+i without sil feature 
% % % % % % % % % % % % % % % % % % % % % % % 
t_i_sil_head_mfcce_norm = {};
t_i_sil_head_lpcce_norm = {};
for i = 1:1:843
    i
    a = round(rand(1,1)*1834 +1)
    x = wavread(['/home/sinb/matlabworks/ASCCD/cut/t_i_wav/' num2str(i) '.wav'])';
    sil = wavread(['/home/sinb/matlabworks/ASCCD/cut/sil/' num2str(a) '.wav'])';
    x = [sil x]';
%     if size(x,1) < 256
%         x(size(x,1):256) = 0;
%     end
    mfcce = mfcc_e(x);
    lpcc = lpc_2mc(x);
    lpcce = [lpcc,mfcce(:,13)];
    t_i_sil_head_mfcce_norm = [t_i_sil_head_mfcce_norm mfcce];
    t_i_sil_head_lpcce_norm = [t_i_sil_head_lpcce_norm lpcce];
end
% % % % % % ending % % % % % % % % 
% % % % % % % % % % % % % % % % % % 




% % % % % % % % % t without sil at the head
% % % % % % % % % 
% t_no_sil_mfcce_norm = {};
% t_no_sil_lpcce_norm = {};
% for i = 1:1:2739
%     i
%     x = wavread(['/home/sinb/matlabworks/ASCCD/cut/t_wav/' num2str(i) '.wav']);
%  %   a = round(rand(1,1)*1834);
%  %   sil = wavread(['/home/sinb/matlabworks/ASCCD/cut/sil/' num2str(a) '.wav'])';
% %    x = [sil x]';
%     if size(x,1) < 256
%         x(size(x,1):256) = 0;
%     end
%     mfcce = mfcc_e(x);
%     lpcc = lpc_2mc(x);
%     lpcce = [lpcc,mfcce(:,13)];
%     t_no_sil_mfcce_norm = [t_no_sil_mfcce_norm mfcce];
%     t_no_sil_lpcce_norm = [t_no_sil_lpcce_norm lpcce];
% end
% % % % % % % % % % % % % % % % %



% % % % % % % % t with sil at the head
% % % % % % % % 
% t_i_no_sil_mfcce = {};
% t_i_no_sil_lpcce = {};
% for i = 1:1:843
%     i
%     x = wavread(['/home/sinb/matlabworks/ASCCD/cut/t_i_wav/' num2str(i) '.wav'])';
%    a = round(rand(1,1)*1834);
%    sil = wavread(['/home/sinb/matlabworks/ASCCD/cut/sil/' num2str(a) '.wav'])';
%    x = [sil x]';
%     if size(x,1) < 256
%         x(size(x,1):256) = 0;
%     end
%     mfcce = mfcc_e(x);
%     lpcc = lpc_2mc(x);
%     lpcce = [lpcc,mfcce(:,13)];
%     t_i_no_sil_mfcce = [t_i_no_sil_mfcce mfcce];
%     t_i_no_sil_lpcce = [t_i_no_sil_lpcce lpcce];
% end
% % % % % % % % % % % % % % % % %