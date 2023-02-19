function isReached = checkIfReachedGoal(planner, goalState, newState)
    resolution = 10000;
    isReached = false;
    threshold = 20/resolution;
    planner.StateSpace.distance(newState, goalState)
    if planner.StateSpace.distance(newState, goalState) < threshold
        isReached = true;
    end
end