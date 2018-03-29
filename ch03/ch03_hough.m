%==========================================================================
%   Read an image, and convert it to a grayscale image. 
%==========================================================================
imgfilename = 'square.jpg';   %'gantrycrane.png'

Iorg = imread(imgfilename);
if length(size(Iorg)) == 3
    I  = rgb2gray(Iorg);
else
    I = Iorg;    
end 
% 1. Extract edges.
BW = edge(I,'canny');

%Display the original image and the Hough matrix.
subplot(2,2,1);
imshow(RGB);
title(imgfilename);
subplot(2,2,2), imshow(BW);
title('edge');


% 2. Calculate Hough transform.
% H : strength, Thetha is angle, Rho is distance from origin
[H,Theta,Rho] = hough(BW,'RhoResolution',0.5,'ThetaResolution',0.5);
%function rescale(m)
%imshow(imadjust(rescale(H)),'XData',T,'YData',R,'InitialMagnification','fit');
H2 = uint8(H /max(max(H))*255);  % imadjust(H));
subplot(2,2,3);
imshow(H2,'XData',Theta,'YData',Rho,'InitialMagnification','fit'); % x-axis is Theta; y-axis Rho
title('Hough transform');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca, hot);

% 3. add peak 
P  = houghpeaks(H,4);
plot(Theta(P(:,2)),Rho(P(:,1)),'s','color','white');

%==========================================================================
%   Display the Hough lines on the image 
%==========================================================================
lines = houghlines(BW,Theta,Rho, P,'FillGap',5,'MinLength',7);
subplot(2,2,4), imshow(I), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
title('hough-segments');
