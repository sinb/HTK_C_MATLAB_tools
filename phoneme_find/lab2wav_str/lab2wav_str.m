 load('t_aeio_struct.mat')
for i = 1:1:size(t_aeio_struct,2)
    t_aeio_struct(i).intervalsID(35:37) = 'wav';
    t_aeio_struct(i).intervalsID(43:45) = 'wav';
    t_aeio_struct(i).intervalsID(58:end) = [];
    t_aeio_struct(i).intervalsID = [t_aeio_struct(i).intervalsID 'wav'];
    t_aeio_struct(i).intervalsID
end
%  load('t_i_struct.mat')
% for i = 1:1:size(t_i_struct,2)
%     t_i_struct(i).intervalsID(35:37) = 'wav';
%     t_i_struct(i).intervalsID(43:45) = 'wav';
%     t_i_struct(i).intervalsID(58:end) = [];
%     t_i_struct(i).intervalsID = [t_i_struct(i).intervalsID 'wav'];
%     t_i_struct(i).intervalsID
% end
%  load('t_struct.mat')
% for i = 1:1:size(t_struct,2)
%     t_struct(i).intervalsID(35:37) = 'wav';
%     t_struct(i).intervalsID(43:45) = 'wav';
%     t_struct(i).intervalsID(58:end) = [];
%     t_struct(i).intervalsID = [t_struct(i).intervalsID 'wav'];
%     t_struct(i).intervalsID
% end