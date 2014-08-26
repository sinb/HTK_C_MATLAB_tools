function modelParameterMeanVarToCpp(filename)
%filename = 'hmm_460tiantianmfcce_10_state';
%outfilename = 'a.cpp';
outfilename = [filename 'MeanVar.cpp'];
fid=fopen(['../cpps/' outfilename],'w');
hmms = read_htk_hmm(filename);

lines = ['float modelParameterMean[' ...
    num2str(hmms.nstates) '][' num2str(hmms.gmms(1,1).nmix) ...
     '][' num2str(size(hmms.gmms(1,1).means,1)) '] = {' ];
%display float modelParameterMean[8][5][13] = {
 fprintf(fid,'%s',lines);
fprintf(fid,'\n\t');

comma = ',';
prefix = '{'; 
suffix = '}';
numbers = '';

for i = 1:1:hmms.nstates
    a = hmms.gmms(1,i).means';
    numbers = [numbers prefix];
    for j = 1:1:hmms.gmms(1,1).nmix
           numbers = [numbers prefix];
        for k = 1:1:size(hmms.gmms(1,1).means,1)
           %  numbers = [ prefix numbers suffix]; 
           %a(j,k); a(j,k) is jth gmm's kth mean value;
           if k == size(hmms.gmms(1,1).means,1) 
               numbers = [ numbers num2str(a(j,k))];
           else
               numbers = [ numbers num2str(a(j,k)) comma];
           end
           
        end
           if j == hmms.gmms(1,1).nmix
                numbers = [ numbers suffix char(10) char(9)];
           else
                numbers = [ numbers suffix comma ' ' char(10) char(9)];
           end
    end
    numbers = [numbers suffix comma char(10)];
end
numbers(size(numbers,2)-1) = [];
numbers = [numbers '};'];
fprintf(fid,'%s',numbers);

fprintf(fid,'\n\t');
lines = ['float modelParameterVar[' ...
    num2str(hmms.nstates) '][' num2str(hmms.gmms(1,1).nmix) ...
     '][' num2str(size(hmms.gmms(1,1).means,1)) '] = {' ];
%display float modelParameterVar[8][5][13] = {
fprintf(fid,'%s',lines);
fprintf(fid,'\n\t');
numbers = '';
for i = 1:1:hmms.nstates
    a = hmms.gmms(1,i).covars';
    numbers = [numbers prefix];
    for j = 1:1:hmms.gmms(1,1).nmix
           numbers = [numbers prefix];
        for k = 1:1:size(hmms.gmms(1,1).means,1)
           %  numbers = [ prefix numbers suffix]; 
           %a(j,k); a(j,k) is jth gmm's kth mean value;
           if k == size(hmms.gmms(1,1).means,1) 
               numbers = [ numbers num2str(a(j,k))];
           else
               numbers = [ numbers num2str(a(j,k)) comma];
           end
           
        end
           if j == hmms.gmms(1,1).nmix
                numbers = [ numbers suffix char(10) char(9)];
           else
                numbers = [ numbers suffix comma ' ' char(10) char(9)];
           end
    end
    numbers = [numbers suffix comma char(10)];
end
numbers(size(numbers,2)-1) = [];
numbers = [numbers '};'];
fprintf(fid,'%s',numbers);

fclose(fid);
finished = 'finished'
end