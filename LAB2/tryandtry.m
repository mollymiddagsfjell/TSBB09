% BE SURE TO BOOK cvlcam00 BEFORE DOING THIS!!
%---------------------------------------------

clear ptz

% Give your angles here, i.e. replace the 0:s with suitable angles in degrees
%----------------------------------------------------------------------------
ptz.pan =   -6;
ptz.tilt =  -8;

ptz.tilt = -1*ptz.tilt;
im = cvlcam00(ptz);
im = imread('http://cvl-cam-00.edu.isy.liu.se/jpg/image.jpg');
img = rgb2gray(im2double(im));
  
figure(3)
imagesc(im);
