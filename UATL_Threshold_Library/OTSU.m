
clc
clear all
close all
im1=imread('cameraman.tif');
%im1=imread('coins.png');
%im1=imread('rice.png');
%im1=rgb2gray(im1);
[n, m, C]=size(im1)
if C==3
im1=rgb2gray(im1);
end
hst=imhist(im1);
N=0;
alpha=0.5;

% The total mean level of  image
for i=1:255
    N=N+hst(i);
end

for T=1:255
    omegab=0;
    mub=0;
    mb=0;
    sigmasquareb=0;
    for i=1:T
        omegab=omegab+hst(i); % probability of class occurence (background)qb
        mb=mb+(i.*hst(i));% first order cumulative moment of the histogram up to Tth level
    end
    mub=mb/omegab;% first order cumulative moment of the histogram up to Tth level
    for i=1:T
        sigmasquareb=sigmasquareb+(((i-mub)^2).*hst(i));
    end
    sigmasquareb=sigmasquareb/omegab;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    sigmasquaref=0;
    omegaf=0;
    muf=0;
    mf=0;
    for i=T+1:255
        omegaf=omegaf+hst(i); % probability of class occurence (background)qb
        mf=mf+(i.*hst(i));% first order cumulative moment of the histogram up to Tth level
    end
    muf=mf/omegaf;% first order cumulative moment of the histogram up to Tth level
   
    for i=T+1:255
        sigmasquaref=sigmasquaref+(((i-muf)^2).*hst(i));
    end
    sigmasquaref=sigmasquaref/omegaf;
    JJ(T)=alpha*(sigmasquareb+sigmasquaref)+((1-alpha)*sqrt(sigmasquareb)*sqrt(sigmasquaref));
end
[Y,T] = min(JJ)

im=im1>T;

figure(1);
subplot(1,3,1);
imshow(im1);
subplot(1,3,2);
[count,x] = imhist(im1);
idxI = x==T;
stem(x(~idxI), count(~idxI), 'b-','LineWidth',3, 'marker', 'none');
hold on
hText = text(x(idxI), count(idxI)+50, 'Thershold value');
set(hText,'HorizontalAlignment','Center', 'VerticalAlignment','bottom', 'FontSize',8, 'Color','r');
%str = ['',num2str(T)]
hText2 = text(x(idxI), 0, 'str');
set(hText2,'HorizontalAlignment','Center', 'VerticalAlignment','top', 'FontSize',8, 'Color','r','String',['',num2str(T)]);
stem(x(idxI), count(idxI), 'r-','LineWidth',3);
subplot(1,3,3);
imshow(im);