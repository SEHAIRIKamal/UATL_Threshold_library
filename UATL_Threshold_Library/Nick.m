% local thresholding (with windowig)
% We have computed the mean of all threshold values as global threshold
% Nick threshold
clc
clear all
close all

im1=imread('cameraman.tif');


[n, m, C]=size(im1)
if C==3
im1=rgb2gray(im1);
end

im1=double(im1);

k=-0.2;
w =15;
window = ones(w, w);
% compute sum of pixels in WxW window
sp = conv2(im1, window, 'same');
% convert to mean
num = w^2;            % number of pixels in window
mean = sp / n;

% compute sum of pixels squared in WxW window
sp2 = conv2(im1.^2, window, 'same');
% convert to std
var=(sp2-mean.^2)/num; % Nick method from 72470U_1.pdf
s = sqrt(var);

% compute Nick threshold
t = mean + k * s;

% Initialize the output
output = zeros(size(im1));

% Nick
output(im1 > t) = 1;
% mean of all threshold values
imt=reshape(t,[n*m,1]);
Topt=sum(imt)/(n*m)
im=im1>Topt;

subplot(1,3,1) 
imshow(uint8(im1));
subplot(1,3,2);
imshow(output);
subplot(1,3,3);
imshow(im);