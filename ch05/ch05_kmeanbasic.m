
% K-mean basic demo

% 1. data generation 
rng default; % For reproducibility
X = [randn(100,2)*0.75+ones(100,2);
    randn(100,2)*0.5-ones(100,2)];
figure;
subplot(1,2, 1), plot(X(:,1),X(:,2),'.');
title 'Randomly Generated Data';

% 2. K-mean 
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock','Replicates',5,'Options',opts);


% 3. plot the result 
subplot(1,2, 2);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off