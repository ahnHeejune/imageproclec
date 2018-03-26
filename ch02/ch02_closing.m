I = imread('phn1.GIF');

% binarization 
T = graythresh(I);
bw = im2bw(I, T);
bw = ~bw;
imshow(bw);

se1 = strel('disk',5);
Iclose = imclose(bw, se1);
imshow(Iclose);

se1 = strel('disk',5);
Idilate = imdilate(bw, se1);
Iclose2 = imerode(Idilate, se1);
imshow(Iclose2);

[c, r] = find( Iclose ~= Iclose);

se1 = strel('disk',5);
Iopen = imopen(bw, se1);
imshow(Iopen);

