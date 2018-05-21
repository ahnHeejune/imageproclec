function [accuracy, decisions, probs] = testMNIST(test_set, test_label)

global W1 W2 alpha beta;

test_size = size(test_set);
numSamples = test_size(1);

decisions = -1*ones(numSamples,1);
probs = zeros(numSamples,10);  % 10 is hardcoded

num_correct = 0;
for i=1:test_size(1)
    input_x = [1; test_set(i,:)'];
    hidden_output = [1; sigmf(W1'*input_x, [beta 0])];
    output = sigmf(W2'*hidden_output, [beta 0]);
    probs(i,:) = output;
    [max_unit, max_idx] = max(output);
    decisions(i) = max_idx;
    if(max_idx == test_label(i)+1)
        num_correct = num_correct + 1;
    end
end
% computing accuracy
accuracy = num_correct/test_size(1);