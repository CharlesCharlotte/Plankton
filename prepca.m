function prepca(isGallery,imageSet)
%Eliminating the background, Normalize the size of images, 
%and Locate the plankton

%imageSet :the sets of images to be processed
%isGallery :distinguishes whether this function is processing gallery or
%           other image sets.
%           if this is true,the function is for gallery preprocessing
%           before pca,if not,it is for other image sets processing
    if(isGallery)
        load gallery;
        galleryproc=cell(category_num,size(gallery,2));
        for k=1:category_num
            for m=1:size(gallery,2)
                Image=gallery{k,m};
                if(size(Image,1)==0)
                    break;
                else
                    Image=Prepca(Image);
                    galleryproc{k,m}=Image;
                end
            end
        end
        save('galleryproc','galleryproc','category_num','path');
    else
        [rownum,columnnum]=size(imageSet);
        num=rownum*columnnum;
        testMat=cell(num);
        for k=1:num
            Image=Prepca(imageSet{k});
            testMat{k}=Image;
        end
        save testMat testMat;
    end
    clear all;
end
function Y=Prepca(image)
    X=edge(image,'sobel');%edge detecting
    [x,y]=find(X==1);
    xmin=max(min(x)-1,1);
    xmax=min(max(x)+1,size(image,1));
    ymin=max(min(y)+1,1);
    ymax=min(max(y)+1,size(image,2));
    Y=image(xmin:xmax,ymin:ymax);
    Y=imresize(Y,[256,256]);
end
            
