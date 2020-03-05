clc;
close all;
load Stereo;
NrFrames = size(W,1)/2;
NrPoints = size(W,2);
f = 100;
d = 5 * 37.7952755906;
b = f*d;
xl = W(1:NrFrames-1, :);
xr = W(2:NrFrames, :);
z = b\(xl-xr);

figure;
plot3(W(1,:), W(NrFrames+1,:), z(1,:), 'o');
xlabel('x'); 
ylabel('y'); 
zlabel('z');
grid on;

