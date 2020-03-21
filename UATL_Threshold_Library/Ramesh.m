% Ramesh threshold method
clc
clear all
close all
im1=imread('cameraman.tif');
%im1=imread('coins.png');
%im1=imread('rice.png');
[rows, columns, C]=size(im1)
if C==3
im1=rgb2gray(im1);
end

hst=imhist(im1);

N=0;
for i=1:255
    N=N+hst(i);
end

for T=1:255
    hib=0;
    hif=0;
    omega0=0;
    omega1=0;
    mb=0;
    mf=0;
    mub=0;
    muf=0;
    Sb=0;
    Sf=0;
    for i=1:T
        omega0=omega0+hst(i);% probability of class occurence (background)
        hib=hib+(i.*hst(i));
    end
    omega0=omega0/N;
    mb=hib/N;
    mub=mb/omega0;
    
    
    for i=T+1:255
        omega1=omega1+hst(i);% probability of class occurence (background)
        hif=hif+(i.*hst(i));
    end
    omega1=omega1/N;
    mf=hif/N;
    muf=mf/omega1;
    
    for i=1:T
        Sb=Sb+((mub-i)^2);
    end
   
    for i=T+1:255
        Sf=Sf+((muf-i)^2);
    end
    Topt(T)=Sb+Sf;
end
[Topt,T] = min(Topt)
im=im1>T;

figure(1);
subplot(1,2,1);
imshow(im1);
subplot(1,2,2);
imshow(im);
figure(2)
[count,x] = imhist(im1);
idxI = x==T;
stem(x(~idxI), count(~idxI), 'b-','LineWidth',2, 'marker', 'none');
hold on
hText = text(x(idxI), count(idxI)+50, 'Thershold value');
set(hText,'HorizontalAlignment','Center', 'VerticalAlignment','bottom', 'FontSize',8, 'Color','r');
%str = ['',num2str(T)]
hText2 = text(x(idxI), 0, 'str');
set(hText2, 'VerticalAlignment','top', 'FontSize',8, 'Color','r','String',['',num2str(T)]);
stem(x(idxI), count(idxI), 'r-','LineWidth',3);
figure(3)
imhist(im1);