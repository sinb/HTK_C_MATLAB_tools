function [mfcce] = mfcc_e(x)
% Ԥ�����˲���
xx=double(x);
xx=filter([1 -0.9375],1,xx);
 
% �����źŷ�֡
xx=enframe(xx,256,128);

%����Mel����˲�����DCTϵ��
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
% ��һ�����������
w = 1 + 6 * sin(pi * [1:12] ./ 12);
w = w/max(w);
%
min_normalize = [-27.7970845253125,-20.8145836115148,-28.0039790609293,-14.4838519188106,-46.4641638729450,-22.1668673438722,-24.6694905475291,-14.5919938529450,-10.4602708584816,-13.8259446566945,-5.20812985597622,-2.23915240238937;];
max_normalize = [12.1315933383664,20.8236777707446,24.1361586913599,35.4965441016701,22.4539882512168,28.8656399123396,18.3502638428051,18.2674583526762,15.5623422986538,9.29018925316300,6.93839892935411,1.58613671287737;];
%
% ����ÿ֡��MFCC����
for i=1:size(xx,1)                %size(xx,1)����xx��ά��
  y = xx(i,:);
  s = y' .* hamming(256);          %�˴�
  sf=fft(s);
%[sp,f1,t1]=spectrogram(sf,256,128,256);        %spectrogram�任       
  t = abs(sf);                %FFT�任
  t = t.^2; %��������
  if sum(t) < 700
        en(i,:)=sum(t) / 700;
  else
        en(i,:) = 1;
  end
  c1=dctcoef * log(F * t);  % dctcoefΪDCTϵ�� bank��һ��mel�˲�����ϵ��
  c2 = c1.*w';                    % wΪ��һ�����������
  mc(i,:)=c2';
  
%     for counter = 1:1:12
%         if mc(i,counter) > max_normalize(counter)
%             mc(i,counter) = 1;
%             continue;
%         end        
%         if mc(i,counter) < min_normalize(counter)
%             mc(i,counter) = 0;
%             continue;
%         end
%         if (mc(i,counter) > min_normalize(counter)) && (mc(i,counter) < max_normalize(counter))
%            mc(i,counter) = (mc(i,counter) - min_normalize(counter)) / (max_normalize(counter) - min_normalize(counter));
%         end
%     end
%     
  
end
mfcce = [mc,en];
