A=imread('peppers.png'); % Read in image
A = rgb2gray(A);

subplot(3,2,1), imshow(A), title('original'); % Display image

% average filter 
k = fspecial('average', [5,5]); 
B = imfilter(A, k, 'symmetric'); % apply using symmetric mirroring at edges 
subplot(3,2,3), imshow(B), title('average'); % Display result image B


% gaussian  filter 
k = fspecial('gaussian', [5,5], 0.5); 
B = imfilter(A, k, 'symmetric'); % apply using symmetric mirroring at edges 
subplot(3,2,4), imshow(B), title('gaussian'); % Display result image B

% sobel filter 
k = fspecial('sobel'); 
B = imfilter(A, k, 'symmetric'); % apply using symmetric mirroring at edges 
subplot(3,2,5), imshow(B), title('sobel'); % Display result image B

% motion filter 
k = fspecial('motion', 50, 54); % create a 5x5 convolution kernel
B = imfilter(A, k, 'symmetric'); % apply using symmetric mirroring at edges 
subplot(3,2,6), imshow(B), title('motion'); % Display result image B

