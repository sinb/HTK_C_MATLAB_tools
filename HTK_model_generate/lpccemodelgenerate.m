function lpccemodelgenerate(foldernames,states,mixes,word,type)
%foldernames = 'model/proto'
%states = 8;
%mixes = 5;
%word = 'tiantian';
%type = 'lpcce';
modelname = [word '_' num2str(states) '_' num2str(mixes) '_' type];
%some constant
% Mean and Var
Mean13 = ['<Mean> 13' char(10) ];
Var13 = ['<Variance> 13' char(10)];
for i = 1:1:13
    Mean13 = [Mean13 num2str(0) ' ' ];
    Var13 = [Var13 num2str(1.0) ' ' ];
end
    Mean13 = [Mean13 char(10) ];
    Var13 = [Var13 char(10) ];
% TransP and EndHMM
TransP = ['<TransP> ' num2str(states) char(10)];
transitarray = zeros(states,states);
transitarray(1,2) = 1;
for i=2:1:states-1
    if(i+1 > states || i+2 > states)
        transitarray(i,i) = 0.5;
        transitarray(i,i+1) = 0.5;
        continue;
    else
        transitarray(i,i) = 0.5;
        transitarray(i,i+1) = 0.5;
        transitarray(i,i+2) = 0;
    end
end
for i=1:1:states
    for j = 1:1:states
       TransP = [TransP ' ' num2str(transitarray(i,j))];
    end
    TransP = [TransP char(10)];
end
TransP = [TransP '<EndHMM>'];
%

%'model/proto'

fid = fopen([foldernames '/' modelname],'w');
%output header
line1 = ['~o <VecSize> 13 <LPCEPSTRA_E>'];
line2 = ['~h "' modelname '"'];
line3 = ['<BeginHMM>'];
line4 = ['<NumStates> ' num2str(states)];
outstring = [line1 char(10) line2 char(10) line3 char(10) line4 char(10)];
fprintf(fid,'%s',outstring);
fprintf(fid,'\n');
outstring = [];
%output mean var
for i = 2:1:states-1
    StateNumMixes = ['<State> ' num2str(i) ' <NumMixes> ' num2str(mixes) char(10)];
    fprintf(fid,'%s',StateNumMixes);
    for j = 1:1:mixes
        MixtureN = ['<Mixture>' num2str(j) ' ' num2str(1/mixes) char(10)];
        MixtureN = [MixtureN Mean13 Var13];
        fprintf(fid,'%s',MixtureN);
    end
    fprintf(fid,'\n');
end
fprintf(fid,'%s',TransP);
fprintf(fid,'\n');
end