% image pyramid

I = imread('cameraman.tif');

% Perform a series of reductions. The first call reduces the original image. 
% The other calls to impyramid use the previously reduced image.

I1 = impyramid(I, 'reduce');
I2 = impyramid(I1, 'reduce');
I3 = impyramid(I2, 'reduce');

I4 = impyramid(I3, 'expand');
I5 = impyramid(I4, 'expand');
I6 = impyramid(I5, 'expand');

%View the original image and the reduced versions.
figure, subplot(1,2, 1), imshow(I), subplot(1,2, 2), imshow(I6);
figure, subplot(1,2, 1), imshow(I1), subplot(1,2, 2), imshow(I5);
figure, subplot(1,2, 1), imshow(I2), subplot(1,2, 2), imshow(I4);
figure, imshow(I3);