function [CrystalImage] = Crystallise(Image, crystalrow, crystalcol)
%The Crystallise function applies a frosted window or mosaic-like filter to
%the input image
%
%Inputs:
%        Image: An m-by-n-by-3 uint8 array representing an RGB image
%        crystalrow: A 1-by-n double array representing the row co-ordinates
%                    of each crystal
%        crystalcol: A 1-by-n double array representing the column
%                    co-ordinates of each crystal
%Output:
%        CrystalImage: An m-by-n-by-3 uint8 array representing the crystallised
%                      image
%
%Author:Vincent Ung

%Calculates the size of the input image
[rows cols layers] = size(Image);

%Pre-assigns an output image the same size as the input
CrystalImage = zeros(rows, cols, layers);

%Iterates through the rows and column
for i = 1:rows
    for j = 1:cols

        %Finds the closest coordinates from the input
        Closest = FindClosest([i j], crystalrow, crystalcol);

        %Selects the crystal colour
        Crystalcolour = Image(Closest(1),Closest(2),:);

        %Assigns the crystal colour to the current position
        CrystalImage(i,j,:) = Crystalcolour;
    end
end

%Converts the output image from a double to uint8
CrystalImage = uint8(CrystalImage);
end