
%%
figure(2)
pattern = imread('http://cvl-cam-01.edu.isy.liu.se/jpg/image.jpg');
imagesc(pattern); axis image;

%%

% Calibration points in the world
%--------------------------------
X1 =  0; Y1 =  0;
X2 =  5; Y2 =  0;
X3 = 10; Y3 =  0;
X4 =  0; Y4 =  5;
X5 =  5; Y5 =  5;
X6 = 10; Y6 =  5;
X7 =  0; Y7 = 10;
X8 =  5; Y8 = 10;
X9 = 10; Y9 = 10;

% Calibration points in the image
%--------------------------------
u1 = 122; v1 = 36;
u2 = 199; v2 = 28;
u3 = 274; v3 = 22;
u4 = 124; v4 = 91;
u5 = 208; v5 = 82;
u6 = 291; v6 = 74;
u7 = 128; v7 = 158;
u8 = 220; v8 = 147;
u9 = 311; v9 = 137;

f = [u1 v1 u2 v2 u3 v3 u4 v4 u5 v5 u6 v6 u7 v7 u8 v8 u9 v9]';

% Calibration matrix
%-------------------
D = [  
    X1 Y1  1   0  0  0 -u1*X1 -u1*Y1;
     0  0  0  X1 Y1  1 -v1*X1 -v1*Y1;
    X2 Y2  1   0  0  0 -u2*X2 -u2*Y2;
     0  0  0  X2 Y2  1 -v2*X2 -v2*Y2;
    X3 Y3  1   0  0  0 -u3*X3 -u3*Y3;
     0  0  0  X3 Y3  1 -v3*X3 -v3*Y3;
    X4 Y4  1   0  0  0 -u4*X4 -u4*Y4;
     0  0  0  X4 Y4  1 -v4*X4 -v4*Y4;
    X5 Y5  1   0  0  0 -u5*X5 -u5*Y5;
     0  0  0  X5 Y5  1 -v5*X5 -v5*Y5;
    X6 Y6  1   0  0  0 -u6*X6 -u6*Y6;
     0  0  0  X6 Y6  1 -v6*X6 -v6*Y6;
    X7 Y7  1   0  0  0 -u7*X7 -u7*Y7;
     0  0  0  X7 Y7  1 -v7*X7 -v7*Y7;
    X8 Y8  1   0  0  0 -u8*X8 -u8*Y8;
     0  0  0  X8 Y8  1 -v8*X8 -v8*Y8;
    X9 Y9  1   0  0  0 -u9*X9 -u9*Y9;
     0  0  0  X9 Y9  1 -v9*X9 -v9*Y9];

%vector
c = pinv(D)*f;
%Matix
c = [c; 1];
C = (reshape (c, 3, 3))';

%Check if correct
test = C * [5 5 1]';
u5new = test(1) / test(3);
v5new = test(2) / test(3);

%Xa/sa, Ya/sa, 1/sa
A = inv(C)*[124 91 1]';
%Xb/sb, Yb/sb, 1/sb
B = inv(C)*[311 137 1]';

%Xa, Ya, Xb, Yb
Xa = -0.0236/1.0960;
Ya = 5.4847/1.0960;
Xb = 11.8091/1.1799;
Yb = 11.7922/1.1799;

