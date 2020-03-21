
% from otsu paper equation 14
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
%im1=rgb2gray(im1);

hst=imhist(im1);
% The total mean level of  image
m=0;
mu=0;
N=0;

for i=1:255
    N=N+hst(i);
    m=m+(i.*hst(i));
end
mu=m/N;


for T=1:255;
    hi=0;
    omega0=0;
    mk=0;
    for i=1:T
        omega0=omega0+hst(i);% probability of class occurence (background)
        hi=hi+(i.*hst(i));
    end
    omega0=omega0/N;
    mk=hi/N;
    
    mu0=mk/omega0;
    mu1=(mu-mk)/(1-omega0);
    sigmasquare(T)=omega0*(1-omega0)*((mu1-mu0)^2);
end
[Y,T] = max(sigmasquare)


im=im1>T;

figure(1);
subplot(1,2,1);
imshow(im1);
subplot(1,2,2);
imshow(im);
figure(2)
[count,x] = imhist(im1);
idxI = x==T;
stem(x(~idxI), count(~idxI), 'b-','LineWidth',3, 'marker', 'none');
hold on
hText = text(x(idxI), count(idxI)+50, 'Thershold value');
set(hText,'HorizontalAlignment','Center', 'VerticalAlignment','bottom', 'FontSize',8, 'Color','r');
%str = ['',num2str(T)]
hText2 = text(x(idxI), 0, 'str');
set(hText2, 'VerticalAlignment','top', 'FontSize',8, 'Color','r','String',['',num2str(T)]);
stem(x(idxI), count(idxI), 'r-','LineWidth',3);