A=imread('sunandsea.jpg') ;                                 %Read image
I=rgb2gray(A);                                              %Convert to grey-scale
J = stdfilt(I);                                             %Apply local standard deviaton filter
subplot(1,4,1), imshow(I); subplot(1,4,2),imshow(J,[]);     %Display original and processed
J = entropyfilt(I,ones(15));                                %Apply entropy filter over 15x15 neighbourhood
subplot(1,4,3),imshow(J,[]);                                %Display processed result
J = rangefilt(I,ones(5));                                   %Apply range filter over 5x5 neighbourhood
subplot(1,4,4),imshow(J,[]);                                %Display processed result

%COMMENTS: This file shows the effect of three different texture filters
%based on calculating the variance (standard devn), range and entropy over
%a locally defined neighbourhood
