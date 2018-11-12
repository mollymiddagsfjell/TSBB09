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

%blue
mask1 = zeros(rows,cols);
mask1(2:2:end,2:2:end) = 1;

%green
mask2 = zeros(rows,cols);
mask2(1:2:end,2:2:end) = 1;
mask2(2:2:end,1:2:end) = 1;

%red
mask3 = zeros(rows,cols);
mask3(1:2:end,1:2:end) = 1;

%%
%Test the mask
img_rgb = reshape([im.*mask1 im.*mask2 im.*mask3],[size(im) 3]);

%%
f = [1 2 1]/4;

img = conv2(f, f, im.*mask1, 'same');
figure
imshow(img)