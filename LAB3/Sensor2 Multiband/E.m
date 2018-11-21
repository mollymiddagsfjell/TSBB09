%% load data
load('Refdata1.mat');
load('Refdata2.mat');
load('Refdata3.mat');
load('Scenedata.mat');

figure
imagesc(Refdata1(:,:,1));
%figure
%imagesc(Refdata2(:,:,1));
%figure
%imagesc(Refdata3(:,:,1));

%%

RefdataTempAve = mean(Refdata2,3);
deltaSpat1 = std2(RefdataTempAve(:,1:350));
deltaSpat2 = std2(RefdataTempAve(2:512,:));

RNU1 = (deltaSpat1/(2^14))*100;
RNU2 = (deltaSpat2/(2^14))*100;

