function Y=Prepca(image,Size)
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
    Test=ones(size(image));
    Test=imrotate(Test,ang);
    idx=~Test;
    X=imrotate(X,ang);
    [x,y]=find(X==1);
    xmin=min(x);
    xmax=max(x);
    ymin=min(y);
    ymax=max(y);
    xu=max(xmin-3,1);
    xd=min(xmax+3,size(Y,1));
    yl=max(ymin-3,1);
    yr=min(ymax+3,size(Y,2));
    %replace the dark area caused by imrotate with color around the edge
    rep=[Y(xmin,ymin),Y(xmax,ymax),Y(xmin,ymax),Y(xmax,ymin)];
    Y(idx)=max(rep);
    Y=Y(xu:xd,yl:yr);
    Y=imresize(Y,[Size,Size]);
    Y=reshape(Y,Size*Size,1);
end
           
