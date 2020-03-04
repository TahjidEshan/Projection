function [] = fourthtask()
    clc;
    close all;
    depth = stereoDisparity();
    num = 500;
    t = sort(rand(num,1))*100;
    xstart = 150;
    ystart = 50;
    zstart = 1;

    v_z = {0, 0, 1};
    v_y = {0, 1, 0};
    v_x = {1, 0, 0};
    v_z_m = {0, 0, -1};
    v_y_m = {0, -1, 0};
    v_x_m = {-1, 0, 0};
    xstart = xstart-15;
    r_0 = {xstart, ystart, zstart};
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
    f = 301.0545;
    b = 15;
    figure(1)
    plot3([x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12],[y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 y12],[z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12], 'Color','b');
    title('Cube');
    xlabel('x'); 
    ylabel('y'); 
    zlabel('z');
    grid on;
    axis([-50 300 -50 200 -50 200])


    figure(2)
%     plot3([x1 x2 x3 x4 xscxscsc5 x6 x7 x8 x9 x10 x11 x12],[y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 y12],[f*b/depth(x1,y1) f*b/depth(x2,y2) f*b/depth(x3,y3) f*b/depth(x4,y4) f*b/depth(x5,y5) f*b/depth(x6,y6) f*b/depth(x7,y7) f*b/depth(x8,y8) f*b/depth(x9,y9) f*b/depth(x10,y10) f*b/depth(x11,y11) f*b/depth(x12,y12)], 'Color','b');
    plot3([x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12],[y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 y12],[f*b./depth(int64(x1), int64(y1)) f*b./depth(int64(x2), int64(y2))
        f*b./depth(int64(x3), int64(y3)) f*b./depth(int64(x4), int64(y4)) f*b./depth(int64(x5), int64(y5)) f*b./depth(int64(x6), int64(y6)) 
        f*b./depth(int64(x7), int64(y7)) f*b./depth(int64(x8), int64(y8)) f*b./depth(int64(x9), int64(y9)) f*b./depth(int64(x10), int64(y10)) 
        f*b./depth(int64(x11), int64(y11)) f*b./depth(int64(x12), int64(y12))], 'Color','b');
    title('Cube');
    xlabel('x'); 
    ylabel('y'); 
    zlabel('z');
    grid on;
    axis([-50 300 -50 200 -50 200])
end

function [x,y,z] = getcoord(r_0, v, t)
    [x_0,y_0,z_0] = r_0{:};
    [a, b , c] = v{:};
    x = x_0 + a*t;
    y = y_0 + b*t;
    z = z_0 + c*t;
end