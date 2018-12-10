load imleft;
load imright;

left = imleft(:,51:204);
right = imright(:,51:204);

f = zeros(154,154,3);
f(:,:,2) = 0.5*left;
f(:,:,3) = 0.5*left;
f(:,:,1) = right;

figure(1);
subplot(1,1,1), imshow(f/255);
