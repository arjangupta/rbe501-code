clear all; close all; clc;
[airway,color_map, transp] = imread("939-Oblique.png");
gray_airway = rgb2gray(airway);
inverted_airway = gray_airway == 0;
occ_map = binaryOccupancyMap(inverted_airway);
show(occ_map)