function dlmcell(file,cell_arr,delim,perm,endline)

% dlmcell(file,cell_arr,delim,perm)
% Write a cell array of strings or numerics to text file
%
% - file output filename [string]
% - cell_arr cell array to be written [cell]
% - delim [optionnal] defines the delimiter symbol
% (default is a tab: '\t')
% - permission [optionnal] defines the permission
% 'w' for write (default)
% 'a' for append
% - endline [optionnal] define a string to append at the end
% of each line
%
% Written by B.Delhaye, february 2013, updated december 2013

% check inputs
if(nargin<2)
  disp('Error - You must specify an output filename and a cell array!');
  return;
end
if(~ischar(file))
  disp('Error - file should be a string !');
  return;
end
isnumber=cellfun(@isnumeric,cell_arr);
isstring=cellfun(@ischar,cell_arr);
if(~all(isnumber|isstring))
  disp('Error - cell_arr does not contain only string or numerics !');
  return;
end
if(nargin==2),  delim='\t';  perm='w';  endline='';end
if(nargin==3),  perm='w';  endline='';end
if(nargin==4),  endline='';end
if(isempty(endline)),  offset=1;else  offset=2;end
[nrows, ncols]=size(cell_arr);

% create default line
a={['%s' delim]};
formatall=[a(ones(1,ncols)) endline '\r\n'];

% write to file line by line
output_file = fopen(file,perm);
for row=1:nrows
  format=formatall;
  [format{isnumber(row,:)}]=deal(['%g' delim]);
  % rem last column delim
  format{end-offset}=format{end-offset}(1:end-length(delim));
  fprintf(output_file,[format{:}],cell_arr{row,:});
end
fclose(output_file);
