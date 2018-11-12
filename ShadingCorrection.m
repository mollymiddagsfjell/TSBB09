%%
%Copied from shadcorr.m

fpath='shadingcorr/';

figure(1); colormap(gray);

load([fpath 'whiteimage']);
subplot(2,2,1), imagesc(whiteimage, [0 255]); axis image;
title('white image')

load([fpath 'darkimage']);
subplot(2,2,2), imagesc(darkimage, [0 255]); axis image;
title('dark image')

load([fpath 'blackimage']);
subplot(2,2,3), imagesc(blackimage, [0 255]); axis image;
title('black image')

load([fpath 'origimage']);
subplot(2,2,4), imagesc(origimage, [0 255]); axis image;
title('original image')

%%
% fA and fB
fA = mean(mean(darkimage));
fB = mean(mean(whiteimage));
fBlack = mean(mean(blackimage));
%%
b = origimage; 
dark = darkimage;
bright = whiteimage; 

c = (fB - fA)./(bright - dark);
d = ((fA.*bright) - (fB.*dark))./(fB - fA);

figure
imshow(c)
figure
imshow(d)
%corrImage = c.*(b + d);

corrImage = (b + d);
corrImage = (c .* corrImage)/255;
figure
imshow(corrImage);
colormap(jet)

%% 
% darkimage as ref

dark = blackimage;
c = (fBlack - fA)./(bright - dark);
d = ((fA.*bright) - (fBlack.*dark))./(fBlack - fA);
corrImage = (b + d);
corrImage = (c .* corrImage)/255;
figure
imshow(corrImage);
colormap(jet)


