function [Array] = ColourDifference(Array1, Array2)
%The ColourDifference function, given two m-by-n-by-3 arrays, will
%calculate the euclidean difference in colour between respective pixels in
%the two arrays.
%
%Inputs:
%        Array1: An m-by-n-by-3 uint8 array representing one array of colours
%        Array2: An m-by-n-by-3 uint8 array representing a second array of colours
%Output:
%        Array: An m-by-n array of doubles representing the euclidean difference
%               in colour between corresponding pixels of the inputs
%
%Author:Vincent Ung

%Calculates the size of Array1 (same size as Array2)
[rows cols layers] = size(Array1);

%Converts both input arrays to double (can exceed 255 value)
Array1 = double(Array1);
Array2 = double(Array2);

%Iterates through the colours in the input arrays
for i = 1:rows
    for j = 1:cols

        %Calculates the difference in value between each layer and squares
        %them
        Diff1 = (Array1(i,j,1) - Array2(i,j,1))^2;
        Diff2 = (Array1(i,j,2) - Array2(i,j,2))^2;
        Diff3 = (Array1(i,j,3) - Array2(i,j,3))^2;

        %Sums the difference up and roots the sum giving the euclidean
        %distance
        EuclideanDistance = (Diff1 + Diff2 + Diff3)^0.5;

        %Assigns the euclidean distance back into a new array
        Array(i,j) = EuclideanDistance;

    end
end
end