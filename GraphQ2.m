% Define source and destination arrays
source = [1, 1, 2, 3, 4];
destination = [2, 3, 4, 4, 5];

% Create a graph object
G = graph(source, destination);

figure;
plot(G);
title('Graph Visualization');

% Define selected nodes
selectedNodes = [1, 2, 4];

% Create subgraph
subG = subgraph(G, selectedNodes);

% Plot the subgraph
figure;
plot(subG);
title('Subgraph with Nodes 1, 2, 4');

% Display adjacent vertices
disp('Adjacent Vertices:');
for i = 1:numnodes(G)
    neighbors = neighbors(G, i);
    fprintf('Node %d: ', i);
    disp(neighbors');
end

% Plot graph with edge labels
figure;
p = plot(G);
% Label edges with their indices or weights (here, simply their index)
edgeLabels = 1:numedges(G);
labeledge(p, source, destination, edgeLabels);
title('Graph with Edge Labels');

% Label nodes (nodes are numbered, but we can display labels explicitly)
p = plot(G);
labelnode(p, 1:numnodes(G), arrayfun(@num2str, 1:numnodes(G), 'UniformOutput', false));
title('Graph with Node Labels');

% Use a simple greedy coloring
color = zeros(numnodes(G), 1); % Initialize color array
for node = 1:numnodes(G)
    neighborColors = color(neighbors(G, node));
    availableColors = setdiff(1:numnodes(G), neighborColors);
    color(node) = availableColors(1); % Assign smallest available color
end

% Plot graph with colored nodes
figure;
p = plot(G);
p.NodeCData = color;
colormap(jet(max(color)));
colorbar;
title('Graph Coloring');

% Compute shortest path
[spath, spathLength] = shortestpath(G, 1, 5);

% Display result
fprintf('Shortest path from node 1 to 5: ');
disp(spath);
fprintf('Path length: %d\n', spathLength);

% Plot with highlighted path
figure;
p = plot(G);
highlight(p, spath, 'EdgeColor', 'r', 'LineWidth', 2);
title('Shortest Path from Node 1 to Node 5');