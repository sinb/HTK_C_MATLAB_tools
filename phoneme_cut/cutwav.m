clear;clc
% load('ian_struct_wav.mat');
% for i = 1:1:size(ian_struct_wav, 2)
%     if i < 2600
%         continue;
%     end
%     infilename = ian_struct_wav(i).intervalsID
%     xmin = round(ian_struct_wav(i).xmin * 16000);
%     xmax = round(ian_struct_wav(i).xmax * 16000);
%     outfilename = ['/home/sinb/matlabworks/ASCCD/cut/ian_wav/' num2str(i) '.wav']
%  %   wavchunksizefix(infilename);
%     audioclip = wavread(infilename,[xmin xmax]);
%     audioclip = audioclip(:,1);
%     wavwrite(audioclip,16000,outfilename);
% end

% load('t_i_struct_wav.mat')
% 
% for i = 1:1:size(t_i_struct_wav, 2)
%     if i < 500
%         continue;
%     end
%     infilename = t_i_struct_wav(i).intervalsID
%     xmin = round(t_i_struct_wav(i).xmin * 16000);
%     xmax = round(t_i_struct_wav(i).xmax * 16000);
%     outfilename = ['/home/sinb/matlabworks/ASCCD/cut/t_i_wav/' num2str(i) '.wav']
%  %   wavchunksizefix(infilename);
%     audioclip = wavread(infilename,[xmin xmax]);
%     audioclip = audioclip(:,1);
%     wavwrite(audioclip,16000,outfilename);
% end
% 
%  load('t_struct_wav.mat')
% for i = 1:1:size(t_struct_wav, 2)
% %     if i < 500
% %         continue;
% %     end
%     infilename = t_struct_wav(i).intervalsID
%     xmin = round(t_struct_wav(i).xmin * 16000);
%     xmax = round(t_struct_wav(i).xmax * 16000);
%     outfilename = ['/home/sinb/matlabworks/ASCCD/cut/t_wav/' num2str(i) '.wav']
%  %   wavchunksizefix(infilename);
%     audioclip = wavread(infilename,[xmin xmax]);
%     audioclip = audioclip(:,1);
%     wavwrite(audioclip,16000,outfilename);
% end
% 
% 


 load('t_aeio_struct_wav.mat')
for i = 1:1:size(t_aeio_struct_wav, 2)
%     if i < 500
%         continue;
%     end
    infilename = t_aeio_struct_wav(i).intervalsID
    xmin = round(t_aeio_struct_wav(i).xmin * 16000);
    xmax = round(t_aeio_struct_wav(i).xmax * 16000);
    outfilename = ['/home/sinb/matlabworks/ASCCD/cut/t_aeio_wav/' num2str(i) '.wav']
 %   wavchunksizefix(infilename);
    audioclip = wavread(infilename,[xmin xmax]);
    audioclip = audioclip(:,1);
    wavwrite(audioclip,16000,outfilename);
end







