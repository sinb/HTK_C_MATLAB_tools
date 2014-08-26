function [features] = mfcc4(signal, samplingRate, windowSize, windowStep, numFrames)
%Extracts MFCC from audio signal.
%Input:
%signal: array of the audio signal
%samplingRate: sampling rate of the audio signal
%windowSize: size of the window in milliseconds (ms)
%hopsize: size of the hopsize for the overlapping of windows in
%         milliseconds (ms)
pre_emphasis=0.9375;
mel_channels=23; %uniformly distributed on mel-frequency scale from fe.min_freq to fe.max_freq
min_freq=64;
max_freq=floor(samplingRate/2);
ceps_coefN=30;
cepstrum_sighp_cutoff=1.4699654; %zero-pole high-pass filter cut-off frequency (~6db) as used in ES201_108 for DC offset removal
energy_floor_logE=-50; %frame energy
energy_floor_FB=-50; %filterbank


%high-pass filter for DC offset removal -> |H(cepstrum_sighp_cutoff)|=alpha
alpha=1/2;
w=2*pi/samplingRate*cepstrum_sighp_cutoff;
hp_b2=-cos(w); %half the 'b' coefficient of the second order equation (p^2*a + 2*p*b + c) which solves |(1-exp(-jw))/(1-p*exp(-jw))|=alpha
hp_c=1- 2*(1-cos(w))/alpha^2; %c coefficient of the second order equation (p^2*a + 2*p*b + c)
cepstrum_sighp_coeff=-hp_b2 - sqrt(hp_b2^2 - hp_c); %real solution of the above equation

%high-pass filtering (removing DC)
signal = filter([1 -1],[1 -cepstrum_sighp_coeff],signal); %from  ES201_108

%computing energy

sig2=signal.^2;
energy = zeros(numFrames,1);

for n=1:numFrames,
    from = (n-1)*windowStep + 1;
    to = from + windowSize - 1;
    energy(n,1)=mean(sig2(from:to));
end;

energy(:,1)=log(max(energy(:,1),exp(energy_floor_logE)));

%pre-emphasis
signal=filter([1 -pre_emphasis],1,signal);

%processing frames
features=zeros(numFrames,ceps_coefN-1);
fbank=zeros(1,mel_channels);

persistent dct_mat;
if isempty(dct_mat)
    dct_mat = DCTMatrix(mel_channels,ceps_coefN);
end
persistent fb;
if isempty(fb)
    fb = FilterBank(min_freq, max_freq, mel_channels, samplingRate, windowSize);
end

% computing cepstral coefficients
for n=1:numFrames
    from = (n-1)*windowStep + 1;
    to = from + windowSize - 1;
    fft_frame=abs(fft(signal(from:to).*hamming(windowSize)));
    
    for c=1:mel_channels,
        fbank(c)=sum(fft_frame(fb.mel_channels_edge(c):fb.mel_channels_edge(c+1)).*(1:fb.triangleLL(c))/fb.triangleLL(c));%lower frequency part
        fbank(c)=fbank(c)+sum(fft_frame(fb.mel_channels_edge(c+1)+1:fb.mel_channels_edge(c+2)).*(1-(1:fb.triangleRL(c)-1)/fb.triangleRL(c)));%higher frequency part
    end;
    
    %log operation normalize signal amplitude (volume variation won't affect mfcc so much, except for energy (c0, logE))
    fbank=log(max(fbank,exp(energy_floor_FB)));
    features(n,1:ceps_coefN-1)=fbank*dct_mat;
    
end;

%Energy is merged with MFCC features and labels
features = [energy, features];

return;

%===========================
%Used to speed up computations.

function dct_mat = DCTMatrix(mel_channels,ceps_coefN)
% DCT matrix
dct_mat=zeros(mel_channels,ceps_coefN-1);
for r=1:ceps_coefN-1,
    dct_mat(:,r)=r*((1:mel_channels)-0.5)';
end;
dct_mat=cos(dct_mat*pi/mel_channels);
return

function fb = FilterBank(min_freq, max_freq, mel_channels, samplingRate, windowSize)

% finding triangle filter-bank edges
const1=2595;
const2=700;
mel_range=const1*log10(1+[min_freq max_freq]/const2);
fb.mel_channels_edge=mel_range(1)+(mel_range(2)-mel_range(1))/(mel_channels+1)*(0:mel_channels+1); %a total of mel_channels+2 center frequencies
fb.mel_channels_edge=const2*(10.^(fb.mel_channels_edge/const1) - 1); %linear frequency scale
fb.mel_channels_edge=round(fb.mel_channels_edge/samplingRate*windowSize)+1;

%computing filter bank widths
fb.triangleLL=zeros(1,mel_channels);
fb.triangleRL=zeros(1,mel_channels);
for c=1:mel_channels,
    fb.triangleLL(c)=diff(fb.mel_channels_edge([c c+1]))+1;
    fb.triangleRL(c)=diff(fb.mel_channels_edge([c+1 c+2]))+1;
end;