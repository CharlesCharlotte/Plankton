function galleryproc=GalleryPrepca(gallery,category_num,img_num,Size)
   galleryproc=cell(category_num,size(gallery,2));
   for k=1:category_num
       for m=1:img_num(k)
           Image=gallery{k,m};
           Image=Prepca(Image,Size);
           galleryproc{k,m}=Image;
       end
   end
end
