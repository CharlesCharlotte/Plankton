<<<<<<< HEAD
function [Ave,ZeroMeanSpace,PcaEigVals,SubEigVecs,Info]=GalleryProcessing(gallery,category_num,img_num,Size)
    x=size(gallery,1);
    %Figure out eigenvectors and eigenvalues
    galMat=GalleryPrepca(gallery,category_num,img_num,Size);
    Ave=cell(x,1);
    ZeroMeanSpace=Ave;
    PcaEigVals=Ave;
    SubEigVecs=Ave;
    for k=1:x
        %%%%%%
        %试改为小部分逐部训练，步长、步数待定
        %%%%%%
        trainMat=zeros(Size*Size,img_num(k));
=======
function GalleryProcessing(gallery,category_num,img_num)
    x=size(gallery,1);
    %Figure out eigenvectors and eigenvalues
    galMat=GalleryPrepca(gallery,category_num,img_num);
    ave=cell(x,1);
    zeroMeanSpace=ave;
    pcaEigVals=ave;
    pcaEigVecs=ave;
    subEigVecs=ave;
    for k=1:x
        %试改为小部分逐部训练，步长、步数待定
        trainMat=zeros(256*256,img_num(k));
>>>>>>> f5e1b3ebfe7fa4dd3c5a101610b876755401349a
        for m=1:img_num(k)
            Image=galMat{k,m};
            trainMat(:,m)=Image;
        end
        subDim=round(0.4*img_num(k));
<<<<<<< HEAD
        [Ave{k},ZeroMeanSpace{k},PcaEigVals{k},SubEigVecs{k}]=Pca(trainMat, subDim);
    end
=======
        [ave{k},zeroMeanSpace{k},pcaEigVals{k},pcaEigVecs{k},subEigVecs{k}]=pca(trainMat, subDim);
    end
    save CategoryInfo ave zeroMeanSpace pcaEigVals pcaEigVecs subEigVecs;
>>>>>>> f5e1b3ebfe7fa4dd3c5a101610b876755401349a
    
    %Project gallery onto eigenspace
    Info=cell(x,2);%Info stores the coordinates of projection ,for gallery
                   %Info{k,1} stores all coordinates,Info{k,2} stores the average of coordinates  
    for k=1:x
<<<<<<< HEAD
        Image=zeros(Size*Size,img_num(k));
        for m=1:img_num(k)
            Image(:,m)=double(galMat{k,m})-Ave{k};
        end
        w=Image.'*SubEigVecs{k};
        Info{k,1}=w;
        Info{k,2}=mean(w);
    end
=======
        Image=zeros(256*256,img_num(k));
        for m=1:img_num(k)
            Image(:,m)=galMat{k,m}-ave{k};
        end
        w=Image.'*subEigVecs{k};
        Info{k,1}=w;
        Info{k,2}=mean(w);
    end
    
    save GalleryInfo Info;
    clear all;
>>>>>>> f5e1b3ebfe7fa4dd3c5a101610b876755401349a
end

    
        
        
            
        
    
    