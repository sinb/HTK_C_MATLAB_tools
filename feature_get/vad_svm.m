clear all;
clc;
close all;
[x,fs,bits,opt_ck]=wavread('E:\turan.wav');
mc_f= mfcc(x);
mc=mc_f(:,1:5);
%en = energe(x);
%x_fea=[mc,en];  %特征值：每一帧6x1
x_fea=mc;
h_fea=size(x_fea,1);  %帧数
n_fea=size(x_fea,2);  %每一帧特征值个数
l_win=20;        %窗长：20帧
n_win=h_fea-l_win+1;       %窗数
K=n_fea*l_win;  %每一个窗的特征值个数
%--窗函数--%
x_fe=x_fea';
x_v=x_fe(:);
x_v=x_v';
x_win=zeros(K,n_win); 
    n=K+1;
for i=1:n_win
    x_win(:,i)=x_v(n+i-K:1:n+i-1);
end   
x_win=x_win';
%-VAD后关于声音的起始点和终点--%
spoint=4018;
epoint=24784;
s_fra=spoint/128; 
s=ceil(s_fra);    %语音起始点所在的帧数
e_fra=epoint/128; 
e=ceil(e_fra);    %语音结束点所在的帧数
%--确定声音后静音段的位置和SVM训练集的标签--%
   if(s<=11&&e>=n_win-10)  
     x_lable=ones(n_win,1); 
   elseif(s<=11&&e<n_win-10)
     x_lable(1:e+10,:)=ones(e+10,1);
     x_lable(e+11:n_win,:)=-ones(n_win-e-10,1);
   elseif(s>11&&e<n_win-10)
     x_lable(1:s-11,:)=-ones(s-11,1);
     x_lable(s-10:e+10,:)=ones(e-s+21,1);
     x_lable(e+11:n_win,:)=-ones(n_win-e-10,1);
   else 
     x_lable(1:s-11,:)=-ones(s-11,1);
     x_lable(s-10:n_win,:)=ones(n_win-s+11,1);     
   end          
%--SVM训练集:特征向量加标签--%
xtrain=[x_win,x_lable];

%--SVM训练集的标签--%
%      x_lable(1:s(:,1)-11,:)=-ones(s(:,1)-11,1);
%      x_lable(s(:,1)-10:e(:,1)+10,:)=ones(e(:,1)-s(:,1)+21,1);
%      for i=2:n_point-1
%      x_lable(e(:,i-1)+11:s(:,i)-11,:)=-ones(s(:,i)-e(:,i-1)-21,1);
%      x_lable(s(:,i)-10:e(:,i)+10,:)=ones(e(:,i)-s(:,i)+21,1);
%      end
%      x_lable(e(:,n_point-1)+11:s(:,n_point)-11,:)=-ones(s(:,n_point)-e(:,n_point-1)-21,1);
%      x_lable(s(:,n_point)-10:e(:,n_point)+10,:)=ones(e(:,n_point)-s(:,n_point)+21,1);
%      x_lable(e(:,n_point)+11:n_win,:)=-ones(n_win-e(:,n_point)-10,1);
     





