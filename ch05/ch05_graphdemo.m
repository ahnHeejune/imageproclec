% Matlab basic graph functions

% 1. Graph (Edges, Node) and Plot
s = [1 1 1 2 5 3 6 4 7 8 8 8];
t = [2 3 4 5 3 6 4 7 2 6 7 5];
weights = [100 10 10 10 10 20 10 30 50 10 70 10];
G = graph(s,t,weights);  
p = plot(G,'EdgeLabel',G.Edges.Weight);

% 2. MST
[T,pred] = minspantree(G);  % pred 는 트리에서 각 노드의 이전 부모 도드 
highlight(p,T)              % p 에 T를 오버레이하여 그림. 


% 3. maxflow & min-cut
% 3.1 maxflow 
s = [1 1 2 3 3 4 4 5 5];
t = [2 3 3 2 5 5 6 4 6];
weights = [0.77 0.44 0.67 0.69 0.73 2 0.78 1 1];
G = digraph(s,t,weights);
plot(G,'EdgeLabel',G.Edges.Weight,'Layout','layered');

% mincut i.e. bottlenect edges 
[mf,~,cs,ct] = maxflow(G,1,6);
disp(mf);  % maximum-flow 
disp(cs);  % source cluster
disp(ct);  % target cluster
