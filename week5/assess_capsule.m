clear; close all; clc;

total_trials = 20;
solutions = 0;

for i = 1:total_trials
    subplot(4,5,i);
    fprintf("Running trial #%d... ", i);
    solutionFound = capsule;
    if solutionFound
        solutions = solutions + 1;
    end
    fprintf("\n");
end

fprintf("Success rate: %f\n", solutions/total_trials);