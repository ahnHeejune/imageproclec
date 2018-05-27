%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Artificial  Image generation for multiple views
% 
%  Object :  a plane  L1 5mx1m  at (0,0,0)
%            a plane  L2 1mx1m  at (0,0,3)   
%   (+x)         
%   |
%   |      red       * R 
%   |------|-------- (+z) 
%   |   2        3   * L  
%   |
%   blue    
%  
%  Right Camera  at (+1, 5, 0)        
%  Left Camera at (-1, 5, 0) 
%  f = 0.01m, H-FOV = 60?degree, V-FOV = 30?degree, s = 1000 pixels/m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Setup object and Camera
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define rectangle planes in Cartesian Coordinate
L1 = 5;      % inch or mm
worldPoints1 = [ L1/2, 1/2, 0;   
               -L1/2, 1/2, 0;
               -L1/2, -1/2, 0;
               L1/2, -1/2, 0]';
L2 = 1;      % inch or mm
worldPoints2 = [ L2/2, 1/2, 2;   
               -L2/2, 1/2, 2;
               -L2/2, -1/2, 2;
               L2/2, -1/2, 2]';
% convert from Cartesian to Homogenous Coordinate
worldPoints1homo =  [worldPoints1; ones(1,4)];   % 3D- homogeneous 
worldPoints2homo =  [worldPoints2; ones(1,4)];   % 3D- homogeneous 
            

% Left camera position
angleYLeft  = pi;   % 180 degree
extMatrixLeft = [ cos(angleYLeft),  0,  -sin(angleYLeft),  1;     
                              0,    1,          0,         0
                  sin(angleYLeft),  0,   cos(angleYLeft),  5;
                                0,                0,  0,  1]; 
% right cam position
angleYRight  = pi; % 180
extMatrixRight = [ cos(angleYRight), 0,    -sin(angleYRight),  -1;    
                                 0,  1,               0,       0;
                  sin(angleYRight), 0,     cos(angleYRight),   5;
                                  0,                 0,   0,  1]; 
                  
                  
% 2. View point Transfrom 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                        
cameraView1Left =  extMatrixLeft*worldPoints1homo;
cameraView2Left =  extMatrixLeft*worldPoints2homo;
cameraView1Right =  extMatrixRight*worldPoints1homo;
cameraView2Right =  extMatrixRight*worldPoints2homo;

disp(cameraView1Left)
f = 0.01;
intrinsic  =    [ f       0       0    % fx  
                  0       f       0    % fy 
                  0       0       1 ];  % cx, cy  (center of image)
% we could combine projection with pixel domain conversion
%intrinsic  =    [ s*f       0       cx    % fx  
%                  0       s*f       cy    % fy 
%                  0       0         1 ];  % cx, cy  (center of image)

% draw world view 
hold off;     
subplot(1,3,1);
%plot3
fill3([worldPoints1(1, :), worldPoints1(1,1)], [worldPoints1(2,:) worldPoints1(2,1)], [worldPoints1(3, :), worldPoints1(3, 1)], 'b');
hold on; 
fill3([worldPoints2(1, :), worldPoints2(1,1)], [worldPoints2(2,:) worldPoints2(2,1)], [worldPoints2(3, :), worldPoints2(3, 1)], 'r');
plot3( 1, 0, 5, 'o'); % right cam
plot3( -1, 0, 5,'o');       % left cam
grid;
title('world view');
xlabel('x');
ylabel('y');
zlabel('z');

axis([-5, 5, -5, 5, -1, 5]);

% 3. projecttion by K 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
projected3DPoints1Left = intrinsic*cameraView1Left(1:3,:);  
projected2DPoints1Left = projected3DPoints1Left(1:2, :) ./ projected3DPoints1Left(3, :);
projected3DPoints2Left = intrinsic*cameraView2Left(1:3,:);  
projected2DPoints2Left = projected3DPoints2Left(1:2, :) ./ projected3DPoints2Left(3, :);

projected3DPoints1Right = intrinsic*cameraView1Right(1:3,:);  
projected2DPoints1Right = projected3DPoints1Right(1:2, :) ./ projected3DPoints1Right(3, :);
projected3DPoints2Right = intrinsic*cameraView2Right(1:3,:);  
projected2DPoints2Right = projected3DPoints2Right(1:2, :) ./ projected3DPoints2Right(3, :);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. camera space to pixel space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s = 100000;    % meter to pixels
cx = 1000;
cy = 500;
cam2pixel =  [s  0  cx;    % camera coord to pixel coord
              0  -s  cy;   % -s for reversed y direction
              0   0  1];   %   

% homogeneoud coord    
projected2DPoints1LeftHomo = [projected2DPoints1Left; ones(1,size(projected2DPoints1Left,2))];
projected2DPoints2LeftHomo = [projected2DPoints2Left; ones(1,size(projected2DPoints2Left,2))];

projected2DPoints1RightHomo = [projected2DPoints1Right; ones(1,size(projected2DPoints1Right,2))];
projected2DPoints2RightHomo = [projected2DPoints2Right; ones(1,size(projected2DPoints2Right,2))];

% transform
pixel1LeftHomo = cam2pixel*projected2DPoints1LeftHomo;
pixel2LeftHomo = cam2pixel*projected2DPoints2LeftHomo;

pixel1RightHomo = cam2pixel*projected2DPoints1RightHomo;
pixel2RightHomo = cam2pixel*projected2DPoints2RightHomo;

% to Cartesian coord
pixel1Left = pixel1LeftHomo(1:2,:);
pixel2Left = pixel2LeftHomo(1:2,:);

pixel1Right = pixel1RightHomo(1:2,:);
pixel2Right = pixel2RightHomo(1:2,:);


subplot(1,3,2);
fill(pixel1Left(1,:), pixel1Left(2,:), 'b');
hold on;
fill(pixel2Left(1,:), pixel2Left(2,:), 'r');
axis([0,2000,0,1000]);
%set (gca,'Ydir','reverse');
xlabel('x');
ylabel('y');
title('Left cam');
grid;


subplot(1,3,3);
fill(pixel1Right(1,:), pixel1Right(2,:), 'b');
hold on;
fill(pixel2Right(1,:), pixel2Right(2,:), 'r');
grid;
xlabel('x');
ylabel('y');
axis([0,2000,0,1000]);
title('Right cam');
%set (gca,'Ydir','reverse');


% Save a Images %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imgLeft = zeros([1000,2000,3], 'uint8');
imgRight = zeros([1000,2000,3], 'uint8');
topleft = [min(pixel1Left(2,:)), min(pixel1Left(1,:))];
botright= [max(pixel1Left(2,:)), max(pixel1Left(1,:))];
imgLeft(topleft(1):botright(1), topleft(2):botright(2), 3) = 255;   % blue 

topleft = [min(pixel2Left(2,:)), min(pixel2Left(1,:))];
botright= [max(pixel2Left(2,:)), max(pixel2Left(1,:))];
imgLeft(topleft(1):botright(1), topleft(2):botright(2), 3) = 0;   % red 
imgLeft(topleft(1):botright(1), topleft(2):botright(2), 1) = 255;   % red 

topleft = [min(pixel1Right(2,:)), min(pixel1Right(1,:))];
botright= [max(pixel1Right(2,:)), max(pixel1Right(1,:))];
imgRight(topleft(1):botright(1), topleft(2):botright(2), 3) = 255;   % blue 
topleft = [min(pixel2Right(2,:)), min(pixel2Right(1,:))];
botright= [max(pixel2Right(2,:)), max(pixel2Right(1,:))];
imgRight(topleft(1):botright(1), topleft(2):botright(2), 3) = 0;   % red 
imgRight(topleft(1):botright(1), topleft(2):botright(2), 1) = 255;   % red 
figure;
subplot(1,2,1); imshow(imgLeft);
title('Left Cam');
subplot(1,2,2); imshow(imgRight);
title('Right Cam');
% save to image file
imwrite(imgLeft, 'left.png');
imwrite(imgRight, 'right.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Depth Image 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imgLeft = 255*ones([1000,2000], 'uint8');
imgRight = 255*ones([1000,2000], 'uint8');
topleft = [min(pixel1Left(2,:)), min(pixel1Left(1,:))];
botright= [max(pixel1Left(2,:)), max(pixel1Left(1,:))];
imgLeft(topleft(1):botright(1), topleft(2):botright(2)) = 5*20;   % blue 

topleft = [min(pixel2Left(2,:)), min(pixel2Left(1,:))];
botright= [max(pixel2Left(2,:)), max(pixel2Left(1,:))]; 
imgLeft(topleft(1):botright(1), topleft(2):botright(2)) = 3*20;   % red 

topleft = [min(pixel1Right(2,:)), min(pixel1Right(1,:))];
botright= [max(pixel1Right(2,:)), max(pixel1Right(1,:))];
imgRight(topleft(1):botright(1), topleft(2):botright(2)) = 5*20;   % blue 
topleft = [min(pixel2Right(2,:)), min(pixel2Right(1,:))];
botright= [max(pixel2Right(2,:)), max(pixel2Right(1,:))]; 
imgRight(topleft(1):botright(1), topleft(2):botright(2), 1) = 3*20;   % red 
figure;
subplot(1,2,1); imshow(imgLeft);
title('Left Cam Depth');
subplot(1,2,2); imshow(imgRight);
title('Right Cam Depth');
% save to image file
imwrite(imgLeft, 'leftdepth.png');
imwrite(imgRight, 'rightdepth.png');

