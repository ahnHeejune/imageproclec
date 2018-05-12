function trainMNIST(train_set, train_label)   

global W1 W2 alpha beta;
K = 10;
Y = eye(K); % output vector 
N = size(train_set, 1);
for j=1:N
    
        % 1. propagate the input forward through the network
        input_x = [1; train_set(j, :)'];
        hidden_output = [1;sigmf(W1'*input_x, [beta 0])];
        output = sigmf(W2'*hidden_output, [beta 0]);
        
        % 2. propagate the error backward through the network
        % 2.1 compute the error of output unit c
        delta_c = (output-Y(:,train_label(j)+1)).*output.*(1-output);
        
        % compute the error of hidden unit h
        delta_h = (W2*delta_c).*(hidden_output).*(1-hidden_output);
        delta_h = delta_h(2:end);
        
        % 2.2 update weight matrix
        W1 = W1 - alpha*(input_x*delta_h');
        W2 = W2 - alpha*(hidden_output*delta_c');
end