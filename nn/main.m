%% Initialization
clear ; close all; clc

%% Setup the parameters
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 11;          % 11 labels, from 1 to 11


%% =========== Part 1: Loading and Visualizing Data =============

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

load('../data/ts/img/20x20/xy.gen.mat');
m = size(X, 1);

% Randomly select 49 data points to display
sel = randperm(size(X, 1));
sel = sel(1:49);

displayData(X(sel, :));

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 2: Initializing Pameters ================

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


%% =================== Part 3: Training NN ===================
%  To train the neural network, we will now use "fmincg", which
%  is a function which works similarly to "fminunc". These
%  advanced optimizers are able to train the cost functions efficiently as
%  long as we provide them with the gradient computations.

fprintf('\nTraining Neural Network... \n')

options = optimset('MaxIter', 50);
lambda = 1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(
  p, ...
  input_layer_size, ...
  hidden_layer_size, ...
  num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
  hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
  num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================= Part 4: Predict =================
%  After training the neural network, we would like to use it to predict the labels.
%  "predict" function is implemented to predict the labels of the training set.
%  This lets us compute the training set accuracy.

% Load Validation Data
fprintf('Loading Data ...\n')

load('../data/vs/img/20x20/xy.gen.mat');

disp(size(X));
disp(size(y));

pred = predict(Theta1, Theta2, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

pause;
