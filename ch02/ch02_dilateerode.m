bw = imread('text.png');            		%Read in binary image
se1 = strel('square',4)                     %4-by-4 square
se2 = strel('line',5,45)     				%line, length 5, angle 45 degrees
bw_1=imdilate(bw,se1);              		%Dilate image
bw_2=imerode(bw,se2);              			%Erode image
subplot(1,2,1), imshow(bw_1);         		%Display dilated image
subplot(1,2,2), imshow(bw_2);               %Display eroded image
