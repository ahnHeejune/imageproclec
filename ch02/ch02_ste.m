bw = imread('text.png');            		%Read in binary image
se=[0 1 0; 1 1 1; 0 1 0];                   %Define structuring element
bw_out=imdilate(bw,se);              		%Erode image
subplot(1,2,1), imshow(bw);         		%Display original
subplot(1,2,2), imshow(bw_out);     		%Display dilated image
