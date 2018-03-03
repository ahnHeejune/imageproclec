D=imread('onion.png');      % Read in 8-bit RGB colour image.

Dred  = D(:,:,1);           % extract red channel   (1st channel)
Dgreen = D(:,:,2);          % extract green channel (2nd channel)
Dblue = D(:,:,3);           % extract blue channel  (3rd channel)

subplot(2,2,1); imshow(D); axis image;  % display all in 2x2 plot

subplot(2,2,2); imshow(Dred); title('red');     % display and label      
subplot(2,2,3); imshow(Dgreen); title('green');
subplot(2,2,4); imshow(Dblue); title('blue');