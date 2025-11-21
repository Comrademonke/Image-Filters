function [Inverted_Image] = Invert(Image)
%The Invert function converts the supplied image (RGB or greyscale) to its
%opposite colours (complementary hues) and returns the inverted image
%
%Input:
%       Image: An m-by-n-by-k uint8 array representing an RGB or greyscale colour
%              image
%Output:
%       Inverted_Image: An m-by-n-by-k uint8 array representing the inverted image
%
%Author:Vincent Ung

%Calculates the opposite colour value for each pixel in the image
Inverted_Image = 255 - Image(:,:,:);

end