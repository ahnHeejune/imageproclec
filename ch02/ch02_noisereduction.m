%
%  add noise 
%
I=imread('eight.tif'); % Read in image
subplot(1,3,1), imshow(I); % Display image

Isp = imnoise(I,'salt & pepper',0.03); % add 3% (0.03) salt and pepper noise
subplot(1,3,2), imshow(Isp); % Display result image Isp

Ig = imnoise(I,'gaussian',0.02); % add Gaussian noise (with 0.02 variance)
subplot(1,3,3), imshow(Ig); % Display result image Ig

%
%  average filter 
%
figure;
k = ones(3,3) / 9;	% define mean filter
I_m = imfilter(I,k); % apply to original image
Isp_m = imfilter(Isp,k); % apply to salt and pepper image
Ig_m = imfilter(Ig,k); % apply tp gaussian image
subplot(1,3,1), imshow(I_m); % Display result image 
subplot(1,3,2), imshow(Isp_m); % Display result image
subplot(1,3,3), imshow(Ig_m); % Display result image

%
% median filter 
%
I_m = medfilt2(I,[3 3]); % apply to original image
Isp_m = medfilt2(Isp,[3 3]); % apply to salt and pepper image
Ig_m =medfilt2(Ig,[3 3]); % apply tp gaussian image
subplot(1,3,1), imshow(I_m); % Display result image 
subplot(1,3,2), imshow(Isp_m); % Display result image
subplot(1,3,3), imshow(Ig_m); % Display result image



