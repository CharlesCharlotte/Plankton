function [ave,zeroMeanSpace,pcaEigVals,pcaEigVecs,subEigVecs]=pca(trainMat, subDim) 
    ave = mean(double(trainMat'))';
    zeroMeanSpace = zeros(size(trainMat));
    for k = 1:subDim
        zeroMeanSpace(:,k) = double(trainMat(:,k))-ave;
    end
    L = zeroMeanSpace' * zeroMeanSpace;
    [eigVecs, eigVals] = eig(L);
    eigVals = diag(eigVals);
    [~, index] = sort(eigVals);
    index = flipud(index);
    pcaEigVals = zeros(size(eigVals));
    pcaEigVecs = zeros(size(eigVecs));
    for k = 1 : length(eigVals)
        pcaEigVals(k) = eigVals(index(k));
        pcaEigVecs(:,k) = eigVecs(:,index(k));
    end
    %pcaEigVals = pcaEigVals/(subDim);
    pcaEigVals = pcaEigVals(1:subDim);
    pcaEigVecs = zeroMeanSpace * pcaEigVecs;
    for k = 1:subDim
        pcaEigVecs(:,k) = pcaEigVecs(:,k) / norm(pcaEigVecs(:,k));
    end
    subEigVecs = pcaEigVecs(:,1:subDim);
end