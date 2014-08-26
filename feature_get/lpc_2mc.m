%function lpc_mccc = lpc_2mc(x)    %���lpc_mfcc������һ�ף����ײ��ϵ��
function l_mc = lpc_2mc(x)
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
n1=255; %LPC����

%use the fllowing arrays as the max_normalize[] and mix_normalize[]
max_normalize = [6.53203634537046,23.9716029409051,22.4806678307711,11.1036457769023,39.4786515757917,19.4061219070162,27.0071501095028,10.6332732480504,10.6925692836314,12.1024330880607,4.70214607080530,2.59155921100735;];
min_normalize = [-25.3900445187693,-16.4518054194880,-24.1085492609997,-30.9343437314689,-12.9566438599773,-27.9205969087598,-14.3026667951887,-17.4446670246811,-16.7176188638698,-12.0732822876804,-9.00772266144848,-1.73879339710944;];


% ����ÿ֡��MFCC����
for i=1:size(xx,1)                %size(xx,1)����xx��ά��
  y = xx(i,:);
  s = y' .* hamming(256);          %�˴�
  L=lpc(s,n1);                     %��LPCϵ��
  t = fft(L);                %FFT�任
  sf=t';
  %[sp,f1,t1]=spectrogram(sf,256,128,256);        %spectrogram�任       
  sp = sf;
  t = abs(sp);                %FFT�任
  t = t.^2;                       %��������
  c1=dctcoef * log(F * t);  % dctcoefΪDCTϵ�� bank��һ��mel�˲�����ϵ��
  c2 = c1.*w';                    % wΪ��һ�����������
  l_mc(i,:)=c2';                %lpc_mfcc����       
  for counter = 1:1:12
        if l_mc(i,counter) > max_normalize(counter)
            l_mc(i,counter) = 1;
            continue;
        end        
        if l_mc(i,counter) < min_normalize(counter)
            l_mc(i,counter) = 0;
            continue;
        end
        if (l_mc(i,counter) > min_normalize(counter)) && (l_mc(i,counter) < max_normalize(counter))
           l_mc(i,counter) = (l_mc(i,counter) - min_normalize(counter)) / (max_normalize(counter) - min_normalize(counter));
        end
    end
end
%��ȡlpc_mfccһ�ײ��ϵ��
dtm = zeros(size(l_mc));
for i=3:size(l_mc,1)-2
  dtm(i,:) = -2*l_mc(i-2,:) - l_mc(i-1,:) + l_mc(i+1,:) + 2*l_mc(i+2,:);
end
dtm = dtm / 3;

%��ȡlpc_mfcc���ײ��ϵ��
dtmm=zeros(size(dtm));
for i=3:size(dtm,1)-2
dtmm(i,:)=-2*dtm(i-2,:)-dtm(i-1,:)+dtm(i+1,:)+2*dtm(i+2,:);
end
dtmm=dtmm/3;

%�ϲ�lpc_mfccc����һ�ײ�ֲ���Ͷ��ײ�ֲ���
lpc_mccc=[l_mc dtm dtmm];
%ȥ����β��֡����Ϊ����֡��һ�ײ�ֲ���Ϊ0
lpc_mccc = lpc_mccc(3:size(l_mc,1)-2,:);
