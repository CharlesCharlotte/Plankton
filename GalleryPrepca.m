function out=GalleryPrepca(gallery,category_num,img_num)
   galleryproc=cell(category_num,size(gallery,2));
   for k=1:category_num
       for m=1:img_num(k)
           Image=gallery{k,m};
           Image=Prepca(Image);
           galleryproc{k,m}=Image;
       end
   end
   save('galleryproc','galleryproc','category_num','path','img_num');
   clear category_num path img_num;
   out=galleryproc;
end
