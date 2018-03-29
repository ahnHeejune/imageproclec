
% Compares Edge detectors


A=imread('pencing.png');                      			%Read in image
A=rgb2gray(A);                      			

subplot(4,3,1), imshow(A,[]);               		%Display original
g2=fspecial('gaussian',[13 13],2);
g4=fspecial('gaussian',[25 25],4);
g8=fspecial('gaussian',[49 49],8);

subplot(4,3,4), imshow(imfilter(A,g2),[]);   		%Display filtered version sigma=2
subplot(4,3,7), imshow(imfilter(A,g4),[]);   		%Display filtered version sigma=4
subplot(4,3,10), imshow(imfilter(A,g8),[]);   		%Display filtered version sigma=4


[bw,thresh]=edge(A,'log');                  		%Edge detection on original - LOG filter
subplot(4,3,2), imshow(~bw,[]);

[bw,thresh]=edge(A,'canny');                		%Canny edge detection on original 
subplot(4,3,3), imshow(~bw,[]);              		%Display


[bw,thresh]=edge(A),'log', );      		%LOG Edge detection on sigma=6 
subplot(4,3,5), imshow(~bw,[]);              

[bw,thresh]=edge(imfilter(A,g2),'canny');         	%Canny edge detection on sigma=6
subplot(4,3,6), imshow(~bw,[]);


[bw,thresh]=edge(imfilter(A,g4),'log');      		%LOG Edge detection on sigma=12
subplot(4,3,8), imshow(~bw,[]);              

[bw,thresh]=edge(imfilter(A,g4),'canny');  		%Canny edge detection on sigma=12
subplot(4,3,9), imshow(~bw,[]);


[bw,thresh]=edge(imfilter(A,g8),'log');      		%LOG Edge detection on sigma=12
subplot(4,3,11), imshow(~bw,[]);              

[bw,thresh]=edge(imfilter(A,g8),'canny');  		%Canny edge detection on sigma=12
subplot(4,3,12), imshow(~bw,[]);
