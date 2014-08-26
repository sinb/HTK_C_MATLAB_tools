function l_mc = lpcmfcc(x)
% 预加重滤波器
xx=double(x);
xx=filter([1 -0.9375],1,xx);
 
% 语音信号分帧
xx=enframe(xx,256,128);

%计算Mel三角滤波器和DCT系数
fh=20000;
melf=2595*log(1+fh/700);
M=24;
i=0:25;
f=700*(exp(melf/2595*i/(M+1))-1);
N=256;
for m=1:24
    for k=1:256
        x=fh*k/N;
        if (f(m)<=x)&&(x<=f(m+1))
            F(m,k)=(x-f(m))/(f(m+1)-f(m));
        else if (f(m+1)<=x)&&(x<=f(m+2))
                F(m,k)=(f(m+2)-x)/(f(m+2)-f(m+1));
            else
                F(m,k)=0;
            end
        end
    end
end
% DCT系数,12*24
for k=1:12
  n=0:23;
  dctcoef(k,:)=cos((2*n+1)*k*pi/(2*24));
end
% 归一化倒谱提升窗口
w = 1 + 6 * sin(pi * [1:12] ./ 12);
w = w/max(w);
n1=12; %LPC阶数

% 计算每帧的MFCC参数
for i=1:size(xx,1)                %size(xx,1)返回xx的维数
  y = xx(i,:);
  s = y' .* hamming(256);          %乘窗
  L=lpc(s,n1)  ;                   %求LPC系数
  t = abs(fft(L));                %FFT变换
  t = spectrogram(t);             %计算spectrogram
  t = t.^2;                       %计算能量
  c1=dctcoef * log(F * t(1:129));  % dctcoef为DCT系数， bank归一化mel滤波器组系数
  c2 = c1.*w';                    % w为归一化倒谱提升窗口
  m(i,:)=c2';
  l_mc=m;
end
