function modelParameterWeightToCpp(filename)
    outfilename = ['../cpps/' filename 'Weight.cpp'];
    hmms = read_htk_hmm(filename);
    txt = read_text_file(filename);
    states = hmms.nstates;
    mixes = hmms.gmms(1,1).nmix;
    mixmat1 = zeros(states,mixes);

    for i = 1:1:hmms.nstates
        STATE_ln = 9 + (32 + 6*(hmms.gmms(1,1).nmix - 5)) * (i - 1);
        for j = 1:1:hmms.gmms(1,1).nmix
            [i+1,j,STATE_ln + 6 *(j-1)];
            a = cell2mat(txt(STATE_ln + 6 *(j-1)));
            a = regexp(a, '\s+', 'split');
            a = cell2mat(a(3));
            a = str2num(a);
            mixmat1(i,j) = a;
        end
    end
  %  save(['../mats/' outfilename 'LPCCEmixmat1.mat'],'LPCCEmixmat1');
    %begin to write cpp file
    fid = fopen(outfilename,'w');
    comma = ',';
    prefix = '{'; 
    suffix = '}';
    numbers = '';
    lines = ['double modelParameterWeight[' ...
        num2str(hmms.nstates) '][' num2str(hmms.gmms(1,1).nmix) ...
         ']' '= {' ];
     fprintf(fid,'%s\n',lines);
     for i = 1:1:10
         for j = 1:1:5
            if j==5
                fprintf(fid,'%f', mixmat1(i,j));
            else
                fprintf(fid,'%f, ', mixmat1(i,j));
            end   
         end
         fprintf(fid,'\n');
     end
     fprintf(fid,'};\n');
     fclose(fid);
    %write end
    
end
