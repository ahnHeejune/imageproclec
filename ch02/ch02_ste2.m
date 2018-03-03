bw = imread('text.png');            		%Read in binary image
se=ones(6,1);                       		%Define structuring element
bw_out=imerode(bw,se);              		%Erode image
subplot(1,2,1), imshow(bw);         		%Display original
subplot(1,2,2), imshow(bw_out);     		%Display eroded image
