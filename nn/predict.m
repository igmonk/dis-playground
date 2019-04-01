function p = predict(Theta1, Theta2, X)

  %PREDICT Predict the label of an input given a trained neural network
  %   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
  %   trained weights of a neural network (Theta1, Theta2)

  % Useful values
  m = size(X, 1);
  num_labels = size(Theta2, 1);

  % Return the following variables correctly
  p = zeros(size(X, 1), 1);

  h0 = [ones(m, 1) X]'; % size(h0) = [401 m]
  h1 = sigmoid(Theta1 * h0); % size(h1) = [25 m]
  h1 = [ones(1, m); h1]; % size(h1) = [26 m]
  h2 = sigmoid(Theta2 * h1); % size(h2) = [10 m]
  [dummy, p] = max(h2', [], 2);

end
