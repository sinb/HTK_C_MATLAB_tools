dir = '/home/sinb/HTK/works/t_i_an/t_i_an_mfcce_norm/data/mfcc/';
fid = fopen('/home/sinb/Programming/matlabworks/MyASRTools/HTK_model_generate/t_aeio_nosil/t_aeio_nosil_mfcce/training/trainlist.txt','w');
for i = 1:1:300
    fprintf(fid,'%s\n',[dir num2str(i) '.mfcc']);
end

dir = '/home/sinb/HTK/works/t_i_an/t_i_an_lpcce_norm/data/lpcc/';
fid = fopen('/home/sinb/Programming/matlabworks/MyASRTools/HTK_model_generate/t_aeio_nosil/t_aeio_nosil_lpcce/training/trainlist.txt','w');
for i = 1:1:300
    fprintf(fid,'%s\n',[dir num2str(i) '.lpcc']);
end
    