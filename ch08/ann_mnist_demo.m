%
% Simple MLP (3-layer: input, hidden, output) ANN demonstration 
%
% Prereqisit:  
%  - First download dataset from http://yann.lecun.com/exdb/mnist/
%  - extract the zip file in the same directory with m files 
% 
% Note 1: sigmf.m is provided from octave software, 
%       You can remove this file when you installed Matlab Fuzzy Toolbox.
% Note 2: for simplicity, the bias term is not used 
%

% 0. initilaize 
clear;
close all;

% 1. load training set and testing set
train_set = loadMNISTImages('train-images.idx3-ubyte')';
train_label = loadMNISTLabels('train-labels.idx1-ubyte');
test_set = loadMNISTImages('t10k-images.idx3-ubyte')';
test_label = loadMNISTLabels('t10k-labels.idx1-ubyte');


% show 

figure                                          % initialize figure
colormap(gray)                                  % set to grayscale
for i = 1:36                                    % preview first 36 samples
    subplot(6,6,i)                              % plot them in 6 x 6 grid
    digit = reshape(train_set(i, :), [28,28]);     % row = 28 x 28 image
    imagesc(digit);                              % show the image
    axis off;
    title(num2str(train_label(i)))                   % show the label
end

% 2. parameter setting

global W1 W2;
global alpha beta;

alpha = 0.1; % learning rate
beta = 0.01; % scaling factor for sigmoid function
train_size = size(train_set);
N = train_size(1); % number of training samples
D = train_size(2); % dimension of feature vector
n_hidden = 300; % number of hidden layer units
K = 10; % number of output layer units
% initialize all weights between -1 and 1
W1 = 2*rand(1+D, n_hidden)-1; % weight matrix from input layer to hidden layer
W2 = 2*rand(1+n_hidden, K)-1; % weight matrix from hidden layer to ouput layer

max_iter = 5; %100; % number of iterations

% 3. training 
% it will take some times 
acc = testMNIST(test_set, test_label)
disp(['initial accuracy:',num2str(acc)]);    

for i=1:max_iter
	disp([num2str(i), ' iteration']);
    trainMNIST(train_set, train_label);
    
    % 4. verifiying 
    acc = testMNIST(test_set, test_label)
    disp(['accuracy:',num2str(acc)]);    
end

% 4. verifiying 
acc = testMNIST(test_set, test_label)
disp(['final accuracy:',num2str(acc)]);    

