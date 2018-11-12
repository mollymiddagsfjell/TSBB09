%%im2double
%load image
im = imread('interlaced_image.png');
im = im2double(im);
imshow(im);
%%
%Masks
[rows,cols,ndim] = size(im);
mask1 = zeros(rows,cols);
mask1(1:2:end,:)=1;
mask2 = zeros(rows,cols);
mask2(2:2:end,:)=1;

figure(1)
maskOne =imshow(im.*repmat(mask1, [1 1 3]));
figure(2)
maskTwo =imshow(im.*repmat(mask2, [1 1 3]));

%%
f = [1 2 1]'/2;

%%
im1 = zeros(size(im));
im2 = zeros(size(im));

for k = 1:3
    bk = im(:,:,k);
    im1(:,:,k) = conv2(bk.*mask1,f,'same');
    im2(:,:,k) = conv2(bk.*mask2,f,'same');
end


figure(3)
imshow(im1)
figure(4)
imshow(im2)
    
