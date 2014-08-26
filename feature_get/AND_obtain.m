clc;
close all;
clear all;
WUW='and';
wavFiles = find_wav('F:/��Ŀ/����/SpeechCorpus/TIMIT/test/dr1/faks0');
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
   location=find(cellfun(@(x) strcmp(x,WUW),s));  %���Ѵʳ��ֵ�λ�� 
   if (isempty(location)==0)
       h=size(location,1);
       for i=1:h
       start(i,:)=a(location(i,:),:);
       endpoint(i,:)=b(location(i,:),:);
       y{i} = wavread(wavFile,[start(i,:) endpoint(i,:)]);
       wav_WUW{end+i} = y{i};
       end               %�õ���and��������
   end
end
 id = cellfun('length',wav_WUW);
wav_WUW(id==0)=[];