%%
im = imread('raw0014.png');
im = im2double(im);
imshow(im);
%%
%Masks GBRG
[rows,cols,ndim] = size(im);
%%
% %blue
% mask1 = zeros(rows,cols);
% mask1(2:2:end,1:2:end) = 1;
% 
% %green
% mask2 = zeros(rows,cols);
% mask2(1:2:end,1:2:end) = 1;
% mask2(2:2:end,2:2:end) = 1;
% 
% %red
% mask3 = zeros(rows,cols);
% mask3(1:2:end,2:2:end) = 1;
%%
%right one - BGGR

%Red
mask1 = zeros(rows,cols);
mask1(2:2:end,2:2:end) = 1;

%Green
mask2 = zeros(rows,cols);
mask2(1:2:end,2:2:end) = 1;
mask2(2:2:end,1:2:end) = 1;

%Blue
mask3 = zeros(rows,cols);
mask3(1:2:end,1:2:end) = 1;

%%
%Test the mask
img_rgb = reshape([im.*mask1, im.*mask2, im.*mask3], [size(im) 3]);
%%
f = [1 2 1]/4;

img = conv2(f, f, im.*mask1, 'same');
figure
imshow(img)
%% red
imgMeanRed = conv2(f, f, im.*mask1, 'same')./conv2(f, f, mask1, 'same');
figure
imshow(imgMeanRed)

%% Green

imgMeanGreen = conv2(f, f, im.*mask2, 'same')./conv2(f, f, mask2, 'same');
figure
imshow(imgMeanGreen)

%% Blue
imgMeanBlue = conv2(f, f, im.*mask3, 'same')./conv2(f, f, mask3, 'same');
figure
imshow(imgMeanBlue)
%%
imgMask_rgb = reshape([imgMeanRed, imgMeanGreen, imgMeanBlue], [size(im) 3]);
imshow(imgMask_rgb)

%%

raw2rgb('raw0094.png');
