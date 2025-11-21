function [Sketch] = Sketch(Image,Intensity)
%The Sketch function takes an image and converts it into a sketch-like
%drawing by using a combination of greyscale, inversion and blurring.
%
%Inputs:
%        Image: An m-by-n-by-k uint8 array representing an RGB or
%               greyscale colour image
%        Intensity: A positive, odd, integer that defines the intensity
%                   of the sketch lines (used for blurring).
%Output:
%        Sketch: An m-by-n-by-1 uint8 array representing the sketch-like
%                image.
%
%Author:Vincent Ung

%Creates a greyscale version of the input image
greyscaledimage = Greyscale(Image);

%Allows the greyscaled image values to go above 255
greyscaledimage = double(greyscaledimage);

%Creates an inverted version of the greyscale image
invertedimage = Invert(greyscaledimage);

%Blurs the greyscaled, inverted image according to the given intensity
blurredimage = Blur(invertedimage,Intensity);

%Allows the blurred image values to go above 255
blurredimage = double(blurredimage);

%Calculates the size of the input image
[rows cols layers] = size(Image);

%Pre-assigns an output image the same size as the input
Sketch = zeros(rows,cols);

%Allows values of the output image to go above 255
Sketch = double(Sketch);

%Iterates through each pixel of the image
for i = 1:rows
    for j = 1:cols

        %Calculates the numerator for the colour dodge
        num = 255 * blurredimage(i,j);

        %Calculates the denominator for the colour dodge
        denom = 255 - greyscaledimage(i,j);

        %If denominator is equal to or less than zero, assign current 
        %pixel as white, else perform a colour dodge
        if denom <= 0
            Sketch(i,j) = 255;
        else
            blend = num / denom;
            Sketch(i,j) = uint8(blend);
        end
    end
end

%Converts output image from double to uint8
Sketch = uint8(Sketch);
end