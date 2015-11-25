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
        for m=1:img_num(k)
            Image=galMat{k,m};
            trainMat(:,m)=Image;
        end
        subDim=round(0.4*img_num(k));
        [ave{k},zeroMeanSpace{k},pcaEigVals{k},pcaEigVecs{k},subEigVecs{k}]=pca(trainMat, subDim);
    end
    save CategoryInfo ave zeroMeanSpace pcaEigVals pcaEigVecs subEigVecs;
    
    %Project gallery onto eigenspace
    Info=cell(x,2);%Info stores the coordinates of projection ,for gallery
                   %Info{k,1} stores all coordinates,Info{k,2} stores the average of coordinates  
    for k=1:x
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
end

    
        
        
            
        
    
    