# Regrouper-3-tissus-segmentes-par-SPM.
De nombreux algorithmes de segmentation des classes de tissus utilisent 3 cartes de probabilité tissulaire : substance grise, substance blanche et LCS (et une catégorie « autre » implicite). Les voxels qui appartiennent à d'autres classes de tissus (comme le crâne ou les tissus mous) peuvent être attribués de manière incorrecte à la substance grise, à la substance blanche ou au LCS, ce qui réduit la précision de la segmentation. Celles-ci reflètent la probabilité qu'un voxel appartienne à chaque classe de tissus sur la base de la segmentation d'un grand nombre de cerveaux de jeunes adultes qui ont été normalisés à l'espace standard. Ceux-ci peuvent être trouvés dans SPMDIR/apriori/.