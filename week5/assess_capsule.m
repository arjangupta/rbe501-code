clear; close all; clc;

total_trials = 100;
solutions = 0;

for i = 1:total_trials
    solutionFound = capsule;
    if solutionFound
        solutions = solutions + 1;
    end
end

fprintf("Accuracy: %f\n", solutions/total_trials);