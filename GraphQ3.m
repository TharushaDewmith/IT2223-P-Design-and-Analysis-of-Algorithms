% Define edges of the graph
s = [1 1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 6 8 9 10 7];
t = [6 2 11 10 5 6 11 7 3 7 11 4 8 8 11 5 9 9 10 11 11 11 11 11 11];

% Create the graph
G = graph(s, t);

% Plot the graph with improved layout
h = plot(G, 'Layout', 'force', 'LineWidth', 2.5);

% Highlight all nodes in blue
highlight(h, 1:11, 'NodeColor', 'blue');

% Highlight edges connected to node 11 in magenta
highlight(h, 11, predecessors(G, 11), 'EdgeColor', 'magenta');

% Highlight specific edges in green
highlight(h, [1 1 2 3 4], [2 5 3 4 5], 'EdgeColor', 'green');

% Highlight another set of edges in red
highlight(h, [1 6 2 7 3 8 4 9 5 10], [6 2 7 3 8 4 9 5 10 1], 'EdgeColor', 'red');

% Improve visualization by adjusting node labels
labelnode(h, 1:11, string(1:11));
