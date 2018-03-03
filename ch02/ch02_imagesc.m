A=imread('cameraman.tif');      % Read in intensity image

imshow(A);                      % First display image using imshow

imagesc(A);                     % Next display image using imagesc

axis image;                     % Correct aspect ratio of displayed image
axis off;                       % turn off the axis labelling
colormap(gray);                 % display intensity image in gray-scale
