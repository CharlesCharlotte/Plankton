clear all;close all;clc;
Size=128;
[gallery,category_num,Path,img_num]=Gallery();
%ÐÞ¸Ä´æ´¢Â·¾¶
% save Gallery_test gallery category_num path img_num;
[Ave,ZeroMeanSpace,PcaEigVals,SubEigVecs,GalleryInfo]=GalleryProcessing(gallery,category_num,img_num,Size);
% save GalleryInfo GalleryInfo ave zeroMeanSpace pcaEigVals pcaEigVecs subEigVecs;
[probe,probeCat_num,probecat,probeImg_num]=ProbeRead();
probe=ProbePrepca(probe,Size);
[ProbeInfo,Classfier]=ProbeTesting(probe,Ave,SubEigVecs,PcaEigVals,GalleryInfo,category_num,Path,img_num);
%save ProbeInfo ProbeInfo Classfier;

