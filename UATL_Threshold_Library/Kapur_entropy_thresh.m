
% Entropy Kapur threshold
clc
clear all
close all 
im1=imread('cameraman.tif');
%im1=imread('coins.png');
%im1=imread('rice.png');
%im1=double(im1);
%im1=rgb2gray(im1);
[n, m, N]=size(im1)
if N==3
im1=rgb2gray(im1);
end
hst=imhist(im1);
Shis=0;
for T=1:255
    Shis=Shis+hst(T);
end
hst=hst/Shis;% or hst=hst/sum(hst)


for T=1:255
    hf=0;
    hb=0;
    Sb=0;
    Sf=0;
    for i=1:T
            Sf=Sf+hst(i);
    end
    for i=1:T
        if (hst(i)~=0 && Sf~=0)
            hf=hf-((hst(i)/Sf).*log(hst(i)/Sf));
        end
    end
    for i=T+1:255
         Sb=Sb+hst(i);
    end
    %Sb=Sb/Shis;
    for i=T+1:255
        if (hst(i)~=0 && Sb~=0)
            hb=hb-((hst(i)/Sb).*log(hst(i)/Sb));
        end
    end
    H(T)=hf+hb;
    end

[Y,T] = max(H)
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