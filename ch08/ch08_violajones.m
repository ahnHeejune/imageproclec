
% FACE DETECTION - MATLAB CODE
% Lets see how to detect face, nose, mouth and eyes using the MATLAB 
%  built-in class and function. 
% Based on Viola-Jones face detection algorithm, 
% the computer vision system toolbox contains vision.CascadeObjectDetector System 
% object which detects objects based on above mentioned algorithm.
% Prerequisite: Computer vision system toolbox

%FACE DETECTION:
clear;
%clc;
%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
I = imread('HarryPotter1.jpg');  %% WHY Another SImliar Picture Doesnot detect?

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

figure,
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;

%{

The step(Detector,I) returns Bounding Box value that contains [x,y,Height,Width] of the objects of interest.


BB =

    52    38    73    73
   379    84    71    71
   198    57    72    72
%}


%2. NOSE DETECTION:
%To detect Nose
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);
BB=step(NoseDetect,I);
figure,
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','b');
end
title('Nose Detection');
hold off;

%EXPLANATION:
% To denote the object of interest as 'nose', the argument  'Nose' is passed.
%Based on the input image, we can modify the default values of the parameters passed to vision.CascaseObjectDetector. Here the default value for 'MergeThreshold' is 4.
%When default value for 'MergeThreshold' is used, the result is not correct.
%Here there are more than one detection on Hermione.
%To avoid multiple detection around an object, the 'MergeThreshold' value can be overridden. 


%MOUTH DETECTION:
%To detect Mouth
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);
BB=step(MouthDetect,I);
figure,
imshow(I); hold on
for i = 1:size(BB,1)
 rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
title('Mouth Detection');
hold off;




% 4. EYE DETECTION:

%To detect Eyes
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
%Read the input Image
%I = imread('harry_potter.jpg');
BB=step(EyeDetect,I);

figure,imshow(I);
rectangle('Position',BB,'LineWidth',4,'LineStyle','-','EdgeColor','b');
title('Eyes Detection');
Eyes=imcrop(I,BB);
figure,imshow(Eyes);

