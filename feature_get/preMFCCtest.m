clear;clc
[speech,fs,nbits] = wavread('turan16000mono.wav');
[mc,en] = mfcc(speech); 
mfcc_ours = mc;
en_ours = en;
filename = 'turan16000monoMFCCours.mat';
delete(filename);
save(filename,'en_ours','mfcc_ours');
