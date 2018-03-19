bw=imread('basic_shapes.png');                          %Read in image
[L,num]=bwlabel(bw);                                    %Get labelled image and number of objects
subplot(1,2,1), imagesc(bw); axis image; axis off; 		%Plot binary input image
colorbar('North'); subplot(1,2,2), imagesc(L);          %Display labelled image
axis image; axis off; colormap(jet); colorbar('North')
