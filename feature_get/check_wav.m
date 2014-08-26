clear all;
files = find_wav('F:/œÓƒø/”Ô“Ù/SpeechCorpus');
for fileIdx = 1:length(files)
    file = strtrim(files(fileIdx,:));
    [y, fs, nbits] = wavread(file); %report error if it's not a wav file
    if(fs~=16000)
        fprintf('%s: fs~=16000\n', file);
    end
    if(nbits ~= 16)
        fprintf('%s: nbits ~= 16\n', file);
    end
end



