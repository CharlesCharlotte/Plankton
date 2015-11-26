clear all;
close all;
path=dir('*.png');
for k=1:size(path,1)
    image{k}=imread(path(k).name);
end
load GALLERY_test;
prepca(0,image,gallery);
load testMat;
for k=1:size(image,2)
    figure;
    subplot(2,1,1);
    imshow(image{k});
    subplot(2,1,2);
    imshow(testMat{k});
end

    
