I=imread('coins.png'); % read in image
level = graythresh(I); % get OTSU theshold
It = im2bw(I, level);  % theshold image
imshow(It);            % display it
