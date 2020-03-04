clc;
close all;
C = [50,55, 60] ;  
R = 5.0; 
% teta=0:0.01:2*pi ;
t= sort(rand(5000,1))*10;
x=C(1)+R*cos(t);
y=C(2)+R*sin(t) ;
z = C(3)+zeros(size(x));
plot3(x,y,z, '*');
title('Circle');
xlabel('x'); 
ylabel('y'); 
zlabel('z');
grid on;
figure(2);
title('Orthographic Projection');
plot(x, y, '.');
figure(3);
title('Perspective Projection');
plot(x/z, y/z, '.');
p = 15;
x_new = x;
y_new = y*cos(p)-z*sin(p);
z_new = y*sin(p)+z*cos(p);
% rotation = [cosd(alpha) -sind(alpha) 0; sind(alpha) cosd(alpha) 0; 0 0 1];
% x_new = zeros(size(x));
% y_new = zeros(size(y));
% z_new = zeros(size(z));
% for i=1:num
% 	val = rotation.*[x(i) y(i) z(i)];
%     x_new(i) = val(1);
%     y_new(i) = val(2);
%     z_new(i) = val(3);
% end
figure(4);
title('Perspective Projection with rotation');
plot(x_new/z_new, y_new/z_new, '.');