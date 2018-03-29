
% Compares Edge detectors


A=imread('pencing.png');                      			%Read in image
A=rgb2gray(A);                      			

sigma = 2;
s = 13;
LoG = fspecial('log', [s,s], sigma);
B = imfilter(A, LoG);
Peak = max(max(B));
BW = edge(A,'zerocross', 0, LoG); 
subplot(3,2,1), imshow(BW);  
BW = edge(A,'zerocross', Peak*0.01, LoG); 
subplot(3,2,2), imshow(BW);   		


sigma = 4;
s = 25;
LoG = fspecial('log', [s,s], sigma);
B = imfilter(A, LoG);
Peak = max(max(B));
BW = edge(A,'zerocross', 0, LoG); 
subplot(3,2,3), imshow(BW);  
BW = edge(A,'zerocross', Peak*0.02, LoG); 
subplot(3,2,4), imshow(BW);   		


sigma = 8;
s = 49;
LoG = fspecial('log', [s,s], sigma);
B = imfilter(A, LoG);
Peak = max(max(B));
BW = edge(A,'zerocross', 0, LoG); 
subplot(3,2,5), imshow(BW);  
BW = edge(A,'zerocross', Peak*0.02, LoG); 
subplot(3,2,6), imshow(BW);   		



