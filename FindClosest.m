function [closest] = FindClosest(position,row,column)
%The FindClosest function, given a pixel position, finds the closest pixel
%from the given row and column co-ordinates
%
%Inputs:
%        position: A 1-by-2 double vector representing the position of a
%                  pixel
%        row: A 1-by-n double array representing the row co-ordinates of a
%             set of pixels
%        column: A 1-by-n double array representing the column co-ordinates
%                of a set of pixels
%Output:
%        closest: A 1-by-2 double vector representing the position of the
%                 closest pixel co-ordinates to the input position
%
%Author:Vincent Ung

%Calculates number of coordinates to scan
CoordNum = length(row);

%Iterates from the start to end of array coordinates
for c = 1:CoordNum
    %Calculates the euclidean distance from the given position and input
    %coordinates
    distance(c) = ( (position(1) - row(c))^2 + (position(2) - column(c))^2 )^0.5;
end

%Determines the smallest distance in the new array
smallest = min(distance);

%Iterates through the new array
for c = 1:CoordNum

    %Ends loop when minimum distance is found 
    if smallest == distance(c)
        break
    end
end

%Returns the coordinates of the closest pixel
closest = [row(c), column(c)];
end