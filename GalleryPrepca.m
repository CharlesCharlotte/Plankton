<<<<<<< HEAD
function galleryproc=GalleryPrepca(gallery,category_num,img_num,Size)
=======
function out=GalleryPrepca(gallery,category_num,img_num)
>>>>>>> f5e1b3ebfe7fa4dd3c5a101610b876755401349a
   galleryproc=cell(category_num,size(gallery,2));
   for k=1:category_num
       for m=1:img_num(k)
           Image=gallery{k,m};
<<<<<<< HEAD
           Image=Prepca(Image,Size);
           galleryproc{k,m}=Image;
       end
   end
=======
           Image=Prepca(Image);
           galleryproc{k,m}=Image;
       end
   end
   save('galleryproc','galleryproc','category_num','path','img_num');
   clear category_num path img_num;
   out=galleryproc;
>>>>>>> f5e1b3ebfe7fa4dd3c5a101610b876755401349a
end
