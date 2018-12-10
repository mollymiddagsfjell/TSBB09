% Read an image volume.
% Make a depth-coded image.
% 2017-11 updated by Maria Magnusson
%------------------------------------

% load volume
%------------
load cylvol.mat;
cylvol = double(cylvol);

% check sizes, note that (row,col,z) corresponds to (y,x,z)
%----------------------------------------------------------
siz = size(cylvol);
sizex = siz(2);
sizey = siz(1);
sizez = siz(3);
zmax = sizez;

% open figure with gray colormap
%-------------------------------
figure(2);
colormap gray;

% Plot 3 slices from image volume
%--------------------------------
subplot(2,2,1), imshow(cylvol(:,:,5), [0 255]);
title('slice 5'); axis image; colorbar;
subplot(2,2,2), imshow(cylvol(:,:,15), [0 255]);
title('slice 15'); axis image; colorbar;
subplot(2,2,3), imshow(cylvol(:,:,32), [0 255]);
title('slice 32'); axis image; colorbar;


% Make a depth-image in the y-direction 
%--------------------------------------
depth = zeros(sizez,sizex);
thresh = 100;
for z = 1 : zmax,
  for x = 1 : sizex,
    y=1;
    while (y<sizey) & (cylvol(y,x,z)<thresh),
      y=y+1;
    end;
    if cylvol(y,x,z)>=thresh
      depth(z,x)=sizey-y;
    end;    
  end;
end;

subplot(2,2,4);
imshow(depth, [0 sizey]);
title('depthimage'); axis image; colorbar;



