function [probe,probeCat_num,probecat,probeImg_num]=ProbeRead()
 %��ȡ2013����������ݣ���Ϊprobe
    up_path='F:\ѧϰ\������\�������\��һ��Project\test\probe';
    p = dir(up_path); 
    len_p = size(p,1)-2; %������,��ȥǰ�����ṹ:.��..
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