clear;clc
dir = '/home/sinb/Desktop/ASCCD/DATAANNO/lab/';
gender = {'f', 'm'};
people = {'001','002','003','004','005'};
article = {'001','002','003','004','005','006','007','008','009','010','011','012','013','014'...
    ,'015','016','017','018'};
paragraph = {'01','02','03','04','05','06','07','08','09','10'};

t_i_struct = [];%final result store here
for genderID = 1:1:2
    for peopleID = 1:1:5
        foldername = [gender{genderID} people{peopleID} 'lab/']
        for articleID = 1:1:18
            for paragraphID = 1:1:10
                
                filename = [dir foldername gender{genderID} people{peopleID} article{articleID}...
                    '_' paragraph{paragraphID} '.TextGrid']
                
                if ~exist(filename)
                    break;
                end
                    
                %filename = 'f001001_01.TextGrid';
                fid = fopen(filename, 'r');
                
                while ~feof(fid)
                    beginItem = fgetl(fid);%read a line
                    beginItem(find(isspace(beginItem))) = [];%delete the space
                    if strcmp(beginItem, 'item[1]:') %find the desired data
                        a = fgetl(fid);% skip five lines
                        a = fgetl(fid);
                        a = fgetl(fid);
                        a = fgetl(fid);
                        a = fgetl(fid);  
                %       this is the real thing!
                        intervalsIDStr = [];
                        xminStr = [];
                        xmaxStr = [];
                        textStr = [];
                        while 1
                            intervalsIDStr = fgetl(fid);
                            xminStr = fgetl(fid);
                            xmaxStr = fgetl(fid);
                            textStr = fgetl(fid);
                            if (strcmp(intervalsIDStr,'    item [2]:') || ...
                                    strcmp(xminStr,'    item [2]:') || ...
                                    strcmp(xmaxStr,'    item [2]:') || ...
                                    strcmp(textStr,'    item [2]:') ) == 1
                                'reading finished';
                                break;
                            end
                            %start finding "t+i",and save these 4 parameter into a cell;
                            %first split the string according to SPACE
                            intervalsIDStr = regexp(intervalsIDStr, ' +', 'split');
                            xminStr = regexp(xminStr, ' +', 'split');
                            xmaxStr = regexp(xmaxStr, ' +', 'split');
                            textStr = regexp(textStr, ' +', 'split');
                            %judge if textStr{4} == '"t+i"'
                            if strcmp(textStr{4},'"t+i"')
                                findOne.intervalsID = [filename '_' intervalsIDStr{3}];
                                %findOne.intervalsID = [gender{genderID} people{peopleID} article{articleID}...
                   % '_' paragraph{paragraphID} '_' intervalsIDStr{3}];
                                
                                findOne.xmin = str2num(xminStr{4});
                                findOne.xmax = str2num(xmaxStr{4});
                                findOne.lab = textStr{4};
                                t_i_struct = [t_i_struct, findOne];
                            end
                        end     
                    end
                end
                fclose(fid);
                
                
            end
        end
    end    
end      