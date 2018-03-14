I=imread('cameraman.tif'); % Read in image

subplot(2,2,1), imshow(I), title('original');

%Id=im2double(I);
%Output1=2*(Id.^0.5);
%Output2=2*(Id.^1.5);
%Output3=2*(Id.^3.0);
% 2. Gamma contrast correction 
Inorm= double(I)./255;  % normlaize
Output1=uint8(255*(Inorm.^0.5));
Output2=uint8(255*(Inorm.^1.5));
Output3=uint8(255*(Inorm.^3.0));

% 3. display images 
subplot(2,2,2), imshow(Output1), title('gamma = 0.5');
subplot(2,2,3), imshow(Output2), title('gamma = 1.5');
subplot(2,2,4), imshow(Output3), title('gamma = 3.0');
