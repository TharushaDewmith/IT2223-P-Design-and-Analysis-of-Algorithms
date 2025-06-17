%% 1. Define source and destination arrays

source = [1, 1, 2, 3, 4];
destination = [2, 3, 4, 4, 5];

% Create a graph object
G = graph(source, destination);

%% 2. Plot full graph
figure;
plot(G, 'Layout', 'force');
title('Graph Visualization');

%% 3. Define selected nodes and create subgraph
selectedNodes = [1, 2, 4];
subG = subgraph(G, selectedNodes);

% Plot the subgraph
figure;
plot(subG, 'Layout', 'force');
title('Subgraph with Nodes 1, 2, 4');

%% 4. Display adjacent vertices (neighbors)
disp('Adjacent Vertices:');
for i = 1:numnodes(G)
    nbrs = neighbors(G, i);
    fprintf('Node %d: ', i);
    disp(nbrs');
end

%% 5. Plot graph with edge labels
figure;
p = plot(G, 'Layout', 'force');
edgeLabels = 1:numedges(G);
labeledge(p, source, destination, edgeLabels);
title('Graph with Edge Labels');

%% 6. Plot graph with node labels
figure;
p = plot(G, 'Layout', 'force');
labelnode(p, 1:numnodes(G), arrayfun(@num2str, 1:numnodes(G), 'UniformOutput', false));
title('Graph with Node Labels');

%% 7. Greedy graph coloring
color = zeros(numnodes(G), 1); % Initialize color array
for node = 1:numnodes(G)
    neighborColors = color(neighbors(G, node));
    availableColors = setdiff(1:numnodes(G), neighborColors);
    color(node) = availableColors(1); % Assign smallest available color
end

% Plot graph with colored nodes
figure;
p = plot(G, 'Layout', 'force');
p.NodeCData = color;
colormap(jet(max(color)));
colorbar;
title('Graph Coloring');

%% 8. Compute and plot shortest path from node 1 to 5
[spath, spathLength] = shortestpath(G, 1, 5);

% Display result
fprintf('\nShortest path from node 1 to 5: ');
disp(spath);
fprintf('Path length: %d\n', spathLength);

% Highlight the path in the graph
figure;
p = plot(G, 'Layout', 'force');
highlight(p, spath, 'EdgeColor', 'r', 'LineWidth', 2);
title('Shortest Path from Node 1 to Node 5');
