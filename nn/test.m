%% Initialization
clear ; close all; clc

m = [10, 1, 0; -10, -1, 0];

r = reluM(m);
disp(r);

r = reluMGradient(m);
disp(r);

r = softMax(1);
disp(r);

r = softMax([-1 0 1; 3 5 7; 2 4 6; 1.2 1.4 1.6]);
disp(r);

