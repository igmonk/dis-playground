function r = reluM(x)

  % Returns the value of the ReLU function evaluated at x
  %   r = reluM(x) computes the value of the ReLU function
  %   evaluated at x. This should work regardless if x is a matrix or a
  %   vector. In particular, if x is a vector or matrix, return
  %   the value for each element.

  r = arrayfun(@relu, x);

end
