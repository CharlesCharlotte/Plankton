<<<<<<< HEAD
function Gallery()
    %��ȡ2014���103�ຣ�����������ݣ���Ϊgallery
    %�ļ�������ȡ����ο���ҳhttp://blog.csdn.net/haizimin/article/details/39646595

    up_path='F:\ѧϰ\������\�������\��һ��Project\2014';
    p = dir(up_path); 
    len_p = size(p,1)-2; %������,��ȥǰ�����ṹ:.��..
    path=cell(len_p);
    for k=1:len_p 
        path{k}=p(k+2).name;
    end

    category_num = size(path,2);
    for k = 1:category_num 
        if(k~=95)%���Է��ֵ�95��mix�ļ�̫�࣬�����mix��ֻ��ȡ����ͼƬ���洢��mix10000�ļ����У�
            file_path = [up_path,'\',path{k},'\'];   
            img_path_list = dir(strcat(file_path,'*.png'));  
            img_num = length(img_path_list); 
            if (img_num>0) 
                for m = 1:img_num  
                    image_name = img_path_list(m).name; 
                    gallery{k,m} =  imread(strcat(file_path,image_name)); 
                    if(img_num>5000)
                        cal='image_num'
                        img_num-m 
                    end
                end  
            end  
            cal='category_num'
            category_num-k
        end
    end 

    %��mix��(��95��)����gallery
    up_path='F:\ѧϰ\������\�������\��һ��Project\mix10000\';
    mixpath=dir(up_path);
    img_num=size(mixpath,1)-2;
    for m=1:img_num
         image_name = mixpath(m+2).name; 
         gallery{95,m} = imread(strcat(up_path,image_name)); 
         img_num-m
    end

    path=path';
    save('gallery','gallery','category_num','path');
    clear all;
end
=======
%读取2014年的103类海洋浮游生物数据，作为gallery
%文件批量读取代码参考网页http://blog.csdn.net/haizimin/article/details/39646595
clear all;
up_path='F:\学习\大三上\随机过程\第一次Project\2014';
p = dir(up_path); 
len_p = size(p,1)-2; %类别个数,除去前两个结构:.和..
for k=1:len_p 
    path{k}=p(k+2).name;
end
category_num = size(path,2);
for k = 1:category_num 
    if(k~=95)%调试发现第95类mix文件太多，这里对mix类只读取部分图片（存储在mix10000文件夹中）
        file_path = [up_path,'\',path{k},'\'];   
        img_path_list = dir(strcat(file_path,'*.png'));  
        img_num = length(img_path_list); 
        if (img_num>0) 
            for m = 1:img_num  
                image_name = img_path_list(m).name; 
                gallery{k,m} =  imread(strcat(file_path,image_name)); 
                if(img_num>5000)
                    cal='image_num'
                    img_num-m 
                end
            end  
        end  
        cal='category_num'
        category_num-k
    end
end 
%将mix类(第95类)读进gallery
up_path='F:\学习\大三上\随机过程\第一次Project\mix10000\';
mixpath=dir(up_path);
img_num=size(mixpath,1)-2;
for m=1:img_num
     image_name = mixpath(m+2).name; 
     gallery{95,m} = imread(strcat(up_path,image_name)); 
     img_num-m
end
path=path';
save('gallery','gallery','category_num','path');
>>>>>>> e814e95e5fe8810066f58ceec2b74f2d52b86d1b
