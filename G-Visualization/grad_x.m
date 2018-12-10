% Compute the x-derivative at the center of a (3,3,3)-volume
% ==========================================================
function out = grad_x(in)

% a mirrored 3D-sobelx filter kernel
sobelx = zeros(3,3,3);
sobelx(:,:,1) = [-1 0 1; -2 0 2; -1 0 1];
sobelx(:,:,2) = [-2 0 2; -4 0 4; -2 0 2];
sobelx(:,:,3) = [-1 0 1; -2 0 2; -1 0 1];

xgrad = sum(sum(sum(sobelx.*in)));


out = xgrad;
