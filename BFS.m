% Run BFS on a graph Graph, with the start vertex at start. Assume graph is
% square, symetric, non-reflexive

function BFS( Graph, start)
  % get num of col in Graph
  numCol = size(Graph, 2);
    
  % Pull the column from the matrix and put it in a adjList to be stored
  % in the node.
  for j=1:numCol,
      adjList = Graph(j,:);
      node(j).adjList = adjList;
      node(j).color = 'w';
      node(j).dist = NaN;
      node(j).pred = NaN;
      node(j).position = j;
  end
    
  % put start vector in Queue
  %Q = node(start)
  node(start).color = 'g';
  node(start).dist = 0;
  Q = node(start);
  
  while ~isempty(Q),
    
      % use "current" to access node properties since the nodes in the Q are
      % copy by value, not by reference
      current = Q(1).position;
    
      % find adj nodes
      for j=1:size(Q(1).adjList, 2)
          if Q(1).adjList(j) == 1
              if node(j).color == 'w'
                  node(j).color = 'g';
                  node(j).dist = node(current).dist + 1;
                  node(j).pred = char(node(current).position - 1 + 'A');
                  Q = [Q node(j)];
                  
              end
          end
      end
    
      % update color
      node(current).color = 'b';
      
      % dequeue front node
      T = Q(2:end);
      if ~isempty(T)
          Q = T;
      else
          Q = [];
      end
  end
  
  % print the results out
  for j=1:size(node, 2)
      fprintf('Node %s:\nPred: %s\t\tDist: %d\n', char(node(j).position - 1 + 'A'), node(j).pred, node(j).dist)
  end
end
