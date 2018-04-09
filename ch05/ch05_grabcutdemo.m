%
% 1.Read an RGB image into the workspace.
%
%RGB = imread('flower.jpg');
%RGB = imread('porsche.jpg');
RGB = imread('messi5.jpg');

% 2. Generate label matrix.
L = superpixels(RGB,50000);

%Specify a region of interest and create a mask image.
figure;
imshow(RGB);
s = size(RGB)
h1 = impoly(gca); %,[50, 50; s(1)-50, s(2)-50]);
 
roiPoints = getPosition(h1);  % final user bounding box
roi = poly2mask(roiPoints(:,1),roiPoints(:,2),size(L,1),size(L,2));

% Perform the grab cut operation, specifying the original image, the label matrix and the ROI.

BW = grabcut(RGB,L,roi);
figure;
imshow(BW);

maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
figure;
imshow(maskedImage);

