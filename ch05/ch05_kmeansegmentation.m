%
% Kmean based segmenation 
% (c) 2018  seoultech 
%
Irgb = imread('onion.png');

subplot(1, 3, 1), imshow(Irgb), title('original');

K = 5;
% K-mean
X = reshape(Irgb, size(Irgb,1)*size(Irgb, 2), 3); % 2D to 1D for kmean func 
X = double(X);
[idx1d,C] = kmeans(X,K);

% remapping
idx2d = reshape(idx1d, size(Irgb,1), size(Irgb, 2)); % 1D idx to 2D

%for clazz = 1:K
    % @TODO vectorization
    % Irgb(idx2d == clazz) = C(clazz, :);
    for y = 1: size(Irgb,1)
        for x = 1: size(Irgb,2)
            clazz = idx2d(y,x); 
            Irgb(y,x, :) = C(clazz, :);
        end
    end
%end

subplot(1, 3, 2), imshow(Irgb), title('K-mean with only colors');

% TODO : with spatial location consideration 
%
