clc;
close all;
clear all;
WUW='ix';
WUW1='and';
wavFiles = find_wav('F:/项目/语音/SpeechCorpus/TIMIT/train');
phnFiles = find_phn('F:/项目/语音/SpeechCorpus/TIMIT/train');
y={};
wav_WUW={};
length=size(phnFiles,1);
for idx = 1:length
    wavFile = strtrim(wavFiles(idx,:));
    phnFile = strtrim(phnFiles(idx,:));
    wrdFile = [wavFile(1:end-3), 'wrd'];
   fid=fopen(phnFile);
   allData = fread(fid, inf, 'char');
   fclose(fid);
   new=sprintf('%s', allData);
   [a,b,s] = strread(new,'%d%d%s','delimiter',',');
   fid1=fopen(wrdFile);
   allData1 = fread(fid1, inf, 'char');
   fclose(fid1);
   new1=sprintf('%s', allData1);
   [a1,b1,s1] = strread(new1,'%d%d%s','delimiter',',');
   location=find(cellfun(@(x) strcmp(x,WUW),s));  %唤醒词出现的位置 
   if (isempty(location)==0)
       h=size(location,1);
       for i=1:h
       start=a(location(i,:),:);
       endpoint=b(location(i,:),:);
       if(s{location(i,:)+1}=='n')
           if(any(a1==start)==1)
               [m,n]=find(a1==start);
               if (strcmp(s1{m},WUW1)==1)
       y{i} = wavread(wavFile,[start endpoint]);
       wav_WUW{end+i} = y{i};
               end
           end
       end
       end               %得到了and的样本点
   end
end
 id = cellfun('length',wav_WUW);
wav_WUW(id==0)=[];