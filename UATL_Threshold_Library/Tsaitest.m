
% Tsai
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

m=0;
mu1=0;
N=0;
c0=0;
c1=0;
G=0;
P0=0;
% The total mean level of  image
for i=1:255
    N=N+hst(i);
    m=m+(i.*hst(i));
end
mu1=m/N;

m=0;
mu2=0;
for i=1:255
    m=m+((i^2).*hst(i));
end
mu2=m/N;

m=0;
mu3=0;
for i=1:255
    m=m+((i^3).*hst(i));
end
mu3=m/N;

c0=((mu1*mu3)-(mu2^2))/(mu2-(mu1)^2);
c1=((mu1*mu2)-mu3)/(mu2-(mu1)^2);
G=0.5*((sqrt(c1^2-4*c0))-c1);
P0=(G-mu1)/sqrt((c1^2)-(4*c0));

hst=hst/N;
cdf=cumsum(hst);
T = find( cdf >= P0 , 1, 'first' )

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