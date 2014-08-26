%clear;clc
%filename = 'hmm_460tiantianmfcce_10_state';
%outfilename = 'modelParametersTransPI.cpp';
function modelParameterTransPiToCpp(filename)
outfilename = [filename 'TransPi.cpp'];
fid=fopen(['../cpps/' outfilename],'w');
txt = read_text_file(filename);
a = txt(6); a = cell2mat(a);
nstates = str2num(a(size(a,2)-1:size(a,2)));

hmms = read_htk_hmm(filename);
trans = txt(size(txt,1)-nstates:size(txt,1)-1);
trans = cell2mat(trans);
trans = str2num(trans);
trans(hmms.nstates+1,hmms.nstates+1) = 1;
trans = trans(2:hmms.nstates+1,2:hmms.nstates+1);
PI = zeros(1,hmms.nstates);
PI(1) = 1;
lines = ['HMM hmm  = {' ];
%display HMM hmm = {
fprintf(fid,'%s',lines);
fprintf(fid,'\n\t');

comma = ',';
prefix = '{'; 
suffix = '}';
numbers = '';
numbers = [numbers prefix];
for i = 1:1:hmms.nstates
    for j = 1:1:hmms.nstates
        if i == hmms.nstates && j == hmms.nstates
            numbers = [numbers num2str(trans(i,j)) char(10) char(9)];
        else
             if j == hmms.nstates
                   numbers = [numbers num2str(trans(i,j)) comma char(10) char(9)];
             else
                   numbers = [numbers num2str(trans(i,j)) comma char(9)];
             end
        end
    end
end
numbers = [numbers suffix comma];
fprintf(fid,'%s\n\t',numbers);
%display PI
numbers = [];
numbers = [numbers '{'];
for i = 1:1:hmms.nstates
    if i == hmms.nstates
       numbers = [numbers num2str(PI(i))];
    else
       numbers = [numbers num2str(PI(i)) comma];
    end
end
fprintf(fid,'%s}\n\t};',numbers);
end