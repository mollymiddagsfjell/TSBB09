% Read a CT-volume.
% 2017-11 updated by Maria Magnusson
%------------------------------------

% user must load volum with the following command
%------------------------------------------------
load ctvol.mat;
ctvol = double(ctvol);

% check sizes
%------------
siz = size(ctvol);
sizex = siz(2);
sizey = siz(1);
sizez = siz(3);

% open figure with gray colormap
%-------------------------------
figure(3);
colormap gray;

% Plot 3 slices from image volume
%--------------------------------
subplot(2,2,1), imshow(ctvol(:,:,1), [0 max(max(ctvol(:,:,8)))]);
title('slice 1'); axis image; colorbar;
subplot(2,2,2); imshow(ctvol(:,:,8), [0 max(max(ctvol(:,:,8)))]);
title('slice 8'); axis image; colorbar;
subplot(2,2,3); imshow(ctvol(:,:,15), [0 max(max(ctvol(:,:,8)))]);
title('slice 15'); axis image; colorbar;
subplot(2,2,4); imshow(ctvol(:,:,30), [0 max(max(ctvol(:,:,8)))]);
title('slice 30'); axis image; colorbar;



