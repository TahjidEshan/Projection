clc;
close all;
im1 = imread('ex6b_1.jpg');
im2 = imread('ex6b_2.jpg');
figure;
imshow(im1);
hold on;
points = 6;
[x1 y1]=ginput(points);
close all;
figure;
imshow(im2);
hold on;
[x2 y2]=ginput(points);
f=699.2375;
b = 2*75.5905511811; %1 inch = 96 pixels
z1 = zeros(points,1);

for i=1:points
    z1(i) = f*b/(x2(i)-x1(i));
end
figure;
plot3(x2, y2, z1);
xlabel('x'); 
ylabel('y'); 
zlabel('z');
grid on;




