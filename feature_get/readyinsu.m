function phoneme=readyinsu(path)
files = find_phn(path);%path'F:/项目/语音/SpeechCorpus/TIMIT/test'
   file = strtrim(files(1,:));
   fid=fopen(file);
   allData = fread(fid, inf, 'char');
   length=size(files,1)
for fileIdx = 2:length
   file = strtrim(files(fileIdx,:));
   fid=fopen(file);
   newData = fread(fid, inf, 'char');
   fclose(fid);
   allData=[allData;newData];
end
   new=sprintf('%s', allData);
   [a,b,s] = strread(new,'%d%d%s','delimiter',',');
  % [nrows,ncols]= size(s);
   phoneme=tabulate(s);   %得到了音素的种类和出现的次数，频数
  
