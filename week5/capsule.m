function capsule()
% Load in the airway image, transform to grayscale and invert it
[airway,color_map, transp] = imread("939-Oblique.png");
gray_airway = rgb2gray(airway);
inverted_airway = gray_airway == 0;

% Create occupancy grid
resolution = 10000;
occGrid = binaryOccupancyMap(inverted_airway, resolution);
show(occGrid)

% Set start and goal poses
start = [745/resolution,762/resolution,-pi];
goal = [415/resolution, 660/resolution,pi];

% Show start and goal positions of robot
hold on
plot(start(1),start(2),'ro')
plot(goal(1),goal(2),'mo')
    
% Show start and goal headings.
% r = 0.5;
% plot([start(1),start(1) + r*cos(start(3))],[start(2),start(2) + r*sin(start(3))],'r-')
% plot([goal(1),goal(1) + r*cos(goal(3))],[goal(2),goal(2) + r*sin(goal(3))],'m-')
hold off

bounds = [occGrid.XWorldLimits; occGrid.YWorldLimits; [-pi pi]];

ss = stateSpaceReedsShepp(bounds);
ss.MinTurningRadius = 80/resolution;

% Plan the path
stateValidator = validatorOccupancyMap(ss); 
stateValidator.Map = occGrid;
stateValidator.ValidationDistance = 10/resolution;

planner = plannerRRT(ss,stateValidator);
planner.MaxConnectionDistance = 50/resolution;
planner.MaxIterations = 9000;

planner.GoalReachedFcn = @checkIfReachedGoal;

rng shuffle

[pthObj, solnInfo] = plan(planner,start,goal);

show(occGrid)
hold on

% Plot entire search tree.
plot(solnInfo.TreeData(:,1),solnInfo.TreeData(:,2),'.-');

if pthObj.NumStates > 0
    % Interpolate and plot path.
    interpolate(pthObj,300)
    plot(pthObj.States(:,1),pthObj.States(:,2),'r-','LineWidth',2)
else
    disp("No path solution found.")
end

% Show start and goal in grid map.
plot(start(1),start(2),'ro')
plot(goal(1),goal(2),'mo')
hold off
end