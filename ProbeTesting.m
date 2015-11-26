function  [ProbeInfo,Classfier]=ProbeTesting(testMat,Ave,SubEigVecs,PcaEigVals,GalleryInfo,category_num,Path,img_num)
%testMat                 --contains images to be identified 
%ave,subEigVecs,EigVals  --information about different categories, 
%                          average images,eigenvalues,eigenvectors
%GalleryInfo             --contains the coordinates of gallery projected onto eigenspaces
%category_num            --is the number of categories,from gallery
%path                    --contains names of different categories,from gallery
%img_num                 --contains the number of images in each categories

    [x,y]=size(testMat);
    num=x*y;
    %%%%%%
    %to be Modified
    %%%%%%
%     epsilon=[0.01 0.01 0.01 0.01 0.01 0.01 0.01];%threshold for seven classfiers
    epsilon=[inf inf inf inf inf inf inf];
    ProbeInfo=cell(num,7,5);%storing the five most likely categories of each immage in probe
    Classfier=cell(7,1);
    Classfier{1}='L1';Classfier{2}='L2';Classfier{3}='Angle';
    Classfier{4}='Mahalanobis';Classfier{5}='L1+Mahalanobis';
    Classfier{6}='L2+Mahalanobis';Classfier{7}='Angle+Mahalanobis';

    for k=1:num
        dis=zeros(category_num,7);%storing distances between testMat and each categories
        for m=1:category_num
            ws=(double(testMat{k})-Ave{m}).'*SubEigVecs{m};%projection of testImage onto eigenspace
            %Wt contains coordinates of each images in this category projected onto eigenspace
            Wt=GalleryInfo{m,1};
            distance=zeros(img_num(m),7);
            for n=1:img_num(m);
                [distance(n,1),distance(n,2),distance(n,3),distance(n,4),distance(n,5),...
                    distance(n,6),distance(n,7)]=Dist(ws,Wt(n,:),PcaEigVals{m});
            end
            dis(m,:)=min(distance);
        end   
        %Rank 5 categories that are the most similar to the probe based on each classfiers
        for m=1:7 %7 kinds of classfiers
            Distance=dis(:,m);
            [~,idx]=sort(Distance);
            if(Distance(idx(1))>=epsilon(m))
                ProbeInfo{k,m,1}='mix';
            else
                for r=1:5
                    ProbeInfo{k,m,r}=Path{idx(r)};
                end
            end
        end   
    end
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
    z=z.';
    Maha=-sum(ws.*wt.*z);
    L1Maha=sum(abs(ws-wt).*z);
    L2Maha=sum((ws-wt).*(ws-wt).*z);
    AngleMaha=-sum(ws.*wt.*z)/norm(ws)/norm(wt);
end    
     