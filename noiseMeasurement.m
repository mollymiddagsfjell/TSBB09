%%
fpath = 'bayer/';

im = cell(100,1);
for k=1:100,
    fname = sprintf('raw%04d.png',k);
    im{k}=imread([fpath fname]);
end


for k=1:100,
    imshow(raw2rgb(im{k}));
    axis([871 980 401 480]);
    drawnow;
end

%%

imTemp = zeros(rows,cols);

for k=1:100,
    imTemp = im2double(im{k}) + imTemp;
end
imm = imTemp./100;
immrgb = raw2rgb(imm);
org = imread('raw0100.png');
subplot(1,2,1), imagesc(org, [0 255]);
title('org')
subplot(1,2,2), imagesc(immrgb, [0 255]);
title('avg')

%%
imTemp = zeros(rows,cols);

for k=1:100,
    imTemp = im2double(im{k}).^2 + imTemp;
end
imv = imTemp/100;
imv = imv - imm.*imm;
imvrgb = raw2rgb(imv);

figure(1)
imshow(imvrgb*10000);

%%

%N = imv;
%S = imTemp/100;

S = imm.*imm;
N = imv; 

SNR = N./S;

figure
imshow(SNR*1000);


