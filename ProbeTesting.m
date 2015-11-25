function ProbeTesting(Image,GalleryInfo)
%Image is the image to be identified
%GalleryInfo contains the coordinates of gallery projected onto eigenspaces

end

function [L1,L2,Angle,Maha,L1Maha,L2Maha,AngleMaha]=Distance(ws,wt,ev)
%ws,wt are vectors to be calculated distance
%ev is eigenvalues 
%L1 :the nearest-neighbor classfier Baseline uses
%L2 :Euclidean distance
%Maha :Mahalanobis
%L1Maha,L2Maha,AngleMaha :combination of two measures

L1=norm(ws-wt,1);
L2=norm(ws-wt,2);
Angle=-sum(ws.*wt)/norm(ws)/norm(wt);
z=ev.^(-0.5);
Maha=-sum(ws.*wt.*z);
L1Maha=sum(abs(ws-wt).*z);
L2Maha=sum((ws-wt).*(ws-wt).*z);
AngleMaha=-sum(ws.*wt.*z)/norm(ws)/norm(wt);

end

    
    

    