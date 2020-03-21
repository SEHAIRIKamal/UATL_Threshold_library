
% from otsu.pdf file otsu's paper equation 18
clc
clear all
close all
im1=imread('cameraman.tif');
%im1=imread('coins.png');
%im1=imread('autumn.tif');

[rows, columns, C]=size(im1)
if C==3
im1=rgb2gray(im1);
end

hst=imhist(im1);
m=0;
mu=0;
N=0;

% The total mean level of  image
for i=1:255
    N=N+hst(i);
    m=m+(i.*hst(i));
end
mu=m/N;

for T=1:255
    omegak=0;
    muT=0;
    mT=0;
    shis=0;
    for i=1:T
        omegak=omegak+hst(i); % probability of class occurence (background)qb
        mT=mT+(i.*hst(i));% first order cumulative moment of the histogram up to Tth level
    end
    muT=mT/N;% first order cumulative moment of the histogram up to Tth level
    omegak=omegak/N;% 
    
%     for i=T+1:255
%         qo=qo+hst(i);% probability of class occurence (object)
%     end
% mu1=(mu-muT)/(1-omegak);
    sigmasquare(T)=((mu*omegak)-muT)^2/(omegak*(1-omegak));
end
[Y,T] = max(sigmasquare)
%[Y2,T2] = max(sigmasquare2)


im=im1>T;


figure(1);
subplot(1,3,1);
imshow(im1);
subplot(1,3,2);
imhist(im1);
subplot(1,3,3);
imshow(im);

figure(2)
plot([0:255],hst)
hold on
plot(sigmasquare)
hold on
[count,xth] = imhist(im1);
idxI = xth==uint8(T);
%stem(xth(~idxI), count(~idxI), 'b-','LineWidth',3, 'marker', 'none');
%hold on
hText = text(xth(idxI), count(idxI)+50, 'Thershold value');
set(hText,'HorizontalAlignment','Center', 'VerticalAlignment','bottom', 'FontSize',12, 'Color','g');
%str = ['',num2str(T)]
hText2 = text(xth(idxI), 0, 'str');
set(hText2,'HorizontalAlignment','Center', 'VerticalAlignment','top', 'FontSize',12, 'Color','g','String',['',num2str(uint8(T))]);
legend('N','\sigma^2')
xlabel('Intensisty') % x-axis label
ylabel('N, \sigma^2') % y-axis label
title('Histogram and Interclass variance \sigma^2')