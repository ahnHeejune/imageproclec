% scene disolve 

img1 = imread('palaceday.jpg');
img2 = imread('palacenight.jpg');
sz = size(img1)
img2 = imresize(img2, sz(1:2));  % make sure the same size 

img_disolve = img1;

imshow(img_disolve);

for alpha = 0.0:0.05:1.0
    img_disolve = img1*(1-alpha) +img2 *alpha;
    imshow(img_disolve);
    pause(0.2);
    %disp(alpha);
end