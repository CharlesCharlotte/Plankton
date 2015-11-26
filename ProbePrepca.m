function testMat=ProbePrepca(imageSet,Size)
%imageSet :the sets of images to be processed
    [rownum,columnnum]=size(imageSet);
    num=rownum*columnnum;
    testMat=cell(num,1);
    for k=1:num
        Image=Prepca(imageSet{k},Size);
        testMat{k}=Image;
    end
end