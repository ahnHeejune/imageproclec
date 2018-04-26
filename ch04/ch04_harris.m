%
% Harris Corner Demo
% 1) follow the low-level procedure of HArris corner detection
% 2) compare with Hasris corner function of Matlab
%

clear;
close all;

I=imread('zener_star.jpg'); I=double(rgb2gray(I));              %Read in image and convert to intensity

% step 1 is not required, since no noise

wdth=5; sdvn=2;                                                 %Fix smoothing parameters
k=0.04;                                             			%Fix Harris constant
hsmall=fspecial('gaussian',[wdth wdth],sdvn);                   %Define gaussian filter
                        			%Perform neighbourhood smoothing
% step 2
[Fx,Fy]=gradient(I);                                            %Calculate gradient
 
Fx_sq=Fx.^2; Fy_sq=Fy.^2; Fx_Fy=Fx.*Fy;                         %Define terms in Harris function

subplot(2,2,1), imagesc(Fx_sq); 
subplot(2,2,2), imagesc(Fy_sq);

Fx_sq=filter2(hsmall,Fx_sq);                        			%Perform neighbourhood smoothing
Fy_sq=filter2(hsmall,Fy_sq);                        			%on each term
Fx_Fy=filter2(hsmall,Fx_Fy);

%step 3                                                                %calculate Harris function
R=(1-2.*k).*Fx_sq.*Fy_sq - k.*(Fx_sq.^2+Fy_sq.^2) - Fx_Fy.^2;


% step 4
S=ordfilt2(R,wdth.^2,ones(wdth));                               %Maximum filtering over neighbourhood
[j,k]=find(R>max(R(:))./12 & R==S);                             %Get subscript indices of local maxima

subplot(2,2,3), imagesc(R); axis image; axis off; colormap(gray);%Display Harris response
subplot(2,2,4), imshow(I,[]);                       			%Display original image
hold on; plot(k,j,'r*');                            			%Interest points superimposed
bw=zeros(size(R)); bw([j,k])=1; bw=logical(bw);                 %Return logical array of interest locations


%------------------------------------------------------------------------
% compare with matlab function 
%------------------------------------------------------------------------
figure
C = corner(I);
subplot(1,2,1);
imshow(I);
hold on;
plot(C(:,1),C(:,2),'r*');
C = corner(I, 20);  % with number inut 
subplot(1,2,2);
imshow(I);
hold on;
plot(C(:,1),C(:,2),'r*');


