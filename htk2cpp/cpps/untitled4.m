fid = fopen('test.cpp','w');
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
            fprintf(fid,'%f',LPCCEmixmat1(i,j));
        else
            fprintf(fid,'%f, ',LPCCEmixmat1(i,j));
        end   
     end
     fprintf(fid,'\n');
 end
 fprintf(fid,'};\n');
 fclose(fid);
 
 
 
 