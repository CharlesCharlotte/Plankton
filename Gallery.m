function [gallery,category_num,path,img_num]=Gallery()
%     %��ȡ2014���103�ຣ�����������ݣ���Ϊgallery
%     %�ļ�������ȡ����ο���ҳhttp://blog.csdn.net/haizimin/article/details/39646595
% 
%     up_path='F:\ѧϰ\������\�������\��һ��Project\2014';
%     p = dir(up_path); 
%     len_p = size(p,1)-2; %������,��ȥǰ�����ṹ:.��..
%     path=cell(len_p);
%     for k=1:len_p 
%         path{k}=p(k+2).name;
%     end
% 
%     category_num = size(path,2);
%     for k = 1:category_num 
%         if(strcmp(path{k},'mix')==0) 
%             file_path = [up_path,'\',path{k},'\'];   
%             img_path_list = dir(strcat(file_path,'*.png'));  
%             img_num = length(img_path_list); 
%             if (img_num>0) 
%                 for m = 1:img_num  
%                     image_name = img_path_list(m).name; 
%                     gallery{k,m} =  imread(strcat(file_path,image_name)); 
%                     if(img_num>5000)
%                         cal='image_num'
%                         img_num-m 
%                     end
%                 end  
%             end  
%             cal='category_num'
%             category_num-k
%         end
%     end
% end

    up_path='F:\ѧϰ\������\�������\��һ��Project\test\gallery';
    p = dir(up_path); 
    len_p = size(p,1)-2; %������,��ȥǰ�����ṹ:.��..
    Path=cell(len_p,1);
    for k=1:len_p 
        Path{k}=p(k+2).name;
    end

    category_num = size(Path,1);
    img_num=zeros(category_num,1);
    for k = 1:category_num 
            file_path = [up_path,'\',Path{k},'\'];   
            img_path_list = dir(strcat(file_path,'*.png'));  
            img_num(k) = length(img_path_list); 
            if (img_num(k)>0) 
                for m = 1:img_num(k) 
                    image_name = img_path_list(m).name; 
                    gallery{k,m} =  imread(strcat(file_path,image_name)); 
                    if(img_num>5000)
                        cal='image_num'
                        img_num(k)-m 
                    end
                end  
            end  
            cal='category_num'
            category_num-k
    end 
end