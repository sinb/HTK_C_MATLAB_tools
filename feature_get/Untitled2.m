clear;clc
speech = [1:256]';
fs = 16000;
           Tw = 16;           % analysis frame duration (ms)
           Ts = 8;           % analysis frame shift (ms)
           alpha = 0.9375;      % preemphasis coefficient
           R = [ 300 3700 ];  % frequency range to consider
           M = 24;            % number of filterbank channels 
           C = 13;            % number of cepstral coefficients
           L = 22;            % cepstral sine lifter parameter
           
[ CC, FBE, frames ] = mfcc3( speech, fs, Tw, Ts, alpha, window, R, M, N, L )