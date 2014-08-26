clc;
close all;
clear all;
WUW='and';
wavFiles = find_wav('F:/项目/语音/SpeechCorpus/TIMIT/test/dr1/faks0');
y={};
wav_WUW={};
length=size(wavFiles,1);
for idx = 1:length
    wavFile = strtrim(wavFiles(idx,:));
    wrdFile = [wavFile(1:end-3), 'wrd'];
   fid=fopen(wrdFile);
   allData = fread(fid, inf, 'char');
   fclose(fid);
   new=sprintf('%s', allData);
   [a,b,s] = strread(new,'%d%d%s','delimiter',',');
   location=find(cellfun(@(x) strcmp(x,WUW),s));  %唤醒词出现的位置 
   if (isempty(location)==0)
       h=size(location,1);
       for i=1:h
       start(i,:)=a(location(i,:),:);
       endpoint(i,:)=b(location(i,:),:);
       y{i} = wavread(wavFile,[start(i,:) endpoint(i,:)]);
       wav_WUW{end+i} = y{i};
       end               %得到了and的样本点
   end
end
 id = cellfun('length',wav_WUW);
wav_WUW(id==0)=[];