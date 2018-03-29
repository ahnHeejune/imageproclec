%
% how to read video 
% (c) 2018 heejune@seoultech.ac.kr 
%

videofn = 'viplanedeparture.avi'; % this is inlcuded in Matlab ImageToolbox
v = VideoReader(videofn);

n = 0;
while hasFrame(v)
    frame = readFrame(v);
    imshow(frame);
    n = n+1;
    t = sprintf('frame %d', n);
    title(t);
    % add image processing function. ie. hough transform etc.
    
    pause(0.1);
end
