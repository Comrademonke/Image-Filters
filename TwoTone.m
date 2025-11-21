function [TwoToned] = TwoTone(Image, colours, weightings)
%The function TwoTone converts an image to use only two different colours.
%
%Inputs:
%        Image: An m-by-n-by-3 uint8 array representing an RGB image
%        colours: A 1-by-2-by-3 uint8 array representing two RGB pixel
%                 colours to be used in the output image
%        weightings: A 1-by-2-by-3 uint8 array representing two RGB pixel
%                    colours to be used as weightings for determining which
%                    output colour to apply
%Output: TwoToned: An m-by-n-by-3 uint8 array representing the two toned
%                  output image
%
%Author:Vincent Ung

%First and second colour inputs
colourA = colours(1,1,:);
colourB = colours(1,2,:);

%Low and high colour weightings
low = weightings(1,1,:);
high = weightings(1,2,:);

%Calculates the size of the input image
[rows cols layers] = size(Image);

%Pre-assigns an output image the same size as the input
TwoToned = zeros(rows, cols, layers);

%Iterates through each pixel in the image
for i = 1:rows
    for j = 1:cols

        %Calculates current pixel position on the image
        position = Image(i,j,:);

        %Assigns the output colour based off which weighting colour is
        %closer
        if ColourDifference(position,low) <= ColourDifference(position,high)
            TwoToned(i,j,:) = colourA;
        else
            TwoToned(i,j,:) = colourB;
        end
    end
end

%Converts output image to uint8
TwoToned = uint8(TwoToned);
end