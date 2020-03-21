% local thressolding 
% We have computed the mean of all threshold values as global threshold 
% local thresholding (with windowig)
% the choice of window is very important
clc
clear all
close all
im1=imread('cameraman.tif');
[rows, columns, C]=size(im1)
if C==3
im1=rgb2gray(im1);
end
hst=imhist(im1);
im1=double(im1);
k=0.5;
R=128;
w =128;
window = ones(w, w);
% compute sum of pixels in WxW window
sp = conv2(im1, window, 'same');
% convert to mean
n = w^2;            % number of pixels in window
m = sp / n;

% compute sum of pixels squared in WxW window
sp2 = conv2(im1.^2, window, 'same');
% convert to std
var=((sp2/n)-m.^2); %Sauvola
s = sqrt(var);

% compute Sauvola threshold
t = m + (1-k*(1-(s/R)));

% Initialize the output
output = zeros(size(im1));

% Sauvola
output(im1 > t) = 1;

% mean of all threshold values
imt=reshape(t,[rows*columns,1]);
Topt=sum(imt)/(rows*columns)
im=im1>Topt;

figure(1);
subplot(1,3,1);
imshow(uint8(im1));
subplot(1,3,2);
imshow(im);
subplot(1,3,3);
imshow(output);