% Makes a cylinder volume with a hole
% 2005-05 Maria Magnusson Seger
%------------------------------------

% make an x-matrix and a y-matrix
%--------------------------------
[x,y]=meshgrid(-32:1:31,-32:1:31);

% make slices for a cylinder with hole
%-------------------------------------
circ = 200 * ((x.*x+y.*y)<30^2);
circhole = 200 * (((x.*x+y.*y)<30^2) & (((x-0).*(x-0)+(y+30).*(y+30))>10^2));
back = 20  * ones(64,64);

% show slices
%------------
figure(1);
colormap gray;
subplot(2,2,1), imagesc(back,[0 255]); 
title('background slice'); axis image; colorbar;
subplot(2,2,2), imagesc(circ,[0 255]); 
title('circle slice'); axis image; colorbar;
subplot(2,2,3), imagesc(circhole,[0 255]); 
title('hole slice'); axis image; colorbar;

% make a volume of a cylinder with hole
%--------------------------------------
cylvol = uint16(zeros(64,64,64));
for no = 1:10;
 cylvol(:,:,no) = uint16(back);
end;
for no = 11:20;
 cylvol(:,:,no) = uint16(circ);
end;
for no = 21:44;
 cylvol(:,:,no) = uint16(circhole);
end;
for no = 45:54;
 cylvol(:,:,no) = uint16(circ);
end;
for no = 55:64; cylvol(:,:,no) = uint16(back);
end;

% save the volume
%----------------
save cylvol.mat cylvol



