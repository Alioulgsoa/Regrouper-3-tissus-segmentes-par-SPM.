%Programme pour rassambler 3 tissus segmenter par SPM

clc;
close all;
clear all;

%les image a rasambler
H = niftiread('c1simul3_brainweb_b3n1.nii');
G = niftiread('c2simul3_brainweb_b3n1.nii');
K = niftiread('c3simul3_brainweb_b3n1.nii');

%creation des image vide
SB = zeros(size(H));
SG = zeros(size(G));
LCS = zeros(size(K));

%binariser les images 
H = double(imcomplement(imbinarize(H,0.5)));
G = double(imcomplement(imbinarize(G,0.5)));
K = double(imcomplement(imbinarize(K,0.5)));

%remplire les matrice de la SB,SG,LCS 
for i=1:size(H,1)
    for j=1:size(H,2)
        for k=1:size(H,3)
            if (H(i,j,k)==1)
            SB(i,j,k)= 0 ;
            else
                SB(i,j,k)= 2 ;
            end
        end
    end
end



for i=1:size(G,1)
    for j=1:size(G,2)
        for k=1:size(G,3)
            if (G(i,j,k)==1)
            SG(i,j,k)= 0 ;
            else
                SG(i,j,k)= 3 ;
            end
        end
    end
end



for i=1:size(K,1)
    for j=1:size(K,2)
        for k=1:size(K,3)
            if (K(i,j,k)==1)
            LCS(i,j,k)= 0 ;
            else
                LCS(i,j,k)= 1 ;
            end
        end
    end
end

img= zeros(size(H));

%rassabbler les images
img = SB+SG+LCS ;
%ecrire l'image 
niftiwrite(img,'simu_brainweb_b3n1_seg.nii');
