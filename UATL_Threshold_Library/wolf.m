
% local thresholding (with windowig)
% the choice of window is very im1portant
clc
clear all
close all
im1=imread('cameraman.tif');
%im1=im1read('text.jpg');
[rows, columns, C]=size(im1)
if C==3
im11=rgb2gray(im11);
end
hst=imhist(im1);
im1=double(im1);
[i,j]=size(im1);
k=0.5;
w =16;
window = ones(w, w);
% compute sum of pixels in WxW window
sp = conv2(im1, window, 'same');
% convert to mean
n = w^2;            % number of pixels in window
m = sp / n;
% compute sum of pixels squared in WxW window
sp2 = conv2(im1.^2, window, 'same');
% convert to std
var=((sp2/n)-m.^2); %Niblack from 72470U_1.pdf
s = sqrt(var);
% search for max of standard deviantion 
R= max(max(s));
%search for min gray value in the im1age
M= min(min(im1));
% compute Wolf threshold
t = ((1-k).*m) +(k*M)+(k*(s/R).*(m-M));

% Initialize the output
output = zeros(size(im1));

% Niblack
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