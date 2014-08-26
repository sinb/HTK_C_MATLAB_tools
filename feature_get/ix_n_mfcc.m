clc;
close all;
clear all;
load ix_n.mat;
length=size(wav_WUW,2);
feature={};
for i=1:length
[mc,t] = mfcc(wav_WUW{i});
feature{i}=[mc,t];
end
