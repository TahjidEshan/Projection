close all;
clc;

img = imread('len1.jpg');
imshow(img)
hold on
[x,y]=ginput(2);
distance=sqrt( (x(1)-x(2)).^2 + (y(1)-y(2)).^2)

f= (7.5*96)*distance/96