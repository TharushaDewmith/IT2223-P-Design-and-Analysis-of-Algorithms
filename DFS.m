% DFS - Depth First Search

function dfs(graph, startNode, visited)
    if visited(startNode)
        return;
    end
    fprintf('Visiting node %d\n', startNode);
    visited(startNode) = true;
    
    neighbors = find(graph(startNode, :) > 0);
    for i = 1:length(neighbors)
        dfs(graph, neighbors(i), visited);
    end
end

% Example adjacency matrix representation of a graph
graph = [0 1 1 0 0;
         1 0 0 1 1;
         1 0 0 1 0;
         0 1 1 0 1;
         0 1 0 1 0];

startNode = 1;
visited = false(size(graph, 1), 1);
dfs(graph, startNode, visited);


G = graph(graph);
figure;
plot(G, 'Layout', 'force');
title('Graph Visualization');

