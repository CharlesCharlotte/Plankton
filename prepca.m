function out=prepca(isGallery,imageSet,gallery,category_num,img_num)
%Eliminating the background, Normalize the size of images, 
%and Locate the plankton

%imageSet :the sets of images to be processed
%isGallery :distinguishes whether this function is processing gallery or
%           other image sets.
%           if this is true,the function is for gallery preprocessing
%           before pca,if not,it is for other image sets processing
    if(isGallery)
        galleryproc=cell(category_num,size(gallery,2));
        for k=1:category_num
            for m=1:img_num(k)
                Image=gallery{k,m};
%                 if(size(Image,1)==0)
%                     break;
%                 else
                    Image=Prepca(Image);
                    galleryproc{k,m}=Image;
%                 end
            end
        end
        save('galleryproc','galleryproc','category_num','path','img_num');
        out=galleryproc;
    else
        [rownum,columnnum]=size(imageSet);
        num=rownum*columnnum;
        testMat=cell(num,1);
        for k=1:num
            Image=Prepca(imageSet{k});
            testMat{k}=Image;
        end
        save testMat testMat;
        out=testMat;
    end
end
function Y=Prepca(image)
    X=edge(image,'sobel');%edge detecting
    [x,y]=find(X==1);
    xmin=min(x);
    xmax=max(x);
    ymin=min(y);
    ymax=max(y);
    xh=xmax-xmin;
    yh=ymax-ymin;
    if(xh>yh)%the image is thin and tall
        yu=find(X(xmin,:),1);
        yd=find(X(xmax,:),1);
        ang=-atan(xh/(yu-yd));%the angle used for rotation
    else
        xr=find(X(:,ymax),1);
        xl=find(X(:,ymin),1);
        ang=-atan((xl-xr)/yh);
    end
    ang=ang/pi*180;
    Y=imrotate(image,ang,'bicubic');  
    X=imrotate(X,ang);
    [x,y]=find(X==1);
    xmin=min(x);
    xmax=max(x);
    ymin=min(y);
    ymax=max(y);
    xu=max(xmin-2,1);
    xd=min(xmax+2,size(Y,1));
    yl=max(ymin-2,1);
    yr=min(ymax+2,size(Y,2));
    Y=Y(xu:xd,yl:yr);
    Y=imresize(Y,[256,256]);
    Y=reshape(Y,256*256,1);
end
            
%to be finished :modify the color of background
