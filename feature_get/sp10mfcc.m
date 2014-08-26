clear;clc
wav_file = 'sp10.wav';
[ speech, fs, nbits ] = wavread( wav_file );
[mc,en] = mfcc(speech);