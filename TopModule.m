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

%��������д�ļ�������ģ������ļ���д
