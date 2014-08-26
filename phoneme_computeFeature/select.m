frames = [];
loc = [];
for i = 1:1:843
    s = size(t_i_sil_head_mfcce_norm{1,i},1);
    frames = [frames s];
    if s < 2
        loc = [loc i];
    end
end

t_i_sil_head_lpcce_norm_select = t_i_sil_head_lpcce_norm;
t_i_sil_head_lpcce_norm_select(loc) = [];
t_i_sil_head_mfcce_norm_select = t_i_sil_head_mfcce_norm;
t_i_sil_head_mfcce_norm_select(loc) = [];