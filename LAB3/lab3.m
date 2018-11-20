%% load data
load('Refdata1.mat');
load('Refdata2.mat');
load('Refdata3.mat');
load('Scenedata.mat');

%% Plot

figure
imagesc(Refdata1(:,:,1));
%figure
%imagesc(Refdata2(:,:,1));
%figure
%imagesc(Refdata3(:,:,1));
% Does the pixel npise seem randomly distibuted over the image
% there is randomly distibuted noise, but there is also a concentrated are
% of warmer pixels in the top right corner

%% Plot means vs radiance

m1 = mean2(Refdata1(:,:,1));
m2 = mean2(Refdata2(:,:,1));
m3 = mean2(Refdata3(:,:,1));

figure
plot([0.809 1.58 2.25], [m1 m2 m3]);
axis([0 2.25 0 8000])

% It's not a line through the origin. We don't have a point in zero

%% A-3

figure(1)
%Bad
plot([Refdata1(178,255,1) Refdata2(178,255,1) Refdata3(178,255,1)],[1 2 3] );
figure(2)
plot([Refdata1(131,119,1) Refdata2(131,119,1) Refdata3(131,119,1)],[1 2 3] );
figure(3)
plot([Refdata1(147,71,1) Refdata2(147,71,1) Refdata3(147,71,1)],[1 2 3]);

%% A-4 

time = (1:20);

% cyan pixel
pixeltimearraynormal = zeros(1,20);
for k = 1:20
    pixeltimearraynormal(k) = Refdata1(178,255,k);
end


figure(1)
plot(time, pixeltimearraynormal)

% normal pixel
pixeltimearraysalt = zeros(1,20);
for k = 1:20
    pixeltimearraysalt(k) = Refdata1(131,119,k);
end

figure(2)
plot(time, pixeltimearraysalt)

% gul pixel
pixeltimearraypeppar = zeros(1,20);
for k = 1:20
    pixeltimearraypeppar(k) = Refdata1(147,71,k);
end

figure(3)
plot(time, pixeltimearraypeppar)

%% 
figure
part3_B

%% C-1

part = Scenedata(:,1:351,1);
figure
imagesc(part);

%% RMSE

RMSE = sqrt( (1/20)*sum(pow()) );