D=imread('onion.png');      % Read in 8-bit RGB colour image.

Dgray = rgb2gray(D);        % convert it to a grayscale image

subplot(2,1,1); imshow(D); axis image;  % display both side by side 
subplot(2,1,2); imshow(Dgray);         