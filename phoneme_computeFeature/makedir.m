foldername1 = {'t_i_sil_head','t_i_nosil','ian_sil_tail','ian_no_sil'};
foldername2 = {'lpcce','mfcce'};
for i = 1:1:4
    [status,result] = system(['mkdir' foldername1{i}])
end
% lpccemodelgenerate(2,8,'t_i_sil_head','mfcce')
% mfccemodelgenerate(2,8,'tiantianCUT','lpcce')