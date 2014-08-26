clc;
close all;
clear all;
path='F:/项目/语音/SpeechCorpus/TIMIT/test//dr1/faks0';
phoneme=readyinsu(path);
files = find_phn( path );
wavFiles = find_wav(path);
y={};
wav_phonme={};
length=size(files,1);
for fileIdx = 1:length
   wavFile = strtrim(wavFiles(fileIdx,:));
   file = strtrim(files(fileIdx,:));
   fid=fopen(file);
   allData = fread(fid, inf, 'char');
   fclose(fid);
   new=sprintf('%s', allData);
   [a,b,s] = strread(new,'%d%d%s','delimiter',',');
    location=find(cellfun(@(x) strcmp(x,phoneme(2,1)),s));  %每一个音素出现的位置 
   if (isempty(location)==0)
       h=size(location,1);
       for i=1:h
       start(i,:)=a(location(i,:),:);
       endpoint(i,:)=b(location(i,:),:);
       y{i} = wavread(wavFile,[start(i,:) endpoint(i,:)]);
       wav_phonme{end+i} = y{i};
       end 
   end
end
id = cellfun('length',wav_phonme);
wav_phonme(id==0)=[];
  
   
   