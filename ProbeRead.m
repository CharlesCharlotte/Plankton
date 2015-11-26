function [probe,probeCat_num,probecat,probeImg_num]=ProbeRead()
 %读取2013年的若干数据，作为probe
    up_path='F:\学习\大三上\随机过程\第一次Project\test\probe';
    p = dir(up_path); 
    len_p = size(p,1)-2; %类别个数,除去前两个结构:.和..
    probepath=cell(len_p,1);
    for k=1:len_p 
        probepath{k}=p(k+2).name;
    end
    probeCat_num = size(probepath,1);
    probeImg_num=zeros(probeCat_num,1);
    count=1;
    for k = 1:probeCat_num 
        file_path = [up_path,'\',probepath{k},'\'];   
        img_path_list = dir(strcat(file_path,'*.png'));  
        probeImg_num(k) = length(img_path_list); 
        if (probeImg_num(k)>0) 
            for m = 1:probeImg_num(k) 
                image_name = img_path_list(m).name; 
                probe{count} =  imread(strcat(file_path,image_name)); 
                probecat{count}=probepath{k};
                count=count+1;
            end  
        end  
    end 
    probe=probe';
    probecat=probecat';
end