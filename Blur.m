function [Blurred_Image] = Blur(Image, Intensity)
%The Blur function blurs the supplied image (RGB or greyscale) by finding
%an average of the pixel colours surrounding each pixel.
%
%Inputs:
%        Image: An m-by-n-by-k uint8 array representing an RGB or greyscale
%               image
%        Intensity: A positive, odd, integer that defines the intensity of
%                   the blurring
%Output:
%        Blurred_Image: An m-by-n-by-k uint8 array representing the blurred
%                       image
%
%Author:Vincent Ung

%Allows input image values to go over 255
Image = double(Image);

%Calculates size of input image
[rows, cols, layers] = size(Image);

%Pre-assigns an output image the same size as the input image
Blurred_Image = zeros(rows, cols,layers);

%Calculates the intensity around the pixel
half = round(Intensity / 2)-1;

% Iterate over each pixel in the image
for i = 1:rows
    for j = 1:cols

        %If row goes out of bounds, row starts at 1 (Top side)
        if i-half <= 0
            istart = 1;
        else
            istart = i - half;
        end

        %If row goes out of bounds, row ends at rows (Bottom side)
        if i+half > rows
            ifinish = rows;
        else
            ifinish = i + half;
        end

        %If column goes out of bounds, column starts at 1 (Left side)
        if j-half <= 0
            jstart = 1;
        else
            jstart = j - half;
        end

        %If column goes out of bounds, column ends at cols (Right side)
        if j+half > cols
            jfinish = cols;
        else
            jfinish = j + half;
        end

        %Calculates the average colour in each layer
        for k = 1:layers

            %Determines pixel area
            pixelvalues = Image(istart:ifinish, jstart:jfinish, k);

            %Calculates the average pixel value in area
            Pixelvalue = mean(mean(pixelvalues));

            %Rounds and assigns average pixel value to current pixel position
            Blurred_Image(i, j, k) = round(Pixelvalue);
        end
    end
end

    %Converts output image from double to uint8
    Blurred_Image = uint8(Blurred_Image);
end