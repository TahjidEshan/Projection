function [] = cube()
    clc;
    close all;
    num = 100;
    t = sort(rand(num,1))*10;
    xstart = -1;
    ystart = 2;
    zstart = 3;
    r_0 = {xstart, ystart, zstart};
    v_z = {0, 0, 1};
    v_y = {0, 1, 0};
    v_x = {1, 0, 0};
    v_z_m = {0, 0, -1};
    v_y_m = {0, -1, 0};
    v_x_m = {-1, 0, 0};
    [x1,y1,z1] = getcoord(r_0, v_x, t);
    [x2,y2,z2] = getcoord(r_0, v_y, t);
    [x3,y3,z3] = getcoord(r_0, v_z, t);
    r_1 = {x1(end), ystart, zstart};
    [x4,y4,z4] = getcoord(r_1, v_z, t);
    [x5,y5,z5] = getcoord(r_1, v_y, t);
    r_2 = {x1(end),ystart,z3(end)};
    [x6,y6,z6] = getcoord(r_2, v_x_m, t);
    [x7,y7,z7] = getcoord(r_2, v_y, t);
    
    r_3 = {x1(end),y2(end),z3(end)};
    [x8,y8,z8] = getcoord(r_3, v_z_m, t);
    [x9,y9,z9] = getcoord(r_3, v_x_m, t);
    r_4 = {x3(end),y2(end),zstart};
    [x10,y10,z10] = getcoord(r_4, v_x, t);
    r_5 = {x10(1) y10(end) z3(end)};
    [x11,y11,z11] = getcoord(r_5, v_y_m, t);
    [x12,y12,z12] = getcoord(r_5, v_z_m, t);
    figure(1);
    plot3([x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12],[y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 y12],[z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12], '*', 'Color','b');
    title('Cube');
    xlabel('x'); 
    ylabel('y'); 
    zlabel('z');
    grid on;
    axis([-20 20 -20 20 -20 20])
end

function [x,y,z] = getcoord(r_0, v, t)
    [x_0,y_0,z_0] = r_0{:};
    [a, b , c] = v{:};
    x = x_0 + a*t;
    y = y_0 + b*t;
    z = z_0 + c*t;
end