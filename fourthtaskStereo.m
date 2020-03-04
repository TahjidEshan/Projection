clc;
close all;
load Stereo;
NrFrames = size(W,1)/2;
NrPoints = size(W,2);
f = 100;
d = 5 * 37.7952755906;


for i = 1:NrFrames-1
    x1 = W(i,:);
    y1 = W(i+NrFrames, :);
    x2 = W(i+1,:);
    y2 = W(i+NrFrames+1, :);
    z1 = zeros(NrPoints, 1);
    for j = 1:NrPoints
        z1(j) = f*d/(x2(j)-x1(j));
    end
    figure;
    plot3(x1, y1, z1, 'o');
    xlabel('x'); 
    ylabel('y'); 
    zlabel('z');
    grid on;
end
