function Y=Prepca(image)
%Eliminating the background, Normalize the size of images, 
%and Locate the plankton

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
