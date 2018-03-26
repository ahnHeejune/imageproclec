 % histogram equalization demo
clear;
close all;

I = imread('birds.png');

% original image
Igray = rgb2gray(I);
subplot(3,2,1), imshow(Igray), title('original');
subplot(3,2,2), imhist(Igray);

% global hist equalization
Ieq = histeq(Igray);
subplot(3,2,3), imshow(Ieq), title('histeq');
subplot(3,2,4), imhist(Ieq);

% adaptive hist equalization
Iaeq = adapthisteq(Igray);
subplot(3,2,5), imshow(Iaeq), title('adapthisteq');
subplot(3,2,6), imhist(Ieq);

