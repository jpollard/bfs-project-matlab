% Define the node of a graph for BFS
% Properties of a BFS node are:
% Color: white, not found yet; grey, queued; black, done
% Pred: also know as pi, the predecessor of the current node 
% Distance: distance from the tree root.

classdef NodeClass
    properties
        Color
        Pred
        Distance
    end
    methods
        % setColor - method to set the color of the node; needed when initialized,
        % when queued, and when done
        function r = setColor(obj, color)
            r = setColor([obj.Color], color);
        end
        
        % setPred - method to set the Pred; need when queued
        function r = setPred(obj, pred)
            r = setPred([obj.Pred], pred);
        end
        
        % setDistance - method to set the distance of the current node from
        % the root.
        function r = setDistance(obj, distance)
            r = setDistance([obj.Distance], distance);
        end
    end
end