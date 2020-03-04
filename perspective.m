function [U,V,W] = perspective(x,y,z,number)
    U = zeros(number);
    V = zeros(number);
    W = zeros(number);
    A = [1 0 0 0;
        0 1 0 0;
        0 0 1 0];
    rotation = [cosd(alpha) -sind(alpha) 0; 
        sind(alpha) cosd(alpha) 0; 
        0 0 1];
    for i = 1:number
        temp = (A*[x(i);y(i);z(i);1])';
        U(i) = temp(1);
        V(i) = temp(2);
        W(i) = temp(3);
    end
end