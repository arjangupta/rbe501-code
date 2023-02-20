clear; close all; clc;

total_trials = 10;
solutions = 0;

% fullfig
for i = 1:total_trials
    subplot(4,6,i);
    fprintf("Running trial #%d... ", i);
    solutionFound = capsule;
    if solutionFound
        solutions = solutions + 1;
    end
    fprintf("\n");
end
set(gcf, 'Position', get(0, 'Screensize'));

fprintf("Success rate: %f\n", solutions/total_trials);