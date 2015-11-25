clear all;close all;clc;
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
