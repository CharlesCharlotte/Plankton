function  pca( trainMat, subDim ) 
% INPUTS:
% trainMat      - Pictures as trasing set, already stored in matrix;
<<<<<<< HEAD
% subDim        - Number of dimensions to be retained (the desired subspace
=======
% subDim        - Numer of dimensions to be retained (the desired subspace
>>>>>>> e814e95e5fe8810066f58ceec2b74f2d52b86d1b
%                 dimensionality). if this argument is ommited, maximum
%                 non-zero dimensions will be retained, i.e. (number of training images) - 1
%
% OUTPUTS:
% Function will generate and save to the disk the following outputs:
% DATA          - matrix where each column is one image reshaped into a vector
%               - this matrix size is (number of pixels) x (number of images), uint8
% trainMat       - same as DATA but only images in the training set
% ave           - mean face (of training images)
% zeroMeanSpace - mean face subtracted from each row in trainMat
% pcaEigVals    - eigenvalues
% w             - lower dimensional PCA subspace
% pcaProj       - all images projected onto a subDim-dimensional space

% [~, numIm] = size(trainMat);

ave = mean(double(trainMat'))';
zeroMeanSpace = zeros(size(trainMat));
save ave ave;

for i = 1:subDim
    zeroMeanSpace(:,i) = double(trainMat(:,i))-ave;
end
% subtract the average from the image space 
save zeroMeanSpace zeroMeanSpace;
clear trainMat;

% PCA
L = zeroMeanSpace' * zeroMeanSpace;
[eigVecs, eigVals] = eig(L);
%

diagonal = diag(eigVals);
[~, index] = sort(diagonal);
index = flipud(index);
% sort the eigenvalues by descending order

pcaEigVals = zeros(size(eigVals));
pcaEigVecs = zeros(size(eigVecs));
for i = 1 : size(eigVals,1)
    pcaEigVals(i,i) = eigVals(index(i),index(i));
    pcaEigVecs(:,i) = eigVecs(:,index(i));
end

pcaEigVals = diag(pcaEigVals);
pcaEigVals = pcaEigVals/(subDim);

pcaEigVals = pcaEigVals(1 : subDim);
% get the largest eigValues
pcaEigVecs = zeroMeanSpace * pcaEigVecs;
save pcaEigVals pcaEigVals;


for i = 1:subDim
    pcaEigVecs(:,i) = pcaEigVecs(:,i) / norm(pcaEigVecs(:,i));
end
save pcaEigVecs pcaEigVecs;
% normalise those eigVectors

w = pcaEigVecs(:,1:subDim);
save w w;
clear w;

end