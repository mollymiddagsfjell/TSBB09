% Compute the x-derivative at the center of a (3,3,3)-volume
% ==========================================================
function [xgrad, ygrad, zgrad] = grad_xy(in)

% a mirrored 3D-sobelx filter kernel
sobelx = zeros(3,3,3);
sobelx(:,:,1) = [-1 0 1; -2 0 2; -1 0 1];
sobelx(:,:,2) = [-2 0 2; -4 0 4; -2 0 2];
sobelx(:,:,3) = [-1 0 1; -2 0 2; -1 0 1];

xgrad = sum(sum(sum(sobelx.*in)));

sobely = zeros(3,3,3);
sobely(:,:,1) = [-1 -2 -1; -2 -4 -2; -1 -2 -1];
sobely(:,:,2) = [0 0 0; 0 0 0; 0 0 0];
sobely(:,:,3) = [1 2 1; 2 4 2; 1 2 1];

ygrad = sum(sum(sum(sobely.*in)));

sobelz = zeros(3,3,3);
sobelz(:,:,1) = [-1 -2 -1; 0 0 0; 1 2 1];
sobelz(:,:,2) = [-2 -4 -2; 0 0 0; 2 4 2];
sobelz(:,:,3) = [-1 -2 -1; 0 0 0; 1 2 1];

zgrad = sum(sum(sum(sobelz.*in))); %in punkten på ytan

%out = xgrad;
