% Filename: BFS.m
% Created by: Joseph Pollard
% Last Updated: 12/2/15
% Synopsis:
% Run BFS on a graph Graph, with the start vertex at start. Assume graph is
% square, symetric, non-reflexive. start needs to be passed in as an
% integer corresponding to the start node. IE, to start at node B, start 
% should be 2.

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
    
  % update the start node
  node(start).color = 'g';
  node(start).dist = 0;
  % put the start node into a "queue". since matlab doesnt provide a queue
  % data structure, a simple array is used. Nodes can be appended as
  % needed, and the leading node can be "popped" by creating a new array
  % starting with the second node in the array and ending at "end"
  Q = node(start);
  
  while ~isempty(Q),
    
      % use "current" to access node properties since the nodes in the Q are
      % copy by value, not by reference
      current = Q(1).position;
    
      % find adj nodes by checking if the nodes adjList contain a "1"
      for j=1:size(Q(1).adjList, 2)
          if Q(1).adjList(j) == 1
              
              % check if the adjacent nodes have been found yet
              % note: node is used since the nodes in Q are copies
              if node(j).color == 'w'
                  % update the new nodes
                  node(j).color = 'g';
                  node(j).dist = node(current).dist + 1;
                  % the following line converts the "position" of the 
                  % parent node into a letter.
                  node(j).pred = char(node(current).position - 1 + 'A');
                  % insert new node into the queue
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
      % Out put the info of the nodes. the output should line up, except
      % for the start node which has the Pred as NaN and the tabs appear to
      % not compensate for that.
      fprintf('Node %s:\nPred: %s\t\tDist: %d\n', char(node(j).position - 1 + 'A'), node(j).pred, node(j).dist)
  end
end
