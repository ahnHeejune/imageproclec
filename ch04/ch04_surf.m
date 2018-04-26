
% SURF Full demo
% 1) extract the feature point
% 2) build descriptors
% 3) matching features
%

clear;
close all;

%-------------------------------------------------------------------------
% Prepare  two images.
%-------------------------------------------------------------------------
% The first image is the original image.
original = imread('cameraman.tif');
subplot(1,2, 1); 
imshow(original);

%The second image, is the original image rotated and scaled.
scale = 1.3;
J = imresize(original,scale);
theta = 31;
distorted = imrotate(J,theta);
subplot(1,2,2); 
imshow(distorted);

%-------------------------------------------------------------------------
%Detect matching features between the original and distorted image.
%-------------------------------------------------------------------------
%Detecting the matching SURF features is the first step in determining the transform needed to correct the distorted image.

ptsOriginal  = detectSURFFeatures(original);
ptsDistorted = detectSURFFeatures(distorted);
%Extract features and compare the detected blobs between the two images.

figure;

strongest = ptsOriginal.selectStrongest(10);
subplot(1,2,1),imshow(original); hold on;
plot(strongest);

strongest = ptsDistorted.selectStrongest(10);
subplot(1,2,2),imshow(distorted); hold on;
plot(strongest);

%The detection step found several roughly corresponding blob structures in both images. Compare the detected blob features. This process is facilitated by feature extraction, which determines a local patch descriptor.

[featuresOriginal,validPtsOriginal] = ...
            extractFeatures(original,ptsOriginal);
[featuresDistorted,validPtsDistorted] = ...
            extractFeatures(distorted,ptsDistorted);
			
			
%-------------------------------------------------------------------------			
% Find candidate matches.
%-------------------------------------------------------------------------
%Obtain candidate matches between the features by inputting the descriptors 
% to the matchFeatures function. Candidate matches imply that the results can 
% contain some invalid matches. Two patches that match can indicate like features 
% but might not be a correct match. A table corner can look like a chair corner,
% but the two features are obviously not a match.

indexPairs = matchFeatures(featuresOriginal,featuresDistorted);

%Find point locations from both images.

%Each row of the returned indexPairs contains two indices of candidate feature 
% matches between the images. Use the indices to collect the actual point 
% locations from both images.

matchedOriginal  = validPtsOriginal(indexPairs(:,1));
matchedDistorted = validPtsDistorted(indexPairs(:,2));

% Display the candidate matches.

figure;
showMatchedFeatures(original,distorted,matchedOriginal,matchedDistorted);
title('Candidate matched points (including outliers)');