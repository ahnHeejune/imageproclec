I=imread('pout.tif'); % read in image
Ieq=histeq(I);
subplot(2,2,1), imshow(I); % display image
subplot(2,2,2), imshow(Ieq); % display result
subplot(2,2,3), imhist(I); % display hist. of image
subplot(2,2,4), imhist(Ieq); % display hist. of result
