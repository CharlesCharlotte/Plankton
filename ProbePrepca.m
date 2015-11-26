<<<<<<< HEAD
function testMat=ProbePrepca(imageSet,Size)
=======
function out=ProbePrepca(imageSet)
>>>>>>> f5e1b3ebfe7fa4dd3c5a101610b876755401349a
%imageSet :the sets of images to be processed
    [rownum,columnnum]=size(imageSet);
    num=rownum*columnnum;
    testMat=cell(num,1);
    for k=1:num
<<<<<<< HEAD
        Image=Prepca(imageSet{k},Size);
        testMat{k}=Image;
    end
=======
        Image=Prepca(imageSet{k});
        testMat{k}=Image;
    end
    save testMat testMat;
    out=testMat;
>>>>>>> f5e1b3ebfe7fa4dd3c5a101610b876755401349a
end