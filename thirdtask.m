clc;
close all;
im1 = imread('ex6b_1.jpg');
im2 = imread('ex6b_2.jpg');
figure;
imshow(im1);
hold on;
[x1 y1]=ginput(4);
close all;
figure;
imshow(im2);
hold on;
[x2 y2]=ginput(4);
xl = sqrt( (x1(1)-x1(2)).^2 + (y1(1)-y1(2)).^2);
xr = sqrt( (x2(1)-x2(2)).^2 + (y2(1)-y2(2)).^2);

f = 301.0545;
b = 96; %1 inch = 96 pixels
z = f*b/(xl-xr);
plot3(x1, y1, [z z z z]);