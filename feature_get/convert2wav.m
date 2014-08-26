%SPHERE to wav
clear
fs = 16000;
N = 16;
files = find_wav('F:/œÓƒø/”Ô“Ù/SpeechCorpus');
for fileIdx = 1:length(files)
    file = strtrim(files(fileIdx, :));
    fileID = fopen(file);
    
    % check the header of the file to avoid mistaken operations
    head = fread(fileID, 1024, 'char*1');
    headStr = sprintf('%s', head(1:7));
    if(~strcmp(headStr, 'NIST_1A'))
        fclose(fileID);
        continue;
    end
    frewind(fileID);
    
    allData = fread(fileID, inf, 'short');
    fclose(fileID);
    
    delete(file);
    
    wavwrite(allData(513:end)./32768, fs, N, file);    %SPHERE 1024 bytes for the header
end
