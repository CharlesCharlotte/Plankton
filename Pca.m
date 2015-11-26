function [Ave,ZeroMeanSpace,PcaEigVals,SubEigVecs]=Pca(trainMat, subDim) 
    Ave = mean(double(trainMat'))';
    ZeroMeanSpace = zeros(size(trainMat));
    for k = 1:size(trainMat,2)
        ZeroMeanSpace(:,k) = double(trainMat(:,k))-Ave;
    end
    L = ZeroMeanSpace.' * ZeroMeanSpace;
    [eigVecs, eigVals] = eig(L);
    eigVals = diag(eigVals);
    [~, index] = sort(eigVals);
    index = flipud(index);
    PcaEigVals = zeros(size(eigVals));
    PcaEigVecs = zeros(size(eigVecs));
    for k = 1 : length(eigVals)
        PcaEigVals(k) = eigVals(index(k));
        PcaEigVecs(:,k) = eigVecs(:,index(k));
    end
    PcaEigVals = PcaEigVals(1:subDim);
    PcaEigVecs = ZeroMeanSpace * PcaEigVecs;
    for k = 1:subDim
        PcaEigVecs(:,k) = PcaEigVecs(:,k) / norm(PcaEigVecs(:,k));
    end
    SubEigVecs = PcaEigVecs(:,1:subDim);
end