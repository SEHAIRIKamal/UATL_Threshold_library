% Entropy BRINK threshold Eq 10 & 8
%A. D. Brink and N. E. Pendock, ‘‘Minimum cross entropy threshold selection,’’ Pattern Recogn. 29, 179–188 ~1996!.
clc
clear all
close all
%im1=imread('cameraman.tif');
%im1=imread('coins.png');
im1=imread('rice.png');
[n, m, N]=size(im1)
if N==3
im1=rgb2gray(im1);
end
hst=imhist(im1);


for T=1:255
hf=0;
hb=0;
muo=0;
mub=0;
    for i=1:T
        muo=muo+(i*hst(i));
    end
    for i=1:T
        if hst(i)~=0
            hf=hf+(hst(i)*muo.*log(muo/i));
        end
    end
    
    for i=T+1:255
        mub=mub+(i*hst(i));
    end
    for i=T+1:255
        if hst(i)~=0
            hb=hb+(hst(i)*mub.*log(mub/i));
        end
    end
    H(T)=hf+hb;

end
[Y,T] = min(H)

im = im1 > T;
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