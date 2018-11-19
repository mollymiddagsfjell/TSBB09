function [ rgb ] = raw2rgb( raw )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%image = imread(raw);
image = im2double(raw);
[rows,cols,ndim] = size(image);

%Red
red = zeros(rows,cols);
red(2:2:end,2:2:end) = 1;

%Green
green = zeros(rows,cols);
green(1:2:end,2:2:end) = 1;
green(2:2:end,1:2:end) = 1;

%Blue
blue = zeros(rows,cols);
blue(1:2:end,1:2:end) = 1;

f = [1 2 1]/4;
redMask = conv2(f, f, image.*red, 'same')./conv2(f, f, red, 'same');
greenMask = conv2(f, f, image.*green, 'same')./conv2(f, f, green, 'same');
blueMask = conv2(f, f, image.*blue, 'same')./conv2(f, f, blue, 'same');


rgb = reshape([redMask, greenMask, blueMask], [size(image) 3]);

imshow(rgb);

end

