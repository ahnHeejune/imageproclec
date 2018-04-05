I = rgb2gray(imread('toyobjects.png'));
imshow(I)
hold on
title('Original Image');

%Specify initial contour location close to the object that is to be segmented.
s = size(I);
mask = zeros(s(1:2));
mask(50:150,40:170) = 1;

%Display the initial contour on the original image in blue.
visboundaries(mask,'Color','b');

%Segment the image using the 'edge' method and 200 iterations.

for n =1:20
    imshow(I);
    hold on;
    mask = activecontour(I, mask,2, 'edge');
    %Display the final contour on the original image in red.
    visboundaries(mask,'Color','r'); 
    title('Initial contour (blue) and final contour (red)');
    %disp('next?');
    pause(1);
end
