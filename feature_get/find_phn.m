function [phn_files] = find_phn( path )
%FIND_WAV, find all wav files recursively

phn_files = [];
if(isdir(path) == 0)
    return;
end

path_files = dir(path);
fileNum = length(path_files);
for k= 3:fileNum
    file = [path, '/', path_files(k).name];
    if (path_files(k).isdir == 1)
        ret = find_phn(file);
        if(isempty(ret) ~= 1)
            if(isempty(phn_files))
                phn_files = char(ret);
            else
                phn_files = char(phn_files, ret);
            end
        end
    elseif strfind(path_files(k).name, '.phn')
        if(isempty(phn_files))
            phn_files = char(file);
        else
            phn_files = char(phn_files, file);
        end
    end
end