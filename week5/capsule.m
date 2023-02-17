clear all; close all; clc;
[airway,color_map, transp] = imread("939-Oblique.png");
gray_airway = rgb2gray(airway);
inverted_airway = gray_airway == 0;
occ_map = binaryOccupancyMap(inverted_airway);
show(occ_map)

% Set start and goal poses
start = [745,762,-pi/2];
goal = [550, 668, pi];

% Show start and goal positions of robot
hold on
plot(start(1),start(2),'ro')
plot(goal(1),goal(2),'bo')

