function isReached = checkIfReachedGoal(planner, goalState, newState)
    resolution = 10000;
    isReached = false;
    threshold = 5/resolution;
    if planner.StateSpace.distance(newState, goalState) < threshold
        isReached = true;
    end
end