function r = reluMGradient(x)

  % Returns the gradient of the ReLU function evaluated at x
  %   r = reluMGradient(x) computes the gradient of the ReLU function
  %   evaluated at x. This should work regardless if x is a matrix or a
  %   vector. In particular, if x is a vector or matrix, return
  %   the gradient for each element.

  r = arrayfun(@reluGradient, x);

end
