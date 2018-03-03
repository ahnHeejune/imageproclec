I=rgb2gray(imread('peppers.png')); % Read in image (in greyscale)
k = fspecial('log', [10 10], 3.0); % create laplacian filter
IEzc = edge(I, 'zerocross', [], k); % zero crossing edges (auto thresholded) 
subplot(1,2,1), imshow(I); % Display image
subplot(1,2,2), imshow(IEzc); % Display image
