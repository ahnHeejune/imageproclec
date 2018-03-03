length=18; tlevel=0.2;                                     		%Define SE and percent threshold level
A=imread('circuit.tif'); subplot(2,3,1), imshow(A)              %Read image and display
B=im2bw(A,tlevel); subplot(2,3,2), imshow(~B);                  %Threshold image and display
SE=ones(3,length); bw1=imerode(~B,SE);                          %Erode vertical lines
subplot(2,3,3), imshow(bw1);                                    %display result
bw2=imerode(bw1,SE'); subplot(2,3,4), imshow(bw2);              %Erode horizontal lines
bw3=imdilate(bw2,SE');bw4=imdilate(bw3,SE);                     %Dilate back
subplot(2,3,5), imshow(bw4);                                    %Display
boundary=bwperim(bw4);[i,j]=find(boundary);                     %Superimpose boundaries
subplot(2,3,6), imshow(A); hold on; plot(j,i,'r.');
