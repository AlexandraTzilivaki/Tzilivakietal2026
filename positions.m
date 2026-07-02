%  Simple script to create the x,y,z points for the CA1 network neurons, in
%  order to create te stratum layers. written by Alexandra Tzilivaki (D.
%  Schmitz lab) Charite Berln 2022 alexandra.tzilivaki@charite.de


% str. oriens --> Pyr basal dends and OLM somata  y size 120microns
%str. pyramidale --> Pyr, PV BCs and a number of PV BSC and AAC somata
%100 microns y size
%str. radiatum --> apical Pyr dendrites, a few PV CA3 input, 200 microns
%str lac mol. --> VIP CR/CCK somata, apical tuft of Pyrs, axons of OLMs


%Z axis for all

z=linspace(-5,5,174)
z=z'
z=z(randperm(length(z)))

%pyrs

xpyr=linspace(-2250,2250,150) %150*25 microns=3750 a bit less
% y=((log(x)))

ypyr=0.5*((xpyr).^2)

% y=(-5*(exp(-x.^2)))
ypyr=(ypyr- min(ypyr))/(max(ypyr)-min(ypyr))*100

ypyr=ypyr'
ypyr=flipud(ypyr)
xpyr=xpyr'


%aac 3 
xaac=[-1095, 0, 1119]
yaac=[108, 49, 4]

%basket
%rad 2 pyr 9 or 1
xbc=linspace(-1200,1200,9) %150*25 microns=3750 a bit less

 ybc=randi([10,130],1,9) %random distribution


%bsc
ybsc=[-11, 112, 29,77,48,102]
% xbsc=[-1042, 49, 220,901,-555,-22]
xbsc=linspace(-1200,1200,6) %150*25 microns=3750 a bit less

%olm
% xolm=[-1053, 6, 1173]
yolm=[-176, -194, -131]
xolm=linspace(-1200,1200,3) %150*25 microns=3750 a bit less

xbc=xbc'
xaac=xaac'
xbsc=xbsc'
xolm=xolm'
ybc=ybc'
yaac=yaac'
ybsc=ybsc'
yolm=yolm'

xrandom=[xpyr;xbc;xbsc;xaac;xolm]

yrandom=[ypyr;ybc;ybsc;yaac;yolm]

plot(xpyr',ypyr, 'b*')
hold on;
plot(xbc,ybc, 'r*')
hold on;
plot(xbsc,ybsc, 'g*')
hold on;
plot(xaac,yaac, 'm*')
hold on;
plot(xolm,yolm, 'y*')

csvwrite('Zrandom.txt',z)
csvwrite('Xrandom.txt',xrandom)
csvwrite('Yrandom.txt',yrandom)

