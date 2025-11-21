function [Greyscale_Image] = Greyscale(Colour_Image)
%The Greyscale function converts the supplied RGB colour image to a
%greyscale version by applying a ratio of colours for each pixel.
%
%Input: 
%       Colour_Image: An m by n by 3 uint8 array representing an RGB colour image
%Output: 
%       Greyscale_Image: An m by n by 1 uint8 array representing a greyscale image
%
%Author:Vincent Ung

%Allows Colour_Image to go over values of 255
Colour_Image = double(Colour_Image);

%Calculates greyscale value in the ratio 3:5:1 (r:g:b)
greyscaleimage = Colour_Image(:,:,1)*3/9 + Colour_Image(:,:,2)*5/9 + Colour_Image(:,:,3)*1/9;

%Rounds to nearest integer and converts image to uint8
Greyscale_Image = uint8(round(greyscaleimage));
end