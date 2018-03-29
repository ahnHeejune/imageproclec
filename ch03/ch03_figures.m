%
% Clean up 
%
clear;
close all;

% LOG filter shape
if false
    sigma = 0.5;
    s = 3;
    G = fspecial('gaussian', [s,s], sigma);
    subplot(1,2,1), mesh(G);
    L = del2(G)
    subplot(1,2,2), mesh(L);
end

if false
    figure;
    sigma = 1.0;
    s = 7;
    G = fspecial('gaussian', [s,s], sigma);  % Gaussian Filter
    subplot(1,2,1), mesh(G);
    L = del2(G);        % Laplacian Filter 
    subplot(1,2,2), mesh(L);
end


figure;
sigma = 2.0;
s = 13;
G = fspecial('gaussian', [s,s], sigma);
subplot(1,3,1), mesh(G);
L = del2(G);
subplot(1,3,2), mesh(L);
LoG = fspecial('log', [s,s], sigma);
subplot(1,3,3), mesh(LoG);

%axis([0 30 0 30, 0 max(max(G))])