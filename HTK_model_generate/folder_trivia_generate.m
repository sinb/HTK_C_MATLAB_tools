filename = 't_aeio_nosil';
dir = '/home/sinb/Programming/matlabworks/MyASRTools/HTK_model_generate/';
cd(dir);
mkdir(filename);
cd(filename);
mkdir([filename '_lpcce']);
mkdir([filename '_mfcce']);
%generate lpcce folder first
cd([filename '_lpcce'])
mkdir('data/lpcc');
mkdir('hmms/hmm0');mkdir('hmms/hmm1');mkdir('hmms/hmm2');
mkdir('hmms/hmm3');mkdir('hmms/hmm4');mkdir('hmms/hmm5');
mkdir('model/proto');mkdir('training');
%generate 'config'
cd('training');
fid = fopen('config','w');
fprintf(fid,'SOURCEFORMAT =HTK\n');
fprintf(fid,'TARGETKIND = LPCEPSTRA_E\n');
fclose(fid);
cd ..
%
cd ..
cd([filename '_mfcce'])
mkdir('data/mfcc');
mkdir('hmms/hmm0');mkdir('hmms/hmm1');mkdir('hmms/hmm2');
mkdir('hmms/hmm3');mkdir('hmms/hmm4');mkdir('hmms/hmm5');
mkdir('model/proto');mkdir('training');
%generate 'config'
cd('training');
fid = fopen('config','w');
fprintf(fid,'SOURCEFORMAT =HTK\n');
fprintf(fid,'TARGETKIND = MFCC_E\n');
fclose(fid);
cd ..
%
cd ..;cd ..