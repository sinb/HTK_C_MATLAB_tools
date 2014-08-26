function l_mc = lpcmfcc(x)
% Ԥ�����˲���
xx=double(x);
xx=filter([1 -0.9375],1,xx);
 
% �����źŷ�֡
xx=enframe(xx,256,128);

%����Mel�����˲�����DCTϵ��
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
% DCTϵ��,12*24
for k=1:12
  n=0:23;
  dctcoef(k,:)=cos((2*n+1)*k*pi/(2*24));
end
% ��һ��������������
w = 1 + 6 * sin(pi * [1:12] ./ 12);
w = w/max(w);
n1=12; %LPC����

% ����ÿ֡��MFCC����
for i=1:size(xx,1)                %size(xx,1)����xx��ά��
  y = xx(i,:);
  s = y' .* hamming(256);          %�˴�
  L=lpc(s,n1)  ;                   %��LPCϵ��
  t = abs(fft(L));                %FFT�任
  t = spectrogram(t);             %����spectrogram
  t = t.^2;                       %��������
  c1=dctcoef * log(F * t(1:129));  % dctcoefΪDCTϵ���� bank��һ��mel�˲�����ϵ��
  c2 = c1.*w';                    % wΪ��һ��������������
  m(i,:)=c2';
  l_mc=m;
end
