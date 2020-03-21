% Global thresholding
%T. W. Ridler and S. Calvard,” Picture Thresholding Using an Iterative Selection Method”, IEEE Transactions On Systems, Man, And Cybernetics, Vol. sMC-8, NO. 8, AUGUST (1978). 
clc
clear all
close all
im1=imread('cameraman.tif');
% im1=imread('coins.png');
%im1=imread('rice.png');
[n, m, N]=size(im1)
if N==3
im1=rgb2gray(im1);
end
hst=imhist(im1);

T0=128;
hi=0;
Shis=0;
for i=1:T0
hi=hi+i.*hst(i);
Shis=Shis+hst(i);
end
mu0=hi/Shis;
for i=T0:255
hi=hi+i.*hst(i);
Shis=Shis+hst(i);
end
mu1=hi/Shis;
T1=(mu0+mu1)/2;
T1=round(T1);
Seuil=abs(T1-T0);
while Seuil >= 1
    hib=0;
    Shisb=0;
    hiu=0;
    Shisu=0;
    for i=1:T0
     hib=hib+i.*hst(i);
     Shisb=Shisb+hst(i);
    end
mu0=hib/Shisb;
    for i=T0:255
    hiu=hiu+i.*hst(i);
    Shisu=Shisu+hst(i);
    end
mu1=hiu/Shisu;
   T1=(mu0+mu1)/2;
   T1=round(T1);
   Seuil=abs(T1-T0);
   T0=T1;
end
Topt=T1
im=im1>Topt;
figure(1);
subplot(1,2,1);
imshow(im1);
subplot(1,2,2);
imshow(im);
figure(2)
[count,x] = imhist(im1);
idxI = x==Topt;
stem(x(~idxI), count(~idxI), 'b-','LineWidth',2, 'marker', 'none');
hold on
hText = text(x(idxI), count(idxI)+50, 'Thershold value');
set(hText,'HorizontalAlignment','Center', 'VerticalAlignment','bottom', 'FontSize',8, 'Color','r');
%str = ['',num2str(T)]
hText2 = text(x(idxI), 0, 'str');
set(hText2, 'VerticalAlignment','top', 'FontSize',8, 'Color','r','String',['',num2str(Topt)]);
stem(x(idxI), count(idxI), 'r-','LineWidth',3);
figure(3)
imhist(im1);