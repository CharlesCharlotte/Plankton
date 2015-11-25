function out=ProbePrepca(imageSet)
%imageSet :the sets of images to be processed
    [rownum,columnnum]=size(imageSet);
    num=rownum*columnnum;
    testMat=cell(num,1);
    for k=1:num
        Image=Prepca(imageSet{k});
        testMat{k}=Image;
    end
    save testMat testMat;
    out=testMat;
end