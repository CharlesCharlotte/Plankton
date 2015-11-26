clear all;close all;clc;
<<<<<<< HEAD
Size=128;
[gallery,category_num,Path,img_num]=Gallery();
%修改存储路径
% save Gallery_test gallery category_num path img_num;
[Ave,ZeroMeanSpace,PcaEigVals,SubEigVecs,GalleryInfo]=GalleryProcessing(gallery,category_num,img_num,Size);
% save GalleryInfo GalleryInfo ave zeroMeanSpace pcaEigVals pcaEigVecs subEigVecs;
[probe,probeCat_num,probecat,probeImg_num]=ProbeRead();
probe=ProbePrepca(probe,Size);
[ProbeInfo,Classfier]=ProbeTesting(probe,Ave,SubEigVecs,PcaEigVals,GalleryInfo,category_num,Path,img_num);
%save ProbeInfo ProbeInfo Classfier;

=======
Gallery();
load Gallery_test;
GalleryProcessing(gallery,category_num,img_num);
load GalleryInfo;
load CategoryInfo;
imageSet=ProbeRead();
testMat=ProbePrepca(imageSet);
ProbeTesting(testMat,ave,subEigVecs,EigVals,GalleryInfo,category_num,path,img_num);
load ProbeInfo;

%函数不读写文件，顶层模块进行文件读写
>>>>>>> f5e1b3ebfe7fa4dd3c5a101610b876755401349a
