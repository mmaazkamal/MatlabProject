%% read guids
guids=getappdata(0,'k');
activeGuid=guids(:,:,2);

%% read audio
[y, FSS]=wavread('papa.wav');
audio1=(.49*y)/max(y(:,1));

%% create signatures

nbits=5; amp=.49; Fs=FSS; p=.05; pc=.05;
t = [0:p*Fs+1]/Fs; tc = [0:pc*Fs+1]/Fs;

Fs = 19900; F1 = 19300; F0 = 19600;

% sync
ys=amp*cos(2*pi*Fs*tc);
Ls=length(ys);
ws=hann(Ls);
ys=times(ys,ws');

% bits
y1=amp*cos(2*pi*F1*t);

L=length(y1);
w=hann(L);
y1=times(y1,w');

y0=amp*cos(2*pi*F0*t);
y0=times(y0,w');
%% embed signature
% define bits
delay= (nbits+1)*Ls +nbits*L;
time1=5;
sindex=time1*FSS; 
sindexAdjusted=sindex-delay;

yb=[];
for i=1:length(activeGuid)
    if(activeGuid(i))==0
yb(:,:,i)=y0;
    elseif (activeGuid(i))==1
        yb(:,:,i)=y1;
    end

end

%%

j1=sindexAdjusted;
data=audio1;
T=L;
Tc=Ls;
incrementBit=1;

data(Tc+j1+1:2*Tc+j1,1)=data(Tc+j1+1:2*Tc+j1,1)+ys';
Watermarking(1:Tc)=ys';
i1=Tc+1;
i2=Tc+Tc;
index1=2*Tc+j1+1;
    index2=2*Tc+j1+Tc;

    
 data(index1:index2,1)=data(index1:index2,1);
Watermarking(i1:i2)=0;
i1=i2+1;
i2=i2+T;
index1=index2+1;
    index2=index2+T;
    
    
    data(index1:index2,1)=data(index1:index2,1)+yb(:,:,1)';
Watermarking(i1:i2)=yb(:,:,1)';
i1=i2+1;
i2=i2+Tc;
index1=index2+1;
    index2=index2+Tc;
    
    
      data(index1:index2,1)=data(index1:index2,1);
Watermarking(i1:i2)=0;
i1=i2+1;
i2=i2+Tc;
index1=index2+1;
    index2=index2+Tc;
    
    
    

data(index1:index2,1)=data(index1:index2,1)+ys';
Watermarking(i1:i2)=ys';
i1=i2+1;
i2=i2+Tc;
index1=index2+1;
    index2=index2+Tc;
    
    
    
      data(index1:index2,1)=data(index1:index2,1);
Watermarking(i1:i2)=0;
i1=i2+1;
i2=i2+T;
index1=index2+1;
    index2=index2+T;
    
    
    
    
    
    data(index1:index2,1)=data(index1:index2,1)+yb(:,:,2)';
Watermarking(i1:i2)=yb(:,:,2)';
i1=i2+1;
i2=i2+Tc;
index1=index2+1;
    index2=index2+Tc;

    
    
      data(index1:index2,1)=data(index1:index2,1);
Watermarking(i1:i2)=0;
i1=i2+1;
i2=i2+Tc;
index1=index2+1;
    index2=index2+Tc;
    
    
    
    
data(index1:index2,1)=data(index1:index2,1)+ys';
Watermarking(i1:i2)=ys';
i1=i2+1;
i2=i2+Tc;
index1=index2+1;
    index2=index2+Tc;
    
    
      data(index1:index2,1)=data(index1:index2,1);
Watermarking(i1:i2)=0;
i1=i2+1;
i2=i2+T;
index1=index2+1;
    index2=index2+T;
    
    
    
    
    
    data(index1:index2,1)=data(index1:index2,1)+yb(:,:,3)';
Watermarking(i1:i2)=yb(:,:,3)';
i1=i2+1;
i2=i2+Tc;
index1=index2+1;
    index2=index2+Tc;

    
    
      data(index1:index2,1)=data(index1:index2,1);
Watermarking(i1:i2)=0;
i1=i2+1;
i2=i2+Tc;
index1=index2+1;
    index2=index2+Tc;
    
    
    
    
data(index1:index2,1)=data(index1:index2,1)+ys';
Watermarking(i1:i2)=ys';
i1=i2+1;
i2=i2+Tc;
index1=index2+1;
    index2=index2+Tc;
    
    
    
    
    
      data(index1:index2,1)=data(index1:index2,1);
Watermarking(i1:i2)=0;
i1=i2+1;
i2=i2+T;
index1=index2+1;
    index2=index2+T;
    
    
    
    
    
    data(index1:index2,1)=data(index1:index2,1)+yb(:,:,4)';
Watermarking(i1:i2)=yb(:,:,4)';
i1=i2+1;
i2=i2+Tc;

index1=index2+1;
    index2=index2+Tc;

    
    
      data(index1:index2,1)=data(index1:index2,1);
Watermarking(i1:i2)=0;
i1=i2+1;
i2=i2+Tc;
index1=index2+1;
    index2=index2+Tc;
    
    
    
data(index1:index2,1)=data(index1:index2,1)+ys';
Watermarking(i1:i2)=ys';
i1=i2+1;
i2=i2+Tc;
index1=index2+1;
    index2=index2+Tc;
    
    
      data(index1:index2,1)=data(index1:index2,1);
Watermarking(i1:i2)=0;
i1=i2+1;
i2=i2+T;
index1=index2+1;
    index2=index2+T;
    
    data(index1:index2,1)=data(index1:index2,1)+yb(:,:,5)';
Watermarking(i1:i2)=yb(:,:,5)';
i1=i2+1;
i2=i2+Tc;

index1=index2+1;
    index2=index2+Tc;

    
      data(index1:index2,1)=data(index1:index2,1);
Watermarking(i1:i2)=0;
i1=i2+1;
i2=i2+Tc;

index1=index2+1;
    index2=index2+Tc;
    
    
    
data(index1:index2,1)=data(index1:index2,1)+ys';
Watermarking(i1:i2)=ys';

%% export audio
wavwrite(data,FSS, 'papa(out).wav');

% Window Waterking

wavwrite(Watermarking,FSS, 'WaterMark.wav');
