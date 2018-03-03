I=imread('circuit.tif'); % Read in image
IEr = edge(I,'roberts'); % roberts edges
IEp = edge(I,'prewitt'); % prewitt edges
IEs = edge(I,'sobel');   % sobel edges

subplot(2,2,1), imshow(I); % Display image
subplot(2,2,2), imshow(IEr); % Display image
subplot(2,2,3), imshow(IEp); % Display image
subplot(2,2,4), imshow(IEs); % Display image
