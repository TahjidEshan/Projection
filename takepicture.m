clc;
close all;
success = mexMTF2('init','pipeline v img_source f')
[~, first_frame] = mexMTF2('get_frame');
imshow(first_frame)