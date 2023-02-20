function solutionFound = capsule(trial_num)
solutionFound = true;
% Load in the airway image, transform to grayscale and invert it
[airway,color_map, transp] = imread("939-Oblique.png");
gray_airway = rgb2gray(airway);
inverted_airway = gray_airway == 0;

% Create occupancy grid
resolution = 10000;
occGrid = binaryOccupancyMap(inverted_airway, resolution);
show(occGrid)

rng shuffle

% Set start and goal poses
start = [randi([685,800])1/resolution, 750/resolution, (randi(200)/100)*pi]

leftorRight = randi(2);
goal = zeros(1,3);
if leftorRight == 1
    goal = [randi([410,445])/resolution, 660/resolution, (randi(200)/100)*pi]
else
    goal = [randi([540,560])/resolution, 660/resolution, (randi(200)/100)*pi]
end

bounds = [occGrid.XWorldLimits; occGrid.YWorldLimits; [-pi pi]];

ss = stateSpaceReedsShepp(bounds);
ss.MinTurningRadius = 20/resolution;

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
    fprintf("Path found.")
else
    fprintf("No path solution found.")
    solutionFound = false;
end

% Show start and goal in grid map.
plot(start(1),start(2),'ro')
plot(goal(1),goal(2),'mo')

% Edit text
title(sprintf("Trial %d", trial_num))
hold off
end