<<<<<<< HEAD
function Gallery()
    %¶ÁÈ¡2014ÄêµÄ103Ààº£Ñó¸¡ÓÎÉúÎïÊý¾Ý£¬×÷Îªgallery
    %ÎÄ¼þÅúÁ¿¶ÁÈ¡´úÂë²Î¿¼ÍøÒ³http://blog.csdn.net/haizimin/article/details/39646595

    up_path='F:\Ñ§Ï°\´óÈýÉÏ\Ëæ»ú¹ý³Ì\µÚÒ»´ÎProject\2014';
    p = dir(up_path); 
    len_p = size(p,1)-2; %Àà±ð¸öÊý,³ýÈ¥Ç°Á½¸ö½á¹¹:.ºÍ..
    path=cell(len_p);
    for k=1:len_p 
        path{k}=p(k+2).name;
    end

    category_num = size(path,2);
    for k = 1:category_num 
        if(k~=95)%µ÷ÊÔ·¢ÏÖµÚ95ÀàmixÎÄ¼þÌ«¶à£¬ÕâÀï¶ÔmixÀàÖ»¶ÁÈ¡²¿·ÖÍ¼Æ¬£¨´æ´¢ÔÚmix10000ÎÄ¼þ¼ÐÖÐ£©
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

    %½«mixÀà(µÚ95Àà)¶Á½øgallery
    up_path='F:\Ñ§Ï°\´óÈýÉÏ\Ëæ»ú¹ý³Ì\µÚÒ»´ÎProject\mix10000\';
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
%è¯»å–2014å¹´çš„103ç±»æµ·æ´‹æµ®æ¸¸ç”Ÿç‰©æ•°æ®ï¼Œä½œä¸ºgallery
%æ–‡ä»¶æ‰¹é‡è¯»å–ä»£ç å‚è€ƒç½‘é¡µhttp://blog.csdn.net/haizimin/article/details/39646595
clear all;
up_path='F:\å­¦ä¹ \å¤§ä¸‰ä¸Š\éšæœºè¿‡ç¨‹\ç¬¬ä¸€æ¬¡Project\2014';
p = dir(up_path); 
len_p = size(p,1)-2; %ç±»åˆ«ä¸ªæ•°,é™¤åŽ»å‰ä¸¤ä¸ªç»“æž„:.å’Œ..
for k=1:len_p 
    path{k}=p(k+2).name;
end
category_num = size(path,2);
for k = 1:category_num 
    if(k~=95)%è°ƒè¯•å‘çŽ°ç¬¬95ç±»mixæ–‡ä»¶å¤ªå¤šï¼Œè¿™é‡Œå¯¹mixç±»åªè¯»å–éƒ¨åˆ†å›¾ç‰‡ï¼ˆå­˜å‚¨åœ¨mix10000æ–‡ä»¶å¤¹ä¸­ï¼‰
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
%å°†mixç±»(ç¬¬95ç±»)è¯»è¿›gallery
up_path='F:\å­¦ä¹ \å¤§ä¸‰ä¸Š\éšæœºè¿‡ç¨‹\ç¬¬ä¸€æ¬¡Project\mix10000\';
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
