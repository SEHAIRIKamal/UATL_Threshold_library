% without windowing
% from nilblack W.Niblack, An Introduction to Digital Image Processing. Prentice Hall, Englewood Cliffs, (1986).
clc
clear all
close all
im1=imread('cameraman.tif');
%im1=rgb2gray(im1);
[n, m, C]=size(im1)
if C==3
im1=rgb2gray(im1);
end
hst=imhist(im1);
mu=0;
N=0;
d=0;
sum=0;
s=0;
% The total mean level of  image
for i=1:255
    N=N+hst(i);
    mu=mu+(i.*hst(i));
end
mu=mu/N;
for i=1:255
    sum=sum+(((i-mu)^2)*hst(i));
end
s=sqrt(sum/N);

T=mu+(-0.2*s);
Topt=round(T)
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