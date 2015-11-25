function ProbeTesting(testMat,ave,subEigVecs,pcaEigVals,GalleryInfo,category_num,path,img_num)
%testMat                 --contains images to be identified 
%ave,subEigVecs,EigVals  --information about different categories, 
%                          average images,eigenvalues,eigenvectors
%GalleryInfo             --contains the coordinates of gallery projected onto eigenspaces
%category_num            --is the number of categories,from gallery
%path                    --contains names of different categories,from gallery
%img_num                 --contains the number of images in each categories

    [x,y]=size(testMat);
    num=x*y;
    epsilon=[0.01 0.01 0.01 0.01 0.01 0.01 0.01];%threshold for seven classfiers
    ProbeInfo=cell(num,5,7);%storing the five most likely categories of each immage in probe
    Classfier=cell(7,1);
    Classfier{1}='L1';Classfier{2}='L2';Classfier{3}='Angle';
    Classfier{4}='Mahalanobis';Classfier{5}='L1+Mahalanobis';
    Classfier{6}='L2+Mahalanobis';Classfier{7}='Angle+Mahalanobis';

    for k=1:num
        dis=zeros(category_num,7);%storing distances between testMat and each categories
        for m=1:category_num
            ws=(testMat{k}-ave{m}).'*subEigVecs{m};%projection of testImage onto eigenspace
            %Wt contains coordinates of each images in this category projected onto eigenspace
            Wt=GalleryInfo{m,1};
            distance=zeros(img_num,7);
            for n=1:img_num(m);
                distance(n,:)=Dist(ws,Wt(n,:),pcaEigVals{m});
            end
            dis(m,:)=min(diatance);
        end   
        %Rank 5 categories that are the most similar to the probe based on each classfiers
        for m=1:7 %7 kinds of classfiers
            Distance=dis(:,m);
            [~,idx]=sort(Distance);
            if(Distance(idx(1))>=epsilon(m))
                ProbeInfo{k,1,m}='Unknown';
            else
                for r=1:5
                    ProbeInfo{k,r,m}=path{idx(r)};
                end
            end
        end   
    end
    save ProbeInfo ProbeInfo Classfier;
end

function [L1,L2,Angle,Maha,L1Maha,L2Maha,AngleMaha]=Dist(ws,wt,ev)
%ws,wt are vectors to be calculated distance
%ev is eigenvalues 
%L1 :the nearest-neighbor classfier Baseline uses
%L2 :Euclidean distance
%Maha :Mahalanobis
%L1Maha,L2Maha,AngleMaha :combination of two measures
    L1=norm(ws-wt,1);
    L2=norm(ws-wt,2);
    Angle=-sum(ws.*wt)/norm(ws)/norm(wt);
    z=ev.^(-0.5);
    Maha=-sum(ws.*wt.*z);
    L1Maha=sum(abs(ws-wt).*z);
    L2Maha=sum((ws-wt).*(ws-wt).*z);
    AngleMaha=-sum(ws.*wt.*z)/norm(ws)/norm(wt);
end    
     