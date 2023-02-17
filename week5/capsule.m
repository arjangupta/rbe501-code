[airway,color_map, transp] = imread("939-Oblique.png");
gray_airway = rgb2gray(airway);
occ_map = binaryOccupancyMap(gray_airway);
show(occ_map)